import { WiredCard, WiredDivider } from "../../components/WiredElements";
import { RoughDonut, RoughBar } from "../../components/RoughViz";
import { Typography } from "../../components/Typography";
import { affordabilityEffort, affordabilityByCity } from "../../data/mockData";
import styles from "./Asequibilidad.module.css";

const statCards = [
  { label: "Esfuerzo medio en Madrid", value: "42%", color: "#e55039" },
  { label: "Esfuerzo medio en Barcelona", value: "45%", color: "#e55039" },
  { label: "Media nacional", value: "35%", color: "#f5cd79" },
  { label: "Umbral recomendado", value: "30%", color: "#78e08f" },
];

export function Asequibilidad() {
  return (
    <div className={styles.container}>
      <Typography as="h1">Asequibilidad de la Vivienda</Typography>
      <Typography as="p" className={styles.subtitle}>
        Indicadores de esfuerzo economico para acceder a vivienda en las principales ciudades.
      </Typography>

      <div className={styles.statsGrid}>
        {statCards.map((stat) => (
          <WiredCard key={stat.label} elevation={2} className={styles.statCard}>
            <Typography as="h2" className={styles.statValue}>
              {stat.value}
            </Typography>
            <Typography as="p" className={styles.statLabel}>
              {stat.label}
            </Typography>
          </WiredCard>
        ))}
      </div>

      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h2">Distribucion del esfuerzo</Typography>
        <WiredDivider />
        <Typography as="p" className={styles.hint}>
          Porcentaje de hogares segun el % de ingresos dedicado a vivienda
        </Typography>
        <RoughDonut
          data={affordabilityEffort}
          title="Esfuerzo en vivienda (% de ingresos)"
          colors={["#78e08f", "#f5cd79", "#f78fb3", "#e55039"]}
          roughness={2}
          className={styles.chart}
        />
      </WiredCard>

      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h2">Esfuerzo por ciudad</Typography>
        <WiredDivider />
        <RoughBar
          data={affordabilityByCity}
          title="% de ingresos dedicado a alquiler"
          color="#f78fb3"
          highlight="#e55039"
          roughness={2}
          className={styles.chart}
        />
      </WiredCard>

      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h3">Como se calcula</Typography>
        <WiredDivider />
        <Typography as="p">
          El indicador de esfuerzo mide el porcentaje de la renta bruta del hogar que se destina al
          pago de la vivienda (alquiler o hipoteca). Se considera que un hogar tiene sobreesfuerzo
          cuando destina mas del 30% de sus ingresos a vivienda. Los datos se obtienen cruzando
          fuentes del INE (Encuesta de Condiciones de Vida) y del Ministerio de Vivienda (indices de
          precios).
        </Typography>
      </WiredCard>

      <Typography as="p" className={styles.source}>
        Fuente: INE (ECV) / MIVAU — Ultima actualizacion: 2024-Q3
      </Typography>
    </div>
  );
}
