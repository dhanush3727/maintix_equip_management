import { DepartmentType } from '@prisma/client';
import { Transform } from 'class-transformer';
import { IsEnum, IsNotEmpty, IsString } from 'class-validator';

export class CreateDepartmentDto {
  @IsString()
  @IsNotEmpty()
  @Transform(({ value }: { value: string }) => {
    if (typeof value !== 'string') return value;

    let result = value.trim().replace(/\s+/g, ' ');

    result = result.charAt(0).toUpperCase() + result.slice(1).toLowerCase();

    return result;
  })
  name!: string;

  @IsString()
  @IsNotEmpty()
  @Transform(({ value }: { value: string }) => {
    const result = value.trim().replace(/\s+/g, ' ').toUpperCase();

    return result;
  })
  code!: string;

  @IsNotEmpty()
  @IsEnum(DepartmentType)
  type!: DepartmentType;
}
