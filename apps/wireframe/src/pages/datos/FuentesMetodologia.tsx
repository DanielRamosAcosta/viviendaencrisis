import { Typography } from "../../components/Typography";
import { WiredCard, WiredDivider, WiredLink } from "../../components/WiredElements";
import { dataSources } from "../../data/mockData";
import styles from "./FuentesMetodologia.module.css";

export function FuentesMetodologia() {
  return (
    <div className={styles.container}>
      <Typography as="h1">Fuentes y metodologia</Typography>
      <Typography as="p" className={styles.subtitle}>
        Informacion sobre la procedencia de los datos, como se procesan y cuales son sus
        limitaciones.
      </Typography>

      {/* Data sources */}
      <Typography as="h2">Fuentes de datos</Typography>
      <div className={styles.sourceGrid}>
        {dataSources.map((source) => (
          <WiredCard key={source.name} elevation={2} className={styles.sourceCard}>
            <Typography as="h3">{source.name}</Typography>
            <Typography as="p">{source.description}</Typography>
            <div className={styles.sourceMeta}>
              <WiredLink href={source.url} target="_blank" elevation={1}>
                {source.url}
              </WiredLink>
              <Typography as="span" className={styles.updated}>
                Ultima actualizacion: {source.updated}
              </Typography>
            </div>
          </WiredCard>
        ))}
      </div>

      {/* Methodology */}
      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h2">Metodologia</Typography>
        <WiredDivider />
        <Typography as="p">
          Los datos de precios de alquiler y compraventa se obtienen trimestralmente de las fuentes
          oficiales indicadas. Se procesan mediante scripts automatizados que normalizan los
          formatos, geocodifican los municipios y calculan los indicadores derivados (precio por
          metro cuadrado, tasa de esfuerzo, variacion interanual).
        </Typography>
        <Typography as="p">
          Los indicadores de asequibilidad se calculan cruzando los precios medios con los datos de
          renta disponible por hogar del INE. La tasa de esfuerzo representa el porcentaje de
          ingresos netos del hogar que se destina al pago de la vivienda.
        </Typography>
        <Typography as="p">
          Complementariamente, se realizan sondeos puntuales de portales inmobiliarios (Idealista,
          Fotocasa) para contrastar los datos oficiales con los precios de oferta del mercado. Estos
          sondeos se realizan dentro del marco legal, accediendo unicamente a datos publicos.
        </Typography>
      </WiredCard>

      {/* Limitations */}
      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h2">Limitaciones</Typography>
        <WiredDivider />
        <Typography as="p">
          Los datos oficiales presentan un desfase temporal de entre 3 y 6 meses respecto a la
          situacion real del mercado, ya que los indices se publican con retraso.
        </Typography>
        <Typography as="p">
          La cobertura municipal varia segun la fuente. Municipios con poca actividad inmobiliaria
          pueden no tener datos en determinados trimestres.
        </Typography>
        <Typography as="p">
          Los precios de portales inmobiliarios reflejan precios de oferta, no de transacciones
          cerradas, por lo que tienden a ser superiores a los datos oficiales.
        </Typography>
        <Typography as="p">
          Los datos de catastro pueden no reflejar reformas recientes o cambios de uso no
          declarados.
        </Typography>
      </WiredCard>
    </div>
  );
}
