import { Line } from "rough-viz";
import { useRoughViz } from "./useRoughViz";
import type { AxisChartProps, LineData } from "./types";

interface RoughLineProps extends AxisChartProps {
  data: LineData;
  x?: string[] | number[];
  colors?: string[];
  legend?: boolean;
  legendPosition?: "left" | "right";
  circle?: boolean;
  circleRadius?: number;
  circleRoughness?: number;
}

export function RoughLine({ className, style, ...opts }: RoughLineProps) {
  const { ref, containerId } = useRoughViz(Line, opts);
  return <div ref={ref} id={containerId} className={className} style={style} />;
}
