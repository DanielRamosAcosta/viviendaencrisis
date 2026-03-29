import { useState } from "react";
import { Link } from "react-router";
import { Typography } from "../../components/Typography";
import {
  WiredCard,
  WiredButton,
  WiredInput,
  WiredTextarea,
  WiredCombo,
  WiredSearch,
  WiredCheckbox,
  WiredProgress,
} from "../../components/WiredElements";
import { AuthGate } from "../../components/AuthGate";
import { irregularityTypes, zones } from "../../data/mockData";
import styles from "./ReportarIrregularidad.module.css";

export function ReportarIrregularidad() {
  return (
    <AuthGate>
      <ReportForm />
    </AuthGate>
  );
}

function ReportForm() {
  const [step, setStep] = useState(0);
  const [type, setType] = useState("");
  const [address, setAddress] = useState("");
  const [zone, setZone] = useState("");
  const [description, setDescription] = useState("");
  const [confirmed, setConfirmed] = useState(false);
  const [submitted, setSubmitted] = useState(false);

  if (submitted) {
    return (
      <div className={styles.container}>
        <WiredCard elevation={2} className={styles.section}>
          <Typography as="h2">Reporte enviado correctamente</Typography>
          <Typography as="p">
            Tu reporte ha sido registrado y sera revisado por un moderador. Puedes consultar el
            estado de tu reporte en cualquier momento.
          </Typography>
          <Link to="/cuenta/estado-reporte">
            <WiredButton>Mi cuenta &gt; Estado de reporte</WiredButton>
          </Link>
        </WiredCard>
      </div>
    );
  }

  return (
    <div className={styles.container}>
      <Typography as="h1">Reportar una Irregularidad</Typography>

      {step === 0 && (
        <WiredCard elevation={2} className={styles.anonymityNotice}>
          <Typography as="h3">Aviso de anonimato</Typography>
          <Typography as="p">
            Tu identidad nunca sera visible para terceros. Los reportes se publican de forma anonima
            y los datos se tratan conforme al RGPD. Tu informacion personal solo sera accesible por
            los administradores de la plataforma para fines de moderacion.
          </Typography>
          <WiredButton onClick={() => setStep(1)}>Entendido, continuar</WiredButton>
        </WiredCard>
      )}

      {step >= 1 && (
        <WiredProgress value={step === 1 ? 33 : step === 2 ? 66 : 100} max={100} percentage />
      )}

      {step === 1 && (
        <WiredCard elevation={2} className={styles.section}>
          <Typography as="h2">Paso 1: Ubicacion</Typography>
          <div className={styles.field}>
            <Typography as="span">Tipo de irregularidad</Typography>
            <WiredCombo selected={type} onSelected={(val: string) => setType(val)}>
              {irregularityTypes.map((t) => (
                <wired-item key={t} value={t}>
                  {t}
                </wired-item>
              ))}
            </WiredCombo>
          </div>
          <div className={styles.field}>
            <Typography as="span">Direccion</Typography>
            <WiredInput
              placeholder="Calle, numero, piso..."
              value={address}
              onChange={setAddress}
            />
          </div>
          <div className={styles.field}>
            <Typography as="span">Zona</Typography>
            <WiredSearch placeholder="Buscar zona..." onChange={(val: string) => setZone(val)} />
            {zone && (
              <Typography as="span" className={styles.selectedZone}>
                Zona seleccionada: {zone}
              </Typography>
            )}
            <div className={styles.zoneHints}>
              {zones.slice(0, 4).map((z) => (
                <WiredButton key={z} onClick={() => setZone(z)}>
                  {z}
                </WiredButton>
              ))}
            </div>
          </div>
          <div className={styles.actions}>
            <WiredButton onClick={() => setStep(0)}>Atras</WiredButton>
            <WiredButton onClick={() => setStep(2)}>Siguiente</WiredButton>
          </div>
        </WiredCard>
      )}

      {step === 2 && (
        <WiredCard elevation={2} className={styles.section}>
          <Typography as="h2">Paso 2: Descripcion</Typography>
          <div className={styles.field}>
            <Typography as="span">Describe la irregularidad</Typography>
            <WiredTextarea
              placeholder="Describe lo ocurrido con el mayor detalle posible (min. 50 caracteres)..."
              rows={5}
              value={description}
              onChange={setDescription}
            />
          </div>
          <WiredButton disabled>Adjuntar evidencia (fotos, documentos)</WiredButton>
          <Typography as="span" className={styles.hint}>
            Funcionalidad no disponible en el prototipo
          </Typography>
          <div className={styles.actions}>
            <WiredButton onClick={() => setStep(1)}>Atras</WiredButton>
            <WiredButton onClick={() => setStep(3)}>Siguiente</WiredButton>
          </div>
        </WiredCard>
      )}

      {step === 3 && (
        <WiredCard elevation={2} className={styles.section}>
          <Typography as="h2">Paso 3: Confirmacion</Typography>
          <WiredCard className={styles.summary}>
            <Typography as="p">
              <Typography as="span" className={styles.label}>
                Tipo:
              </Typography>{" "}
              {type || "No especificado"}
            </Typography>
            <Typography as="p">
              <Typography as="span" className={styles.label}>
                Direccion:
              </Typography>{" "}
              {address || "No especificada"}
            </Typography>
            <Typography as="p">
              <Typography as="span" className={styles.label}>
                Zona:
              </Typography>{" "}
              {zone || "No especificada"}
            </Typography>
            <Typography as="p">
              <Typography as="span" className={styles.label}>
                Descripcion:
              </Typography>{" "}
              {description || "No proporcionada"}
            </Typography>
          </WiredCard>
          <div className={styles.confirmRow}>
            <WiredCheckbox checked={confirmed} onChange={setConfirmed} />
            <Typography as="span">
              Confirmo que la informacion proporcionada es veraz y comprendo que los reportes falsos
              pueden ser eliminados.
            </Typography>
          </div>
          <div className={styles.actions}>
            <WiredButton onClick={() => setStep(2)}>Atras</WiredButton>
            <WiredButton onClick={() => setSubmitted(true)}>Enviar reporte</WiredButton>
          </div>
        </WiredCard>
      )}
    </div>
  );
}
