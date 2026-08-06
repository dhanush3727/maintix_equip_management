export function formatDate(dateStr: string): string {
  const date = dateStr.split("T")[0].split("-");

  const [year, month, day] = date;

  return `${day}/${month}/${year}`;
}
