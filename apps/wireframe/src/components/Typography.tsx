import type { ElementType, ComponentPropsWithoutRef } from "react";

type TypographyProps<T extends ElementType = "span"> = {
  as?: T;
} & ComponentPropsWithoutRef<T>;

export function Typography<T extends ElementType = "span">({
  as,
  style,
  ...props
}: TypographyProps<T>) {
  const Component = as || "span";
  return (
    <Component
      style={{ fontFamily: "Gloria Hallelujah, cursive", ...style }}
      {...props}
    />
  );
}
