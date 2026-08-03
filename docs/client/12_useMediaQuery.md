# useMediaQuery
## Overview
`useMediaQuery` is reusable React hook for detecting whether the current browser viewport matches a CSS media query. I uses the browser's native `window.matchMedia()` API and automatically updates when the viewport changes.
`const isDesktop = useMediaQuery("(min-width: 1024px)");`.
The hook returns: `boolean | undefined`.

## Why do we use it?
CSS media queries are enough when we only need to change the UI.
For example:
```tsx
<div className="lg:hidden">
  Mobile UI
</div>
<div className="hidden lg:block">
  Desktop UI
</div>
```
However, CSS cannot control which React logic or API request should execute.
In Maintix, the equipment page uses two different data-loading strategies:
Desktop
Desktop uses normal pagination:
Page 1 → Page 2 → Page 3 → ...
Mobile
Mobile uses infinite scrolling:
Page 1
  ↓
Scroll
  ↓
Page 2
  ↓
Scroll
  ↓
Page 3
Therefore, we need to know the viewport size inside React.
useMediaQuery allows us to do that.