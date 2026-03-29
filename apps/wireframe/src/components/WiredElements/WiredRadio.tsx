import { useRef, useEffect, type CSSProperties } from "react";

interface WiredRadioProps {
  className?: string;
  style?: CSSProperties;
  checked?: boolean;
  disabled?: boolean;
  name?: string;
  text?: string;
  onChange?: (checked: boolean) => void;
}

export function WiredRadio({
  className,
  style,
  checked,
  disabled,
  name,
  text,
  onChange,
}: WiredRadioProps) {
  const ref = useRef<HTMLElement>(null);

  useEffect(() => {
    const el = ref.current;
    if (!el || !onChange) return;
    const handler = () => onChange((el as unknown as { checked: boolean }).checked);
    el.addEventListener("change", handler);
    return () => el.removeEventListener("change", handler);
  }, [onChange]);

  return (
    <wired-radio
      ref={ref}
      className={className}
      style={style}
      checked={checked || undefined}
      disabled={disabled || undefined}
      name={name}
      text={text}
    />
  );
}
