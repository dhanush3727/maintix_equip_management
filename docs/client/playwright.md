# Playwright
Playwright is an end-to-end testing framework used to test web applications by controlling real browsers and verifying application behavior.

## Installation
Install Playwright in the client application:

```bash
npm init playwright@latest
```
After installation, verify that Playwright is working:

```bash
npx playwright test
```

## Playwright Configuration
Enable `baseURL` and `webServer` in `playwright.config.ts`:
```ts
use: {
  baseURL: "http://localhost:3000",
},

webServer: {
  command: "npm run dev",
  url: "http://localhost:3000",
  reuseExistingServer: !process.env.CI,
},
```
### `baseURL`
With `baseURL` configured:

```ts
await page.goto("/login");
```
Playwright automatically resolves it to:
```text
http://localhost:3000/login
```
Without `baseURL`, you would need:
```ts
await page.goto("http://localhost:3000/login");
```
### `webServer`
The `webServer` configuration allows Playwright to automatically start the Next.js development server before running tests.
```text
Playwright
    ↓
npm run dev
    ↓
Next.js
    ↓
http://localhost:3000
    ↓
Run tests
```

# Playwright Concepts Used
## `test()`
Defines an individual test case.
```ts
test("test name", async ({ page }) => {
  // test steps
});
```
Each test should represent a meaningful behavior that can independently pass or fail.

## `page`
`page` represents a browser tab controlled by Playwright.
```ts
await page.goto("/login");
await page.getByLabel("Email").fill("...");
```
## `page.goto()`
Navigates the browser to a URL.
With:
```ts
baseURL: "http://localhost:3000"
```
this:
```ts
await page.goto("/login");
```
opens:
```text
http://localhost:3000/login
```

## `getByRole()`
Locates an element using its accessible role and name.
```ts
page.getByRole("button", { name: "Login" })
```
This is preferred over relying on fragile CSS classes.

## `getByLabel()`
Locates form controls using their associated label.
```ts
page.getByLabel("Email");
page.getByLabel("Password");
```
Maintix supports this because the labels and inputs are correctly associated using `htmlFor` and `id`.

## `click()`
Performs a real click interaction.
```ts
await page.getByRole("button", { name: "Login" }).click();
```
Playwright checks that the element is visible, enabled, stable, and actionable before clicking.

## `fill()`
Enters text into an input.
```ts
await page.getByLabel("Email").fill(testEmail);
```

## `expect()`
Creates an assertion to verify the expected application state.
```ts
await expect(locator).toBeVisible();
await expect(locator).toHaveValue(value);
await expect(page).toHaveURL(/dashboard/);
```

## `toBeVisible()`
Checks whether an element is visible.
```ts
await expect(page.getByLabel("Email")).toBeVisible();
```

## `toHaveValue()`
Checks the current value of an input.
```ts
await expect(emailInput).toHaveValue(testEmail);
```

## `toHaveURL()`
Checks the current browser URL.

```ts
await expect(page).toHaveURL(/dashboard/);
```
Used in the successful login test to verify that authentication resulted in the expected redirect.

# Login Test Coverage
The Maintix login tests currently cover:
```text
Login Page
├── Required fields
├── Field validation
├── Form interaction
└── Successful login
```
These are kept as separate tests so that each test has a clear responsibility and failures are easier to identify.

# Running Login Tests
Run the login tests using Chromium:
```bash
npx playwright test tests/auth/login --project=chromium
```
Run with the browser visible:
```bash
npx playwright test tests/auth/login --project=chromium --headed
```
Run in debug mode:
```bash
npx playwright test tests/auth/login --project=chromium --debug
```
Open the HTML report:
```bash
npx playwright show-report
```