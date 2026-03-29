import { useState } from "react";
import { Link } from "react-router";
import { Typography } from "../../components/Typography";
import {
  WiredCard,
  WiredSearch,
  WiredCombo,
  WiredButton,
  WiredDivider,
} from "../../components/WiredElements";
import { municipalData } from "../../data/mockData";
import styles from "./DescargarDatos.module.css";

export function DescargarDatos() {
  const [search, setSearch] = useState("");
  const [period, setPeriod] = useState("2024");
  const [dataType, setDataType] = useState("ambos");
  const [format, setFormat] = useState("csv");
  const [downloaded, setDownloaded] = useState(false);

  const matched = municipalData.filter((m) =>
    m.municipality.toLowerCase().includes(search.toLowerCase()),
  );
  const recordCount = matched.length * (dataType === "ambos" ? 2 : 1) * 4;

  const handleDownload = () => {
    setDownloaded(true);
    setTimeout(() => setDownloaded(false), 3000);
  };

  return (
    <div className={styles.container}>
      <Typography as="h1">Descargar datos</Typography>
      <Typography as="p" className={styles.subtitle}>
        Selecciona los filtros y descarga los datos en el formato que prefieras.
      </Typography>

      {/* Filters */}
      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h2">Filtros</Typography>
        <WiredDivider />

        <div className={styles.filters}>
          <div className={styles.filterGroup}>
            <Typography as="span">Municipio</Typography>
            <WiredSearch placeholder="Buscar municipio..." onChange={(v) => setSearch(v)} />
          </div>

          <div className={styles.filterGroup}>
            <Typography as="span">Periodo</Typography>
            <WiredCombo selected={period} onSelected={(v) => setPeriod(v)}>
              <wired-item value="2024">2024</wired-item>
              <wired-item value="2023">2023</wired-item>
              <wired-item value="2022">2022</wired-item>
              <wired-item value="2021">2021</wired-item>
              <wired-item value="2020">2020</wired-item>
            </WiredCombo>
          </div>

          <div className={styles.filterGroup}>
            <Typography as="span">Tipo de datos</Typography>
            <WiredCombo selected={dataType} onSelected={(v) => setDataType(v)}>
              <wired-item value="alquiler">Alquiler</wired-item>
              <wired-item value="compraventa">Compraventa</wired-item>
              <wired-item value="ambos">Ambos</wired-item>
            </WiredCombo>
          </div>

          <div className={styles.filterGroup}>
            <Typography as="span">Formato</Typography>
            <WiredCombo selected={format} onSelected={(v) => setFormat(v)}>
              <wired-item value="csv">CSV</wired-item>
              <wired-item value="json">JSON</wired-item>
            </WiredCombo>
          </div>
        </div>
      </WiredCard>

      {/* Preview */}
      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h2">Vista previa</Typography>
        <WiredDivider />
        <Typography as="p">{recordCount} registros disponibles para la seleccion actual</Typography>
        {matched.slice(0, 3).map((m) => (
          <WiredCard key={m.municipality} className={styles.previewRow}>
            <Typography as="span">
              {m.municipality} — Alquiler: {m.avgRent} EUR/mes | Compraventa: {m.avgBuy} EUR/m2 |
              Periodo: {period}
            </Typography>
          </WiredCard>
        ))}
        {matched.length > 3 && (
          <Typography as="p" className={styles.moreRows}>
            ...y {matched.length - 3} municipios mas
          </Typography>
        )}
      </WiredCard>

      {/* Download */}
      <div className={styles.actions}>
        <WiredButton onClick={handleDownload}>Descargar {format.toUpperCase()}</WiredButton>
        {downloaded && (
          <Typography as="span" className={styles.confirmation}>
            Descarga iniciada correctamente
          </Typography>
        )}
      </div>

      <Typography as="p" className={styles.methodologyLink}>
        Consulta las <Link to="/datos/metodologia">fuentes y metodologia</Link> para mas informacion
        sobre los datos.
      </Typography>
    </div>
  );
}
