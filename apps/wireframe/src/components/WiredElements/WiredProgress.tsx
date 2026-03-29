import type { CSSProperties } from "react";
import { useWiredRef } from "./useWiredRef";

interface WiredProgressProps {
  className?: string;
  style?: CSSProperties;
  value?: number;
  min?: number;
  max?: number;
  percentage?: boolean;
}

export function WiredProgress({
  className,
  style,
  value,
  min,
  max,
  percentage,
}: WiredProgressProps) {
  const ref = useWiredRef<HTMLElement>({ value, min, max, percentage });
  return <wired-progress ref={ref} className={className} style={style} />;
}
