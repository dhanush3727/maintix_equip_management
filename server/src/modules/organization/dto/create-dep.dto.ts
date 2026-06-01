import { ApiProperty } from '@nestjs/swagger';
import { DepartmentType } from '@prisma/client';
import { Transform } from 'class-transformer';
import { IsEnum, IsNotEmpty, IsString } from 'class-validator';

// the ApiProperty decorator is used to provide metadata for Swagger documentation, describing the properties of the
// DTO (Data Transfer Object) that will be used in API requests and responses.

export class CreateDepartmentDto {
  @ApiProperty({
    example: 'Human Resources',
    description: 'The name of the department',
  })
  @IsString()
  @IsNotEmpty()
  @Transform(({ value }: { value: string }) => {
    if (typeof value !== 'string') return value;

    let result = value.trim().replace(/\s+/g, ' ');

    result = result.charAt(0).toUpperCase() + result.slice(1).toLowerCase();

    return result;
  })
  name!: string;

  @ApiProperty({
    example: 'HR',
    description: 'The code of the department',
  })
  @IsString()
  @IsNotEmpty()
  @Transform(({ value }: { value: string }) => {
    const result = value.trim().replace(/\s+/g, ' ').toUpperCase();

    return result;
  })
  code!: string;

  @ApiProperty({
    example: 'MECHANICAL',
    description: 'The type of the department',
  })
  @IsNotEmpty()
  @IsEnum(DepartmentType)
  type!: DepartmentType;
}
