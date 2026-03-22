import { useState, useMemo } from "react";
import { feature } from "topojson-client";
import type { Topology } from "topojson-specification";
import type { FeatureCollection } from "geojson";
import spainTopo from "es-atlas/es/autonomous_regions.json";
import { WiredCard, WiredCombo, WiredDivider } from "../../components/WiredElements";
import { RoughBarH, RoughMap } from "../../components/RoughViz";
import { Typography } from "../../components/Typography";
import { cityPricesM2, ccaaColors } from "../../data/mockData";
import styles from "./PrecioMetroCuadrado.module.css";

export function PrecioMetroCuadrado() {
  const [_tipo, setTipo] = useState("alquiler");

  const spainGeo = useMemo(() => {
    const topo = spainTopo as unknown as Topology;
    return feature(topo, topo.objects.autonomous_regions) as FeatureCollection;
  }, []);

  return (
    <div className={styles.container}>
      <Typography as="h1">Precio por Metro Cuadrado</Typography>
      <Typography as="p" className={styles.subtitle}>
        Ranking de ciudades por precio/m2 y mapa coropletico por comunidad autonoma.
      </Typography>

      <WiredCard elevation={2} className={styles.section}>
        <div className={styles.filterRow}>
          <Typography as="span">Tipo:</Typography>
          <WiredCombo selected="alquiler" onSelected={(v: string) => setTipo(v)}>
            <wired-item value="alquiler">Alquiler</wired-item>
            <wired-item value="compraventa">Compraventa</wired-item>
          </WiredCombo>
        </div>
      </WiredCard>

      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h2">Ranking por precio/m2</Typography>
        <WiredDivider />
        <RoughBarH
          data={cityPricesM2}
          title="Precio medio (EUR/m2/mes)"
          color="#778beb"
          highlight="#f5cd79"
          roughness={2}
          className={styles.chart}
        />
      </WiredCard>

      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h2">Mapa coropletico</Typography>
        <WiredDivider />
        <div className={styles.mapWrapper}>
          <RoughMap
            data={spainGeo}
            width={700}
            height={500}
            fill={(f) => {
              const name = (f.properties as Record<string, unknown>)?.name as string;
              return ccaaColors[name] ?? "rgba(0,0,0,0.08)";
            }}
            stroke="#333"
            roughness={1.5}
            fillStyle="hachure"
            hachureGap={4}
          />
        </div>
      </WiredCard>

      <Typography as="p" className={styles.source}>
        Fuente: MIVAU / INE — Ultima actualizacion: 2024-Q3
      </Typography>
    </div>
  );
}
