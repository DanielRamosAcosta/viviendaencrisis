import { Pie } from "rough-viz";
import { useRoughViz } from "./useRoughViz";
import type { BaseChartProps, PieDonutData } from "./types";

interface RoughPieProps extends BaseChartProps {
  data: PieDonutData;
  colors?: string[];
  highlight?: string;
  legend?: boolean;
  legendPosition?: "left" | "right";
}

export function RoughPie({ className, style, ...opts }: RoughPieProps) {
  const { ref, containerId } = useRoughViz(Pie, opts);
  return <div ref={ref} id={containerId} className={className} style={style} />;
}
