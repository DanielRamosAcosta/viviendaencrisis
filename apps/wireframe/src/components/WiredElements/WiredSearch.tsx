import { useRef, useEffect, type CSSProperties } from "react";

interface WiredSearchProps {
  className?: string;
  style?: CSSProperties;
  placeholder?: string;
  value?: string;
  disabled?: boolean;
  onChange?: (value: string) => void;
}

export function WiredSearch({ className, style, placeholder, value, disabled, onChange }: WiredSearchProps) {
  const ref = useRef<HTMLElement>(null);

  useEffect(() => {
    const el = ref.current;
    if (!el || !onChange) return;
    const handler = (e: Event) => onChange((e.target as HTMLInputElement).value);
    el.addEventListener("input", handler);
    return () => el.removeEventListener("input", handler);
  }, [onChange]);

  return (
    <wired-search
      ref={ref}
      className={className}
      style={style}
      placeholder={placeholder}
      value={value}
      disabled={disabled || undefined}
    />
  );
}
