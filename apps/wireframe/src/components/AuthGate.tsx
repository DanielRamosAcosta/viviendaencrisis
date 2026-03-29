import type { ReactNode } from "react";
import { Link } from "react-router";
import { WiredCard, WiredButton } from "./WiredElements";
import { Typography } from "./Typography";
import { useAuth } from "../context/AuthContext";
import styles from "./AuthGate.module.css";

interface AuthGateProps {
  children: ReactNode;
}

export function AuthGate({ children }: AuthGateProps) {
  const { isLoggedIn } = useAuth();

  if (!isLoggedIn) {
    return (
      <div className={styles.container}>
        <WiredCard elevation={2} className={styles.card}>
          <Typography as="h2">Acceso restringido</Typography>
          <Typography as="p">Necesitas iniciar sesion para acceder a esta seccion.</Typography>
          <Link to="/login">
            <WiredButton>Iniciar sesion</WiredButton>
          </Link>
          <Typography as="p" className={styles.registerHint}>
            ¿No tienes cuenta? <Link to="/registro">Crear cuenta</Link>
          </Typography>
        </WiredCard>
      </div>
    );
  }

  return <>{children}</>;
}
