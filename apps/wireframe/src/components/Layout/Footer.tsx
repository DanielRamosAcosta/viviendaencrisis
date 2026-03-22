import { Link } from "react-router";
import { Typography } from "../Typography";
import styles from "./Footer.module.css";

export function Footer() {
  return (
    <footer className={styles.footer}>
      <div className={styles.content}>
        <div className={styles.links}>
          <Link to="/info/que-es" className={styles.link}>
            <Typography as="span">Sobre nosotros</Typography>
          </Link>
          <Link to="/info/faq" className={styles.link}>
            <Typography as="span">FAQ</Typography>
          </Link>
          <Link to="/datos/metodologia" className={styles.link}>
            <Typography as="span">Metodologia</Typography>
          </Link>
          <Link to="/info/derechos" className={styles.link}>
            <Typography as="span">Derechos</Typography>
          </Link>
        </div>
        <Typography as="p" className={styles.copyright}>
          Vivienda en Crisis — Datos abiertos para la transparencia del mercado de la vivienda
        </Typography>
      </div>
    </footer>
  );
}
