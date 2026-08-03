import { ApiPropertyOptional } from '@nestjs/swagger';
import { Transform, Type } from 'class-transformer';
import {
  IsDate,
  IsInt,
  IsOptional,
  IsPositive,
  IsString,
} from 'class-validator';

export class UpdateEquipmentDto {
  @ApiPropertyOptional({ example: 'Pump' })
  @IsString()
  @IsOptional()
  @Transform(({ value }: { value: string }) => {
    if (typeof value !== 'string') return value;

    let result = value.trim().replace(/\s+/g, ' ');

    result = result.charAt(0).toUpperCase() + result.slice(1).toLowerCase();

    return result;
  })
  name?: string;

  @ApiPropertyOptional({ example: 'EQ-1001' })
  @IsString()
  @IsOptional()
  @Transform(({ value }: { value: string }) => {
    if (typeof value !== 'string') return value;

    const result = value.trim().replace(/\s+/g, '').toUpperCase();

    return result;
  })
  code?: string;

  @ApiPropertyOptional({ example: 'E1' })
  @Transform(({ value }: { value: string }) => value.trim().replace(/\s+/g, ''))
  @IsString()
  @IsOptional()
  serialNumber?: string;

  @ApiPropertyOptional({ example: 0 })
  @IsInt()
  @IsOptional()
  @IsPositive()
  equipmentTypeId?: number;

  @ApiPropertyOptional({ example: 0 })
  @IsInt()
  @IsOptional()
  @IsPositive()
  locationId?: number;

  @ApiPropertyOptional({ example: 0 })
  @IsInt()
  @IsOptional()
  @IsPositive()
  departmentId?: number;

  @ApiPropertyOptional({ example: '2026-07-01' })
  @Type(() => Date)
  @IsDate()
  @IsOptional()
  installedDate?: Date;

  @ApiPropertyOptional({ example: '2026-07-01' })
  @Type(() => Date)
  @IsDate()
  @IsOptional()
  warrantyExpiry?: Date;

  @ApiPropertyOptional({ example: 'Manufacturer' })
  @Transform(({ value }: { value: string }) => value.trim().replace(/\s+/g, ''))
  @IsString()
  @IsOptional()
  manufacturer?: string;

  @ApiPropertyOptional({ example: 'Model' })
  @Transform(({ value }: { value: string }) => value.trim().replace(/\s+/g, ''))
  @IsString()
  @IsOptional()
  model?: string;
}
