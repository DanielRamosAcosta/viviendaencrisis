import { BarH } from "rough-viz";
import { useRoughViz } from "./useRoughViz";
import type { AxisChartProps, BarData } from "./types";

interface RoughBarHProps extends AxisChartProps {
  data: BarData;
  color?: string;
  highlight?: string;
  padding?: number;
}

export function RoughBarH({ className, style, ...opts }: RoughBarHProps) {
  const { ref, containerId } = useRoughViz(BarH, opts);
  return <div ref={ref} id={containerId} className={className} style={style} />;
}
