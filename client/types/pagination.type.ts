export interface Pagination {
  total: number;
  page: number;
  totalPages: number;
  limit: number;
}

export interface Meta {
  limit: number;
  hasMore: boolean;
  nextCursor: string;
}
