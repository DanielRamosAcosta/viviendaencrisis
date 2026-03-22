import { useState } from "react";
import { Link } from "react-router";
import { Typography } from "../../components/Typography";
import {
  WiredCard,
  WiredButton,
  WiredSearch,
  WiredDivider,
} from "../../components/WiredElements";
import { AuthGate } from "../../components/AuthGate";
import { userFavoriteZones } from "../../data/mockData";
import styles from "./ZonasFavoritas.module.css";

function ZonasFavoritasContent() {
  const [favorites, setFavorites] = useState(
    userFavoriteZones.map((z) => ({ ...z, visible: true })),
  );

  const visibleFavorites = favorites.filter((f) => f.visible);

  const handleRemove = (zone: string) => {
    setFavorites((prev) =>
      prev.map((f) => (f.zone === zone ? { ...f, visible: false } : f)),
    );
  };

  return (
    <div className={styles.container}>
      <Typography as="h1">Zonas favoritas</Typography>
      <Typography as="p" className={styles.subtitle}>
        Gestiona las zonas que sigues para recibir actualizaciones de precios.
      </Typography>

      {/* Add zone (non-functional) */}
      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h2">Anadir zona</Typography>
        <WiredDivider />
        <WiredSearch placeholder="Buscar zona para anadir..." onChange={() => {}} />
      </WiredCard>

      {/* Favorites list */}
      {visibleFavorites.length === 0 ? (
        <WiredCard elevation={2} className={styles.emptyState}>
          <Typography as="p">
            No tienes zonas favoritas todavia.
          </Typography>
          <Link to="/precios">
            <WiredButton>Explorar precios</WiredButton>
          </Link>
        </WiredCard>
      ) : (
        <div className={styles.list}>
          {visibleFavorites.map((fav) => (
            <WiredCard key={fav.zone} elevation={2} className={styles.favCard}>
              <div className={styles.favInfo}>
                <Typography as="h3">{fav.zone}</Typography>
                <Typography as="span" className={styles.date}>
                  Anadida el {fav.addedDate}
                </Typography>
              </div>
              <div className={styles.favActions}>
                <Link to="/precios/evolucion">
                  <WiredButton>Ver precios</WiredButton>
                </Link>
                <WiredButton onClick={() => handleRemove(fav.zone)}>
                  Eliminar
                </WiredButton>
              </div>
            </WiredCard>
          ))}
        </div>
      )}
    </div>
  );
}

export function ZonasFavoritas() {
  return (
    <AuthGate>
      <ZonasFavoritasContent />
    </AuthGate>
  );
}
