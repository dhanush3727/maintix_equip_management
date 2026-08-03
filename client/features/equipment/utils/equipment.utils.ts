export interface DropdownOptions {
  value: string | number;
  label: string;
}

// Dropdowns store the selected option ID.
// The equipment API expects location, department, and type names,
// so convert the selected IDs to their corresponding labels.
export const getOptionLabel = (
  options: DropdownOptions[],
  value: number | undefined,
): string => {
  const label =
    options.find((option) => String(option.value) === String(value))?.label ||
    "";

  return label;
};

export const formatDate = (date: string | null): string | undefined => {
  if (!date) return;

  const dateStr = date.split("T")[0];
  return dateStr;
};
