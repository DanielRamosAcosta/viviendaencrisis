import { useState } from "react";
import { WiredCard, WiredButton, WiredTabs, WiredSearch, WiredDivider } from "../../components/WiredElements";
import { RoughStackedBar } from "../../components/RoughViz";
import { Typography } from "../../components/Typography";
import { cityPrices } from "../../data/mockData";
import styles from "./CompararZonas.module.css";

const comparisonData = cityPrices.labels.slice(0, 4).map((label, i) => ({
  city: label,
  "Zona A": cityPrices.values[i],
  "Zona B": Math.round(cityPrices.values[i] * 0.94),
}));

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

        <RoughStackedBar
          data={comparisonData}
          labels="city"
          title="Precio medio alquiler (EUR/mes)"
          roughness={2}
          padding={0.3}
          interactive={false}
          className={styles.chart}
        />
      </WiredCard>

      <Typography as="p" className={styles.source}>
        Fuente: MIVAU / INE — Ultima actualizacion: 2024-Q3
      </Typography>
    </div>
  );
}
