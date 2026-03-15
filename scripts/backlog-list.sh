#!/usr/bin/env bash
# List backlog tasks ordered by ordinal
# Usage: backlog-list.sh [--milestone <id>] [--status <status>]

set -euo pipefail

API_BASE="http://localhost:6420"
MILESTONE=""
STATUS=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --milestone) MILESTONE="$2"; shift 2 ;;
    --status)    STATUS="$2";    shift 2 ;;
    -h|--help)
      echo "Usage: $0 [--milestone <id>] [--status <status>]"
      echo ""
      echo "Options:"
      echo "  --milestone <id>      Filter by milestone (e.g. m-1)"
      echo "  --status <status>     Filter by status (e.g. \"To Do\")"
      echo ""
      echo "Examples:"
      echo "  $0 --milestone m-1"
      echo "  $0 --milestone m-1 --status \"To Do\""
      exit 0
      ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
done

curl -sf "${API_BASE}/api/tasks?crossBranch=true" | python3 -c "
import json, sys

data = json.load(sys.stdin)
tasks = data if isinstance(data, list) else data.get('tasks', [])

milestone = '${MILESTONE}'
status = '${STATUS}'

if milestone:
    tasks = [t for t in tasks if t.get('milestone') == milestone]
if status:
    tasks = [t for t in tasks if t.get('status') == status]

tasks.sort(key=lambda t: t.get('ordinal', 999999))

if not tasks:
    print('No tasks found.')
    sys.exit(0)

# Column widths
ord_w = max(len(str(t.get('ordinal', ''))) for t in tasks)
ord_w = max(ord_w, 7)
status_w = max(len(t.get('status', '')) for t in tasks)
status_w = max(status_w, 6)
id_w = max(len(t.get('id', '')) for t in tasks)
id_w = max(id_w, 2)

header = f\"{'ordinal':>{ord_w}} | {'status':<{status_w}} | {'id':<{id_w}} | title\"
print(header)
print('-' * len(header) + '---')

for t in tasks:
    ordinal = t.get('ordinal', '')
    status = t.get('status', '')
    tid = t.get('id', '')
    title = t.get('title', '')
    print(f\"{str(ordinal):>{ord_w}} | {status:<{status_w}} | {tid:<{id_w}} | {title}\")
"
