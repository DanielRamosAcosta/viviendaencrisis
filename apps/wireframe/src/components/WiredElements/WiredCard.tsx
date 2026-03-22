import type { ReactNode, CSSProperties } from "react";
import { useWiredRef } from "./useWiredRef";

interface WiredCardProps {
  children?: ReactNode;
  className?: string;
  style?: CSSProperties;
  elevation?: number;
}

export function WiredCard({ children, className, style, elevation }: WiredCardProps) {
  const ref = useWiredRef<HTMLElement>({ elevation: elevation ?? 1 });
  return (
    <wired-card ref={ref} className={className} style={style}>
      {children}
    </wired-card>
  );
}
