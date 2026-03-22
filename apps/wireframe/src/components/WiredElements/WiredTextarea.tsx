import { useRef, useEffect, type CSSProperties } from "react";

interface WiredTextareaProps {
  className?: string;
  style?: CSSProperties;
  placeholder?: string;
  value?: string;
  rows?: number;
  disabled?: boolean;
  onChange?: (value: string) => void;
}

export function WiredTextarea({ className, style, placeholder, value, rows, disabled, onChange }: WiredTextareaProps) {
  const ref = useRef<HTMLElement>(null);

  useEffect(() => {
    const el = ref.current;
    if (!el || !onChange) return;
    const handler = (e: Event) => onChange((e.target as HTMLTextAreaElement).value);
    el.addEventListener("input", handler);
    return () => el.removeEventListener("input", handler);
  }, [onChange]);

  return (
    <wired-textarea
      ref={ref}
      className={className}
      style={style}
      placeholder={placeholder}
      value={value}
      rows={rows}
      disabled={disabled || undefined}
    />
  );
}
