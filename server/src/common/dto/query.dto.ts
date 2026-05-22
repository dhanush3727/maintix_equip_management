import { Type } from 'class-transformer';
import { IsInt, IsOptional, Min, IsString, IsIn } from 'class-validator';

export class PaginationDto {
  // Pagination
  @IsOptional()
  @Type(() => Number)
  @IsInt()
  @Min(1)
  page: number = 1;

  @IsOptional()
  @Type(() => Number)
  @IsInt()
  @Min(1)
  limit: number = 10;

  // Search
  @IsOptional()
  @IsString()
  search?: string;

  // Sorting
  @IsOptional()
  @IsString()
  sortBy?: string; // e.g., 'createdAt', 'name', etc.

  @IsOptional()
  @IsIn(['asc', 'desc'])
  order: 'asc' | 'desc' = 'desc';
}

//This DTO (Data Transfer Object) is designed to handle common query parameters for pagination, searching, and sorting in API requests.
// It uses class-validator decorators to enforce validation rules on the incoming query parameters, ensuring that they meet the expected formats and constraints.
// The use of class-transformer allows for automatic transformation of query parameters into the appropriate types, facilitating seamless validation and processing of the data.

// @Type(() => Number) is used to ensure that the incoming query parameters are transformed into numbers before validation.
// This is important because query parameters are typically received as strings, and without this transformation, the validation decorators like @IsInt() and @Min() would not work correctly.
// By using @Type(() => Number), we ensure that the page and pageSize properties are treated as numbers during validation, allowing for proper validation of their values.

// @IsIn() is used to ensure that the order property can only accept specific string values, in this case, 'asc' or 'desc'.
// This is important for sorting functionality, as it restricts the input to valid sorting orders and prevents invalid values from being processed.
// By using @IsIn(['asc', 'desc']), we ensure that the order property can only be set to either 'asc' for ascending order or 'desc' for descending order, which helps maintain data integrity and prevents potential errors in sorting logic.
