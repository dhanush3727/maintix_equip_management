"use client";

import { Check, ChevronsUpDown } from "lucide-react";
import {
  Command,
  CommandEmpty,
  CommandGroup,
  CommandInput,
  CommandItem,
  CommandList,
} from "../command/command";
import { Popover, PopoverContent, PopoverTrigger } from "../popover/popover";
import { SearchSelectOption, SearchSelectProps } from "./search-select.types";
import { useMemo, useState } from "react";
import { Button } from "../button/button";
import { cn } from "@/lib/utils";

export function SearchSelect({
  options,
  value,
  onValueChange,
  placeholder = "Select Option...",
  searchPlaceholder = "Search...",
  emptyMessage = "No results found",
  disabled,
  className,
}: SearchSelectProps) {
  const [open, setOpen] = useState<boolean>(false);

  const selectedOption = useMemo(() => {
    return options.find((option) => option.value === value);
  }, [value, options]);

  const handleSelect = (selectedValue: string) => {
    onValueChange(selectedValue);
    setOpen(false);
  };

  return (
    <Popover open={open} onOpenChange={setOpen}>
      <PopoverTrigger
        render={
          <Button
            type="button"
            role="combobox"
            variant={"outline"}
            aria-expanded={open}
            disabled={disabled}
            className={cn(
              "w-full justify-between active:scale-none",
              !selectedOption && "text-muted-foreground",
              className,
            )}
          >
            {selectedOption?.label ?? placeholder}
            <ChevronsUpDown className="ml-2 h-4 w-4 shrink-0 opacity-50" />
          </Button>
        }
      />

      <PopoverContent className="w-(--radix-popover-trigger-width) p-0">
        <Command>
          <CommandInput placeholder={searchPlaceholder} />

          <CommandList>
            <CommandEmpty>{emptyMessage}</CommandEmpty>

            <CommandGroup>
              {options.map((option: SearchSelectOption) => (
                <CommandItem
                  key={option.value}
                  value={option.label}
                  onSelect={() => handleSelect(option.value)}
                >
                  <Check
                    className={cn(
                      value === option.value ? "opacity-100" : "opacity-0",
                    )}
                  />
                  {option.label}
                </CommandItem>
              ))}
            </CommandGroup>
          </CommandList>
        </Command>
      </PopoverContent>
    </Popover>
  );
}
