import { useRef, useEffect, type ReactNode, type CSSProperties } from "react";

interface WiredListboxProps {
  children?: ReactNode;
  className?: string;
  style?: CSSProperties;
  selected?: string;
  onSelected?: (value: string) => void;
}

export function WiredListbox({
  children,
  className,
  style,
  selected,
  onSelected,
}: WiredListboxProps) {
  const ref = useRef<HTMLElement>(null);

  useEffect(() => {
    const el = ref.current;
    if (!el || !onSelected) return;
    const handler = (e: Event) => onSelected((e as CustomEvent).detail.selected);
    el.addEventListener("selected", handler);
    return () => el.removeEventListener("selected", handler);
  }, [onSelected]);

  return (
    <wired-listbox ref={ref} className={className} style={style} selected={selected}>
      {children}
    </wired-listbox>
  );
}
