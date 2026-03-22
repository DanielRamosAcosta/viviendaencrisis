import { useRef, useEffect, type ReactNode, type CSSProperties } from "react";

interface WiredDialogProps {
  children?: ReactNode;
  className?: string;
  style?: CSSProperties;
  open?: boolean;
}

export function WiredDialog({ children, className, style, open }: WiredDialogProps) {
  const ref = useRef<HTMLElement>(null);

  useEffect(() => {
    const el = ref.current;
    if (!el) return;
    if (open) {
      el.setAttribute("open", "");
    } else {
      el.removeAttribute("open");
    }
  }, [open]);

  return (
    <wired-dialog ref={ref} className={className} style={style}>
      {children}
    </wired-dialog>
  );
}
