import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { ChecklistItemType } from '@prisma/client';
import { Transform } from 'class-transformer';
import {
  IsEnum,
  IsInt,
  IsNotEmpty,
  IsOptional,
  IsPositive,
  IsString,
  ValidateIf,
} from 'class-validator';

export class CreateChecklistItemDto {
  @ApiProperty({ example: 'Checklist name' })
  @IsString()
  @IsNotEmpty()
  @Transform(({ value }: { value: string }) => {
    if (typeof value !== 'string') return value;

    let result = value.trim().replace(/\s+/g, '');

    result = result.charAt(0).toUpperCase() + result.slice(1).toLowerCase();

    return result;
  })
  name!: string;

  @ApiProperty({ example: 0 })
  @IsInt()
  @IsNotEmpty()
  @IsPositive()
  order!: number;

  @ApiProperty({ example: 'TEXT' })
  @IsEnum(ChecklistItemType)
  @IsNotEmpty()
  type!: ChecklistItemType;

  @ApiPropertyOptional({ example: 'OK' })
  @ValidateIf(
    (data: CreateChecklistItemDto) => data.type === ChecklistItemType.SELECT,
  )
  @IsString()
  @IsOptional()
  @IsNotEmpty()
  @Transform(({ value }: { value: string }) => {
    if (typeof value !== 'string') return value;

    const result = value.trim().replace(/\s+/g, '').toUpperCase();

    return result;
  })
  expectedValue?: string;

  @ApiPropertyOptional({ example: 0 })
  @ValidateIf(
    (data: CreateChecklistItemDto) => data.type === ChecklistItemType.SELECT,
  )
  @IsInt()
  @IsOptional()
  @IsNotEmpty()
  @IsPositive()
  minValue?: string;

  @ApiPropertyOptional({ example: 0 })
  @IsInt()
  @IsOptional()
  @IsNotEmpty()
  @IsPositive()
  maxValue?: string;
}
