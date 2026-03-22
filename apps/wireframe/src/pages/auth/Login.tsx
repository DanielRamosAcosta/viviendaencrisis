import { Link, useNavigate } from "react-router";
import { Typography } from "../../components/Typography";
import { WiredCard, WiredButton, WiredInput } from "../../components/WiredElements";
import { useAuth } from "../../context/AuthContext";
import styles from "./Login.module.css";

export function Login() {
  const { login } = useAuth();
  const navigate = useNavigate();

  const handleLogin = () => {
    login();
    navigate(-1);
  };

  return (
    <div className={styles.container}>
      <Typography as="h1">Iniciar Sesion</Typography>

      <WiredCard elevation={2} className={styles.formCard}>
        <div className={styles.field}>
          <Typography as="span">Correo electronico</Typography>
          <WiredInput placeholder="tu@email.com" />
        </div>

        <div className={styles.field}>
          <Typography as="span">Contrasena</Typography>
          <WiredInput placeholder="Tu contrasena" type="password" />
        </div>

        <WiredButton onClick={handleLogin}>Iniciar sesion</WiredButton>

        <div className={styles.links}>
          <Link to="/registro" className={styles.link}>
            <Typography as="span">Crear cuenta</Typography>
          </Link>
          <Link to="/recuperar" className={styles.link}>
            <Typography as="span">Recuperar contrasena</Typography>
          </Link>
        </div>
      </WiredCard>
    </div>
  );
}
