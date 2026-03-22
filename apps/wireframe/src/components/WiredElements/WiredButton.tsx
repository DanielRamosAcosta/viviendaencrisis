import { useEffect, type ReactNode, type CSSProperties } from "react";
import { useWiredRef } from "./useWiredRef";

interface WiredButtonProps {
  children?: ReactNode;
  className?: string;
  style?: CSSProperties;
  elevation?: number;
  disabled?: boolean;
  onClick?: () => void;
}

export function WiredButton({ children, className, style, elevation, disabled, onClick }: WiredButtonProps) {
  const ref = useWiredRef<HTMLElement>({ elevation: elevation ?? 1 });

  useEffect(() => {
    const el = ref.current;
    if (!el || !onClick) return;
    el.addEventListener("click", onClick);
    return () => el.removeEventListener("click", onClick);
  }, [onClick]);

  return (
    <wired-button ref={ref} className={className} style={style} disabled={disabled || undefined}>
      {children}
    </wired-button>
  );
}
