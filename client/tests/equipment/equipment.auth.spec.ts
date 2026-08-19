import { test, expect } from "@playwright/test";

/**
 * Verify that an authenticated user can access
 * the equipment page.
 */
test("Authenticated user can access the equipment page", async ({ page }) => {
  // Navigate to the equipment page.
  await page.goto("/equipment");

  // Verify that the user is on the equipment page.
  await expect(page).toHaveURL(/equipment/);
});

/**
 * Verify that the equipment table and its
 * important columns are displayed.
 */
test("Equipment list is displayed", async ({ page }) => {
  // Navigate to the equipment page.
  await page.goto("/equipment");

  // Verify that the equipment table is visible.
  await expect(page.getByRole("table")).toBeVisible();

  // Verify that the Name column is displayed.
  await expect(page.getByRole("columnheader", { name: /name/i })).toBeVisible();

  // Verify that the Code column is displayed.
  await expect(page.getByRole("columnheader", { name: /code/i })).toBeVisible();
});

/**
 * Verify that the user can search for equipment.
 */
// test("User can search equipment", async ({ page }) => {
//   // Navigate to the equipment page.
//   await page.goto("/equipment");

//   // Locate the equipment search input.
//   const searchInput = page.getByRole("textbox", {
//     name: "Search equipment",
//   });

//   // Enter the search term.
//   await searchInput.fill("pump");

//   // Verify that the matching equipment is displayed.
//   await expect(
//     page
//       .getByRole("cell", {
//         name: "Pump",
//         exact: true,
//       })
//       .first(),
//   ).toBeVisible();

//   // Verify that unrelated equipment is not displayed.
//   await expect(
//     page.getByRole("cell", {
//       name: "Boiler",
//       exact: true,
//     }),
//   ).not.toBeVisible();
// });

/**
 * Verify that the user can filter equipment by equipment type.
 */
// test("User can filter equipment by type", async ({ page }) => {
//   // Navigate to the equipment page.
//   await page.goto("/equipment");

//   // Locate the equipment type filter.
//   const typeSelect = page.getByRole("combobox", {
//     name: /Select type/i,
//   });

//   // Open the equipment type filter.
//   await typeSelect.click();

//   // Select the Mechanical equipment type.
//   await page.getByRole("option", { name: "Mechnical" }).click();

//   // Verify that equipment belonging to the selected
//   // type is displayed.
//   await expect(
//     page
//       .getByRole("cell", {
//         name: "Conveyor belt",
//         exact: true,
//       })
//       .first(),
//   ).toBeVisible();
// });

/**
 * Verify that the user can open the Add Equipment form.
 */
test("User can open add equipment form", async ({ page }) => {
  // Navigate to the equipment page.
  await page.goto("/equipment");

  // Locate the Add Equipment button.
  const addEquipmentButton = page.getByRole("button", {
    name: /add equipment/i,
  });

  // Open the Add Equipment form.
  await addEquipmentButton.click();

  // Verify that the Add Equipment dialog is displayed.
  await expect(
    page.getByRole("heading", {
      name: /add equipment/i,
    }),
  ).toBeVisible();

  // Verify that the equipment name field is displayed.
  await expect(page.getByLabel(/name/i)).toBeVisible();
});

/**
 * Verify that the user can open the Edit Equipment form.
 */
// test("User can open edit equipment form", async ({ page }) => {
//   // Navigate to the equipment page.
//   await page.goto("/equipment");

//   // Locate the edit button.
//   // The EquipmentList component should provide an
//   // accessible name such as: aria-label="Edit Pump".
//   const editButton = page
//     .getByRole("button", {
//       name: /edit/i,
//     })
//     .first();

//   // Open the Edit Equipment form.
//   await editButton.click();

//   // Verify that the Edit/Update Equipment dialog is displayed.
//   await expect(
//     page.getByRole("heading", {
//       name: /update equipment/i,
//     }),
//   ).toBeVisible();

//   // Verify that the equipment name field is displayed.
//   await expect(page.getByLabel(/name/i)).toBeVisible();
// });
