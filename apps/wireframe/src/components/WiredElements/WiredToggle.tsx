import { useRef, useEffect, type CSSProperties } from "react";

interface WiredToggleProps {
  className?: string;
  style?: CSSProperties;
  checked?: boolean;
  disabled?: boolean;
  onChange?: (checked: boolean) => void;
}

export function WiredToggle({ className, style, checked, disabled, onChange }: WiredToggleProps) {
  const ref = useRef<HTMLElement>(null);

  useEffect(() => {
    const el = ref.current;
    if (!el || !onChange) return;
    const handler = () => onChange((el as unknown as { checked: boolean }).checked);
    el.addEventListener("change", handler);
    return () => el.removeEventListener("change", handler);
  }, [onChange]);

  return (
    <wired-toggle
      ref={ref}
      className={className}
      style={style}
      checked={checked || undefined}
      disabled={disabled || undefined}
    />
  );
}
