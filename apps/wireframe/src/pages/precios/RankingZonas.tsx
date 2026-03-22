import { useState } from "react";
import { WiredCard, WiredTabs, WiredCombo, WiredDivider } from "../../components/WiredElements";
import { RoughBarH } from "../../components/RoughViz";
import { Typography } from "../../components/Typography";
import { rankingZonas, cityPricesM2 } from "../../data/mockData";
import styles from "./RankingZonas.module.css";

export function RankingZonas() {
  const [activeTab, setActiveTab] = useState("alquiler");
  const [_sortBy, setSortBy] = useState("precio");

  return (
    <div className={styles.container}>
      <Typography as="h1">Ranking de Zonas</Typography>
      <Typography as="p" className={styles.subtitle}>
        Clasificacion de zonas por precio, tendencia y tipo de mercado.
      </Typography>

      <WiredCard elevation={2} className={styles.section}>
        <div className={styles.controlsRow}>
          <WiredTabs selected={activeTab} onSelected={(v: string) => setActiveTab(v)}>
            <wired-tab name="alquiler">Alquiler</wired-tab>
            <wired-tab name="compraventa">Compraventa</wired-tab>
          </WiredTabs>
          <div className={styles.sortGroup}>
            <Typography as="span">Ordenar por:</Typography>
            <WiredCombo selected="precio" onSelected={(v: string) => setSortBy(v)}>
              <wired-item value="precio">Precio/m2</wired-item>
              <wired-item value="tendencia">Tendencia</wired-item>
              <wired-item value="nombre">Nombre</wired-item>
            </WiredCombo>
          </div>
        </div>
      </WiredCard>

      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h2">Grafico de ranking</Typography>
        <WiredDivider />
        <RoughBarH
          data={cityPricesM2}
          title={activeTab === "alquiler" ? "Alquiler (EUR/m2/mes)" : "Compraventa (EUR/m2)"}
          color="#778beb"
          highlight="#f5cd79"
          roughness={2}
          className={styles.chart}
        />
      </WiredCard>

      <div className={styles.cardsList}>
        {rankingZonas.map((zona, i) => (
          <WiredCard key={zona.name} elevation={2} className={styles.zoneCard}>
            <div className={styles.zoneHeader}>
              <Typography as="h3" className={styles.zoneRank}>#{i + 1}</Typography>
              <Typography as="h3">{zona.name}</Typography>
            </div>
            <WiredDivider />
            <div className={styles.zoneDetails}>
              <div className={styles.zoneStat}>
                <Typography as="span" className={styles.zoneStatLabel}>Precio/m2</Typography>
                <Typography as="span" className={styles.zoneStatValue}>{zona.priceM2} EUR</Typography>
              </div>
              <div className={styles.zoneStat}>
                <Typography as="span" className={styles.zoneStatLabel}>Tendencia</Typography>
                <Typography as="span" className={styles.zoneStatValue}>{zona.trend}</Typography>
              </div>
            </div>
          </WiredCard>
        ))}
      </div>

      <Typography as="p" className={styles.source}>
        Fuente: MIVAU / INE — Ultima actualizacion: 2024-Q3
      </Typography>
    </div>
  );
}
