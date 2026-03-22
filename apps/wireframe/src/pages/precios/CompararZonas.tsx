import { useState } from "react";
import { WiredCard, WiredButton, WiredTabs, WiredSearch, WiredDivider } from "../../components/WiredElements";
import { RoughBar } from "../../components/RoughViz";
import { Typography } from "../../components/Typography";
import { cityPrices } from "../../data/mockData";
import styles from "./CompararZonas.module.css";

export function CompararZonas() {
  const [activeView, setActiveView] = useState("preciom2");
  const [zoneCount, setZoneCount] = useState(2);

  const zoneInputs = Array.from({ length: zoneCount }, (_, i) => i);

  return (
    <div className={styles.container}>
      <Typography as="h1">Comparar Zonas</Typography>
      <Typography as="p" className={styles.subtitle}>
        Selecciona entre 2 y 4 zonas para comparar precios de vivienda lado a lado.
      </Typography>

      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h3">Selecciona zonas</Typography>
        <WiredDivider />
        <div className={styles.zoneInputs}>
          {zoneInputs.map((i) => (
            <div key={i} className={styles.zoneInput}>
              <Typography as="span">Zona {String.fromCharCode(65 + i)}:</Typography>
              <WiredSearch placeholder={`Buscar zona ${String.fromCharCode(65 + i)}...`} />
            </div>
          ))}
        </div>
        {zoneCount < 4 && (
          <WiredButton onClick={() => setZoneCount((c) => Math.min(4, c + 1))}>
            Anadir zona
          </WiredButton>
        )}
      </WiredCard>

      <WiredCard elevation={2} className={styles.section}>
        <WiredTabs selected={activeView} onSelected={(v: string) => setActiveView(v)}>
          <wired-tab name="preciom2">Precio/m2</wired-tab>
          <wired-tab name="evolucion">Evolucion</wired-tab>
          <wired-tab name="ranking">Ranking</wired-tab>
        </WiredTabs>
        <WiredDivider />

        <div className={styles.chartsRow}>
          <div className={styles.chartCol}>
            <Typography as="h4">Zona A: Madrid</Typography>
            <RoughBar
              data={{
                labels: cityPrices.labels.slice(0, 4),
                values: cityPrices.values.slice(0, 4),
              }}
              title="Precio medio (EUR/mes)"
              color="#f78fb3"
              roughness={2}
              className={styles.chart}
            />
          </div>
          <div className={styles.chartCol}>
            <Typography as="h4">Zona B: Barcelona</Typography>
            <RoughBar
              data={{
                labels: cityPrices.labels.slice(0, 4),
                values: cityPrices.values.map((v) => Math.round(v * 0.94)),
              }}
              title="Precio medio (EUR/mes)"
              color="#3dc1d3"
              roughness={2}
              className={styles.chart}
            />
          </div>
        </div>
      </WiredCard>

      <Typography as="p" className={styles.source}>
        Fuente: MIVAU / INE — Ultima actualizacion: 2024-Q3
      </Typography>
    </div>
  );
}
