import { test, expect } from "@playwright/test";

test("Authenticate user can access dashboard", async ({ page }) => {
  await page.goto("/dashboard");

  await expect(page).toHaveURL(/dashboard/);
});
