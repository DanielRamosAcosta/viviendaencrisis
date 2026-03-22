import { WiredCard, WiredDivider, WiredLink } from "../../components/WiredElements";
import { Typography } from "../../components/Typography";
import styles from "./QueEsViviendaEnCrisis.module.css";

const features = [
  {
    title: "Datos abiertos verificados",
    description:
      "Informacion procedente de fuentes oficiales como el Ministerio de Vivienda, INE y Catastro, actualizada trimestralmente.",
  },
  {
    title: "Visualizaciones interactivas",
    description:
      "Graficos de evolucion temporal, comparativas y mapas coropleticos para entender las tendencias del mercado.",
  },
  {
    title: "Comparativas por zona",
    description:
      "Compara precios de alquiler y compraventa entre comunidades autonomas, provincias y municipios.",
  },
  {
    title: "Reportes ciudadanos",
    description:
      "Sistema de denuncias para reportar irregularidades como precios abusivos, clausulas ilegales o condiciones deficientes.",
  },
  {
    title: "Descargas en CSV/JSON",
    description:
      "Descarga los datos en formatos abiertos para tu propio analisis, investigacion o reutilizacion.",
  },
  {
    title: "Indicadores de asequibilidad",
    description:
      "Metricas como el esfuerzo en vivienda, la ratio precio/salario y la evolucion real de los precios.",
  },
];

export function QueEsViviendaEnCrisis() {
  return (
    <div className={styles.container}>
      {/* Hero */}
      <WiredCard elevation={2} className={styles.hero}>
        <Typography as="h1">Que es Vivienda en Crisis</Typography>
        <WiredDivider />
        <Typography as="p">
          Vivienda en Crisis es una plataforma web de datos abiertos cuya mision
          es aportar transparencia al mercado de la vivienda en Espana. A traves
          de visualizaciones interactivas, comparativas por zona y un sistema de
          reportes ciudadanos, buscamos facilitar el acceso a informacion
          verificada sobre precios de alquiler y compraventa.
        </Typography>
        <Typography as="p">
          Nuestro objetivo es empoderar a ciudadanos, investigadores y
          responsables publicos con herramientas que permitan entender la
          situacion real del mercado de la vivienda.
        </Typography>
      </WiredCard>

      {/* Features */}
      <Typography as="h2">Que ofrecemos</Typography>
      <div className={styles.featureGrid}>
        {features.map((feature) => (
          <WiredCard key={feature.title} elevation={1} className={styles.featureCard}>
            <Typography as="h3">{feature.title}</Typography>
            <Typography as="p">{feature.description}</Typography>
          </WiredCard>
        ))}
      </div>

      {/* Data sources */}
      <Typography as="h2">Fuentes de datos</Typography>
      <WiredCard elevation={1} className={styles.section}>
        <Typography as="p">
          Toda la informacion publicada en Vivienda en Crisis proviene de
          fuentes oficiales y de acceso publico:
        </Typography>
        <ul className={styles.sourceList}>
          <li>
            <Typography as="span">
              <strong>MIVAU</strong> — Ministerio de Vivienda y Agenda Urbana:
              indices de precios trimestrales de alquiler y compraventa.
            </Typography>
          </li>
          <li>
            <Typography as="span">
              <strong>INE</strong> — Instituto Nacional de Estadistica: censo de
              vivienda, indicadores demograficos y economicos.
            </Typography>
          </li>
          <li>
            <Typography as="span">
              <strong>Catastro</strong> — Datos abiertos de uso del suelo,
              superficie y caracteristicas de los inmuebles.
            </Typography>
          </li>
        </ul>
      </WiredCard>

      {/* Contact */}
      <Typography as="h2">Contacto</Typography>
      <WiredCard elevation={1} className={styles.section}>
        <Typography as="p">
          Vivienda en Crisis es un proyecto academico desarrollado como Trabajo
          Final de Master en la Universitat Oberta de Catalunya (UOC).
        </Typography>
        <Typography as="p">
          Para consultas, sugerencias o colaboraciones:
        </Typography>
        <div className={styles.contactInfo}>
          <Typography as="p">
            Correo:{" "}
            <WiredLink href="mailto:contacto@viviendaencrisis.es">
              contacto@viviendaencrisis.es
            </WiredLink>
          </Typography>
          <Typography as="p">
            Repositorio:{" "}
            <WiredLink href="https://github.com" target="_blank">
              github.com/viviendaencrisis
            </WiredLink>
          </Typography>
        </div>
      </WiredCard>
    </div>
  );
}
