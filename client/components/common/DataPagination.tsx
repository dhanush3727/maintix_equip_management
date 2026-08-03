import {
  Pagination,
  PaginationContent,
  PaginationItem,
  PaginationLink,
  PaginationNext,
  PaginationPrevious,
} from "@/components/ui";
import { cn } from "@/lib";
import { Pagination as PaginationType } from "@/types";

interface DataPaginationProps {
  pagination?: PaginationType;
  onPageChange: (page: number) => void;
}

export function DataPagination({
  pagination,
  onPageChange,
}: DataPaginationProps) {
  if (!pagination || pagination.totalPages <= 1) {
    return null;
  }

  const { page, totalPages } = pagination;

  return (
    <Pagination className="justify-end mt-5">
      <PaginationContent>
        <PaginationItem>
          <PaginationPrevious
            href="#"
            onClick={(e) => {
              e.preventDefault();

              if (page > 1) {
                onPageChange(page - 1);
              }
            }}
            className={cn(
              page === 1 && "pointer-events-none opacity-50",
              "text-xs",
            )}
          />
        </PaginationItem>

        {Array.from({ length: totalPages }, (_, index) => {
          const pageNumber = index + 1;

          return (
            <PaginationItem key={pageNumber}>
              <PaginationLink
                href="#"
                isActive
                onClick={(e) => {
                  e.preventDefault();
                  onPageChange(pageNumber);
                }}
                className="size-8"
              >
                {pageNumber}
              </PaginationLink>
            </PaginationItem>
          );
        })}

        <PaginationItem>
          <PaginationNext
            href="#"
            onClick={(e) => {
              e.preventDefault();

              if (page < totalPages) {
                onPageChange(page + 1);
              }
            }}
            className={cn(
              page === totalPages && "pointer-events-none opacity-50",
              "text-xs",
            )}
          />
        </PaginationItem>
      </PaginationContent>
    </Pagination>
  );
}
