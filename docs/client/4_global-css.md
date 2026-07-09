# Global CSS file
## What is a Global CSS file?
Global CSS is a file that contains styles that are applied globally across your application. In Next.js, you can create a `global.css` file and import it in your `layout.tsx` file to apply styles globally. Ex: CSS Resets, Typography, etc. It should not contain component-specific styles like cards, buttons, or modals. 
Ex:
```css
:root {
  --color-primary: #ea6721;
  --color-primary-hover: #d95d1c;
  --color-primary-light: #fff3ec;
}
```

## CSS variables
CSS variables, also known as custom properties, are a way to define reusable values in CSS. They allow you to store values in one place and use them throughout your stylesheets. This makes it easier to maintain and update your styles, as you can change the value of a variable in one place and have it reflected everywhere it's used.
ex:
```css
:root {
  --color-primary: #ea6721;
  --color-primary-hover: #d95d1c;
  ...
}
```
Instead of writing `text-[#ea6721]` in your components, you can use `text-[var(--color-primary)]` to make it more maintainable. If you want to change the primary color, you only need to update the value in the `:root` selector.

## Design Tokens & Semantic Tokens
1. Design Tokens
Design Tokens are the raw design values that define your application's visual identity. They are the single source of truth for colors, spacing, typography, radius, shadows, and other design properties. Think of them as your design palette.
Ex:
```css
--brand-primary: #ea6721; 
--brand-primary-hover: #d95d1c; 
--surface-page: #fcfaf7; 
--surface-card: #ffffff; 
--text-primary: #2c231b; 
--text-secondary: #6e655e; 
--radius-md: 10px; --shadow-sm: 0 4px 12px rgb(44 35 27 / 0.06);
```
Notice that these names describe what the value is, not where it is used. For example:
`--brand-primary` -> Brand color
`--surface-card` -> Card background color
`--text-primary` -> Primary text color
They represent the visual language of the application.

2. Semantic Tokens
Semantic Tokens describe the purpose of value instead of the value itself.
Ex:
```css
--primary: var(--brand-primary); 
--background: var(--surface-page); 
--foreground: var(--text-primary); 
--border: var(--border-default);
```
These tokens don't care what the actual color is, they only describe its role in the interface.

3. Real Example
Design Tokens
--brand-primary: #ea6721;
--surface-page: #fcfaf7;
--text-primary: #2c231b;

Semantic Tokens
--primary: var(--brand-primary);
--background: var(--surface-page);
--foreground: var(--text-primary);

Component
<Button className="bg-primary text-primary-foreground" />

The Button doesn't know that the primary color is orange. It simply uses the semantic meaning of "primary."

## @theme inline
`@theme inline` is a Taillwind CSS v4 feature that maps your CSS custom properties (variables) to Tailwind theme tokens. In simple words it tell Tailwind "When someone uses `bg-primary`, use the value stored in `--primary`."
Without `@theme inline`, Tailwind does not know that your CSS variables should become utility classes.
Ex:
```css
@theme inline { --color-primary: var(--primary); }
```
Now Tailwind generates utility classes like:
```
bg-primary 
text-primary 
border-primary 
fill-primary 
stroke-primary
```
All of these use the value stored in, `--primary`

## CSS Resets
1. Universal Selector: The universal selector `*` selects all elements on the page. It is used to apply styles to every element, ensuring a consistent baseline for styling.
2. Box-sizing: The `box-sizing` property is set to `border-box` for all elements. This means that the width and height of an element will include its padding and border, making it easier to manage layouts and avoid unexpected sizing issues.
3. Font Inheritance: The `font: inherit;` rule is applied to input, textarea, and select elements. This ensures that these form elements inherit the font styles from their parent elements, maintaining consistency in typography across the application.
4. Margin and Padding Reset: The `margin` and `padding` properties are set to `0` for all elements. This removes the default spacing applied by browsers, allowing you to define your own spacing rules without interference from browser defaults.
5. List Style Reset: The `list-style` property is set to `none` for all elements. This removes the default bullet points or numbering from lists, giving you full control over how lists are styled in your application.
6. Selection Styling: The `::selection` pseudo-element is used to style the text selection color. In this case, the background color of selected text is set to a specific shade of orange (`#ea6721`), and the text color is set to white (`#fff`). This enhances the user experience by providing a visually appealing selection effect.
7. Focus visibility: The `:focus-visible` pseudo-class is used to apply styles to elements that receive focus, but only when the focus is visible (e.g., when navigating with a keyboard). In this case, a box shadow is applied to focused elements, providing a visual indication of focus for better accessibility.
8. Scrollbar Styling: The `::-webkit-scrollbar` pseudo-element is used to style the scrollbar in webkit-based browsers (e.g., Chrome, Safari). The width of the scrollbar is set to `8px`, and the track and thumb are styled with specific colors and border-radius. This allows you to customize the appearance of scrollbars to match your application's design. The `::-webkit-scrollbar-track` is used to style the track of the scrollbar, while the `::-webkit-scrollbar-thumb` is used to style the draggable thumb of the scrollbar.

## Config font family
In the application we use the Poppins font from Google Fonts. The font is imported and configured in the `layout.tsx` file using the Next.js font optimization feature. The Poppins font is set up with specific subsets, weights, and a CSS variable for easy usage throughout the application. The `display: "swap"` property ensures that a fallback font is used until the Poppins font is fully loaded, improving perceived performance.
```tsx
// layout.tsx
import { Poppins } from "next/font/google";

const poppins = Poppins({
  subsets: ["latin"],
  weight: ["400", "500", "600", "700"],
  variable: "--font-poppins",
  display: "swap",
});

return (
  export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body className={poppins.variable}>
        <QueryProvider>{children}</QueryProvider>
      </body>
    </html>
  );
}
)
```
In this code,
- The `Poppins` font is imported from Google Fonts using the Next.js font optimization feature.
- The `poppins` constant is created by calling the `Poppins` function with an object that specifies the font configuration.
- The `subsets` property defines the character subsets to include for the font, in this case, Latin characters.
- The `weight` property specifies the font weights to include for the Poppins font, allowing for different font weights to be used in the application.
- The `variable` property defines a CSS variable that can be used to reference the Poppins font throughout the application, allowing for easy theming and font management.
- The `display` property specifies the font display strategy. The value `"swap"` means that the browser will use a fallback font until the Poppins font is fully loaded, improving perceived performance.
- The `poppins.variable` is applied to the `body` element's className, making the Poppins font available throughout the application. This allows you to use the Poppins font in your components by referencing the CSS variable defined in the `layout.tsx` file.