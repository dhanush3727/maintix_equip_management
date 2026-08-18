# Playwright Authentication Setup
Playwright uses a separate **setup project** to create authentication state once and an **authenticated project** to reuse that state across protected tests.
This prevents authenticated tests from repeatedly performing the login process.
The overall flow is:
```text
Setup Project
      ↓
auth.setup.ts
      ↓
Login
      ↓
Save authentication state
      ↓
playwright/.auth/user.json
      ↓
chromium-auth
      ↓
Authenticated Tests
```

# 1. Project Structure
The authentication-related tests are organized as follows:
```text
tests/
├── auth/
│   ├── login.spec.ts
│   └── dashboard.authenticated.spec.ts
│
└── setup/
    └── auth.setup.ts
```
There are three important parts:

```text
setup project
     ↓
auth.setup.ts
     ↓
playwright/.auth/user.json
     ↓
chromium-auth project
     ↓
authenticated tests
```

---

# 2. Setup Project

The setup project is configured in `playwright.config.ts`:

```ts
{
  name: "setup",
  testMatch: /.*\.setup\.ts/,
}
```

## `name`

```ts
name: "setup"
```

This gives the Playwright project the name `setup`.

The name is referenced later using:

```ts
dependencies: ["setup"]
```

This means:

> Run the `setup` project before running the project that depends on it.

---

## `testMatch`

```ts
testMatch: /.*\.setup\.ts/
```

This tells Playwright to find test files whose filenames end with:

```text
.setup.ts
```

Therefore:

```text
auth.setup.ts          ✅
database.setup.ts      ✅
auth.spec.ts           ❌
login.spec.ts          ❌
```

The Maintix file:

```text
tests/setup/auth.setup.ts
```

is therefore recognized as a setup test.

---

## What Does `auth.setup.ts` Do?

`auth.setup.ts` performs the actual login and saves the resulting browser authentication state.

The flow is:

```text
Open /login
    ↓
Enter email
    ↓
Enter password
    ↓
Click Login
    ↓
Refresh-token cookie is created
    ↓
Save browser authentication state
    ↓
playwright/.auth/user.json
```

The saved state can then be reused by authenticated tests.

---

# 3. Why Do We Need Two Chromium Projects?

Maintix has two different types of tests.

### Unauthenticated Tests

These tests should start without authentication.

Examples:

```text
login.spec.ts
register.spec.ts
forgot-password.spec.ts
```

### Authenticated Tests

These tests require a logged-in user.

Examples:

```text
dashboard.authenticated.spec.ts
equipment.authenticated.spec.ts
schedule.authenticated.spec.ts
notification.authenticated.spec.ts
```

These two categories should use different browser states.

---

# 4. Chromium Project — Unauthenticated Tests

The normal Chromium project is configured as:

```ts
{
  name: "chromium",
  testIgnore: /.*\.authenticated\.spec\.ts/,
  use: {
    ...devices["Desktop Chrome"],
  },
}
```

This project is used for unauthenticated tests.

The important configuration is:

```ts
testIgnore: /.*\.authenticated\.spec\.ts/
```

This prevents authenticated test files from running in the normal Chromium project.

For example:

```text
login.spec.ts                    ✅
register.spec.ts                 ✅
forgot-password.spec.ts          ✅
dashboard.authenticated.spec.ts  ❌
equipment.authenticated.spec.ts  ❌
```

### Why Should Login Tests Be Unauthenticated?

Consider:

```ts
test("User can login", async ({ page }) => {
  await page.goto("/login");

  // Login manually
});
```

A login test should verify this flow:

```text
Unauthenticated User
        ↓
Open Login Page
        ↓
Enter Credentials
        ↓
Login
        ↓
Authenticated User
```

It should not start like this:

```text
Already Authenticated
        ↓
Open Login Page
        ↓
Login
```

If a saved authentication state is present before the test starts, the test is no longer properly testing the initial login flow.

---

# 5. Chromium Authenticated Project

The authenticated project is configured as:

```ts
{
  name: "chromium-auth",
  testMatch: /.*\.authenticated\.spec\.ts/,
  use: {
    ...devices["Desktop Chrome"],
    storageState: "playwright/.auth/user.json",
  },
  dependencies: ["setup"],
}
```

This project is used for tests that require an authenticated user.

---

## `testMatch`

```ts
testMatch: /.*\.authenticated\.spec\.ts/
```

This tells Playwright to run only files ending with:

```text
.authenticated.spec.ts
```

For example:

```text
dashboard.authenticated.spec.ts  ✅
equipment.authenticated.spec.ts  ✅
schedule.authenticated.spec.ts   ✅

login.spec.ts                    ❌
register.spec.ts                 ❌
```

The `.authenticated` portion is a naming convention used to clearly identify tests that require authentication.

---

# 6. `storageState`

This is the key part of the authenticated project:

```ts
storageState: "playwright/.auth/user.json"
```

It tells Playwright:

> Start the browser using the authentication state saved in this file.

The setup test creates the authentication state:

```text
auth.setup.ts
      ↓
Login
      ↓
Authentication State
      ↓
playwright/.auth/user.json
```

The authenticated project then loads that state:

```text
playwright/.auth/user.json
      ↓
chromium-auth
      ↓
Authenticated Browser
```

Therefore, authenticated tests do not need to repeat the login process.

Instead of:

```ts
await page.goto("/login");
await page.getByLabel("Email").fill(...);
await page.getByLabel("Password").fill(...);
await page.getByRole("button", { name: "Login" }).click();
```

the authenticated test can directly access the protected page:

```ts
test("Authenticated user can access dashboard", async ({ page }) => {
  await page.goto("/dashboard");

  await expect(page).toHaveURL(/dashboard/);
});
```

The browser already has the saved authentication state.

---

# 7. `dependencies`

The authenticated project contains:

```ts
dependencies: ["setup"]
```

This creates the relationship:

```text
chromium-auth
      ↓
depends on
      ↓
setup
```

Therefore, Playwright runs the setup project before the authenticated project.

The complete flow is:

```text
                Playwright
                    │
                    ▼
              Setup Project
                    │
                    ▼
             auth.setup.ts
                    │
                    ▼
                  Login
                    │
                    ▼
          Authentication State
                    │
                    ▼
        playwright/.auth/user.json
                    │
                    ▼
             chromium-auth
                    │
          ┌─────────┼─────────┐
          ▼         ▼         ▼
      Dashboard  Equipment  Schedule
```

---

# 8. Why Not Use One Chromium Project?

It is possible to configure one Chromium project with:

```ts
{
  name: "chromium",
  use: {
    ...devices["Desktop Chrome"],
    storageState: "playwright/.auth/user.json",
  },
}
```

However, this would cause every test to start with the saved authentication state.

That creates a problem for login tests.

For example:

```ts
test("User can login successfully", async ({ page }) => {
  // Login test
});
```

The test would start like this:

```text
Already Authenticated
        ↓
Open Login Page
        ↓
Login
```

But the login test should start like this:

```text
Unauthenticated User
        ↓
Open Login Page
        ↓
Enter Credentials
        ↓
Login
        ↓
Authenticated User
```

Therefore, Maintix separates authenticated and unauthenticated tests into different projects.

---

# 9. Final Playwright Configuration

The current Maintix setup uses three Playwright projects:

```ts
projects: [
  // Creates authentication state
  {
    name: "setup",
    testMatch: /.*\.setup\.ts/,
  },

  // Unauthenticated tests
  {
    name: "chromium",
    testIgnore: /.*\.authenticated\.spec\.ts/,
    use: {
      ...devices["Desktop Chrome"],
    },
  },

  // Authenticated tests
  {
    name: "chromium-auth",
    testMatch: /.*\.authenticated\.spec\.ts/,
    use: {
      ...devices["Desktop Chrome"],
      storageState: "playwright/.auth/user.json",
    },
    dependencies: ["setup"],
  },
]
```

---

# Authentication Architecture

| Project         | Purpose                                     | Authentication            |
| --------------- | ------------------------------------------- | ------------------------- |
| `setup`         | Creates the authentication state            | Logs in                   |
| `chromium`      | Tests login, registration, and public pages | ❌ No saved authentication |
| `chromium-auth` | Tests protected application features        | ✅ Saved authentication    |

---

# Key Idea

The complete authentication strategy can be summarized as:

```text
setup
  = Create authentication state


chromium
  = Test unauthenticated behavior


chromium-auth
  = Test authenticated behavior
```

This separation allows the Maintix test suite to:

* Test the login flow from an unauthenticated state.
* Test public application functionality without authentication.
* Create authentication state only once.
* Reuse the saved authentication state across protected tests.
* Avoid repeatedly logging in before every authenticated test.
* Keep authenticated and unauthenticated test responsibilities clearly separated.

```text
                    Playwright
                        │
          ┌─────────────┴─────────────┐
          │                           │
          ▼                           ▼
       chromium                     setup
   Unauthenticated                    │
          │                           ▼
          │                      Login User
          │                           │
          │                           ▼
          │                 user.json authentication
          │                           │
          │                           ▼
          │                     chromium-auth
          │                           │
          │                 ┌─────────┼─────────┐
          │                 ▼         ▼         ▼
          │            Dashboard  Equipment  Schedule
          │
          ▼
    Login / Register /
    Forgot Password
```

The result is a clean Playwright architecture where **authentication itself is tested separately from features that require authentication**.
