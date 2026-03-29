import { useState } from "react";
import { WiredCard, WiredDivider } from "../../components/WiredElements";
import { Typography } from "../../components/Typography";
import { faqItems } from "../../data/mockData";
import styles from "./PreguntasFrecuentes.module.css";

export function PreguntasFrecuentes() {
  const [openIndex, setOpenIndex] = useState<number | null>(null);

  return (
    <div className={styles.container}>
      <Typography as="h1">Preguntas frecuentes</Typography>
      <Typography as="p" className={styles.subtitle}>
        Respuestas a las dudas mas habituales sobre la plataforma, los datos y los reportes
        ciudadanos.
      </Typography>

      <WiredDivider />

      <div className={styles.list}>
        {faqItems.map((item, index) => (
          <WiredCard key={index} elevation={openIndex === index ? 2 : 1} className={styles.faqCard}>
            <div
              className={styles.question}
              onClick={() => setOpenIndex(openIndex === index ? null : index)}
              role="button"
              tabIndex={0}
              onKeyDown={(e) => {
                if (e.key === "Enter" || e.key === " ") {
                  setOpenIndex(openIndex === index ? null : index);
                }
              }}
            >
              <Typography as="h3" className={styles.questionText}>
                {item.question}
              </Typography>
              <Typography as="span" className={styles.toggle}>
                {openIndex === index ? "−" : "+"}
              </Typography>
            </div>
            {openIndex === index && (
              <div className={styles.answer}>
                <Typography as="p">{item.answer}</Typography>
              </div>
            )}
          </WiredCard>
        ))}
      </div>
    </div>
  );
}
