import { Typography } from "../../components/Typography";
import { SectionCard } from "../../components/SectionCard";
import styles from "./PreciosIndex.module.css";

export function PreciosIndex() {
  return (
    <div className={styles.container}>
      <Typography as="h1">Precios y Comparativas</Typography>
      <Typography as="p" className={styles.subtitle}>
        Explora datos de precios de vivienda en Espana: evolucion temporal, comparativas entre
        zonas, precio por metro cuadrado, asequibilidad y mas.
      </Typography>

      <div className={styles.grid}>
        <SectionCard
          title="Evolucion Temporal"
          description="Graficos de lineas con la evolucion de precios de alquiler y compraventa por trimestre."
          to="/precios/evolucion"
        />
        <SectionCard
          title="Comparar Zonas"
          description="Compara precios entre 2 a 4 zonas con graficos lado a lado."
          to="/precios/comparar"
        />
        <SectionCard
          title="Precio por Metro Cuadrado"
          description="Ranking de ciudades por precio/m2 y mapa corpletico por comunidad autonoma."
          to="/precios/metro-cuadrado"
        />
        <SectionCard
          title="Asequibilidad"
          description="Indicadores de esfuerzo economico para acceder a vivienda por ciudad."
          to="/precios/asequibilidad"
        />
        <SectionCard
          title="Oficial vs Portales"
          description="Comparacion entre datos oficiales (MIVAU/INE) y portales inmobiliarios."
          to="/precios/oficial-vs-portales"
        />
        <SectionCard
          title="Ranking de Zonas"
          description="Clasificacion de zonas por precio, tendencia y tipo de vivienda."
          to="/precios/ranking"
        />
      </div>
    </div>
  );
}
