import type { CSSProperties } from "react";

interface WiredVideoProps {
  className?: string;
  style?: CSSProperties;
  src?: string;
  autoplay?: boolean;
  loop?: boolean;
  muted?: boolean;
}

export function WiredVideo({ className, style, src, autoplay, loop, muted }: WiredVideoProps) {
  return (
    <wired-video
      className={className}
      style={style}
      src={src}
      autoplay={autoplay || undefined}
      loop={loop || undefined}
      muted={muted || undefined}
    />
  );
}
