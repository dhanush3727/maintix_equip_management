type PrismaWhere = Record<string, unknown>;
type PrismaOrderBy = Record<string, 'asc' | 'desc'>;

// Calculates skip value from page and limit
export function getPagination(page: number, limit: number) {
  const safePage = Math.max(page, 1); // ensure page >= 1
  const safeLimit = Math.max(limit, 1); // ensure limit >= 1

  const skip = (safePage - 1) * safeLimit;

  return {
    skip, // number of items to skip
    take: safeLimit, // number of items to take
    page: safePage, // current page number
    limit: safeLimit, // number of items per page
  };
}

// Builds pagination metadata for response
export function buildPaginationMeta(
  page: number,
  limit: number,
  total: number,
) {
  // Calculate total pages based on total items and limit
  const totalPages = Math.ceil(total / limit);
  return {
    total, // total number of items
    page, // current page number
    totalPages, // total number of pages
    limit, // number of items per page
  };
}

// Build WHERE + ORDER BY clause for search and sorting
export function buildQueryOptions(query: {
  search?: string;
  order?: 'asc' | 'desc';
  filters?: Record<string, unknown>;
  searchFields?: string[];
  sortBy?: string;
}) {
  const { search, sortBy, order, filters = {}, searchFields = [] } = query;

  // Start with any additional filters provided
  // e.g., { status: 'active' } can be passed in filters to only return active items
  const where: PrismaWhere = { ...filters };

  // Add search condition (OR across fields)
  if (search && searchFields.length > 0) {
    where['OR'] = searchFields.map((field) => ({
      [field]: {
        contains: search,
        mode: 'insensitive', // case-insensitive search
      },
    }));
  }

  // Add sorting
  const orderBy: PrismaOrderBy | undefined = sortBy
    ? { [sortBy]: order ?? 'desc' }
    : undefined;

  return { where, orderBy };
}

// In this query builder utility, we have three main functions:
// 1. getPagination: This function calculates the skip and take values based on the provided page and limit. It ensures that the page and limit are at least 1 to prevent invalid pagination parameters.
// 2. buildPaginationMeta: This function generates metadata for the pagination response, including the total number of items, current page, total pages, and limit per page. This metadata can be included in API responses to help clients understand the pagination context.
// 3. buildQueryOptions: This function constructs the WHERE and ORDER BY clauses for Prisma queries based on the search, sorting, and additional filters provided. It supports case-insensitive search across multiple fields and allows for dynamic sorting based on specified fields and order.
