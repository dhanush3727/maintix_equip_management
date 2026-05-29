export function formatEnum<T extends Record<string, string>>(enumObj: T) {
  return Object.values(enumObj).map((value) => ({
    label: value
      .toLowerCase()
      .replace(/_/g, ' ')
      .replace(/\b\w/g, (char) => char.toUpperCase()),
    value,
  }));
}
