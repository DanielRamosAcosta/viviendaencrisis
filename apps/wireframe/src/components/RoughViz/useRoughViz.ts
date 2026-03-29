import { useRef, useEffect, useId } from "react";

// Queue to serialize chart creation — rough-viz uses global DOM selectors
// (selectAll("path.domain"), selectAll("g.tick")) that conflict when
// multiple charts initialize in the same frame.
const queue: (() => void)[] = [];
let running = false;

function enqueue(fn: () => void) {
  queue.push(fn);
  if (!running) flush();
}

function flush() {
  running = true;
  const next = queue.shift();
  if (!next) {
    running = false;
    return;
  }
  // Use two rAF calls: first to let layout settle, second to flush after paint
  requestAnimationFrame(() => {
    next();
    requestAnimationFrame(flush);
  });
}

export function useRoughViz<O extends Record<string, unknown>>(
  ChartClass: new (opts: O & { element: string }) => unknown,
  opts: O,
) {
  const ref = useRef<HTMLDivElement>(null);
  const id = useId().replace(/:/g, "_");
  const containerId = `roughviz${id}`;
  const optsKey = JSON.stringify(opts);

  useEffect(() => {
    const node = ref.current;
    if (!node) return;

    let chart: Record<string, unknown> | undefined;
    let cancelled = false;

    enqueue(() => {
      if (cancelled) return;
      const { width, height } = node.getBoundingClientRect();
      if (width < 1 || height < 1) return;
      chart = new ChartClass({ ...opts, element: `#${containerId}` }) as Record<string, unknown>;
    });

    return () => {
      cancelled = true;
      if (chart) {
        chart.responsive = false;
      }
      while (node.firstChild) {
        node.removeChild(node.firstChild);
      }
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [ChartClass, containerId, optsKey]);

  return { ref, containerId };
}
