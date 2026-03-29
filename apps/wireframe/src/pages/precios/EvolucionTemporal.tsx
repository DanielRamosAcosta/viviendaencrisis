import { useState, useMemo } from "react";
import { feature } from "topojson-client";
import type { Topology } from "topojson-specification";
import type { FeatureCollection } from "geojson";
import spainTopo from "es-atlas/es/autonomous_regions.json";
import { WiredCard, WiredTabs, WiredCombo, WiredSearch, WiredDivider } from "../../components/WiredElements";
import { RoughLine, RoughMap } from "../../components/RoughViz";
import { Typography } from "../../components/Typography";
import { priceEvolution, priceEvolutionBuy, ccaaColors } from "../../data/mockData";
import styles from "./EvolucionTemporal.module.css";

export function EvolucionTemporal() {
  const [activeTab, setActiveTab] = useState("grafico");
  const [tipoFilter, setTipoFilter] = useState("alquiler");
  const [_periodoFilter, setPeriodoFilter] = useState("todo");

  const spainGeo = useMemo(() => {
    const topo = spainTopo as unknown as Topology;
    return feature(topo, topo.objects.autonomous_regions) as FeatureCollection;
  }, []);

  const chartData = tipoFilter === "compraventa" ? priceEvolutionBuy : priceEvolution;
  const chartTitle = tipoFilter === "compraventa"
    ? "Evolucion del precio de compraventa (EUR/m2)"
    : "Evolucion del precio de alquiler (EUR/mes)";

  return (
    <div className={styles.container}>
      <Typography as="h1">Evolucion Temporal de Precios</Typography>
      <Typography as="p" className={styles.subtitle}>
        Consulta la evolucion de precios de vivienda por trimestre en distintas zonas de Espana.
      </Typography>

      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h3">Buscar zona</Typography>
        <WiredSearch placeholder="Buscar zona (ej: Madrid, Barcelona...)" />
      </WiredCard>

      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h3">Filtros</Typography>
        <WiredDivider />
        <div className={styles.filtersRow}>
          <div className={styles.filterGroup}>
            <Typography as="span">Tipo:</Typography>
            <WiredCombo selected={tipoFilter} onSelected={(v: string) => setTipoFilter(v)}>
              <wired-item value="alquiler">Alquiler</wired-item>
              <wired-item value="compraventa">Compraventa</wired-item>
              <wired-item value="ambos">Ambos</wired-item>
            </WiredCombo>
          </div>
          <div className={styles.filterGroup}>
            <Typography as="span">Periodo:</Typography>
            <WiredCombo selected="todo" onSelected={(v: string) => setPeriodoFilter(v)}>
              <wired-item value="1a">Ultimo ano</wired-item>
              <wired-item value="3a">3 anos</wired-item>
              <wired-item value="5a">5 anos</wired-item>
              <wired-item value="todo">Todo</wired-item>
            </WiredCombo>
          </div>
        </div>
      </WiredCard>

      <WiredCard elevation={2} className={styles.section}>
        <WiredTabs selected={activeTab} onSelected={(v: string) => setActiveTab(v)}>
          <wired-tab name="grafico">Grafico</wired-tab>
          <wired-tab name="mapa">Mapa</wired-tab>
        </WiredTabs>
        <WiredDivider />

        {activeTab === "grafico" && (
          <RoughLine
            data={{ y: chartData.y }}
            x={chartData.x}
            title={chartTitle}
            xLabel="Trimestre"
            yLabel="EUR"
            colors={["#f78fb3"]}
            roughness={2}
            circle
            circleRadius={6}
            className={styles.chart}
          />
        )}

        {activeTab === "mapa" && (
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
        )}
      </WiredCard>

      <Typography as="p" className={styles.source}>
        Fuente: MIVAU / INE — Ultima actualizacion: 2024-Q3
      </Typography>
    </div>
  );
}
