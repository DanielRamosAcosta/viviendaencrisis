import { useRef, useEffect, type CSSProperties } from "react";

interface WiredCalendarProps {
  className?: string;
  style?: CSSProperties;
  selected?: string;
  firstdate?: string;
  lastdate?: string;
  locale?: string;
  onSelected?: (date: { date: Date; text: string }) => void;
}

export function WiredCalendar({
  className,
  style,
  selected,
  firstdate,
  lastdate,
  locale,
  onSelected,
}: WiredCalendarProps) {
  const ref = useRef<HTMLElement>(null);

  useEffect(() => {
    const el = ref.current;
    if (!el || !onSelected) return;
    const handler = (e: Event) => onSelected((e as CustomEvent).detail);
    el.addEventListener("selected", handler);
    return () => el.removeEventListener("selected", handler);
  }, [onSelected]);

  return (
    <wired-calendar
      ref={ref}
      className={className}
      style={style}
      selected={selected}
      firstdate={firstdate}
      lastdate={lastdate}
      locale={locale}
    />
  );
}
