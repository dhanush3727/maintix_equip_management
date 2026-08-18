// this file is specifically for creating reusable authenticated state.
import { test as setup, expect } from "@playwright/test";

// This authFile is used in the playwright.config.ts file to set the storageState for authenticated tests.
const authFile = "playwright/.auth/user.json";

// Setup test to authenticate and save the authentication state
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

  // Save the authenticated state to the authFile
  // This will allow other tests to use this state for authenticated scenarios
  // This will automatically create the .auth directory if it doesn't exist
  await page.context().storageState({
    path: authFile,
  });
});
