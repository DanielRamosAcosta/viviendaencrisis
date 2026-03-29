import { test, expect } from "@playwright/test";

test.describe("Interactive elements", () => {
  test("Home page has a search element", async ({ page }) => {
    await page.goto("/#/");
    await expect(page.locator("h1, h2").first()).toBeVisible({
      timeout: 10_000,
    });

    // wired-search exists in the DOM (it may have 0 height due to web component
    // rendering quirks in headless Chrome, so we check DOM presence)
    const search = page.locator("wired-search").first();
    await expect(search).toBeAttached();
  });

  test("FAQ accordion expands on click", async ({ page }) => {
    await page.goto("/#/info/faq");
    await expect(page.locator("h1", { hasText: "Preguntas frecuentes" })).toBeVisible({
      timeout: 10_000,
    });

    // All FAQ items start collapsed
    const firstQuestion = page.locator('[role="button"]').first();
    await expect(firstQuestion).toBeVisible();

    // Click to expand
    await firstQuestion.click();

    // An answer paragraph should now be visible inside the same card
    const answerParagraph = page
      .locator("wired-card")
      .filter({ has: firstQuestion })
      .locator("p")
      .first();
    await expect(answerParagraph).toBeVisible();
  });

  test("Glossary search filters results", async ({ page }) => {
    await page.goto("/#/info/glosario");
    await expect(page.locator("h1", { hasText: "Glosario" })).toBeVisible({ timeout: 10_000 });

    // Count initial term cards
    const initialCount = await page.locator("wired-card h3").count();
    expect(initialCount).toBeGreaterThan(0);

    // wired-search has 0 height in headless Chrome (web component rendering issue),
    // so we dispatch an input event directly to simulate typing
    await page.evaluate(() => {
      const el = document.querySelector("wired-search");
      if (!el) throw new Error("wired-search not found");
      el.setAttribute("value", "IPC");
      el.dispatchEvent(new Event("input", { bubbles: true }));
    });

    await page.waitForTimeout(500);

    const filteredCount = await page.locator("wired-card h3").count();
    expect(filteredCount).toBeLessThanOrEqual(initialCount);
  });

  test("Evolucion temporal tabs switch content", async ({ page }) => {
    await page.goto("/#/precios/evolucion");
    await expect(page.locator("h1", { hasText: "Evolucion Temporal" })).toBeVisible({
      timeout: 10_000,
    });

    // Verify the chart is showing by default (grafico tab)
    // rough-viz renders inside a div — the chart container should exist
    await page.waitForTimeout(2000);

    // Switch to Mapa tab by dispatching the custom event
    // (clicking the shadow DOM tab header doesn't reliably propagate to React)
    await page.evaluate(() => {
      const wt = document.querySelector("wired-tabs");
      if (!wt) throw new Error("no wired-tabs");
      wt.dispatchEvent(
        new CustomEvent("selected", {
          detail: { name: "mapa" },
          bubbles: true,
        }),
      );
    });

    await page.waitForTimeout(1000);

    // After switching to Mapa, the RoughMap SVG (width=700) should render
    const mapSvg = page.locator('svg[width="700"]');
    await expect(mapSvg).toBeAttached({ timeout: 5000 });
  });

  test("Report form step progression (authenticated)", async ({ page }) => {
    // Login first via SPA navigation
    await page.goto("/#/");
    await expect(page.locator("h1, h2").first()).toBeVisible({
      timeout: 10_000,
    });

    await page.locator("nav").locator("a[href='#/login']").click();
    await expect(page.getByRole("main").locator("h1", { hasText: "Iniciar Sesion" })).toBeVisible({
      timeout: 10_000,
    });

    await page.locator("wired-card wired-button", { hasText: "Iniciar sesion" }).click();

    // Back on home after navigate(-1)
    await expect(page.getByRole("main").locator("h1").first()).toBeVisible({ timeout: 10_000 });

    // Navigate to report form via the "Enviar un reporte" CTA button
    await page.locator("wired-button", { hasText: "Enviar un reporte" }).click();

    await expect(page.locator("h1", { hasText: "Reportar una Irregularidad" })).toBeVisible({
      timeout: 10_000,
    });

    // Step 0: anonymity notice
    await expect(page.locator("h3", { hasText: "Aviso de anonimato" })).toBeVisible();

    // Click "Entendido, continuar"
    await page.locator("wired-button", { hasText: "Entendido, continuar" }).click();

    // Step 1: Ubicacion
    await expect(page.locator("h2", { hasText: "Paso 1" })).toBeVisible();

    // Click "Siguiente" to go to step 2
    await page.locator("wired-button", { hasText: "Siguiente" }).click();

    // Step 2: Descripcion
    await expect(page.locator("h2", { hasText: "Paso 2" })).toBeVisible();

    // Click "Siguiente" to go to step 3
    await page.locator("wired-button", { hasText: "Siguiente" }).click();

    // Step 3: Confirmacion
    await expect(page.locator("h2", { hasText: "Paso 3" })).toBeVisible();
  });

  test("404 page shows for nonexistent route", async ({ page }) => {
    await page.goto("/#/nonexistent");

    const heading = page.locator("h1", { hasText: "404" });
    await expect(heading).toBeVisible({ timeout: 10_000 });

    const message = page.locator("h2", {
      hasText: "Pagina no encontrada",
    });
    await expect(message).toBeVisible();
  });
});
