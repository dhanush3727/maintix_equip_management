import test, { expect } from "@playwright/test";

test("Dashboard displays", async ({ page }) => {
  await page.goto("/dashboard");

  await expect(page.getByRole("heading", { name: /welcome/i })).toBeVisible();
});
