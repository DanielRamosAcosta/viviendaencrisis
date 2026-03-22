import { useNavigate } from "react-router";
import { WiredCard, WiredButton, WiredDivider, WiredSearch } from "../components/WiredElements";
import { RoughLine } from "../components/RoughViz";
import { Typography } from "../components/Typography";
import { SectionCard } from "../components/SectionCard";
import { priceEvolution, recentReports } from "../data/mockData";
import styles from "./Home.module.css";

const stats = [
  { value: "1.180 EUR/mes", label: "Alquiler medio nacional" },
  { value: "+8.4%", label: "Variacion interanual" },
  { value: "42%", label: "Esfuerzo medio en vivienda" },
];

const sections = [
  {
    title: "Precios y comparativas",
    description: "Evolucion temporal, comparativas por zona y precio por metro cuadrado.",
    to: "/precios",
  },
  {
    title: "Reportes y resenas",
    description: "Denuncias ciudadanas sobre irregularidades en el mercado de la vivienda.",
    to: "/reportes",
  },
  {
    title: "Datos abiertos",
    description: "Descarga datasets en CSV y JSON de fuentes oficiales.",
    to: "/datos",
  },
  {
    title: "Mi cuenta",
    description: "Accede a tu perfil, tus reportes guardados y configuracion.",
    to: "/cuenta",
  },
  {
    title: "Informacion y ayuda",
    description: "FAQ, derechos del inquilino, glosario y mas sobre la plataforma.",
    to: "/info",
  },
];

export function Home() {
  const navigate = useNavigate();

  return (
    <div className={styles.container}>
      {/* ─── Hero ─── */}
      <section className={styles.hero}>
        <Typography as="h1" className={styles.heroTitle}>
          Vivienda en Crisis
        </Typography>
        <Typography as="p" className={styles.heroSubtitle}>
          Datos abiertos para la transparencia del mercado de la vivienda en
          Espana
        </Typography>
        <WiredSearch placeholder="Busca tu municipio..." className={styles.heroSearch} />
      </section>

      {/* ─── Key stats ─── */}
      <div className={styles.statsRow}>
        {stats.map((stat) => (
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

      <WiredDivider />

      {/* ─── Featured chart ─── */}
      <WiredCard elevation={2} className={styles.chartSection}>
        <Typography as="h2">Evolucion del alquiler medio en Espana</Typography>
        <WiredDivider />
        <RoughLine
          data={{ x: priceEvolution.x, y: priceEvolution.y }}
          title=""
          xLabel="Ano"
          yLabel="EUR/mes"
          colors={["#f78fb3"]}
          roughness={3}
          circle
          circleRadius={8}
          className={styles.chart}
        />
      </WiredCard>

      <WiredDivider />

      {/* ─── Section CTAs ─── */}
      <Typography as="h2">Explora la plataforma</Typography>
      <div className={styles.sectionGrid}>
        {sections.map((section) => (
          <SectionCard
            key={section.to}
            title={section.title}
            description={section.description}
            to={section.to}
          />
        ))}
      </div>

      <WiredDivider />

      {/* ─── Latest reports ─── */}
      <Typography as="h2">Ultimos reportes ciudadanos</Typography>
      <div className={styles.reportsRow}>
        {recentReports.map((report, i) => (
          <WiredCard key={i} elevation={1} className={styles.reportCard}>
            <Typography as="h3">{report.type}</Typography>
            <Typography as="p" className={styles.reportZone}>
              {report.zone}
            </Typography>
            <Typography as="p" className={styles.reportDesc}>
              {report.description}
            </Typography>
            <Typography as="span" className={styles.reportDate}>
              {report.date}
            </Typography>
          </WiredCard>
        ))}
      </div>

      <WiredDivider />

      {/* ─── Footer CTA ─── */}
      <WiredCard elevation={2} className={styles.footerCta}>
        <Typography as="h2">Conoces una irregularidad?</Typography>
        <Typography as="p">
          Si has detectado un precio abusivo, una clausula ilegal o unas
          condiciones de vivienda deficientes, puedes reportarlo de forma
          anonima.
        </Typography>
        <WiredButton onClick={() => navigate("/reportes/nuevo")}>
          Enviar un reporte
        </WiredButton>
      </WiredCard>
    </div>
  );
}
