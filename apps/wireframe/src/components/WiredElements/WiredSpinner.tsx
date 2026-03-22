import type { CSSProperties } from "react";
import { useWiredRef } from "./useWiredRef";

interface WiredSpinnerProps {
  className?: string;
  style?: CSSProperties;
  spinning?: boolean;
  duration?: number;
}

export function WiredSpinner({ className, style, spinning, duration }: WiredSpinnerProps) {
  const ref = useWiredRef<HTMLElement>({ spinning, duration });
  return <wired-spinner ref={ref} className={className} style={style} />;
}
