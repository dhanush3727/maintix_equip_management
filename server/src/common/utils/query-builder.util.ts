type PrismaWhere = Record<string, unknown>;

type PrismaOrderBy = Record<string, 'asc' | 'desc'>;

type CursorPayload = {
  id: number;
  createdAt: string;
};

//#region OFFSET
// The offset-based pagination approach is straightforward and widely used.
// It calculates the number of items to skip based on the current page and limit, making it easy to implement and understand.
// However, it can become inefficient for large datasets as the database needs to skip a potentially large number of records, leading to slower query performance.
// This method is suitable for smaller datasets or when the total number of records is not expected to grow significantly.

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
//#endregion

//#region CURSOR
// The cursor-based pagination is a more efficient approach for large datasets, as it uses a unique identifier (cursor) to fetch the next set of records without
// needing to skip a large number of records. This method is particularly beneficial when dealing with real-time data or when the dataset is expected to grow significantly.

// Encode Cursor
// It take id and createdAt converts to JSON string and then encodes it. It becomes cursor string send to client. Client can use this cursor to fetch next page of data.
export function encodeCursor(payload: CursorPayload): string {
  return Buffer.from(JSON.stringify(payload)).toString('base64');
}

// Decode Cursor
// It takes the cursor string from client, decodes it from base64 and parses the JSON to get back the original payload (id and createdAt).
export function decodeCursor(cursor: string): CursorPayload {
  return JSON.parse(
    Buffer.from(cursor, 'base64').toString('utf-8'),
  ) as CursorPayload;
}
// Why we use encode/decode cursor?
// It is used to create a unique identifier for pagination that can be safely transmitted over the network.
// By encoding the cursor, we can include multiple pieces of information (like id and createdAt) in a single string,
// which can then be decoded on the server to retrieve the necessary data for fetching the next set of records.

// Build cursor query
export function buildCursorQueryOptions(query: {
  cursor?: string; // cursor string from client to fetch next page
  limit?: number; // number of items to fetch
  order?: 'asc' | 'desc'; // sorting order
  filters?: Record<string, unknown>; // additional filters for the query
}) {
  const { cursor, limit = 10, order = 'desc', filters = {} } = query;

  // Start with any additional filters provided
  const where: PrismaWhere = { ...filters };

  // If cursor is provided, decode it and add conditions to fetch records after the cursor
  if (cursor) {
    // The cursor contains the createdAt and id of the last item from the previous page. We need to fetch items that are either:
    // 1. Created after the last item's createdAt (for ascending order) or before (for descending order)
    // 2. If createdAt is the same, then we compare the id to ensure we don't fetch the same item again.
    const decoded = decodeCursor(cursor);

    // It is the where clause to fetch records after the cursor. It uses OR to combine two conditions:
    where['OR'] = [
      // condition 1: createdAt is greater than (for asc) or less than (for desc) the cursor's createdAt
      {
        createdAt: {
          [order === 'desc' ? 'lt' : 'gt']: new Date(decoded.createdAt),
        },
      },
      // condition 2: if createdAt is the same, then id must be greater than (for asc) or less than (for desc) the cursor's id
      {
        createdAt: new Date(decoded.createdAt),
        id: {
          [order === 'desc' ? 'lt' : 'gt']: decoded.id,
        },
      },
    ];
  }

  return {
    where,
    orderBy: [{ createdAt: order }, { id: order }],
    take: limit + 1, // fetch one extra item to determine if there are more items
    limit,
  };
}

// Build cursor metadata for response
export function buildCursorMeta<T extends { id: number; createdAt: Date }>(
  data: T[], // data fetched from database
  limit: number, // limit used for fetching data
) {
  const hasMore = data.length > limit;

  if (hasMore) {
    data.pop(); // remove extra item
  }

  const nextCursor = hasMore
    ? encodeCursor({
        id: data[data.length - 1].id,
        createdAt: data[data.length - 1].createdAt.toISOString(),
      })
    : null;

  return {
    data,
    meta: {
      limit,
      hasMore,
      nextCursor,
    },
  };
}
//#endregion

// In this query builder utility, we have implemented functions to support both offset-based and cursor-based pagination
// 1. getPagination: This function calculates the skip and take values based on the provided page and limit. It ensures that the page and limit are at least 1 to prevent invalid pagination parameters.
// 2. buildPaginationMeta: This function generates metadata for the pagination response, including the total number of items, current page, total pages, and limit per page. This metadata can be included in API responses to help clients understand the pagination context.
// 3. buildQueryOptions: This function constructs the WHERE and ORDER BY clauses for Prisma queries based on the search, sorting, and additional filters provided. It supports case-insensitive search across multiple fields and allows for dynamic sorting based on specified fields and order.
// 4. encodeCursor and decodeCursor: These functions handle the encoding and decoding of cursor payloads for cursor-based pagination. The cursor is encoded as a base64 string to safely transmit the necessary information (id and createdAt) for fetching the next set of records.
// 5. buildCursorQueryOptions: This function builds the query options for cursor-based pagination, including the WHERE clause to fetch records after the provided cursor and the ORDER BY clause to sort the results.
// 6. buildCursorMeta: This function generates metadata for cursor-based pagination responses, including whether there are more items to fetch and the next cursor if applicable.
