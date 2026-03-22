import type { CSSProperties } from "react";

export interface Margin {
  top?: number;
  right?: number;
  bottom?: number;
  left?: number;
}

export interface BaseChartProps {
  className?: string;
  style?: CSSProperties;
  title?: string;
  titleFontSize?: string;
  font?: number | string;
  fillStyle?: string;
  tooltipFontSize?: string;
  bowing?: number;
  simplification?: number;
  interactive?: boolean;
  roughness?: number;
  strokeWidth?: number;
  innerStrokeWidth?: number;
  fillWeight?: number;
  margin?: Margin;
}

export interface AxisChartProps extends BaseChartProps {
  stroke?: string;
  axisStrokeWidth?: number;
  axisRoughness?: number;
  axisFontSize?: string;
  xLabel?: string;
  yLabel?: string;
  labelFontSize?: string;
  xValueFormat?: string;
  yValueFormat?: string;
}

export interface BarData {
  labels: string[];
  values: number[];
}

export interface LineData {
  x: string[] | number[];
  y: number[] | number[][];
}

export interface ScatterData {
  x: number[];
  y: number[];
}

export interface PieDonutData {
  labels: string[];
  values: number[];
}

export type StackedBarData = Record<string, string | number>[];
