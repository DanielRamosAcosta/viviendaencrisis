import type { ElementType, ComponentPropsWithoutRef } from "react";
import typographyStyles from "./Typography.module.css";

type TypographyProps<T extends ElementType = "span"> = {
  as?: T;
} & ComponentPropsWithoutRef<T>;

export function Typography<T extends ElementType = "span">({
  as,
  className,
  ...props
}: TypographyProps<T>) {
  const Component = as || "span";
  return (
    <Component
      className={[typographyStyles.typography, className].filter(Boolean).join(" ")}
      {...props}
    />
  );
}
