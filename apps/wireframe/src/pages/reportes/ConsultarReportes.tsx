import { useState, useMemo } from "react";
import { Link } from "react-router";
import { feature } from "topojson-client";
import type { Topology } from "topojson-specification";
import type { FeatureCollection } from "geojson";
import spainTopo from "es-atlas/es/autonomous_regions.json";
import { Typography } from "../../components/Typography";
import { WiredCard, WiredCombo, WiredTabs, WiredDivider } from "../../components/WiredElements";
import { RoughMap } from "../../components/RoughViz";
import { reports, irregularityTypes, zones, ccaaColors } from "../../data/mockData";
import styles from "./ConsultarReportes.module.css";

const statusLabels: Record<string, string> = {
  approved: "Aprobado",
  pending: "Pendiente",
  rejected: "Rechazado",
  in_review: "En revision",
};

const statusClasses: Record<string, string> = {
  approved: "statusApproved",
  pending: "statusPending",
  rejected: "statusRejected",
  in_review: "statusInReview",
};

export function ConsultarReportes() {
  const [tab, setTab] = useState("lista");
  const [filterZone, setFilterZone] = useState("Todos");
  const [filterType, setFilterType] = useState("Todos");

  const spainGeo = useMemo(() => {
    const topo = spainTopo as unknown as Topology;
    return feature(topo, topo.objects.autonomous_regions) as FeatureCollection;
  }, []);

  const filtered = reports.filter((r) => {
    if (filterZone !== "Todos" && !r.zone.includes(filterZone)) return false;
    if (filterType !== "Todos" && r.type !== filterType) return false;
    return true;
  });

  return (
    <div className={styles.container}>
      <Typography as="h1">Consultar Reportes</Typography>
      <Typography as="p" className={styles.subtitle}>
        Explora los reportes de irregularidades enviados por la comunidad.
      </Typography>

      <div className={styles.filters}>
        <div className={styles.filterItem}>
          <Typography as="span">Zona:</Typography>
          <WiredCombo selected={filterZone} onSelected={(val: string) => setFilterZone(val)}>
            <wired-item value="Todos">Todas las zonas</wired-item>
            {zones.map((z) => (
              <wired-item key={z} value={z}>
                {z}
              </wired-item>
            ))}
          </WiredCombo>
        </div>
        <div className={styles.filterItem}>
          <Typography as="span">Tipo:</Typography>
          <WiredCombo selected={filterType} onSelected={(val: string) => setFilterType(val)}>
            <wired-item value="Todos">Todos los tipos</wired-item>
            {irregularityTypes.map((t) => (
              <wired-item key={t} value={t}>
                {t}
              </wired-item>
            ))}
          </WiredCombo>
        </div>
      </div>

      <WiredTabs selected={tab} onSelected={(val: string) => setTab(val)}>
        <wired-tab name="lista">Lista</wired-tab>
        <wired-tab name="mapa">Mapa</wired-tab>
      </WiredTabs>

      {tab === "lista" && (
        <div className={styles.reportList}>
          {filtered.length === 0 && (
            <Typography as="p">
              No se encontraron reportes con los filtros seleccionados.
            </Typography>
          )}
          {filtered.map((r) => (
            <Link key={r.id} to={`/reportes/${r.id}`} className={styles.reportLink}>
              <WiredCard elevation={2} className={styles.reportCard}>
                <div className={styles.reportHeader}>
                  <Typography as="h3">{r.type}</Typography>
                  <Typography as="span" className={styles[statusClasses[r.status]]}>
                    {statusLabels[r.status]}
                  </Typography>
                </div>
                <WiredDivider />
                <Typography as="p">{r.zone}</Typography>
                <Typography as="span" className={styles.date}>
                  {r.date}
                </Typography>
              </WiredCard>
            </Link>
          ))}
        </div>
      )}

      {tab === "mapa" && (
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
          <Typography as="p" className={styles.mapHint}>
            Mostrando {filtered.length} reportes
          </Typography>
        </WiredCard>
      )}
    </div>
  );
}
