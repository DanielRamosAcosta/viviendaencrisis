import { useState, useMemo } from "react";
import { feature } from "topojson-client";
import type { Topology } from "topojson-specification";
import type { FeatureCollection } from "geojson";
import spainTopo from "es-atlas/es/autonomous_regions.json";
import {
  WiredButton,
  WiredCalendar,
  WiredCard,
  WiredCheckbox,
  WiredCombo,
  WiredDialog,
  WiredDivider,
  WiredFab,
  WiredImage,
  WiredInput,
  WiredLink,
  WiredListbox,
  WiredProgress,
  WiredRadio,
  WiredSearch,
  WiredSlider,
  WiredSpinner,
  WiredTabs,
  WiredTextarea,
  WiredToggle,
} from "../components/WiredElements";
import {
  RoughBar,
  RoughBarH,
  RoughDonut,
  RoughLine,
  RoughPie,
  RoughScatter,
  RoughStackedBar,
  RoughMap,
} from "../components/RoughViz";
import { Typography } from "../components/Typography";
import { urlOfImageOfSize } from "../utils/placeholder";
import styles from "./Showcase.module.css";

const ccaaColors: Record<string, string> = {
  Andalucía: "#f78fb3",
  Aragón: "#3dc1d3",
  "Principado de Asturias": "#f5cd79",
  "Illes Balears": "#778beb",
  Canarias: "#e77f67",
  Cantabria: "#cf6a87",
  "Castilla y León": "#786fa6",
  "Castilla - La Mancha": "#63cdda",
  Cataluña: "#ea8685",
  "Comunitat Valenciana": "#78e08f",
  Extremadura: "#e15f41",
  Galicia: "#574b90",
  "Comunidad de Madrid": "#f19066",
  "Región de Murcia": "#546de5",
  "Comunidad Foral de Navarra": "#c44569",
  "País Vasco": "#3dc1d3",
  "La Rioja": "#f5cd79",
};

export function Showcase() {
  const [dialogOpen, setDialogOpen] = useState(false);
  const [sliderValue, setSliderValue] = useState(50);
  const [toggleChecked, setToggleChecked] = useState(false);
  const [checkboxChecked, setCheckboxChecked] = useState(false);
  const [progressValue, setProgressValue] = useState(65);
  const spainGeo = useMemo(() => {
    const topo = spainTopo as unknown as Topology;
    return feature(topo, topo.objects.autonomous_regions) as FeatureCollection;
  }, []);

  return (
    <div className={styles.container}>
      <Typography as="h1">Component Library Demo</Typography>
      <Typography as="p" className={styles.subtitle}>
        All available wired-elements and rough-viz chart wrappers
      </Typography>

      {/* ─── BUTTONS ─── */}
      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h2">Buttons &amp; Actions</Typography>
        <WiredDivider />
        <div className={styles.row}>
          <WiredButton>Default</WiredButton>
          <WiredButton elevation={3}>Elevated</WiredButton>
          <WiredButton disabled>Disabled</WiredButton>
          <WiredFab onClick={() => alert("FAB clicked")} />
        </div>
      </WiredCard>

      {/* ─── TEXT INPUTS ─── */}
      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h2">Text Inputs</Typography>
        <WiredDivider />
        <div className={styles.col}>
          <WiredInput placeholder="Text input" />
          <WiredInput placeholder="Password" type="password" />
          <WiredInput placeholder="Disabled" disabled />
          <WiredSearch placeholder="Search..." />
          <WiredTextarea placeholder="Textarea with 3 rows" rows={3} />
        </div>
      </WiredCard>

      {/* ─── SELECTION CONTROLS ─── */}
      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h2">Selection Controls</Typography>
        <WiredDivider />
        <div className={styles.col}>
          <div className={styles.row}>
            <WiredCheckbox checked={checkboxChecked} onChange={setCheckboxChecked} />
            <Typography as="span">
              Checkbox ({checkboxChecked ? "checked" : "unchecked"})
            </Typography>
          </div>
          <div className={styles.row}>
            <WiredToggle checked={toggleChecked} onChange={setToggleChecked} />
            <Typography as="span">Toggle ({toggleChecked ? "on" : "off"})</Typography>
          </div>
          <div className={styles.row}>
            <WiredRadio name="demo" text="Option A" />
            <WiredRadio name="demo" text="Option B" />
            <WiredRadio name="demo" text="Option C" />
          </div>
        </div>
      </WiredCard>

      {/* ─── COMBO & LISTBOX ─── */}
      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h2">Combo &amp; Listbox</Typography>
        <WiredDivider />
        <div className={styles.row}>
          <WiredCombo selected="Madrid">
            <wired-item value="Madrid">Madrid</wired-item>
            <wired-item value="Barcelona">Barcelona</wired-item>
            <wired-item value="Valencia">Valencia</wired-item>
          </WiredCombo>
          <WiredListbox selected="Alquiler" className={styles.listbox}>
            <wired-item value="Alquiler">Alquiler</wired-item>
            <wired-item value="Compra">Compra</wired-item>
            <wired-item value="Compartido">Compartido</wired-item>
          </WiredListbox>
        </div>
      </WiredCard>

      {/* ─── SLIDER & PROGRESS ─── */}
      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h2">Slider &amp; Progress</Typography>
        <WiredDivider />
        <div className={styles.col}>
          <div className={styles.row}>
            <Typography as="span">Slider: {sliderValue}</Typography>
            <WiredSlider value={sliderValue} min={0} max={100} onChange={setSliderValue} />
          </div>
          <div className={styles.row}>
            <Typography as="span">Progress: {progressValue}%</Typography>
            <WiredProgress value={progressValue} max={100} percentage />
          </div>
          <div className={styles.row}>
            <WiredButton onClick={() => setProgressValue((v) => Math.min(100, v + 10))}>
              +10%
            </WiredButton>
            <WiredButton onClick={() => setProgressValue((v) => Math.max(0, v - 10))}>
              -10%
            </WiredButton>
          </div>
        </div>
      </WiredCard>

      {/* ─── SPINNER ─── */}
      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h2">Spinner</Typography>
        <WiredDivider />
        <div className={styles.row}>
          <WiredSpinner spinning duration={1000} />
          <Typography as="span">Loading...</Typography>
        </div>
      </WiredCard>

      {/* ─── TABS ─── */}
      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h2">Tabs</Typography>
        <WiredDivider />
        <WiredTabs selected="tab1">
          <wired-tab name="tab1">Precios</wired-tab>
          <wired-tab name="tab2">Mapas</wired-tab>
          <wired-tab name="tab3">Reportes</wired-tab>
        </WiredTabs>
      </WiredCard>

      {/* ─── CALENDAR ─── */}
      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h2">Calendar</Typography>
        <WiredDivider />
        <WiredCalendar locale="es-ES" />
      </WiredCard>

      {/* ─── DIALOG ─── */}
      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h2">Dialog</Typography>
        <WiredDivider />
        <WiredButton onClick={() => setDialogOpen(true)}>Open Dialog</WiredButton>
        <WiredDialog open={dialogOpen}>
          <Typography as="p">This is a wired dialog!</Typography>
          <WiredButton onClick={() => setDialogOpen(false)}>Close</WiredButton>
        </WiredDialog>
      </WiredCard>

      {/* ─── CARD, IMAGE, LINK, DIVIDER ─── */}
      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h2">Cards, Images &amp; Links</Typography>
        <WiredDivider />
        <div className={styles.row}>
          <WiredCard elevation={1} className={styles.miniCard}>
            <Typography as="span">Card (elevation 1)</Typography>
          </WiredCard>
          <WiredCard elevation={3} className={styles.miniCard}>
            <Typography as="span">Card (elevation 3)</Typography>
          </WiredCard>
        </div>
        <div className={styles.col}>
          <WiredImage
            src={urlOfImageOfSize(600, 400)}
            elevation={2}
            className={styles.wiredImage}
          />
          <WiredLink href="https://github.com" target="_blank" elevation={2}>
            WiredLink to GitHub
          </WiredLink>
        </div>
      </WiredCard>

      {/* ═══════════════════════════════════════════ */}
      {/*              ROUGH-VIZ CHARTS              */}
      {/* ═══════════════════════════════════════════ */}

      <WiredDivider elevation={3} className={styles.dividerSpacing} />
      <Typography as="h1">Rough-Viz Charts</Typography>
      <Typography as="p" className={styles.subtitle}>
        Hand-drawn style data visualizations
      </Typography>

      {/* ─── BAR CHART ─── */}
      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h2">Bar Chart</Typography>
        <WiredDivider />
        <RoughBar
          data={{
            labels: ["Madrid", "Barcelona", "Valencia", "Sevilla", "Bilbao"],
            values: [1250, 1180, 750, 620, 890],
          }}
          title="Precio medio alquiler (EUR/mes)"
          color="skyblue"
          highlight="coral"
          roughness={2}
          strokeWidth={1}
          className={styles.chart}
        />
      </WiredCard>

      {/* ─── HORIZONTAL BAR ─── */}
      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h2">Horizontal Bar Chart</Typography>
        <WiredDivider />
        <RoughBarH
          data={{
            labels: ["Estudio", "1 hab.", "2 hab.", "3 hab.", "4+ hab."],
            values: [650, 850, 1100, 1350, 1800],
          }}
          title="Alquiler por tipo de vivienda"
          color="orange"
          highlight="lightyellow"
          roughness={2}
          className={styles.chart}
        />
      </WiredCard>

      {/* ─── DONUT ─── */}
      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h2">Donut Chart</Typography>
        <WiredDivider />
        <RoughDonut
          data={{
            labels: ["Alquiler", "Propiedad", "Compartido", "Social", "Otros"],
            values: [38, 42, 12, 5, 3],
          }}
          title="Distribución por tipo de tenencia"
          colors={["#f78fb3", "#3dc1d3", "#f5cd79", "#778beb", "#e77f67"]}
          roughness={2}
          className={styles.chart}
        />
      </WiredCard>

      {/* ─── LINE ─── */}
      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h2">Line Chart</Typography>
        <WiredDivider />
        <RoughLine
          data={{
            x: ["2019", "2020", "2021", "2022", "2023", "2024"],
            y: [820, 790, 810, 920, 1050, 1180],
          }}
          title="Evolución del alquiler medio"
          xLabel="Año"
          yLabel="EUR/mes"
          colors={["#f78fb3"]}
          roughness={3}
          circle
          circleRadius={8}
          className={styles.chart}
        />
      </WiredCard>

      {/* ─── PIE ─── */}
      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h2">Pie Chart</Typography>
        <WiredDivider />
        <RoughPie
          data={{
            labels: ["< 30%", "30-50%", "50-70%", "> 70%"],
            values: [25, 35, 28, 12],
          }}
          title="Esfuerzo en vivienda (% de ingresos)"
          colors={["#78e08f", "#f5cd79", "#f78fb3", "#e55039"]}
          roughness={1}
          className={styles.chart}
        />
      </WiredCard>

      {/* ─── SCATTER ─── */}
      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h2">Scatter Plot</Typography>
        <WiredDivider />
        <RoughScatter
          data={{
            x: [45, 62, 78, 95, 110, 55, 70, 88, 130, 150],
            y: [680, 820, 950, 1100, 1350, 720, 890, 1020, 1600, 1900],
          }}
          title="Superficie vs Precio (alquiler)"
          xLabel="m²"
          yLabel="EUR/mes"
          colors={["#3dc1d3"]}
          roughness={2}
          radius={12}
          interactive={false}
          className={styles.chart}
        />
      </WiredCard>

      {/* ─── STACKED BAR ─── */}
      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h2">Stacked Bar Chart</Typography>
        <WiredDivider />
        <RoughStackedBar
          data={[
            { city: "Madrid", Alquiler: 45, Propiedad: 35, Otros: 20 },
            { city: "Barcelona", Alquiler: 38, Propiedad: 40, Otros: 22 },
            { city: "Valencia", Alquiler: 52, Propiedad: 32, Otros: 16 },
            { city: "Sevilla", Alquiler: 60, Propiedad: 28, Otros: 12 },
          ]}
          title="Distribución de tenencia por ciudad (%)"
          labels="city"
          roughness={2}
          padding={0.3}
          className={styles.chart}
        />
      </WiredCard>

      {/* ─── MAP ─── */}
      <WiredCard elevation={2} className={styles.section}>
        <Typography as="h2">Choropleth Map</Typography>
        <WiredDivider />
        <RoughMap
          data={spainGeo}
          width={700}
          height={500}
          fill={(f) => {
            const name = (f.properties as Record<string, unknown>)?.name as string;
            return ccaaColors[name] ?? "rgba(0,0,0,0.08)";
          }}
          stroke="#333"
          strokeWidth={0.8}
          roughness={1.5}
          fillStyle="hachure"
          hachureGap={4}
          fillWeight={0.6}
        />
      </WiredCard>
    </div>
  );
}
