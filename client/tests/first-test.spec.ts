import { test, expect } from "@playwright/test";

// page is a browser tab that Playwright controls.
test("Playwright can open webpage", async ({ page }) => {
  await page.goto("https://playwright.dev/");

  await expect(page).toHaveTitle(/Playwright/);
});
