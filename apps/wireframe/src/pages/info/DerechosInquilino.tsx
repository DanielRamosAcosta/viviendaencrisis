import { WiredCard, WiredDivider, WiredLink } from "../../components/WiredElements";
import { Typography } from "../../components/Typography";
import { tenantRights } from "../../data/mockData";
import styles from "./DerechosInquilino.module.css";

export function DerechosInquilino() {
  return (
    <div className={styles.container}>
      <Typography as="h1">Derechos del inquilino</Typography>
      <Typography as="p" className={styles.subtitle}>
        Conocer tus derechos como inquilino es fundamental para protegerte ante posibles abusos. A
        continuacion se resumen los principales derechos recogidos en la Ley de Arrendamientos
        Urbanos (LAU) vigente en Espana.
      </Typography>

      <WiredDivider />

      <div className={styles.list}>
        {tenantRights.map((right) => (
          <WiredCard key={right.title} elevation={1} className={styles.rightCard}>
            <Typography as="h3">{right.title}</Typography>
            <Typography as="p">{right.description}</Typography>
          </WiredCard>
        ))}
      </div>

      <WiredCard elevation={1} className={styles.footer}>
        <Typography as="p" className={styles.disclaimer}>
          Esta informacion es orientativa y no constituye asesoramiento legal. Consulta la LAU
          vigente para informacion legal precisa.
        </Typography>
        <div className={styles.links}>
          <WiredLink href="https://www.boe.es/buscar/act.php?id=BOE-A-1994-26003" target="_blank">
            Ley de Arrendamientos Urbanos (BOE)
          </WiredLink>
          <WiredLink href="https://www.boe.es/buscar/act.php?id=BOE-A-2023-9946" target="_blank">
            Ley de Vivienda 12/2023 (BOE)
          </WiredLink>
        </div>
      </WiredCard>
    </div>
  );
}
