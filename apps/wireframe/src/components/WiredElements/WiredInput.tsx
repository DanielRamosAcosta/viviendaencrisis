import { useRef, useEffect, type CSSProperties } from "react";

interface WiredInputProps {
  className?: string;
  style?: CSSProperties;
  placeholder?: string;
  value?: string;
  type?: string;
  disabled?: boolean;
  onChange?: (value: string) => void;
}

export function WiredInput({
  className,
  style,
  placeholder,
  value,
  type,
  disabled,
  onChange,
}: WiredInputProps) {
  const ref = useRef<HTMLElement>(null);

  useEffect(() => {
    const el = ref.current;
    if (!el || !onChange) return;
    const handler = (e: Event) => onChange((e.target as HTMLInputElement).value);
    el.addEventListener("input", handler);
    return () => el.removeEventListener("input", handler);
  }, [onChange]);

  return (
    <wired-input
      ref={ref}
      className={className}
      style={style}
      placeholder={placeholder}
      value={value}
      type={type}
      disabled={disabled || undefined}
    />
  );
}
