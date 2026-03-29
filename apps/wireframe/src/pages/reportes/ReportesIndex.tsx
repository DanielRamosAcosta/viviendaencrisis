import { Typography } from "../../components/Typography";
import { SectionCard } from "../../components/SectionCard";
import styles from "./ReportesIndex.module.css";

export function ReportesIndex() {
  return (
    <div className={styles.container}>
      <Typography as="h1">Reportes y Resenas</Typography>
      <Typography as="p" className={styles.subtitle}>
        Denuncia irregularidades en el mercado de la vivienda y consulta resenas de agentes
        inmobiliarios.
      </Typography>

      <div className={styles.grid}>
        <SectionCard
          title="Reportar irregularidad"
          description="Enviar un reporte anonimo sobre abusos o irregularidades inmobiliarias."
          to="/reportes/reportar"
        />
        <SectionCard
          title="Mapa de reportes"
          description="Visualiza en un mapa las irregularidades reportadas por zona."
          to="/reportes/mapa"
        />
        <SectionCard
          title="Consultar reportes"
          description="Busca y filtra reportes de irregularidades enviados por la comunidad."
          to="/reportes/consultar"
        />
        <SectionCard
          title="Escribir resena"
          description="Comparte tu experiencia con un agente o inmobiliaria."
          to="/resenas/escribir"
        />
        <SectionCard
          title="Consultar resenas"
          description="Busca resenas de agentes inmobiliarios por nombre o zona."
          to="/resenas/consultar"
        />
      </div>
    </div>
  );
}
