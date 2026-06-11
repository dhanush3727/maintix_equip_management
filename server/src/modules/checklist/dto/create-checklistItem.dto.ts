import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { ChecklistItemType } from '@prisma/client';
import { Transform } from 'class-transformer';
import {
  ArrayNotEmpty,
  ArrayUnique,
  IsArray,
  IsBoolean,
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

    let result = value.trim().replace(/\s+/g, ' ');

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
    (data: CreateChecklistItemDto) => data.type === ChecklistItemType.TEXT,
  )
  @IsString()
  @IsOptional()
  @IsNotEmpty()
  @Transform(({ value }: { value: string }) => {
    if (typeof value !== 'string') return value;

    const result = value.trim().toUpperCase();

    return result;
  })
  expectedValue?: string;

  @ApiPropertyOptional({ example: 0 })
  @ValidateIf(
    (data: CreateChecklistItemDto) => data.type === ChecklistItemType.NUMBER,
  )
  @IsInt()
  @IsOptional()
  @IsNotEmpty()
  @IsPositive()
  minValue?: number;

  @ApiPropertyOptional({ example: 0 })
  @ValidateIf(
    (data: CreateChecklistItemDto) => data.type === ChecklistItemType.NUMBER,
  )
  @IsInt()
  @IsOptional()
  @IsNotEmpty()
  @IsPositive()
  maxValue?: number;

  @ApiPropertyOptional({ example: ['Ok', 'Not Ok'] })
  @ValidateIf(
    (data: CreateChecklistItemDto) => data.type === ChecklistItemType.SELECT,
  )
  @IsArray()
  @ArrayNotEmpty()
  @ArrayUnique()
  @IsString({ each: true })
  @Transform(({ value }: { value: string[] }) => {
    if (!Array.isArray(value)) return value;

    // Normlize the value based on expected value
    // in expected value we use toUpperCase()
    //based on this we change all this in uppercase
    return value.map((v) =>
      typeof v === 'string' ? v.trim().toUpperCase() : v,
    );
  })
  options?: string[];

  @ApiPropertyOptional()
  @IsBoolean()
  @IsOptional()
  isRequired?: boolean;
}

// @ValidateIf - Run the validation rules on this field ONLY IF this condition is true.
