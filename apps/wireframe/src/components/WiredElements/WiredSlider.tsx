import { useRef, useEffect, type CSSProperties } from "react";

interface WiredSliderProps {
  className?: string;
  style?: CSSProperties;
  value?: number;
  min?: number;
  max?: number;
  onChange?: (value: number) => void;
}

export function WiredSlider({ className, style, value, min, max, onChange }: WiredSliderProps) {
  const ref = useRef<HTMLElement>(null);

  useEffect(() => {
    const el = ref.current;
    if (!el || !onChange) return;
    const handler = (e: Event) => onChange(Number((e as CustomEvent).detail.value));
    el.addEventListener("change", handler);
    return () => el.removeEventListener("change", handler);
  }, [onChange]);

  return <wired-slider ref={ref} className={className} style={style} value={value} min={min} max={max} />;
}
