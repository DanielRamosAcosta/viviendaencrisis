import { useState } from "react";
import { Link } from "react-router";
import { Typography } from "../../components/Typography";
import { WiredCard, WiredTabs, WiredButton } from "../../components/WiredElements";
import { AuthGate } from "../../components/AuthGate";
import { useAuth } from "../../context/AuthContext";
import { StarRating } from "../../components/StarRating";
import { reports, reviews, userFavoriteZones } from "../../data/mockData";
import styles from "./MiPerfil.module.css";

const statusLabels: Record<string, string> = {
  pending: "Pendiente",
  in_review: "En revision",
  approved: "Aprobado",
  rejected: "Rechazado",
};

const statusClasses: Record<string, string> = {
  pending: styles.badgePending,
  in_review: styles.badgeReview,
  approved: styles.badgeApproved,
  rejected: styles.badgeRejected,
};

function ProfileContent() {
  const { user } = useAuth();
  const [activeTab, setActiveTab] = useState("reportes");

  return (
    <div className={styles.container}>
      <Typography as="h1">Mi Perfil</Typography>

      {/* Profile header */}
      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h2">{user?.name}</Typography>
        <Typography as="p" className={styles.email}>
          {user?.email}
        </Typography>
        <div className={styles.profileActions}>
          <Link to="/cuenta/alertas">
            <WiredButton>Configurar alertas</WiredButton>
          </Link>
        </div>
      </WiredCard>

      {/* Tabs */}
      <WiredTabs selected={activeTab} onSelected={(v) => setActiveTab(v)}>
        <wired-tab name="reportes">Mis reportes</wired-tab>
        <wired-tab name="resenas">Mis resenas</wired-tab>
        <wired-tab name="favoritas">Mis favoritas</wired-tab>
      </WiredTabs>

      {/* Reportes tab */}
      {activeTab === "reportes" && (
        <div className={styles.tabContent}>
          {reports.map((r) => (
            <WiredCard key={r.id} elevation={1} className={styles.listCard}>
              <div className={styles.listHeader}>
                <Typography as="h3">{r.type}</Typography>
                <Typography as="span" className={`${styles.badge} ${statusClasses[r.status]}`}>
                  {statusLabels[r.status]}
                </Typography>
              </div>
              <Typography as="p">
                {r.zone} — {r.address}
              </Typography>
              <Typography as="span" className={styles.date}>
                {r.date}
              </Typography>
              <Link to={`/cuenta/reporte/${r.id}`}>
                <WiredButton>Ver estado</WiredButton>
              </Link>
            </WiredCard>
          ))}
        </div>
      )}

      {/* Resenas tab */}
      {activeTab === "resenas" && (
        <div className={styles.tabContent}>
          {reviews.map((rv) => (
            <WiredCard key={rv.id} elevation={1} className={styles.listCard}>
              <Typography as="h3">{rv.title}</Typography>
              <StarRating value={rv.rating} readOnly />
              <Typography as="p">{rv.comment}</Typography>
              <Typography as="span" className={styles.date}>
                {rv.date}
              </Typography>
            </WiredCard>
          ))}
        </div>
      )}

      {/* Favoritas tab */}
      {activeTab === "favoritas" && (
        <div className={styles.tabContent}>
          {userFavoriteZones.map((fav) => (
            <WiredCard key={fav.zone} elevation={1} className={styles.listCard}>
              <Typography as="h3">{fav.zone}</Typography>
              <Typography as="span" className={styles.date}>
                Anadida el {fav.addedDate}
              </Typography>
              <Link to="/precios/evolucion">
                <WiredButton>Ver precios</WiredButton>
              </Link>
            </WiredCard>
          ))}
          <Link to="/cuenta/favoritas">
            <WiredButton>Gestionar favoritas</WiredButton>
          </Link>
        </div>
      )}
    </div>
  );
}

export function MiPerfil() {
  return (
    <AuthGate>
      <ProfileContent />
    </AuthGate>
  );
}
