import { Typography } from "../../components/Typography";
import { SectionCard } from "../../components/SectionCard";
import styles from "./DatosIndex.module.css";

export function DatosIndex() {
  return (
    <div className={styles.container}>
      <Typography as="h1">Datos Abiertos</Typography>
      <Typography as="p" className={styles.subtitle}>
        Accede a los datos oficiales de vivienda en Espana. Explora por
        municipio, descarga datasets y consulta las fuentes y la metodologia
        utilizada.
      </Typography>

      <div className={styles.grid}>
        <SectionCard
          title="Explorador por municipio"
          description="Busca y compara datos de precios, poblacion y densidad de cualquier municipio."
          to="/datos/explorador"
        />
        <SectionCard
          title="Descargar datos"
          description="Descarga datasets filtrados en formato CSV o JSON para tu propio analisis."
          to="/datos/descargar"
        />
        <SectionCard
          title="Fuentes y metodologia"
          description="Conoce de donde proceden los datos, como se procesan y cuales son sus limitaciones."
          to="/datos/metodologia"
        />
      </div>
    </div>
  );
}
