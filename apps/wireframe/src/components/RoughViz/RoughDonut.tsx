import { Donut } from "rough-viz";
import { useRoughViz } from "./useRoughViz";
import type { BaseChartProps, PieDonutData } from "./types";

interface RoughDonutProps extends BaseChartProps {
  data: PieDonutData;
  colors?: string[];
  highlight?: string;
  legend?: boolean;
  legendPosition?: "left" | "right";
}

export function RoughDonut({ className, style, ...opts }: RoughDonutProps) {
  const { ref, containerId } = useRoughViz(Donut, opts);
  return <div ref={ref} id={containerId} className={className} style={style} />;
}
