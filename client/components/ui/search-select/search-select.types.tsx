export interface SearchSelectOption {
  label: string;
  value: string | number;
}

export interface SearchSelectProps {
  options: SearchSelectOption[];
  value?: string | number;
  onValueChange: (value: string | number) => void;
  placeholder?: string;
  searchPlaceholder?: string;
  emptyMessage?: string;
  disabled?: boolean;
  className?: string;
}
