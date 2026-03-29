import type { ReactNode, CSSProperties } from "react";

interface WiredLinkProps {
  children?: ReactNode;
  className?: string;
  style?: CSSProperties;
  elevation?: number;
  href?: string;
  target?: string;
}

export function WiredLink({ children, className, style, elevation, href, target }: WiredLinkProps) {
  return (
    <wired-link
      className={className}
      style={style}
      elevation={elevation}
      href={href}
      target={target}
    >
      {children}
    </wired-link>
  );
}
