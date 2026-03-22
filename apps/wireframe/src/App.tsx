import { BrowserRouter, Routes, Route } from "react-router";
import { AuthProvider } from "./context/AuthContext";
import { PageLayout } from "./components/Layout";

/* ─── Pages ─── */
import { Home } from "./pages/Home";
import { Showcase } from "./pages/Showcase";
import { NotFound } from "./pages/NotFound";

/* Auth */
import { Login } from "./pages/auth/Login";
import { Registro } from "./pages/auth/Registro";
import { RecuperarPassword } from "./pages/auth/RecuperarPassword";

/* Precios */
import { PreciosIndex } from "./pages/precios/PreciosIndex";
import { EvolucionTemporal } from "./pages/precios/EvolucionTemporal";
import { CompararZonas } from "./pages/precios/CompararZonas";
import { PrecioMetroCuadrado } from "./pages/precios/PrecioMetroCuadrado";
import { Asequibilidad } from "./pages/precios/Asequibilidad";
import { OficialVsPortales } from "./pages/precios/OficialVsPortales";
import { RankingZonas } from "./pages/precios/RankingZonas";

/* Reportes */
import { ReportesIndex } from "./pages/reportes/ReportesIndex";
import { ReportarIrregularidad } from "./pages/reportes/ReportarIrregularidad";
import { MapaReportes } from "./pages/reportes/MapaReportes";
import { ConsultarReportes } from "./pages/reportes/ConsultarReportes";
import { DetalleReporte } from "./pages/reportes/DetalleReporte";

/* Resenas */
import { ConsultarResenas } from "./pages/resenas/ConsultarResenas";
import { EscribirResena } from "./pages/resenas/EscribirResena";
import { DetalleResena } from "./pages/resenas/DetalleResena";

/* Datos */
import { DatosIndex } from "./pages/datos/DatosIndex";
import { ExploradorMunicipio } from "./pages/datos/ExploradorMunicipio";
import { DescargarDatos } from "./pages/datos/DescargarDatos";
import { FuentesMetodologia } from "./pages/datos/FuentesMetodologia";

/* Cuenta */
import { MiPerfil } from "./pages/cuenta/MiPerfil";
import { ZonasFavoritas } from "./pages/cuenta/ZonasFavoritas";
import { AlertasConfiguracion } from "./pages/cuenta/AlertasConfiguracion";
import { EstadoReporte } from "./pages/cuenta/EstadoReporte";

/* Info */
import { InfoIndex } from "./pages/info/InfoIndex";
import { QueEsViviendaEnCrisis } from "./pages/info/QueEsViviendaEnCrisis";
import { PreguntasFrecuentes } from "./pages/info/PreguntasFrecuentes";
import { DerechosInquilino } from "./pages/info/DerechosInquilino";
import { Glosario } from "./pages/info/Glosario";

export function App() {
  return (
    <AuthProvider>
      <BrowserRouter>
        <PageLayout>
          <Routes>
            {/* Home */}
            <Route path="/" element={<Home />} />
            <Route path="/showcase" element={<Showcase />} />

            {/* Auth */}
            <Route path="/login" element={<Login />} />
            <Route path="/registro" element={<Registro />} />
            <Route path="/recuperar" element={<RecuperarPassword />} />

            {/* Precios y comparativas */}
            <Route path="/precios" element={<PreciosIndex />} />
            <Route path="/precios/evolucion" element={<EvolucionTemporal />} />
            <Route path="/precios/comparar" element={<CompararZonas />} />
            <Route path="/precios/metro-cuadrado" element={<PrecioMetroCuadrado />} />
            <Route path="/precios/asequibilidad" element={<Asequibilidad />} />
            <Route path="/precios/oficial-vs-portales" element={<OficialVsPortales />} />
            <Route path="/precios/ranking" element={<RankingZonas />} />

            {/* Reportes y resenas */}
            <Route path="/reportes" element={<ReportesIndex />} />
            <Route path="/reportes/nuevo" element={<ReportarIrregularidad />} />
            <Route path="/reportes/mapa" element={<MapaReportes />} />
            <Route path="/reportes/consultar" element={<ConsultarReportes />} />
            <Route path="/reportes/:id" element={<DetalleReporte />} />

            {/* Resenas */}
            <Route path="/resenas" element={<ConsultarResenas />} />
            <Route path="/resenas/nueva" element={<EscribirResena />} />
            <Route path="/resenas/:id" element={<DetalleResena />} />

            {/* Datos abiertos */}
            <Route path="/datos" element={<DatosIndex />} />
            <Route path="/datos/explorador" element={<ExploradorMunicipio />} />
            <Route path="/datos/descargar" element={<DescargarDatos />} />
            <Route path="/datos/metodologia" element={<FuentesMetodologia />} />

            {/* Mi cuenta */}
            <Route path="/cuenta" element={<MiPerfil />} />
            <Route path="/cuenta/favoritas" element={<ZonasFavoritas />} />
            <Route path="/cuenta/alertas" element={<AlertasConfiguracion />} />
            <Route path="/cuenta/reporte/:id" element={<EstadoReporte />} />

            {/* Informacion y ayuda */}
            <Route path="/info" element={<InfoIndex />} />
            <Route path="/info/que-es" element={<QueEsViviendaEnCrisis />} />
            <Route path="/info/faq" element={<PreguntasFrecuentes />} />
            <Route path="/info/derechos" element={<DerechosInquilino />} />
            <Route path="/info/glosario" element={<Glosario />} />

            {/* 404 */}
            <Route path="*" element={<NotFound />} />
          </Routes>
        </PageLayout>
      </BrowserRouter>
    </AuthProvider>
  );
}
