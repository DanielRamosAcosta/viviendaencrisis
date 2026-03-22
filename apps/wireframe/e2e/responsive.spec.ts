import { test, expect } from "@playwright/test";

const viewports = [
  { name: "mobile", width: 375, height: 667 },
  { name: "tablet", width: 768, height: 1024 },
  { name: "desktop", width: 1280, height: 800 },
] as const;

const pages = [
  { path: "/", label: "Home" },
  { path: "/precios/evolucion", label: "Evolucion temporal" },
  { path: "/reportes/consultar", label: "Consultar reportes" },
  { path: "/cuenta", label: "Mi cuenta" },
];

test.describe("Responsive design", () => {
  for (const vp of viewports) {
    test.describe(`${vp.name} (${vp.width}x${vp.height})`, () => {
      test.use({ viewport: { width: vp.width, height: vp.height } });

      for (const pg of pages) {
        test(`${pg.label} renders correctly`, async ({ page }) => {
          await page.goto(pg.path);

          // Wait for the page to load
          const heading = page.locator("h1, h2").first();
          await expect(heading).toBeVisible({ timeout: 10_000 });

          // Check no horizontal overflow — body should not be wider than viewport
          const bodyWidth = await page.evaluate(
            () => document.body.scrollWidth,
          );
          expect(bodyWidth).toBeLessThanOrEqual(vp.width + 20); // small tolerance
        });
      }

      if (vp.name === "mobile") {
        test("hamburger button is visible on mobile", async ({ page }) => {
          await page.goto("/");
          await expect(page.locator("h1, h2").first()).toBeVisible({
            timeout: 10_000,
          });

          // The hamburger is a wired-fab inside a div.hamburger
          const hamburger = page.locator("wired-fab").first();
          await expect(hamburger).toBeVisible();
        });
      }

      if (vp.name === "desktop") {
        test("nav links are visible on desktop", async ({ page }) => {
          await page.goto("/");
          await expect(page.locator("h1, h2").first()).toBeVisible({
            timeout: 10_000,
          });

          // Nav links should be visible (not hidden behind hamburger)
          const preciosLink = page.locator('nav a[href="/precios"]');
          await expect(preciosLink).toBeVisible();
        });
      }
    });
  }
});
