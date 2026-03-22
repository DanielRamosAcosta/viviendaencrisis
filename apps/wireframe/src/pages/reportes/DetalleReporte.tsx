import { useParams, Link } from "react-router";
import { Typography } from "../../components/Typography";
import { WiredCard, WiredButton, WiredDivider } from "../../components/WiredElements";
import { reports } from "../../data/mockData";
import styles from "./DetalleReporte.module.css";

const statusLabels: Record<string, string> = {
  approved: "Aprobado",
  pending: "Pendiente",
  rejected: "Rechazado",
  in_review: "En revision",
};

const statusClasses: Record<string, string> = {
  approved: "statusApproved",
  pending: "statusPending",
  rejected: "statusRejected",
  in_review: "statusInReview",
};

export function DetalleReporte() {
  const { id } = useParams();
  const report = reports.find((r) => r.id === id);

  if (!report) {
    return (
      <div className={styles.container}>
        <Typography as="h1">Reporte no encontrado</Typography>
        <Typography as="p">
          No se encontro un reporte con el identificador proporcionado.
        </Typography>
        <Link to="/reportes/consultar">
          <WiredButton>Volver a Consultar Reportes</WiredButton>
        </Link>
      </div>
    );
  }

  return (
    <div className={styles.container}>
      <div className={styles.breadcrumb}>
        <Link to="/reportes/consultar" className={styles.breadcrumbLink}>
          <Typography as="span">Consultar Reportes</Typography>
        </Link>
        <Typography as="span"> / </Typography>
        <Typography as="span">{report.id}</Typography>
      </div>

      <Typography as="h1">Detalle del Reporte</Typography>

      <WiredCard elevation={2} className={styles.detailCard}>
        <div className={styles.headerRow}>
          <Typography as="h2">{report.type}</Typography>
          <Typography
            as="span"
            className={styles[statusClasses[report.status]]}
          >
            {statusLabels[report.status]}
          </Typography>
        </div>
        <WiredDivider />

        <div className={styles.field}>
          <Typography as="span" className={styles.label}>Direccion</Typography>
          <Typography as="p">{report.address}</Typography>
        </div>

        <div className={styles.field}>
          <Typography as="span" className={styles.label}>Zona</Typography>
          <Typography as="p">{report.zone}</Typography>
        </div>

        <div className={styles.field}>
          <Typography as="span" className={styles.label}>Fecha</Typography>
          <Typography as="p">{report.date}</Typography>
        </div>

        <div className={styles.field}>
          <Typography as="span" className={styles.label}>Descripcion</Typography>
          <Typography as="p">{report.description}</Typography>
        </div>

        <WiredDivider />
        <WiredButton onClick={() => navigator.clipboard?.writeText(window.location.href)}>
          Compartir enlace
        </WiredButton>
      </WiredCard>
    </div>
  );
}
