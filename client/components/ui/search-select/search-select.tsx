"use client";

import { Check, ChevronDown, ChevronUp } from "lucide-react";
import { Popover, PopoverContent, PopoverTrigger } from "../popover/popover";
import { SearchSelectOption, SearchSelectProps } from "./search-select.types";
import { useMemo, useState } from "react";
import { Button } from "../button/button";
import { cn } from "@/lib/utils";
import { Input } from "../input/input";

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
  const [search, setSearch] = useState<string>("");

  const filteredOptions = useMemo(() => {
    const searchValue = search.toLowerCase();

    return options.filter((option) =>
      option.label.toLowerCase().includes(searchValue),
    );
  }, [options, search]);

  const selectedOption = useMemo(() => {
    return options.find((option) => option.value === value);
  }, [value, options]);

  const handleSelect = (selectedValue: string | number) => {
    onValueChange(selectedValue);
    setOpen(false);
    setSearch("");
  };

  const handleOpenChange = (nextOpen: boolean) => {
    setOpen(nextOpen);

    if (!nextOpen) setSearch("");
  };

  return (
    <Popover open={open} onOpenChange={handleOpenChange}>
      <PopoverTrigger
        render={
          <Button
            type="button"
            role="combobox"
            variant={"outline"}
            aria-expanded={open}
            disabled={disabled}
            className={cn(
              "w-full justify-between active:scale-none disabled:bg-muted",
              !selectedOption && "text-muted-foreground",
              className,
            )}
          >
            {selectedOption?.label ?? placeholder}
            {open ? (
              <ChevronUp className="ml-2 h-4 w-4 shrink-0 opacity-50" />
            ) : (
              <ChevronDown className="ml-2 h-4 w-4 shrink-0 opacity-50" />
            )}
          </Button>
        }
      />

      <PopoverContent className="w-(--anchor-width) p-0">
        <div className="p-2">
          <Input
            value={search}
            onChange={(e) => setSearch(e.target.value)}
            placeholder={searchPlaceholder}
          />
        </div>

        {filteredOptions.length === 0 ? (
          <p className="text-center pb-3">{emptyMessage}</p>
        ) : (
          <div className="max-h-72 overflow-y-auto">
            {filteredOptions.map((option: SearchSelectOption) => (
              <Button
                variant={"ghost"}
                size={"sm"}
                key={option.value}
                className="flex w-full justify-start items-center text-left hover:bg-muted"
                onClick={() => handleSelect(option.value)}
              >
                <Check
                  className={cn(
                    "mr-1 w-4 h-4",
                    value === option.value ? "opacity-100" : "opacity-0",
                  )}
                />
                {option.label}
              </Button>
            ))}
          </div>
        )}
      </PopoverContent>
    </Popover>
  );
}
