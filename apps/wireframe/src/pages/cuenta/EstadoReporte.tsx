import { Link, useParams } from "react-router";
import { Typography } from "../../components/Typography";
import {
  WiredCard,
  WiredButton,
  WiredProgress,
  WiredDivider,
} from "../../components/WiredElements";
import { AuthGate } from "../../components/AuthGate";
import { reports } from "../../data/mockData";
import styles from "./EstadoReporte.module.css";

const statusLabels: Record<string, string> = {
  pending: "Pendiente",
  in_review: "En revision",
  approved: "Aprobado",
  rejected: "Rechazado",
};

const statusProgress: Record<string, number> = {
  pending: 25,
  in_review: 50,
  approved: 100,
  rejected: 100,
};

const statusClasses: Record<string, string> = {
  pending: styles.stepActive,
  in_review: styles.stepActive,
  approved: styles.stepActive,
  rejected: styles.stepRejected,
};

function EstadoReporteContent() {
  const { id } = useParams();
  const report = reports.find((r) => r.id === id);

  if (!report) {
    return (
      <div className={styles.container}>
        <Typography as="h1">Reporte no encontrado</Typography>
        <Typography as="p">
          No se ha encontrado un reporte con el identificador proporcionado.
        </Typography>
        <Link to="/cuenta">
          <WiredButton>Volver a mi perfil</WiredButton>
        </Link>
      </div>
    );
  }

  const steps = ["Enviado", "En revision", "Aprobado/Rechazado"];
  const currentStep =
    report.status === "pending"
      ? 0
      : report.status === "in_review"
        ? 1
        : 2;

  return (
    <div className={styles.container}>
      <Typography as="h1">Estado del reporte</Typography>

      {/* Progress */}
      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h2">Progreso de moderacion</Typography>
        <WiredDivider />
        <WiredProgress
          value={statusProgress[report.status]}
          max={100}
          percentage
        />
        <div className={styles.timeline}>
          {steps.map((step, i) => (
            <div
              key={step}
              className={`${styles.timelineStep} ${
                i <= currentStep
                  ? statusClasses[report.status]
                  : styles.stepInactive
              }`}
            >
              <div className={styles.stepDot} />
              <Typography as="span">{step}</Typography>
            </div>
          ))}
        </div>
        <Typography as="p" className={styles.statusText}>
          Estado actual: {statusLabels[report.status]}
        </Typography>
      </WiredCard>

      {/* Report details */}
      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h2">Detalles del reporte</Typography>
        <WiredDivider />
        <div className={styles.detailGrid}>
          <div className={styles.detailItem}>
            <Typography as="span" className={styles.detailLabel}>
              Tipo
            </Typography>
            <Typography as="p">{report.type}</Typography>
          </div>
          <div className={styles.detailItem}>
            <Typography as="span" className={styles.detailLabel}>
              Zona
            </Typography>
            <Typography as="p">{report.zone}</Typography>
          </div>
          <div className={styles.detailItem}>
            <Typography as="span" className={styles.detailLabel}>
              Direccion
            </Typography>
            <Typography as="p">{report.address}</Typography>
          </div>
          <div className={styles.detailItem}>
            <Typography as="span" className={styles.detailLabel}>
              Fecha
            </Typography>
            <Typography as="p">{report.date}</Typography>
          </div>
        </div>
        <div className={styles.detailItem}>
          <Typography as="span" className={styles.detailLabel}>
            Descripcion
          </Typography>
          <Typography as="p">{report.description}</Typography>
        </div>
      </WiredCard>

      {/* Rejected message */}
      {report.status === "rejected" && (
        <WiredCard elevation={2} className={styles.rejectedCard}>
          <Typography as="h3">Reporte rechazado</Typography>
          <Typography as="p">
            El reporte no cumple con los criterios de la plataforma o no se ha
            podido verificar la informacion proporcionada. Puedes enviar un
            nuevo reporte con informacion mas detallada.
          </Typography>
          <Link to="/reportes/nuevo">
            <WiredButton>Enviar nuevo reporte</WiredButton>
          </Link>
        </WiredCard>
      )}

      <Link to="/cuenta">
        <WiredButton>Volver a mi perfil</WiredButton>
      </Link>
    </div>
  );
}

export function EstadoReporte() {
  return (
    <AuthGate>
      <EstadoReporteContent />
    </AuthGate>
  );
}
