import { useRef, useEffect, type ReactNode, type CSSProperties } from "react";

interface WiredTabsProps {
  children?: ReactNode;
  className?: string;
  style?: CSSProperties;
  selected?: string;
  onSelected?: (name: string) => void;
}

export function WiredTabs({ children, className, style, selected, onSelected }: WiredTabsProps) {
  const ref = useRef<HTMLElement>(null);

  useEffect(() => {
    const el = ref.current;
    if (!el || !onSelected) return;
    const handler = (e: Event) => onSelected((e as CustomEvent).detail.name);
    el.addEventListener("selected", handler);
    return () => el.removeEventListener("selected", handler);
  }, [onSelected]);

  return (
    <wired-tabs ref={ref} className={className} style={style} selected={selected}>
      {children}
    </wired-tabs>
  );
}
