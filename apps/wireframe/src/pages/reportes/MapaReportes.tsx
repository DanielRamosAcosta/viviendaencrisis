import { useMemo, useState } from "react";
import { feature } from "topojson-client";
import type { Topology } from "topojson-specification";
import type { FeatureCollection } from "geojson";
import spainTopo from "es-atlas/es/autonomous_regions.json";
import { Typography } from "../../components/Typography";
import { WiredCard, WiredCombo } from "../../components/WiredElements";
import { RoughMap } from "../../components/RoughViz";
import { reports, irregularityTypes, ccaaColors } from "../../data/mockData";
import styles from "./MapaReportes.module.css";

export function MapaReportes() {
  const [filterType, setFilterType] = useState("Todos");

  const spainGeo = useMemo(() => {
    const topo = spainTopo as unknown as Topology;
    return feature(topo, topo.objects.autonomous_regions) as FeatureCollection;
  }, []);

  const filteredReports =
    filterType === "Todos" ? reports : reports.filter((r) => r.type === filterType);

  return (
    <div className={styles.container}>
      <Typography as="h1">Mapa de Reportes</Typography>
      <Typography as="p" className={styles.subtitle}>
        Distribucion geografica de las irregularidades reportadas en Espana.
      </Typography>

      <div className={styles.filterRow}>
        <Typography as="span">Filtrar por tipo:</Typography>
        <WiredCombo selected={filterType} onSelected={(val: string) => setFilterType(val)}>
          <wired-item value="Todos">Todos</wired-item>
          {irregularityTypes.map((t) => (
            <wired-item key={t} value={t}>
              {t}
            </wired-item>
          ))}
        </WiredCombo>
      </div>

      <WiredCard elevation={2} className={styles.mapSection}>
        <RoughMap
          data={spainGeo}
          width={700}
          height={500}
          fill={(f) => {
            const name = (f.properties as Record<string, unknown>)?.name as string;
            return ccaaColors[name] ?? "rgba(0,0,0,0.08)";
          }}
          stroke="#333"
          strokeWidth={0.8}
          roughness={1.5}
          fillStyle="hachure"
          hachureGap={4}
          fillWeight={0.6}
        />
      </WiredCard>

      <WiredCard elevation={2} className={styles.summaryCard}>
        <Typography as="h3">Resumen</Typography>
        <Typography as="p">Total de reportes mostrados: {filteredReports.length}</Typography>
        <div className={styles.statGrid}>
          {irregularityTypes.map((t) => {
            const count = filteredReports.filter((r) => r.type === t).length;
            if (count === 0) return null;
            return (
              <div key={t} className={styles.statItem}>
                <Typography as="span" className={styles.statCount}>
                  {count}
                </Typography>
                <Typography as="span">{t}</Typography>
              </div>
            );
          })}
        </div>
      </WiredCard>
    </div>
  );
}
