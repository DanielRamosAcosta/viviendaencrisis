import { useState } from "react";
import { Typography } from "../../components/Typography";
import {
  WiredCard,
  WiredButton,
  WiredInput,
  WiredSearch,
  WiredTextarea,
} from "../../components/WiredElements";
import { StarRating } from "../../components/StarRating";
import { AuthGate } from "../../components/AuthGate";
import { agents } from "../../data/mockData";
import styles from "./EscribirResena.module.css";

export function EscribirResena() {
  return (
    <AuthGate>
      <ResenaForm />
    </AuthGate>
  );
}

function ResenaForm() {
  const [search, setSearch] = useState("");
  const [selectedAgentId, setSelectedAgentId] = useState<string | null>(null);
  const [rating, setRating] = useState(0);
  const [title, setTitle] = useState("");
  const [comment, setComment] = useState("");
  const [submitted, setSubmitted] = useState(false);

  const filteredAgents = search
    ? agents.filter(
        (a) =>
          a.name.toLowerCase().includes(search.toLowerCase()) ||
          a.zone.toLowerCase().includes(search.toLowerCase())
      )
    : [];

  const selectedAgent = agents.find((a) => a.id === selectedAgentId);

  if (submitted) {
    return (
      <div className={styles.container}>
        <WiredCard elevation={2} className={styles.section}>
          <Typography as="h2">Resena enviada</Typography>
          <Typography as="p">
            Tu resena ha sido registrada correctamente. Gracias por compartir tu
            experiencia con la comunidad.
          </Typography>
        </WiredCard>
      </div>
    );
  }

  return (
    <div className={styles.container}>
      <Typography as="h1">Escribir una Resena</Typography>
      <Typography as="p" className={styles.subtitle}>
        Comparte tu experiencia con un agente o inmobiliaria.
      </Typography>

      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h3">Buscar agente</Typography>
        <WiredSearch
          placeholder="Nombre del agente o inmobiliaria..."
          onChange={(val: string) => setSearch(val)}
        />
        {filteredAgents.length > 0 && (
          <div className={styles.agentResults}>
            {filteredAgents.map((a) => (
              <div
                key={a.id}
                className={`${styles.agentOption} ${selectedAgentId === a.id ? styles.agentOptionSelected : ""}`}
                onClick={() => setSelectedAgentId(a.id)}
              >
                <WiredCard className={styles.agentOptionInner}>
                  <Typography as="span">{a.name}</Typography>
                  <Typography as="span" className={styles.agentZone}>
                    {a.zone}
                  </Typography>
                </WiredCard>
              </div>
            ))}
          </div>
        )}
        {selectedAgent && (
          <Typography as="p" className={styles.selectedLabel}>
            Agente seleccionado: {selectedAgent.name} ({selectedAgent.zone})
          </Typography>
        )}
      </WiredCard>

      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h3">Tu valoracion</Typography>
        <StarRating value={rating} onChange={setRating} />

        <div className={styles.field}>
          <Typography as="span">Titulo</Typography>
          <WiredInput
            placeholder="Resumen breve de tu experiencia"
            value={title}
            onChange={setTitle}
          />
        </div>

        <div className={styles.field}>
          <Typography as="span">Comentario</Typography>
          <WiredTextarea
            placeholder="Describe tu experiencia con detalle..."
            rows={5}
            value={comment}
            onChange={setComment}
          />
        </div>

        <WiredButton onClick={() => setSubmitted(true)}>
          Enviar resena
        </WiredButton>
      </WiredCard>
    </div>
  );
}
