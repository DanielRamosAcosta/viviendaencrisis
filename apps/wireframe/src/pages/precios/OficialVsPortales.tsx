import { useState } from "react";
import { WiredCard, WiredTabs, WiredDivider } from "../../components/WiredElements";
import { RoughStackedBar, RoughBar } from "../../components/RoughViz";
import { Typography } from "../../components/Typography";
import { officialVsPortals } from "../../data/mockData";
import styles from "./OficialVsPortales.module.css";

export function OficialVsPortales() {
  const [activeView, setActiveView] = useState("superpuesto");

  return (
    <div className={styles.container}>
      <Typography as="h1">Datos Oficiales vs Portales</Typography>
      <Typography as="p" className={styles.subtitle}>
        Comparacion entre los precios de fuentes oficiales (MIVAU/INE) y los anunciados en portales
        inmobiliarios (Idealista, Fotocasa).
      </Typography>

      <WiredCard elevation={2} className={styles.warningCard}>
        <Typography as="h3">Nota metodologica</Typography>
        <WiredDivider />
        <Typography as="p">
          Los datos de portales inmobiliarios reflejan precios de oferta (asking prices), no precios
          de transaccion real. Las fuentes oficiales utilizan datos de contratos registrados y
          transacciones efectivas. La comparacion es orientativa y debe interpretarse con cautela.
        </Typography>
      </WiredCard>

      <WiredCard elevation={2} className={styles.section}>
        <WiredTabs selected={activeView} onSelected={(v: string) => setActiveView(v)}>
          <wired-tab name="superpuesto">Superpuesto</wired-tab>
          <wired-tab name="ladoalado">Lado a lado</wired-tab>
        </WiredTabs>
        <WiredDivider />

        {activeView === "superpuesto" && (
          <RoughStackedBar
            data={officialVsPortals}
            labels="city"
            title="Precio alquiler: Oficial vs Portales (EUR/mes)"
            roughness={2}
            padding={0.3}
            className={styles.chart}
          />
        )}

        {activeView === "ladoalado" && (
          <div className={styles.chartsRow}>
            <div className={styles.chartCol}>
              <Typography as="h4">Datos oficiales</Typography>
              <RoughBar
                data={{
                  labels: officialVsPortals.map((d) => d.city),
                  values: officialVsPortals.map((d) => d.Oficial),
                }}
                title="Oficial (EUR/mes)"
                color="#3dc1d3"
                roughness={2}
                className={styles.chart}
              />
            </div>
            <div className={styles.chartCol}>
              <Typography as="h4">Portales inmobiliarios</Typography>
              <RoughBar
                data={{
                  labels: officialVsPortals.map((d) => d.city),
                  values: officialVsPortals.map((d) => d.Portales),
                }}
                title="Portales (EUR/mes)"
                color="#f78fb3"
                roughness={2}
                className={styles.chart}
              />
            </div>
          </div>
        )}
      </WiredCard>

      <WiredCard elevation={2} className={styles.section}>
        <Typography as="p">
          Para mas detalles sobre las fuentes de datos y la metodologia de calculo, consulta la
          seccion de Fuentes y Metodologia.
        </Typography>
      </WiredCard>

      <Typography as="p" className={styles.source}>
        Fuente: MIVAU / INE / Idealista / Fotocasa — Ultima actualizacion: 2024-Q3
      </Typography>
    </div>
  );
}
