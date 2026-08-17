import { test, expect } from "@playwright/test";

test("Login page display the required fields", async ({ page }) => {
  await page.goto("/login");

  await expect(page.getByRole("heading", { name: "Login" })).toBeVisible();

  await expect(page.getByLabel("Email")).toBeVisible();

  await expect(page.getByLabel("Password")).toBeVisible();

  await expect(page.getByRole("button", { name: "Login" })).toBeVisible();
});

test("Validate login fields", async ({ page }) => {
  await page.goto("/login");

  await page.getByRole("button", { name: "Login" }).click();

  await expect(
    page.getByText("Please enter a valid email address"),
  ).toBeVisible();

  await expect(
    page.getByText("Password must contain 8 characters"),
  ).toBeVisible();
});

test("Fill the login form", async ({ page }) => {
  await page.goto("/login");

  const emailInput = page.getByLabel("Email");
  const passwordInput = page.getByLabel("Password");

  await emailInput.fill(process.env.PLAYWRIGHT_TEST_EMAIL!);
  await passwordInput.fill(process.env.PLAYWRIGHT_TEST_PASSWORD!);

  await expect(emailInput).toHaveValue(process.env.PLAYWRIGHT_TEST_EMAIL!);
  await expect(passwordInput).toHaveValue(
    process.env.PLAYWRIGHT_TEST_PASSWORD!,
  );
});

test("User can login successfully", async ({ page }) => {
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
});
