import { Bar } from "rough-viz";
import { useRoughViz } from "./useRoughViz";
import type { AxisChartProps, BarData } from "./types";

interface RoughBarProps extends AxisChartProps {
  data: BarData;
  color?: string;
  highlight?: string;
  padding?: number;
}

export function RoughBar({ className, style, ...opts }: RoughBarProps) {
  const { ref, containerId } = useRoughViz(Bar, opts);
  return <div ref={ref} id={containerId} className={className} style={style} />;
}
