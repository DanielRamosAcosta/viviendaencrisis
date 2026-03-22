import { useRef, useEffect } from "react";

export function useWiredRef<T extends HTMLElement>(props: Record<string, unknown>) {
  const ref = useRef<T>(null);

  useEffect(() => {
    const el = ref.current;
    if (!el) return;
    for (const [key, value] of Object.entries(props)) {
      if (value !== undefined) {
        el.setAttribute(key, String(value));
      }
    }
  }, [props]);

  return ref;
}
