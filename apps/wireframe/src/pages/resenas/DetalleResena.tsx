import { useState } from "react";
import { useParams, Link } from "react-router";
import { Typography } from "../../components/Typography";
import { WiredCard, WiredButton, WiredDivider } from "../../components/WiredElements";
import { StarRating } from "../../components/StarRating";
import { reviews, agents } from "../../data/mockData";
import styles from "./DetalleResena.module.css";

export function DetalleResena() {
  const { id } = useParams();
  const review = reviews.find((r) => r.id === id);
  const [helpful, setHelpful] = useState(review?.helpful ?? 0);
  const [notHelpful, setNotHelpful] = useState(review?.notHelpful ?? 0);

  if (!review) {
    return (
      <div className={styles.container}>
        <Typography as="h1">Resena no encontrada</Typography>
        <Typography as="p">
          No se encontro una resena con el identificador proporcionado.
        </Typography>
        <Link to="/resenas/consultar">
          <WiredButton>Volver a Consultar Resenas</WiredButton>
        </Link>
      </div>
    );
  }

  const agent = agents.find((a) => a.id === review.agentId);

  return (
    <div className={styles.container}>
      <div className={styles.breadcrumb}>
        <Link to="/resenas/consultar" className={styles.breadcrumbLink}>
          <Typography as="span">Consultar Resenas</Typography>
        </Link>
        <Typography as="span"> / </Typography>
        <Typography as="span">{review.id}</Typography>
      </div>

      <Typography as="h1">Detalle de Resena</Typography>

      <WiredCard elevation={2} className={styles.detailCard}>
        {agent && (
          <Typography as="p" className={styles.agentName}>
            Agente: {agent.name} ({agent.zone})
          </Typography>
        )}

        <StarRating value={review.rating} readOnly />

        <Typography as="h2">{review.title}</Typography>
        <WiredDivider />

        <Typography as="p">{review.comment}</Typography>

        <div className={styles.meta}>
          <Typography as="span">Por: {review.author}</Typography>
          <Typography as="span">{review.date}</Typography>
        </div>

        <WiredDivider />

        <div className={styles.voteRow}>
          <Typography as="span">Te resulto util esta resena?</Typography>
          <WiredButton onClick={() => setHelpful((h) => h + 1)}>Util ({helpful})</WiredButton>
          <WiredButton onClick={() => setNotHelpful((n) => n + 1)}>
            No util ({notHelpful})
          </WiredButton>
        </div>
      </WiredCard>
    </div>
  );
}
