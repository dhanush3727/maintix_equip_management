import { Meta, Pagination } from "./pagination.type";

export interface ApiResponse<T> {
  success: boolean;
  message: string;
  data?: T;
  pagination?: Pagination;
  meta?: Meta;
}
