import { useState } from "react";
import { Link } from "react-router";
import { Typography } from "../../components/Typography";
import { WiredCard, WiredSearch, WiredDivider } from "../../components/WiredElements";
import { StarRating } from "../../components/StarRating";
import { agents, reviews } from "../../data/mockData";
import styles from "./ConsultarResenas.module.css";

export function ConsultarResenas() {
  const [search, setSearch] = useState("");
  const [selectedAgentId, setSelectedAgentId] = useState<string | null>(null);

  const filteredAgents = search
    ? agents.filter(
        (a) =>
          a.name.toLowerCase().includes(search.toLowerCase()) ||
          a.zone.toLowerCase().includes(search.toLowerCase()),
      )
    : agents;

  const agentReviews = selectedAgentId ? reviews.filter((r) => r.agentId === selectedAgentId) : [];

  const selectedAgent = agents.find((a) => a.id === selectedAgentId);

  return (
    <div className={styles.container}>
      <Typography as="h1">Consultar Resenas</Typography>
      <Typography as="p" className={styles.subtitle}>
        Busca agentes inmobiliarios y lee resenas de otros usuarios.
      </Typography>

      <WiredSearch
        placeholder="Buscar agente por nombre o zona..."
        onChange={(val: string) => setSearch(val)}
      />

      <div className={styles.agentGrid}>
        {filteredAgents.map((agent) => (
          <div
            key={agent.id}
            className={`${styles.agentCard} ${selectedAgentId === agent.id ? styles.agentCardSelected : ""}`}
            onClick={() => setSelectedAgentId(agent.id)}
          >
            <WiredCard
              elevation={selectedAgentId === agent.id ? 3 : 2}
              className={styles.agentCardInner}
            >
              <Typography as="h3">{agent.name}</Typography>
              <Typography as="span" className={styles.agentZone}>
                {agent.zone}
              </Typography>
              <div className={styles.ratingRow}>
                <StarRating value={Math.round(agent.rating)} readOnly />
                <Typography as="span">{agent.rating.toFixed(1)}</Typography>
              </div>
              <Typography as="span" className={styles.reviewCount}>
                {agent.reviewCount} resenas
              </Typography>
            </WiredCard>
          </div>
        ))}
      </div>

      {selectedAgent && (
        <>
          <WiredDivider />
          <Typography as="h2">Resenas de {selectedAgent.name}</Typography>
          {agentReviews.length === 0 ? (
            <Typography as="p">No hay resenas disponibles para este agente.</Typography>
          ) : (
            <div className={styles.reviewList}>
              {agentReviews.map((review) => (
                <Link key={review.id} to={`/resenas/${review.id}`} className={styles.reviewLink}>
                  <WiredCard elevation={2} className={styles.reviewCard}>
                    <div className={styles.reviewHeader}>
                      <StarRating value={review.rating} readOnly />
                      <Typography as="span" className={styles.date}>
                        {review.date}
                      </Typography>
                    </div>
                    <Typography as="h3">{review.title}</Typography>
                    <Typography as="p" className={styles.excerpt}>
                      {review.comment.length > 120
                        ? review.comment.slice(0, 120) + "..."
                        : review.comment}
                    </Typography>
                    <div className={styles.voteRow}>
                      <Typography as="span">Util: {review.helpful}</Typography>
                      <Typography as="span">No util: {review.notHelpful}</Typography>
                    </div>
                  </WiredCard>
                </Link>
              ))}
            </div>
          )}
        </>
      )}
    </div>
  );
}
