import type { CSSProperties } from "react";
import { useWiredRef } from "./useWiredRef";

interface WiredImageProps {
  className?: string;
  style?: CSSProperties;
  src?: string;
  elevation?: number;
}

export function WiredImage({ className, style, src, elevation }: WiredImageProps) {
  const ref = useWiredRef<HTMLElement>({ elevation: elevation ?? 1, src });
  return <wired-image ref={ref} className={className} style={style} />;
}
