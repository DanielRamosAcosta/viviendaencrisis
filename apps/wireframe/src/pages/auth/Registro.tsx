import { useState } from "react";
import { Link } from "react-router";
import { Typography } from "../../components/Typography";
import { WiredCard, WiredButton, WiredInput, WiredCheckbox } from "../../components/WiredElements";
import styles from "./Registro.module.css";

export function Registro() {
  const [accepted, setAccepted] = useState(false);
  const [submitted, setSubmitted] = useState(false);

  if (submitted) {
    return (
      <div className={styles.container}>
        <WiredCard elevation={2} className={styles.formCard}>
          <Typography as="h2">Cuenta creada</Typography>
          <Typography as="p">
            Hemos enviado un correo de verificacion a tu direccion de email. Por favor, revisa tu
            bandeja de entrada y sigue las instrucciones para activar tu cuenta.
          </Typography>
          <Link to="/login">
            <WiredButton>Ir a Iniciar Sesion</WiredButton>
          </Link>
        </WiredCard>
      </div>
    );
  }

  return (
    <div className={styles.container}>
      <Typography as="h1">Crear Cuenta</Typography>

      <WiredCard elevation={2} className={styles.formCard}>
        <div className={styles.field}>
          <Typography as="span">Nombre completo</Typography>
          <WiredInput placeholder="Tu nombre" />
        </div>

        <div className={styles.field}>
          <Typography as="span">Correo electronico</Typography>
          <WiredInput placeholder="tu@email.com" />
        </div>

        <div className={styles.field}>
          <Typography as="span">Contrasena</Typography>
          <WiredInput placeholder="Elige una contrasena" type="password" />
        </div>

        <div className={styles.field}>
          <Typography as="span">Confirmar contrasena</Typography>
          <WiredInput placeholder="Repite la contrasena" type="password" />
        </div>

        <div className={styles.checkboxRow}>
          <WiredCheckbox checked={accepted} onChange={setAccepted} />
          <Typography as="span">Acepto los terminos y condiciones de uso</Typography>
        </div>

        <WiredButton onClick={() => setSubmitted(true)}>Crear cuenta</WiredButton>

        <div className={styles.links}>
          <Link to="/login" className={styles.link}>
            <Typography as="span">Ya tengo cuenta — Iniciar sesion</Typography>
          </Link>
        </div>
      </WiredCard>
    </div>
  );
}
