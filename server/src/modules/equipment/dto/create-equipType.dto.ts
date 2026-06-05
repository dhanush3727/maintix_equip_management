import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { Transform } from 'class-transformer';
import { IsNotEmpty, IsOptional, IsString } from 'class-validator';

export class CreateEquipTypeDto {
  @ApiProperty({ example: 'Mechanical' })
  @IsString()
  @IsNotEmpty()
  @Transform(({ value }: { value: string }) => {
    if (typeof value !== 'string') return value;

    let result = value.trim().replace(/\s+/g, ' ');

    result = result.charAt(0).toUpperCase() + result.slice(1).toLowerCase();

    return result;
  })
  name!: string;

  @ApiPropertyOptional({ example: 'CIVIL' })
  @IsString()
  @IsOptional()
  @IsNotEmpty()
  @Transform(({ value }: { value: string }) => {
    if (typeof value !== 'string') return value;

    let result = value.trim().replace(/\s+/g, ' ');

    result = result.toUpperCase();

    return result;
  })
  code?: string;

  @ApiPropertyOptional({ example: 'Equipment type description' })
  @IsString()
  @IsOptional()
  @IsNotEmpty()
  description?: string;
}
