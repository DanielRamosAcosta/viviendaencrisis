import { Link } from "react-router";
import { WiredButton } from "../components/WiredElements";
import { Typography } from "../components/Typography";

export function NotFound() {
  return (
    <div>
      <Typography as="h1">404 — Pagina no encontrada</Typography>
      <Typography as="p">La pagina que buscas no existe o ha sido movida.</Typography>
      <Link to="/">
        <WiredButton>Volver al inicio</WiredButton>
      </Link>
    </div>
  );
}
