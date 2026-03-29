import { WiredDivider } from "../../components/WiredElements";
import { Typography } from "../../components/Typography";
import { SectionCard } from "../../components/SectionCard";
import styles from "./InfoIndex.module.css";

export function InfoIndex() {
  return (
    <div className={styles.container}>
      <Typography as="h1">Informacion y Ayuda</Typography>
      <Typography as="p" className={styles.subtitle}>
        Todo lo que necesitas saber sobre la plataforma, tus derechos como inquilino y el
        vocabulario del mercado de la vivienda.
      </Typography>

      <WiredDivider />

      <div className={styles.grid}>
        <SectionCard
          title="Que es Vivienda en Crisis"
          description="Conoce nuestra mision, las funcionalidades de la plataforma y las fuentes de datos que utilizamos."
          to="/info/que-es"
        />
        <SectionCard
          title="Preguntas frecuentes"
          description="Resuelve tus dudas sobre el funcionamiento de la plataforma, los datos y los reportes ciudadanos."
          to="/info/faq"
        />
        <SectionCard
          title="Derechos del inquilino"
          description="Informacion orientativa sobre los principales derechos que te asisten como inquilino en Espana."
          to="/info/derechos"
        />
        <SectionCard
          title="Glosario"
          description="Definiciones de los terminos mas utilizados en el mercado de la vivienda y en la plataforma."
          to="/info/glosario"
        />
      </div>
    </div>
  );
}
