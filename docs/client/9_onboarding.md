# OnBoardingGuard
## Overview
The `OnBoardingGuard` component protects both onboarding and dashboard routes by ensuring users are redirected based on their organization's current onboarding progress.
This prevents users from:
- Accessing the dashboard before completing onboarding.
- Returning to onboarding pages after onboarding has been completed.
- Bypassing the onboarding flow by manually entering URLs.
- Landing on incorrect pages after refreshing the browser or reopening the application.
The onboarding progress stored in the database is treated as the single source of truth.

# Why is this needed?
Consider the following scenario:
1. An administrator registers a new organization.
2. The administrator logs in.
3. The administrator completes only part of the onboarding process.
4. The administrator closes the browser.
5. Later, the administrator opens the application again.
Without a guard, the user could be redirected directly to the dashboard even though the onboarding process has not been completed.
`OnBoardingGuard` solves this by checking the current onboarding step before rendering protected pages.

# Responsibilities
The guard performs two primary responsibilities.
## Setup Mode
When the guard is used inside the onboarding pages:
- If onboarding is **completed**, the user is redirected to the dashboard.
- Otherwise, the requested onboarding page is rendered normally.
Example:
```text
Current Step: COMPLETED
/setup/location
        ↓
Redirect
        ↓
/dashboard
```
## Dashboard Mode
When the guard is used inside the dashboard:
- If onboarding is **not completed**, the user is redirected to the current onboarding step.
- If onboarding is completed, dashboard pages are rendered normally.
Example:
```text
Current Step: DEPARTMENT
/dashboard
      ↓
Redirect
      ↓
/setup/department
```

# How it works
The guard performs the following steps:
1. Fetch the current onboarding status using `useOnboarding()`.
2. Wait until the onboarding request completes.
3. Determine the user's current onboarding step.
4. Redirect the user when necessary.
5. Render child pages only when access is allowed.

# Redirect Rules
| Current Mode | Onboarding Status | Result                              |
| ------------ | ----------------- | ----------------------------------- |
| Setup        | Completed         | Redirect to Dashboard               |
| Setup        | Not Completed     | Render Setup Page                   |
| Dashboard    | Completed         | Render Dashboard                    |
| Dashboard    | Not Completed     | Redirect to Current Onboarding Step |

# Route Mapping
The current onboarding step is mapped to its corresponding route using the `setupRoutes` constant.
Example:
```ts
LOCATION    → /setup/location
DEPARTMENT  → /setup/department
USERS       → /setup/invite-users
COMPLETED   → /dashboard
```
This keeps redirect logic centralized and easy to maintain.

# Preventing Protected Content Flash
The guard intentionally avoids rendering its children while:
- onboarding information is still loading, or
- a redirect is about to occur.
This prevents users from briefly seeing protected dashboard content before being redirected.

# Usage
## Protect Setup Pages
```tsx
<OnBoardingGuard mode="setup">{children}</OnBoardingGuard>
```
## Protect Dashboard Pages
```tsx
<OnBoardingGuard mode="dashboard">{children}</OnBoardingGuard>
```
# Notes
- The onboarding step stored in the database is the source of truth.
- The guard does not rely on local storage or session storage.
- Route protection is centralized instead of being duplicated across individual pages.
- The component is reusable for both onboarding and dashboard layouts through the `mode` property.