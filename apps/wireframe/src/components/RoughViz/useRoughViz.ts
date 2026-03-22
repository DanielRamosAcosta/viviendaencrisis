import { useRef, useEffect, useId } from "react";

export function useRoughViz<O extends Record<string, unknown>>(
  ChartClass: new (opts: O & { element: string }) => unknown,
  opts: O,
) {
  const ref = useRef<HTMLDivElement>(null);
  const id = useId().replace(/:/g, "_");
  const containerId = `roughviz${id}`;

  useEffect(() => {
    const node = ref.current;
    if (!node) return;

    // rough-viz reads dimensions via getBoundingClientRect on the container.
    // If the container has no intrinsic size yet, defer to next frame.
    const frame = requestAnimationFrame(() => {
      new ChartClass({ ...opts, element: `#${containerId}` });
    });

    return () => {
      cancelAnimationFrame(frame);
      while (node.firstChild) {
        node.removeChild(node.firstChild);
      }
    };
  });

  return { ref, containerId };
}
