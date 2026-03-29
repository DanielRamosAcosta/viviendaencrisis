/* ─── PRECIOS Y COMPARATIVAS ─── */

export const priceEvolution = {
  x: [
    "2019-Q1",
    "2019-Q3",
    "2020-Q1",
    "2020-Q3",
    "2021-Q1",
    "2021-Q3",
    "2022-Q1",
    "2022-Q3",
    "2023-Q1",
    "2023-Q3",
    "2024-Q1",
    "2024-Q3",
  ],
  y: [820, 835, 790, 780, 810, 840, 920, 960, 1050, 1100, 1180, 1220],
};

export const priceEvolutionBuy = {
  x: [
    "2019-Q1",
    "2019-Q3",
    "2020-Q1",
    "2020-Q3",
    "2021-Q1",
    "2021-Q3",
    "2022-Q1",
    "2022-Q3",
    "2023-Q1",
    "2023-Q3",
    "2024-Q1",
    "2024-Q3",
  ],
  y: [1850, 1870, 1810, 1800, 1830, 1890, 1960, 2020, 2100, 2180, 2260, 2340],
};

export const cityPrices = {
  labels: ["Madrid", "Barcelona", "Valencia", "Sevilla", "Bilbao", "Málaga", "Zaragoza", "Palma"],
  values: [1250, 1180, 750, 620, 890, 920, 580, 1050],
};

export const cityPricesM2 = {
  labels: ["Barcelona", "Madrid", "Palma", "Bilbao", "Málaga", "Valencia", "Sevilla", "Zaragoza"],
  values: [18.5, 17.2, 15.8, 13.2, 12.5, 10.3, 8.9, 7.8],
};

export const affordabilityEffort = {
  labels: ["< 30%", "30-50%", "50-70%", "> 70%"],
  values: [25, 35, 28, 12],
};

export const affordabilityByCity = {
  labels: ["Madrid", "Barcelona", "Palma", "Málaga", "Valencia", "Sevilla"],
  values: [42, 45, 48, 38, 32, 28],
};

export const officialVsPortals = [
  { city: "Madrid", Oficial: 1100, Portales: 1350 },
  { city: "Barcelona", Oficial: 1050, Portales: 1280 },
  { city: "Valencia", Oficial: 680, Portales: 820 },
  { city: "Sevilla", Oficial: 570, Portales: 690 },
  { city: "Bilbao", Oficial: 820, Portales: 950 },
  { city: "Málaga", Oficial: 850, Portales: 1010 },
];

export const tenureDistribution = [
  { city: "Madrid", Alquiler: 45, Propiedad: 35, Otros: 20 },
  { city: "Barcelona", Alquiler: 38, Propiedad: 40, Otros: 22 },
  { city: "Valencia", Alquiler: 52, Propiedad: 32, Otros: 16 },
  { city: "Sevilla", Alquiler: 60, Propiedad: 28, Otros: 12 },
];

export const rankingZonas = [
  { name: "Barcelona", priceM2: 18.5, avgRent: 1180, trend: "+8.2%" },
  { name: "Madrid", priceM2: 17.2, avgRent: 1250, trend: "+7.5%" },
  { name: "Palma de Mallorca", priceM2: 15.8, avgRent: 1050, trend: "+12.1%" },
  { name: "Bilbao", priceM2: 13.2, avgRent: 890, trend: "+5.3%" },
  { name: "Málaga", priceM2: 12.5, avgRent: 920, trend: "+10.8%" },
  { name: "Valencia", priceM2: 10.3, avgRent: 750, trend: "+6.7%" },
  { name: "Sevilla", priceM2: 8.9, avgRent: 620, trend: "+4.2%" },
  { name: "Zaragoza", priceM2: 7.8, avgRent: 580, trend: "+3.1%" },
];

export const zones = [
  "Madrid",
  "Barcelona",
  "Valencia",
  "Sevilla",
  "Bilbao",
  "Málaga",
  "Zaragoza",
  "Palma de Mallorca",
  "Las Palmas",
  "Santa Cruz de Tenerife",
  "Murcia",
  "Alicante",
];

/* ─── CCAA COLORS FOR MAPS ─── */

export const ccaaColors: Record<string, string> = {
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

/* ─── REPORTES ─── */

export const irregularityTypes = [
  "Precio abusivo",
  "Cláusula abusiva en contrato",
  "Fianza irregular",
  "Condiciones de habitabilidad",
  "Discriminación",
  "Desahucio irregular",
  "Otro",
];

export const reports = [
  {
    id: "r-001",
    type: "Precio abusivo",
    zone: "Madrid Centro",
    address: "Calle Gran Vía 42",
    date: "2024-11-15",
    status: "approved" as const,
    description:
      "Alquiler de estudio de 25m² por 1.200 EUR/mes, muy por encima del índice de referencia de la zona.",
  },
  {
    id: "r-002",
    type: "Fianza irregular",
    zone: "Barcelona Eixample",
    address: "Carrer de Mallorca 215",
    date: "2024-11-20",
    status: "pending" as const,
    description:
      "El propietario exige 4 meses de fianza cuando legalmente el máximo es 2 meses para vivienda.",
  },
  {
    id: "r-003",
    type: "Condiciones de habitabilidad",
    zone: "Valencia Ciutat Vella",
    address: "Carrer de la Pau 8",
    date: "2024-12-01",
    status: "rejected" as const,
    description: "Vivienda sin calefacción ni agua caliente funcional desde hace 3 meses.",
  },
  {
    id: "r-004",
    type: "Cláusula abusiva en contrato",
    zone: "Sevilla Triana",
    address: "Calle Betis 33",
    date: "2024-12-10",
    status: "approved" as const,
    description: "Contrato incluye cláusula que prohíbe empadronamiento del inquilino.",
  },
  {
    id: "r-005",
    type: "Discriminación",
    zone: "Bilbao Abando",
    address: "Alameda Recalde 18",
    date: "2025-01-05",
    status: "pending" as const,
    description: "Rechazo de candidatura como inquilino por nacionalidad extranjera.",
  },
  {
    id: "r-006",
    type: "Precio abusivo",
    zone: "Málaga Centro",
    address: "Calle Larios 12",
    date: "2025-01-15",
    status: "in_review" as const,
    description: "Piso de 2 habitaciones a 1.800 EUR/mes en zona donde el índice marca 900 EUR.",
  },
];

/* ─── RESEÑAS ─── */

export const agents = [
  {
    id: "a-001",
    name: "Inmobiliaria López & Asociados",
    zone: "Madrid",
    rating: 3.8,
    reviewCount: 24,
  },
  { id: "a-002", name: "Fincas Martínez", zone: "Barcelona", rating: 2.1, reviewCount: 42 },
  {
    id: "a-003",
    name: "Gestión Inmobiliaria Valencia",
    zone: "Valencia",
    rating: 4.2,
    reviewCount: 15,
  },
  { id: "a-004", name: "Pisos del Sur SL", zone: "Sevilla", rating: 1.5, reviewCount: 31 },
  { id: "a-005", name: "Alquiler Fácil Bilbao", zone: "Bilbao", rating: 4.5, reviewCount: 8 },
];

export const reviews = [
  {
    id: "rv-001",
    agentId: "a-001",
    author: "Anónimo",
    rating: 4,
    title: "Correctos pero lentos",
    comment:
      "El proceso de alquiler fue transparente pero tardaron semanas en gestionar la documentación. Al final todo salió bien.",
    date: "2024-10-15",
    helpful: 12,
    notHelpful: 3,
  },
  {
    id: "rv-002",
    agentId: "a-002",
    author: "Anónimo",
    rating: 1,
    title: "Pésima experiencia",
    comment:
      "Intentaron cobrar comisión ilegal al inquilino. Cuando pregunté por la legalidad, se pusieron agresivos. No recomiendo.",
    date: "2024-11-20",
    helpful: 38,
    notHelpful: 2,
  },
  {
    id: "rv-003",
    agentId: "a-003",
    author: "Anónimo",
    rating: 5,
    title: "Muy profesionales",
    comment:
      "Excelente trato, transparentes con todas las condiciones. El contrato era claro y cumplieron con todo lo pactado.",
    date: "2024-12-05",
    helpful: 7,
    notHelpful: 1,
  },
  {
    id: "rv-004",
    agentId: "a-004",
    author: "Anónimo",
    rating: 1,
    title: "Estafa encubierta",
    comment:
      "Fianza retenida sin justificación. Vivienda en peores condiciones de las anunciadas. Cero profesionalidad.",
    date: "2025-01-10",
    helpful: 25,
    notHelpful: 0,
  },
  {
    id: "rv-005",
    agentId: "a-001",
    author: "Anónimo",
    rating: 3,
    title: "Normal",
    comment:
      "Experiencia estándar. Nada destacable ni especialmente negativo. El piso estaba en condiciones aceptables.",
    date: "2025-01-22",
    helpful: 5,
    notHelpful: 4,
  },
];

/* ─── DATOS ABIERTOS ─── */

export const dataSources = [
  {
    name: "Ministerio de Vivienda y Agenda Urbana (MIVAU)",
    description: "Índices de precios de alquiler y compraventa por trimestre y municipio.",
    url: "https://www.mivau.gob.es",
    updated: "2024-Q3",
  },
  {
    name: "Instituto Nacional de Estadística (INE)",
    description: "Censo de vivienda, indicadores demográficos y estadísticas de hogares.",
    url: "https://www.ine.es",
    updated: "2024",
  },
  {
    name: "Dirección General del Catastro",
    description: "Datos abiertos de uso, superficie y antigüedad de inmuebles.",
    url: "https://www.catastro.meh.es",
    updated: "2024",
  },
];

export const municipalData = [
  {
    municipality: "Madrid",
    population: 3400000,
    avgRent: 1250,
    avgBuy: 4200,
    surface: 604,
    density: 5630,
  },
  {
    municipality: "Barcelona",
    population: 1660000,
    avgRent: 1180,
    avgBuy: 4100,
    surface: 101,
    density: 16435,
  },
  {
    municipality: "Valencia",
    population: 800000,
    avgRent: 750,
    avgBuy: 2200,
    surface: 134,
    density: 5970,
  },
  {
    municipality: "Sevilla",
    population: 690000,
    avgRent: 620,
    avgBuy: 1800,
    surface: 140,
    density: 4929,
  },
  {
    municipality: "Bilbao",
    population: 350000,
    avgRent: 890,
    avgBuy: 3200,
    surface: 41,
    density: 8537,
  },
];

/* ─── MI CUENTA ─── */

export const userFavoriteZones = [
  { zone: "Madrid Centro", addedDate: "2024-09-15" },
  { zone: "Barcelona Eixample", addedDate: "2024-10-22" },
  { zone: "Valencia Ciutat Vella", addedDate: "2024-11-30" },
];

export const userAlerts = [
  {
    id: "al-001",
    zone: "Madrid Centro",
    type: "alquiler" as const,
    threshold: 5,
    frequency: "semanal" as const,
    active: true,
  },
  {
    id: "al-002",
    zone: "Barcelona Eixample",
    type: "compraventa" as const,
    threshold: 10,
    frequency: "mensual" as const,
    active: false,
  },
];

/* ─── RECENT REPORTS (for Home page) ─── */

export const recentReports = [
  {
    type: "Precio abusivo",
    zone: "Madrid Centro",
    date: "2025-01-15",
    description: "Piso de 2 habitaciones a 1.800 EUR/mes en zona donde el indice marca 900 EUR.",
  },
  {
    type: "Fianza irregular",
    zone: "Barcelona Eixample",
    date: "2025-01-10",
    description: "Propietario exige 4 meses de fianza cuando el maximo legal es 2.",
  },
  {
    type: "Discriminacion",
    zone: "Bilbao Abando",
    date: "2025-01-05",
    description: "Rechazo de candidatura como inquilino por nacionalidad extranjera.",
  },
];

/* ─── INFORMACIÓN Y AYUDA ─── */

export const faqItems = [
  {
    question: "¿Qué es Vivienda en Crisis?",
    answer:
      "Es una plataforma web de datos abiertos que permite visualizar información sobre precios de alquiler y compraventa en España, con el objetivo de fomentar la transparencia en el mercado de la vivienda.",
  },
  {
    question: "¿Necesito registrarme para consultar datos?",
    answer:
      "No. Todas las visualizaciones, mapas y datos están disponibles sin registro. Solo necesitas una cuenta para crear reportes de irregularidades o escribir reseñas de agentes inmobiliarios.",
  },
  {
    question: "¿De dónde provienen los datos?",
    answer:
      "Los datos proceden de fuentes oficiales: Ministerio de Vivienda y Agenda Urbana (MIVAU), Instituto Nacional de Estadística (INE) y Dirección General del Catastro. Complementariamente se realizan sondeos de portales inmobiliarios.",
  },
  {
    question: "¿Mis reportes son anónimos?",
    answer:
      "Sí. Tu identidad nunca será visible para terceros. Los reportes se publican de forma anónima y los datos se tratan conforme al RGPD.",
  },
  {
    question: "¿Qué pasa después de enviar un reporte?",
    answer:
      "Tu reporte entra en una cola de moderación. Un administrador lo revisará y puede aprobarlo, rechazarlo o solicitar más información. Recibirás una notificación en cada cambio de estado.",
  },
  {
    question: "¿Puedo descargar los datos?",
    answer:
      "Sí. Desde la sección de Datos abiertos puedes descargar datasets en formato CSV o JSON, filtrados por municipio, periodo y tipo de vivienda.",
  },
  {
    question: "¿Cómo se calculan los indicadores de asequibilidad?",
    answer:
      "Se basan en la relación entre el precio medio de la vivienda y el salario medio de la zona, expresado como porcentaje de renta destinado a vivienda. Consulta la sección de Fuentes y metodología para más detalle.",
  },
];

export const glossaryTerms = [
  {
    term: "Índice de precios",
    definition:
      "Indicador estadístico que mide la variación del precio de la vivienda en un periodo determinado respecto a un periodo base.",
  },
  {
    term: "Mapa coroplético",
    definition:
      "Mapa temático en el que las áreas geográficas se colorean en proporción a una variable estadística (p. ej., precio medio del alquiler).",
  },
  {
    term: "Tasa de esfuerzo",
    definition:
      "Porcentaje de los ingresos del hogar destinado al pago de la vivienda (alquiler o hipoteca).",
  },
  {
    term: "Precio por metro cuadrado",
    definition:
      "Coste de la vivienda dividido entre su superficie útil en metros cuadrados. Permite comparar precios entre viviendas de distinto tamaño.",
  },
  {
    term: "Fianza",
    definition:
      "Depósito monetario que el inquilino entrega al arrendador como garantía. Por ley, el máximo es de 1 mes para vivienda habitual (2 meses en algunos casos).",
  },
  {
    term: "LAU",
    definition:
      "Ley de Arrendamientos Urbanos. Normativa que regula los contratos de alquiler de vivienda en España.",
  },
  {
    term: "MIVAU",
    definition:
      "Ministerio de Vivienda y Agenda Urbana. Organismo del Gobierno de España responsable de las políticas de vivienda.",
  },
  {
    term: "INE",
    definition:
      "Instituto Nacional de Estadística. Organismo autónomo encargado de la producción de estadísticas oficiales en España.",
  },
];

export const tenantRights = [
  {
    title: "Duración mínima del contrato",
    description:
      "Los contratos de alquiler de vivienda habitual tienen una duración mínima de 5 años (7 si el arrendador es persona jurídica), con prórroga obligatoria anual.",
  },
  {
    title: "Límite de fianza",
    description:
      "La fianza legal máxima es de 1 mensualidad de renta para vivienda. Las garantías adicionales no pueden superar las 2 mensualidades.",
  },
  {
    title: "Derecho al empadronamiento",
    description:
      "Todo inquilino tiene derecho a empadronarse en la vivienda arrendada. Cualquier cláusula contractual que lo prohíba es nula.",
  },
  {
    title: "Reparaciones",
    description:
      "Las reparaciones necesarias para conservar la vivienda en condiciones de habitabilidad son responsabilidad del arrendador.",
  },
  {
    title: "Protección frente a desahucios",
    description:
      "En situaciones de vulnerabilidad, existen mecanismos legales de protección y suspensión de lanzamientos.",
  },
  {
    title: "Actualización de renta",
    description:
      "La renta solo puede actualizarse anualmente conforme al índice de referencia para la actualización anual de los contratos de arrendamiento de vivienda.",
  },
];
