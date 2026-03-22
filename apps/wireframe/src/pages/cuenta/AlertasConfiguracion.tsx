import { useState } from "react";
import { Typography } from "../../components/Typography";
import {
  WiredCard,
  WiredButton,
  WiredSearch,
  WiredCombo,
  WiredSlider,
  WiredToggle,
  WiredDivider,
} from "../../components/WiredElements";
import { AuthGate } from "../../components/AuthGate";
import { userAlerts } from "../../data/mockData";
import styles from "./AlertasConfiguracion.module.css";

interface Alert {
  id: string;
  zone: string;
  type: "alquiler" | "compraventa";
  threshold: number;
  frequency: "diaria" | "semanal" | "mensual";
  active: boolean;
  visible: boolean;
}

function AlertasContent() {
  const [alerts, setAlerts] = useState<Alert[]>(
    userAlerts.map((a) => ({ ...a, visible: true })),
  );
  const [showForm, setShowForm] = useState(false);
  const [newType, setNewType] = useState("alquiler");
  const [newThreshold, setNewThreshold] = useState(5);
  const [newFrequency, setNewFrequency] = useState("semanal");
  const [confirmDelete, setConfirmDelete] = useState<string | null>(null);

  const visibleAlerts = alerts.filter((a) => a.visible);

  const handleToggle = (id: string, checked: boolean) => {
    setAlerts((prev) =>
      prev.map((a) => (a.id === id ? { ...a, active: checked } : a)),
    );
  };

  const handleDelete = (id: string) => {
    if (confirmDelete === id) {
      setAlerts((prev) =>
        prev.map((a) => (a.id === id ? { ...a, visible: false } : a)),
      );
      setConfirmDelete(null);
    } else {
      setConfirmDelete(id);
    }
  };

  const handleSave = () => {
    const newAlert: Alert = {
      id: `al-${Date.now()}`,
      zone: "Nueva zona",
      type: newType as "alquiler" | "compraventa",
      threshold: newThreshold,
      frequency: newFrequency as "diaria" | "semanal" | "mensual",
      active: true,
      visible: true,
    };
    setAlerts((prev) => [...prev, newAlert]);
    setShowForm(false);
  };

  return (
    <div className={styles.container}>
      <Typography as="h1">Alertas de precios</Typography>
      <Typography as="p" className={styles.subtitle}>
        Configura alertas para recibir notificaciones cuando los precios
        cambien en tus zonas de interes.
      </Typography>

      {/* Existing alerts */}
      {visibleAlerts.map((alert) => (
        <WiredCard key={alert.id} elevation={2} className={styles.alertCard}>
          <div className={styles.alertInfo}>
            <Typography as="h3">{alert.zone}</Typography>
            <Typography as="p">
              Tipo: {alert.type === "alquiler" ? "Alquiler" : "Compraventa"} |
              Umbral: {alert.threshold}% | Frecuencia: {alert.frequency}
            </Typography>
          </div>
          <div className={styles.alertActions}>
            <div className={styles.toggleRow}>
              <WiredToggle
                checked={alert.active}
                onChange={(checked) => handleToggle(alert.id, checked)}
              />
              <Typography as="span">
                {alert.active ? "Activa" : "Inactiva"}
              </Typography>
            </div>
            <WiredButton onClick={() => handleDelete(alert.id)}>
              {confirmDelete === alert.id ? "Confirmar eliminacion" : "Eliminar"}
            </WiredButton>
          </div>
        </WiredCard>
      ))}

      {visibleAlerts.length === 0 && !showForm && (
        <WiredCard elevation={2} className={styles.emptyState}>
          <Typography as="p">No tienes alertas configuradas.</Typography>
        </WiredCard>
      )}

      {/* New alert button / form */}
      {!showForm ? (
        <WiredButton onClick={() => setShowForm(true)}>
          Nueva alerta
        </WiredButton>
      ) : (
        <WiredCard elevation={2} className={styles.formCard}>
          <Typography as="h2">Nueva alerta</Typography>
          <WiredDivider />

          <div className={styles.formFields}>
            <div className={styles.formGroup}>
              <Typography as="span">Zona</Typography>
              <WiredSearch
                placeholder="Buscar zona..."
                onChange={() => {}}
              />
            </div>

            <div className={styles.formGroup}>
              <Typography as="span">Tipo</Typography>
              <WiredCombo
                selected={newType}
                onSelected={(v) => setNewType(v)}
              >
                <wired-item value="alquiler">Alquiler</wired-item>
                <wired-item value="compraventa">Compraventa</wired-item>
              </WiredCombo>
            </div>

            <div className={styles.formGroup}>
              <Typography as="span">
                Umbral de variacion: {newThreshold}%
              </Typography>
              <WiredSlider
                value={newThreshold}
                min={1}
                max={20}
                onChange={(v) => setNewThreshold(v)}
              />
            </div>

            <div className={styles.formGroup}>
              <Typography as="span">Frecuencia</Typography>
              <WiredCombo
                selected={newFrequency}
                onSelected={(v) => setNewFrequency(v)}
              >
                <wired-item value="diaria">Diaria</wired-item>
                <wired-item value="semanal">Semanal</wired-item>
                <wired-item value="mensual">Mensual</wired-item>
              </WiredCombo>
            </div>
          </div>

          <div className={styles.formActions}>
            <WiredButton onClick={handleSave}>Guardar</WiredButton>
            <WiredButton onClick={() => setShowForm(false)}>
              Cancelar
            </WiredButton>
          </div>
        </WiredCard>
      )}
    </div>
  );
}

export function AlertasConfiguracion() {
  return (
    <AuthGate>
      <AlertasContent />
    </AuthGate>
  );
}
