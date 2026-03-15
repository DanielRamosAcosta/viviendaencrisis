#!/usr/bin/env bash
# Reorder a backlog task by placing it before or after another task
# Usage: backlog-reorder.sh --task <id> --milestone <id> (--before <id> | --after <id>) [--status <status>]

set -euo pipefail

API_BASE="http://localhost:6420"
TASK_ID=""
BEFORE_ID=""
AFTER_ID=""
MILESTONE=""
TARGET_STATUS=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --task)      TASK_ID="$2";       shift 2 ;;
    --before)    BEFORE_ID="$2";     shift 2 ;;
    --after)     AFTER_ID="$2";      shift 2 ;;
    --milestone) MILESTONE="$2";     shift 2 ;;
    --status)    TARGET_STATUS="$2"; shift 2 ;;
    -h|--help)
      echo "Usage: $0 --task <id> --milestone <id> (--before <id> | --after <id>) [--status <status>]"
      echo ""
      echo "Options:"
      echo "  --task <id>           Task to move (e.g. VC-0048)"
      echo "  --milestone <id>     Destination milestone (required, e.g. m-1)"
      echo "  --before <id>        Place task before this task"
      echo "  --after <id>         Place task after this task"
      echo "  --status <status>    Destination status (default: current status of --task)"
      echo ""
      echo "Examples:"
      echo "  $0 --task VC-0048 --before VC-0049 --milestone m-1"
      echo "  $0 --task VC-0048 --after VC-0050 --milestone m-1 --status \"To Do\""
      exit 0
      ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
done

if [[ -z "$TASK_ID" ]]; then
  echo "Error: --task is required" >&2; exit 1
fi
if [[ -z "$MILESTONE" ]]; then
  echo "Error: --milestone is required" >&2; exit 1
fi
if [[ -z "$BEFORE_ID" && -z "$AFTER_ID" ]]; then
  echo "Error: either --before or --after is required" >&2; exit 1
fi
if [[ -n "$BEFORE_ID" && -n "$AFTER_ID" ]]; then
  echo "Error: use only one of --before or --after" >&2; exit 1
fi

# Fetch all tasks and compute the new order
PAYLOAD=$(curl -sf "${API_BASE}/api/tasks?crossBranch=true" | python3 -c "
import json, sys

data = json.load(sys.stdin)
tasks = data if isinstance(data, list) else data.get('tasks', [])

task_id = '${TASK_ID}'
before_id = '${BEFORE_ID}'
after_id = '${AFTER_ID}'
milestone = '${MILESTONE}'
target_status = '${TARGET_STATUS}'

# Find the task to move
task = next((t for t in tasks if t['id'] == task_id), None)
if not task:
    print(f'Error: task {task_id} not found', file=sys.stderr)
    sys.exit(1)

# Determine target status
if not target_status:
    target_status = task['status']

# Get tasks in the target milestone+status, sorted by ordinal
group = [t for t in tasks if t.get('milestone') == milestone and t.get('status') == target_status]
group.sort(key=lambda t: t.get('ordinal', 999999))

# Build ordered ID list without the task being moved
ids = [t['id'] for t in group if t['id'] != task_id]

# Find the reference task position
ref_id = before_id or after_id
if ref_id and ref_id not in ids:
    # Check if ref_id is the task itself (edge case)
    ref_in_group = any(t['id'] == ref_id for t in group)
    if not ref_in_group:
        print(f'Error: reference task {ref_id} not found in milestone={milestone} status={target_status}', file=sys.stderr)
        sys.exit(1)

# Insert task at the right position
if before_id:
    if before_id in ids:
        idx = ids.index(before_id)
        ids.insert(idx, task_id)
    else:
        ids.insert(0, task_id)
elif after_id:
    if after_id in ids:
        idx = ids.index(after_id) + 1
        ids.insert(idx, task_id)
    else:
        ids.append(task_id)

# Ensure the moved task is in the list exactly once
if task_id not in ids:
    ids.append(task_id)

payload = {
    'taskId': task_id,
    'targetStatus': target_status,
    'milestone': milestone,
    'orderedTaskIds': ids
}
print(json.dumps(payload))
")

if [[ -z "$PAYLOAD" ]]; then
  echo "Error: failed to compute reorder payload" >&2; exit 1
fi

# Send the reorder request
RESULT=$(curl -sf -X POST "${API_BASE}/api/tasks/reorder" \
  -H "Content-Type: application/json" \
  -d "$PAYLOAD")

echo "$RESULT" | python3 -c "
import json, sys
data = json.load(sys.stdin)
if data.get('success'):
    task = data.get('task', {})
    print(f\"Reordered {task.get('id', '?')} in {task.get('status', '?')} (milestone {task.get('milestone', '?')})\")
else:
    print(f\"Error: {data.get('error', 'unknown error')}\", file=sys.stderr)
    sys.exit(1)
"
