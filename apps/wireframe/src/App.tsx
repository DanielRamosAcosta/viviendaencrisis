import type { PublicUser } from "@viviendaencrisis/shared";
import { WiredButton, WiredCard, WiredDivider, WiredInput, WiredTextarea } from "./components/WiredElements";
import { Typography } from "./components/Typography";
import styles from "./App.module.css";

const mockUsers: PublicUser[] = [
  { id: "1", displayName: "Ana García", role: "user", avatarUrl: undefined },
  { id: "2", displayName: "Carlos López", role: "admin", avatarUrl: undefined },
  { id: "3", displayName: "María Fernández", role: "user", avatarUrl: undefined },
];

export function App() {
  return (
    <div className={styles.container}>
      <Typography as="h1">Vivienda en Crisis — Wireframe</Typography>

      <WiredCard elevation={2} className={styles.card}>
        <Typography as="h2">Usuarios registrados</Typography>
        <WiredDivider />
        <div className={styles.cardList}>
          {mockUsers.map((user) => (
            <WiredCard key={user.id} className={styles.userCard}>
              <Typography as="strong">{user.displayName}</Typography>
              <Typography as="span" className={styles.role}>
                ({user.role})
              </Typography>
            </WiredCard>
          ))}
        </div>
      </WiredCard>

      <WiredCard elevation={2} className={styles.card}>
        <Typography as="h2">Nuevo reporte ciudadano</Typography>
        <WiredDivider />
        <div className={styles.cardList}>
          <WiredInput placeholder="Dirección del inmueble" className={styles.fullWidth} />
          <WiredTextarea placeholder="Describe el abuso o irregularidad..." rows={4} className={styles.fullWidth} />
          <WiredButton elevation={1}>Enviar reporte</WiredButton>
        </div>
      </WiredCard>
    </div>
  );
}
