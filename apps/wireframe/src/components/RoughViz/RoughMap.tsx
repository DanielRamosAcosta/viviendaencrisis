import { useRef, useEffect, useId, useMemo } from "react";
import { geoPath, geoMercator, type GeoProjection } from "d3-geo";
import rough from "roughjs";
import type { Feature, FeatureCollection, Geometry } from "geojson";
import type { CSSProperties, ReactNode } from "react";

interface RoughMapProps {
  data: FeatureCollection;
  width?: number;
  height?: number;
  className?: string;
  style?: CSSProperties;
  projection?: () => GeoProjection;
  fitSize?: boolean;
  fill?: string | ((feature: Feature) => string);
  stroke?: string;
  strokeWidth?: number;
  roughness?: number;
  fillStyle?: string;
  fillWeight?: number;
  hachureGap?: number;
  bowing?: number;
  simplification?: number;
  children?: ReactNode;
}

export function RoughMap({
  data,
  width = 600,
  height = 400,
  className,
  style,
  projection: createProjection,
  fitSize = true,
  fill = "rgba(0,0,0,0.08)",
  stroke = "#333",
  strokeWidth = 1,
  roughness = 1.5,
  fillStyle = "hachure",
  fillWeight = 0.5,
  hachureGap = 4,
  bowing = 1,
  simplification = 0.3,
  children,
}: RoughMapProps) {
  const svgRef = useRef<SVGSVGElement>(null);
  const gRef = useRef<SVGGElement>(null);
  const id = useId().replace(/:/g, "_");

  const proj = useMemo(() => {
    const p = createProjection ? createProjection() : geoMercator();
    if (fitSize) {
      p.fitSize([width, height], data);
    }
    return p;
  }, [data, width, height, fitSize, createProjection]);

  const pathGen = useMemo(() => geoPath(proj), [proj]);

  useEffect(() => {
    const g = gRef.current;
    if (!g) return;

    // Clear previous rough paths
    while (g.firstChild) {
      g.removeChild(g.firstChild);
    }

    const rc = rough.svg(g.ownerSVGElement!);

    for (const feature of data.features) {
      const d = pathGen(feature as Feature<Geometry>);
      if (!d) continue;

      const featureFill = typeof fill === "function" ? fill(feature) : fill;

      const node = rc.path(d, {
        fill: featureFill,
        stroke,
        strokeWidth,
        roughness,
        fillStyle,
        fillWeight,
        hachureGap,
        bowing,
        simplification,
      });

      node.setAttribute("data-id", String(feature.id ?? ""));
      node.setAttribute(
        "data-name",
        String((feature.properties as Record<string, unknown>)?.name ?? ""),
      );

      g.appendChild(node);
    }
  }, [
    data,
    pathGen,
    fill,
    stroke,
    strokeWidth,
    roughness,
    fillStyle,
    fillWeight,
    hachureGap,
    bowing,
    simplification,
  ]);

  return (
    <svg
      ref={svgRef}
      id={`roughmap_${id}`}
      viewBox={`0 0 ${width} ${height}`}
      width={width}
      height={height}
      className={className}
      style={{ maxWidth: "100%", height: "auto", ...style }}
    >
      <g ref={gRef} />
      {children}
    </svg>
  );
}
