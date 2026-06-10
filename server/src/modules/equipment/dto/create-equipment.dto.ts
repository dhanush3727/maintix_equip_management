import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { Transform, Type } from 'class-transformer';
import {
  IsDate,
  IsInt,
  IsNotEmpty,
  IsOptional,
  IsPositive,
  IsString,
} from 'class-validator';

export class CreateEquipmentDto {
  @ApiProperty({ example: 'Pump' })
  @IsString()
  @IsNotEmpty()
  @Transform(({ value }: { value: string }) => {
    if (typeof value !== 'string') return value;

    let result = value.trim().replace(/\s+/g, ' ');

    result = result.charAt(0).toUpperCase() + result.slice(1).toLowerCase();

    return result;
  })
  name!: string;

  @ApiProperty({ example: 'EQ-1001' })
  @IsString()
  @IsNotEmpty()
  @Transform(({ value }: { value: string }) => {
    if (typeof value !== 'string') return value;

    const result = value.trim().replace(/\s+/g, '').toUpperCase();

    return result;
  })
  code!: string;

  @ApiPropertyOptional({ example: 'E1' })
  @Transform(({ value }: { value: string }) => value.trim().replace(/\s+/g, ''))
  @IsString()
  @IsOptional()
  @IsNotEmpty()
  serialNumber?: string;

  @ApiProperty({ example: 0 })
  @IsInt()
  @IsNotEmpty()
  @IsPositive()
  equipmentTypeId!: number;

  @ApiPropertyOptional({ example: 0 })
  @IsInt()
  @IsNotEmpty()
  @IsPositive()
  locationId!: number;

  @ApiPropertyOptional({ example: 0 })
  @IsInt()
  @IsNotEmpty()
  @IsPositive()
  departmentId!: number;

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
  @IsNotEmpty()
  manufacturer?: string;

  @ApiPropertyOptional({ example: 'Model' })
  @Transform(({ value }: { value: string }) => value.trim().replace(/\s+/g, ''))
  @IsString()
  @IsOptional()
  @IsNotEmpty()
  model?: string;
}
