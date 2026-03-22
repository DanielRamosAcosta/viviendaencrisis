import { useRef, useEffect, type CSSProperties } from "react";

interface WiredFabProps {
  className?: string;
  style?: CSSProperties;
  disabled?: boolean;
  onClick?: () => void;
}

export function WiredFab({ className, style, disabled, onClick }: WiredFabProps) {
  const ref = useRef<HTMLElement>(null);

  useEffect(() => {
    const el = ref.current;
    if (!el || !onClick) return;
    el.addEventListener("click", onClick);
    return () => el.removeEventListener("click", onClick);
  }, [onClick]);

  return <wired-fab ref={ref} className={className} style={style} disabled={disabled || undefined} />;
}
