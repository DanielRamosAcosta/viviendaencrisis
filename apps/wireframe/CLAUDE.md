# Wireframe App

SPA de prototipado rápido con estilo hand-drawn. No conecta con backends ni envía datos — solo navegación y funcionalidad mínima (modales, redirecciones, estado local básico).

## Stack

- React 19 + TypeScript + Vite
- react-router v7 (client-side routing)
- wired-elements 3.0.0-rc.6 (web components con estilo sketchy)
- rough-viz (charts hand-drawn)
- roughjs + d3-geo (mapas coropléticos)
- CSS Modules para layout

## Estructura

```
src/
├── App.tsx                    # Router (BrowserRouter + Routes)
├── pages/                     # Una página por ruta
│   ├── Home.tsx
│   └── Showcase.tsx           # Demo de todos los componentes (/showcase)
├── components/
│   ├── Typography.tsx         # Texto con fuente Gloria Hallelujah (prop `as`)
│   ├── WiredElements/         # React wrappers de wired-elements
│   └── RoughViz/              # React wrappers de rough-viz + RoughMap
└── utils/
    └── placeholder.ts         # Helper para imágenes placeholder
```

## Routing

Definido en `App.tsx` con react-router:

```tsx
<BrowserRouter>
  <Routes>
    <Route path="/" element={<Home />} />
    <Route path="/showcase" element={<Showcase />} />
  </Routes>
</BrowserRouter>
```

Las páginas van en `src/pages/`. Cada página es un componente exportado con nombre.

## Convenciones

### Imágenes

Toda imagen debe usar el helper `urlOfImageOfSize`:

```tsx
import { urlOfImageOfSize } from "../utils/placeholder";

<WiredImage src={urlOfImageOfSize(600, 400)} style={{ width: 300, height: 150 }} />
```

Nunca hardcodear URLs de imagen. Siempre usar este helper que apunta a placeholdit.com.

### Texto

Usar `Typography` para todo texto visible. Acepta prop `as` para el tag HTML:

```tsx
<Typography as="h1">Título</Typography>
<Typography as="p">Párrafo</Typography>
<Typography as="span">Inline</Typography>
```

### Layout

CSS Modules por página. Las clases de layout habituales:

- `.container` — wrapper de página (flex column, max-width, centrado)
- `.section` — sección dentro de una WiredCard (flex column, gap, padding)
- `.row` — fila horizontal (flex wrap, align-items center)
- `.col` — columna vertical (flex column)

### Páginas nuevas

1. Crear `src/pages/NombrePagina.tsx`
2. Crear `src/pages/NombrePagina.module.css` si necesita layout propio
3. Añadir `<Route>` en `App.tsx`

## Componentes disponibles

### WiredElements (from `../components/WiredElements`)

UI components con estilo sketchy. Son wrappers React de web components.

```tsx
// Botones
<WiredButton onClick={fn}>Label</WiredButton>
<WiredButton elevation={3}>Elevated</WiredButton>
<WiredButton disabled>Disabled</WiredButton>
<WiredFab onClick={fn} />

// Inputs
<WiredInput placeholder="..." value={v} onChange={fn} />
<WiredInput type="password" placeholder="..." />
<WiredSearch placeholder="Search..." onChange={fn} />
<WiredTextarea placeholder="..." rows={3} />

// Selection
<WiredCheckbox checked={bool} onChange={fn} />
<WiredToggle checked={bool} onChange={fn} />
<WiredRadio name="group" text="Option A" />

// Combo/Listbox (usan <wired-item> como hijos directos)
<WiredCombo selected="value" onSelected={fn}>
  <wired-item value="a">Option A</wired-item>
</WiredCombo>
<WiredListbox selected="value" style={{ height: 120 }}>
  <wired-item value="a">Option A</wired-item>
</WiredListbox>

// Slider & Progress
<WiredSlider value={50} min={0} max={100} onChange={fn} />
<WiredProgress value={65} max={100} percentage />

// Tabs (usa <wired-tab> como hijos directos)
<WiredTabs selected="tab1" onSelected={fn}>
  <wired-tab name="tab1">Tab 1</wired-tab>
  <wired-tab name="tab2">Tab 2</wired-tab>
</WiredTabs>

// Otros
<WiredSpinner spinning duration={1000} />
<WiredCalendar locale="es-ES" onSelected={fn} />
<WiredDialog open={bool}>...contenido...</WiredDialog>
<WiredCard elevation={2}>...contenido...</WiredCard>
<WiredDivider />
<WiredImage src={urlOfImageOfSize(w, h)} elevation={2} />
<WiredLink href="..." target="_blank" elevation={2}>Link text</WiredLink>
```

### RoughViz Charts (from `../components/RoughViz`)

Charts hand-drawn. Requieren `style={{ width: "100%", height: 350 }}` para dimensionarse.

```tsx
// Bar / BarH
<RoughBar
  data={{ labels: ["A", "B"], values: [10, 20] }}
  title="Title" color="skyblue" roughness={2}
  style={{ width: "100%", height: 350 }}
/>

// Donut / Pie
<RoughDonut
  data={{ labels: ["A", "B"], values: [60, 40] }}
  colors={["#f78fb3", "#3dc1d3"]}
  style={{ width: "100%", height: 350 }}
/>

// Line
<RoughLine
  data={{ x: ["2020", "2021", "2022"], y: [100, 200, 150] }}
  xLabel="Year" yLabel="Value" colors={["#f78fb3"]}
  style={{ width: "100%", height: 350 }}
/>

// Scatter
<RoughScatter
  data={{ x: [1, 2, 3], y: [10, 20, 15] }}
  interactive={false}
  style={{ width: "100%", height: 350 }}
/>

// StackedBar (array of objects, first key = label)
<RoughStackedBar
  data={[
    { city: "Madrid", Rent: 45, Own: 35, Other: 20 },
    { city: "BCN", Rent: 38, Own: 40, Other: 22 },
  ]}
  labels="city"
  style={{ width: "100%", height: 350 }}
/>
```

### RoughMap (from `../components/RoughViz`)

Mapa coroplético hand-drawn. Usa d3-geo + roughjs.

```tsx
import { feature } from "topojson-client";
import spainTopo from "es-atlas/es/autonomous_regions.json";

const geo = feature(topo, topo.objects.autonomous_regions) as FeatureCollection;

<RoughMap
  data={geo}
  width={700}
  height={500}
  fill={(f) => colorByName[f.properties?.name] ?? "#eee"}
  stroke="#333"
  roughness={1.5}
  fillStyle="hachure"
  hachureGap={4}
/>
```

Props: `data` (FeatureCollection), `width`, `height`, `projection` (factory fn), `fitSize`, `fill` (string | fn), `stroke`, `strokeWidth`, `roughness`, `fillStyle`, `fillWeight`, `hachureGap`, `bowing`, `children` (SVG overlay).

## Gotchas

- Los charts de rough-viz necesitan `style={{ width, height }}` explícito — sin dimensiones no renderizan
- `WiredCombo`/`WiredListbox` usan `<wired-item>` y `WiredTabs` usa `<wired-tab>` como hijos directos (JSX types declarados en el index)
- `wired-calendar` no está en el barrel export de wired-elements — se importa aparte via `wired-elements/lib/wired-calendar.js`
- roughjs está pineado a 4.3.1 para wired-elements (override en root `package.json`) porque 4.4+ renombró `fillPolygon` → `fillPolygons`
- `RoughScatter` con datos objeto: usar `interactive={false}` para evitar error con `highlightLabel`
