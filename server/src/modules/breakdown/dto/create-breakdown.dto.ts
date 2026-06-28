import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { BreakdownSeverity } from '@prisma/client';
import { Transform } from 'class-transformer';
import {
  IsEnum,
  IsInt,
  IsNotEmpty,
  IsOptional,
  IsPositive,
  IsString,
} from 'class-validator';

export class CreateBreakdownDto {
  @ApiProperty({ example: 'Machine failure' })
  @IsString()
  @IsNotEmpty()
  @Transform(({ value }: { value: string }) => {
    if (typeof value !== 'string') return value;

    return value.trim().replace(/\s+/g, ' ');
  })
  title!: string;

  @ApiPropertyOptional({ example: 'Description' })
  @IsString()
  @IsOptional()
  @IsNotEmpty()
  @Transform(({ value }: { value: string }) => {
    if (typeof value !== 'string') return value;

    return value.trim().replace(/\s+/g, ' ');
  })
  description?: string;

  @ApiProperty({ example: 'Severity' })
  @IsEnum(BreakdownSeverity)
  @IsNotEmpty()
  severity!: BreakdownSeverity;

  @ApiProperty({ example: 1 })
  @IsNotEmpty()
  @IsInt()
  @IsPositive()
  equipmentId!: number;
}
