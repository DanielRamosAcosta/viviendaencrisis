import { StackedBar } from "rough-viz";
import { useRoughViz } from "./useRoughViz";
import type { AxisChartProps, StackedBarData } from "./types";

interface RoughStackedBarProps extends AxisChartProps {
  data: StackedBarData;
  colors?: string[];
  highlight?: string;
  padding?: number;
  labels?: string;
}

export function RoughStackedBar({ className, style, ...opts }: RoughStackedBarProps) {
  const { ref, containerId } = useRoughViz(StackedBar, opts);
  return <div ref={ref} id={containerId} className={className} style={style} />;
}
