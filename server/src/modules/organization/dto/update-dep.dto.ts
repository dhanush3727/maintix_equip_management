import { ApiProperty } from '@nestjs/swagger';
import { DepartmentType } from '@prisma/client';
import { Transform } from 'class-transformer';
import { IsEnum, IsNotEmpty, IsOptional, IsString } from 'class-validator';

export class UpdateDepartmentDto {
  @ApiProperty({
    example: 'Human Resources',
    description: 'The name of the department',
    required: false,
  })
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  @Transform(({ value }: { value: string }) => {
    if (typeof value !== 'string') return value;

    let result = value.trim().replace(/\s+/g, ' ');

    result = result.charAt(0).toUpperCase() + result.slice(1).toLowerCase();

    return result;
  })
  name?: string;

  @ApiProperty({
    example: 'HR',
    description: 'The code of the department',
    required: false,
  })
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  @Transform(({ value }: { value: string }) => {
    if (typeof value !== 'string') return;

    const result = value.trim().replace(/\s+/g, ' ').toUpperCase();

    return result;
  })
  code?: string;

  @ApiProperty({
    example: 'HR',
    description: 'The type of the department',
    required: false,
  })
  @IsOptional()
  @IsNotEmpty()
  @IsEnum(DepartmentType)
  type?: DepartmentType;
}
