import { useState } from "react";
import { WiredCard, WiredSearch, WiredDivider } from "../../components/WiredElements";
import { Typography } from "../../components/Typography";
import { glossaryTerms } from "../../data/mockData";
import styles from "./Glosario.module.css";

export function Glosario() {
  const [query, setQuery] = useState("");

  const filtered = glossaryTerms
    .filter((item) => {
      const q = query.toLowerCase();
      return (
        item.term.toLowerCase().includes(q) ||
        item.definition.toLowerCase().includes(q)
      );
    })
    .sort((a, b) => a.term.localeCompare(b.term, "es"));

  return (
    <div className={styles.container}>
      <Typography as="h1">Glosario</Typography>
      <Typography as="p" className={styles.subtitle}>
        Definiciones de los terminos mas utilizados en el mercado de la vivienda
        y en la plataforma.
      </Typography>

      <WiredSearch
        placeholder="Buscar termino..."
        value={query}
        onChange={setQuery}
      />

      <WiredDivider />

      <Typography as="p" className={styles.count}>
        {filtered.length} terminos encontrados
      </Typography>

      <div className={styles.list}>
        {filtered.map((item) => (
          <WiredCard key={item.term} elevation={1} className={styles.termCard}>
            <Typography as="h3">{item.term}</Typography>
            <Typography as="p">{item.definition}</Typography>
          </WiredCard>
        ))}
      </div>
    </div>
  );
}
