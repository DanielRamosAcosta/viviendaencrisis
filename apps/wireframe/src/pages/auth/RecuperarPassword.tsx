import { useState } from "react";
import { Link } from "react-router";
import { Typography } from "../../components/Typography";
import { WiredCard, WiredButton, WiredInput } from "../../components/WiredElements";
import styles from "./RecuperarPassword.module.css";

export function RecuperarPassword() {
  const [submitted, setSubmitted] = useState(false);

  if (submitted) {
    return (
      <div className={styles.container}>
        <WiredCard elevation={2} className={styles.formCard}>
          <Typography as="h2">Enlace enviado</Typography>
          <Typography as="p">
            Si la direccion de correo proporcionada esta asociada a una cuenta,
            recibiras un enlace para restablecer tu contrasena. Revisa tu
            bandeja de entrada.
          </Typography>
          <Link to="/login">
            <WiredButton>Volver a Iniciar Sesion</WiredButton>
          </Link>
        </WiredCard>
      </div>
    );
  }

  return (
    <div className={styles.container}>
      <Typography as="h1">Recuperar Contrasena</Typography>

      <WiredCard elevation={2} className={styles.formCard}>
        <Typography as="p">
          Introduce tu correo electronico y te enviaremos un enlace para
          restablecer tu contrasena.
        </Typography>

        <div className={styles.field}>
          <Typography as="span">Correo electronico</Typography>
          <WiredInput placeholder="tu@email.com" />
        </div>

        <WiredButton onClick={() => setSubmitted(true)}>
          Enviar enlace
        </WiredButton>

        <Link to="/login" className={styles.link}>
          <Typography as="span">Volver a Iniciar Sesion</Typography>
        </Link>
      </WiredCard>
    </div>
  );
}
