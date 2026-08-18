// this file is specifically for creating reusable authenticated state.
import { test as setup, expect } from "@playwright/test";

const authFile = "playwright/.auth/user.json";

setup("Authenticate", async ({ page }) => {
  const testEmail = process.env.PLAYWRIGHT_TEST_EMAIL;
  const testPassword = process.env.PLAYWRIGHT_TEST_PASSWORD;

  if (!testEmail || !testPassword) {
    throw new Error("Invalid credential");
  }

  await page.goto("/login");

  await page.getByLabel("Email").fill(testEmail);
  await page.getByLabel("Password").fill(testPassword);

  await page.getByRole("button", { name: "Login" }).click();

  await expect(page).toHaveURL(/dashboard/);

  // "After login succeeds, save the browser's authentication state to this file."
  await page.context().storageState({
    path: authFile,
  });
});
