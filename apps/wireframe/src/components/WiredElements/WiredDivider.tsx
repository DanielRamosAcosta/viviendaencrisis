import type { CSSProperties } from "react";
import { useWiredRef } from "./useWiredRef";

interface WiredDividerProps {
  className?: string;
  style?: CSSProperties;
  elevation?: number;
}

export function WiredDivider({ className, style, elevation }: WiredDividerProps) {
  const ref = useWiredRef<HTMLElement>({ elevation: elevation ?? 1 });
  return <wired-divider ref={ref} className={className} style={style} />;
}
