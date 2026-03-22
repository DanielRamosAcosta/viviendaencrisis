import { test, expect } from "@playwright/test";

/**
 * Helper: go to home first, then navigate to /login via navbar,
 * and click the form's login button. This preserves SPA state
 * because navigate(-1) returns to home (not about:blank).
 */
async function loginViaSPA(page: import("@playwright/test").Page) {
  await page.goto("/");
  await expect(page.locator("h1, h2").first()).toBeVisible({ timeout: 10_000 });

  // Click navbar "Iniciar sesion" link to go to /login
  await page.locator("nav").locator("a[href='/login']").click();
  await expect(
    page.getByRole("main").locator("h1", { hasText: "Iniciar Sesion" }),
  ).toBeVisible({ timeout: 10_000 });

  // Click the form's login button (inside wired-card)
  await page
    .locator("wired-card wired-button", { hasText: "Iniciar sesion" })
    .click();

  // navigate(-1) takes us back to home — wait for the main hero heading
  await expect(
    page.getByRole("main").locator("h1").first(),
  ).toBeVisible({ timeout: 10_000 });
}

test.describe("Authentication flow", () => {
  test("unauthenticated user sees AuthGate on /cuenta", async ({ page }) => {
    await page.goto("/cuenta");

    await expect(
      page.locator("h2", { hasText: "Acceso restringido" }),
    ).toBeVisible({ timeout: 10_000 });
  });

  test("login shows profile on /cuenta", async ({ page }) => {
    await loginViaSPA(page);

    // Navbar should show "Cerrar sesion"
    await expect(
      page.locator("nav wired-button", { hasText: "Cerrar sesion" }),
    ).toBeVisible();

    // Navigate to /cuenta via nav link (SPA navigation preserves auth state)
    await page.locator('nav a[href="/cuenta"]').click();

    // Should see profile, not AuthGate
    await expect(
      page.getByRole("main").locator("h1", { hasText: "Mi Perfil" }),
    ).toBeVisible({ timeout: 10_000 });
  });

  test("logout returns to unauthenticated state", async ({ page }) => {
    await loginViaSPA(page);

    // Click logout in navbar
    await page
      .locator("nav wired-button", { hasText: "Cerrar sesion" })
      .click();

    // Navbar should now show "Iniciar sesion" again
    await expect(
      page.locator("nav wired-button", { hasText: "Iniciar sesion" }),
    ).toBeVisible();
  });

  test("unauthenticated user sees AuthGate on /reportes/nuevo", async ({
    page,
  }) => {
    await page.goto("/reportes/nuevo");

    await expect(
      page.locator("h2", { hasText: "Acceso restringido" }),
    ).toBeVisible({ timeout: 10_000 });
  });
});
