import { Scatter } from "rough-viz";
import { useRoughViz } from "./useRoughViz";
import type { AxisChartProps, ScatterData } from "./types";

interface RoughScatterProps extends AxisChartProps {
  data: ScatterData;
  colors?: string[];
  colorVar?: string;
  highlight?: string;
  highlightLabel?: "x" | "y" | "xy";
  radius?: number;
  radiusExtent?: [number, number];
  curbZero?: boolean;
}

export function RoughScatter({ className, style, ...opts }: RoughScatterProps) {
  const { ref, containerId } = useRoughViz(Scatter, opts);
  return <div ref={ref} id={containerId} className={className} style={style} />;
}
