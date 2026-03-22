import type { ReactNode, CSSProperties } from "react";

interface WiredIconProps {
  children?: ReactNode;
  className?: string;
  style?: CSSProperties;
}

export function WiredIcon({ children, className, style }: WiredIconProps) {
  return (
    <wired-icon className={className} style={style}>
      {children}
    </wired-icon>
  );
}
