import { useNavigate } from "react-router";
import { WiredCard, WiredButton, WiredSearch, WiredDivider } from "../components/WiredElements";
import { Typography } from "../components/Typography";
import styles from "./NotFound.module.css";

const mainSections = [
  { label: "Inicio", href: "/" },
  { label: "Precios y comparativas", href: "/precios" },
  { label: "Reportes y resenas", href: "/reportes" },
  { label: "Datos abiertos", href: "/datos" },
  { label: "Informacion y ayuda", href: "/info" },
];

export function NotFound() {
  const navigate = useNavigate();

  return (
    <div className={styles.container}>
      <WiredCard elevation={2} className={styles.card}>
        <Typography as="h1" className={styles.code}>
          404
        </Typography>
        <Typography as="h2" className={styles.title}>
          Pagina no encontrada
        </Typography>
        <Typography as="p" className={styles.message}>
          La pagina que buscas no existe o ha sido movida. Comprueba la URL o
          utiliza el buscador para encontrar lo que necesitas.
        </Typography>

        <WiredSearch placeholder="Busca lo que necesitas..." className={styles.search} />

        <WiredDivider />

        <WiredButton onClick={() => navigate("/")}>
          Volver al inicio
        </WiredButton>

        <WiredDivider />

        <Typography as="p" className={styles.linksTitle}>
          O visita una de nuestras secciones:
        </Typography>
        <div className={styles.links}>
          {mainSections.map((section) => (
            <WiredButton key={section.href} onClick={() => navigate(section.href)}>
              {section.label}
            </WiredButton>
          ))}
        </div>
      </WiredCard>
    </div>
  );
}
