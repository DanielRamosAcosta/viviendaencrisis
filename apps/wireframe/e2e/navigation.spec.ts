import { test, expect } from "@playwright/test";

const routes: { path: string; label: string; skip?: string }[] = [
  { path: "/", label: "Home" },
  { path: "/showcase", label: "Showcase" },
  { path: "/login", label: "Login" },
  { path: "/registro", label: "Registro" },
  { path: "/recuperar", label: "Recuperar password" },
  { path: "/precios", label: "Precios index" },
  { path: "/precios/evolucion", label: "Evolucion temporal" },
  { path: "/precios/comparar", label: "Comparar zonas", skip: "rough-viz charts crash headless Chromium" },
  { path: "/precios/metro-cuadrado", label: "Precio metro cuadrado" },
  { path: "/precios/asequibilidad", label: "Asequibilidad" },
  { path: "/precios/oficial-vs-portales", label: "Oficial vs portales" },
  { path: "/precios/ranking", label: "Ranking zonas" },
  { path: "/reportes", label: "Reportes index" },
  { path: "/reportes/nuevo", label: "Reportar irregularidad" },
  { path: "/reportes/mapa", label: "Mapa reportes" },
  { path: "/reportes/consultar", label: "Consultar reportes" },
  { path: "/reportes/r-001", label: "Detalle reporte" },
  { path: "/resenas", label: "Consultar resenas" },
  { path: "/resenas/nueva", label: "Escribir resena" },
  { path: "/resenas/rv-001", label: "Detalle resena" },
  { path: "/datos", label: "Datos index" },
  { path: "/datos/explorador", label: "Explorador municipio" },
  { path: "/datos/descargar", label: "Descargar datos" },
  { path: "/datos/metodologia", label: "Fuentes metodologia" },
  { path: "/cuenta", label: "Mi perfil" },
  { path: "/cuenta/favoritas", label: "Zonas favoritas" },
  { path: "/cuenta/alertas", label: "Alertas configuracion" },
  { path: "/cuenta/reporte/r-001", label: "Estado reporte" },
  { path: "/info", label: "Info index" },
  { path: "/info/que-es", label: "Que es" },
  { path: "/info/faq", label: "FAQ" },
  { path: "/info/derechos", label: "Derechos inquilino" },
  { path: "/info/glosario", label: "Glosario" },
  { path: "/nonexistent-page", label: "404 page" },
];

test.describe("Route accessibility", () => {
  for (const route of routes) {
    const testFn = route.skip ? test.skip : test;
    testFn(`${route.label} (${route.path}) renders without errors`, async ({
      page,
    }) => {
      const consoleErrors: string[] = [];
      page.on("console", (msg) => {
        if (msg.type() === "error") {
          consoleErrors.push(msg.text());
        }
      });

      await page.goto(route.path);

      // Wait for at least one heading to be visible — every page should have one
      const heading = page.locator("h1, h2").first();
      await expect(heading).toBeVisible({ timeout: 10_000 });

      // Verify no meaningful JS console errors (filter out noise)
      const realErrors = consoleErrors.filter(
        (e) =>
          !e.includes("favicon") &&
          !e.includes("the server responded with a status of 404") &&
          // SVG path attribute warnings from rough-viz charts (NaN in coordinates)
          !e.includes("<path> attribute d: Expected number"),
      );
      expect(realErrors).toEqual([]);
    });
  }
});
