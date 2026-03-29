import { useState } from "react";
import { Typography } from "../../components/Typography";
import { WiredCard, WiredSearch, WiredCombo, WiredDivider } from "../../components/WiredElements";
import { RoughBar } from "../../components/RoughViz";
import { municipalData } from "../../data/mockData";
import styles from "./ExploradorMunicipio.module.css";

export function ExploradorMunicipio() {
  const [search, setSearch] = useState("");
  const [dataView, setDataView] = useState<"rent" | "buy">("rent");

  const filtered = municipalData.filter((m) =>
    m.municipality.toLowerCase().includes(search.toLowerCase()),
  );

  const chartData = {
    labels: filtered.map((m) => m.municipality),
    values: filtered.map((m) => (dataView === "rent" ? m.avgRent : m.avgBuy)),
  };

  return (
    <div className={styles.container}>
      <Typography as="h1">Explorador por municipio</Typography>
      <Typography as="p" className={styles.subtitle}>
        Busca un municipio para consultar sus datos de vivienda.
      </Typography>

      <div className={styles.controls}>
        <WiredSearch placeholder="Buscar municipio..." onChange={(v) => setSearch(v)} />
        <WiredCombo selected={dataView} onSelected={(v) => setDataView(v as "rent" | "buy")}>
          <wired-item value="rent">Alquiler</wired-item>
          <wired-item value="buy">Compraventa</wired-item>
        </WiredCombo>
      </div>

      {/* Data table */}
      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h2">Datos municipales</Typography>
        <WiredDivider />
        <div className={styles.tableHeader}>
          <Typography as="span" className={styles.cellMuni}>
            Municipio
          </Typography>
          <Typography as="span" className={styles.cell}>
            Poblacion
          </Typography>
          <Typography as="span" className={styles.cell}>
            Alquiler medio
          </Typography>
          <Typography as="span" className={styles.cell}>
            Compraventa/m2
          </Typography>
          <Typography as="span" className={styles.cell}>
            Superficie
          </Typography>
          <Typography as="span" className={styles.cell}>
            Densidad
          </Typography>
        </div>
        {filtered.map((m) => (
          <WiredCard key={m.municipality} className={styles.tableRow}>
            <Typography as="span" className={styles.cellMuni}>
              {m.municipality}
            </Typography>
            <Typography as="span" className={styles.cell}>
              {m.population.toLocaleString("es-ES")}
            </Typography>
            <Typography as="span" className={styles.cell}>
              {m.avgRent} EUR/mes
            </Typography>
            <Typography as="span" className={styles.cell}>
              {m.avgBuy} EUR/m2
            </Typography>
            <Typography as="span" className={styles.cell}>
              {m.surface} km2
            </Typography>
            <Typography as="span" className={styles.cell}>
              {m.density.toLocaleString("es-ES")}
            </Typography>
          </WiredCard>
        ))}
        {filtered.length === 0 && (
          <Typography as="p" className={styles.empty}>
            No se encontraron municipios.
          </Typography>
        )}
      </WiredCard>

      {/* Chart */}
      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h2">
          {dataView === "rent"
            ? "Alquiler medio por municipio"
            : "Precio compraventa por municipio"}
        </Typography>
        <WiredDivider />
        {filtered.length > 0 && (
          <RoughBar
            data={chartData}
            title={dataView === "rent" ? "Alquiler medio (EUR/mes)" : "Compraventa (EUR/m2)"}
            color={dataView === "rent" ? "skyblue" : "#f78fb3"}
            roughness={2}
            className={styles.chart}
          />
        )}
      </WiredCard>
    </div>
  );
}
