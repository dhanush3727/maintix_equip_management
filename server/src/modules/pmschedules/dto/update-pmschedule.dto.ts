import { ApiPropertyOptional } from '@nestjs/swagger';
import { FrequencyType } from '@prisma/client';
import { Type } from 'class-transformer';
import {
  IsDate,
  IsEnum,
  IsInt,
  IsNotEmpty,
  IsOptional,
  IsPositive,
} from 'class-validator';

export class UpdatePMScheduleDto {
  @ApiPropertyOptional({ example: 1 })
  @IsOptional()
  @IsNotEmpty()
  @IsEnum(FrequencyType)
  frequencyType?: FrequencyType;

  @ApiPropertyOptional({ example: 1 })
  @IsOptional()
  @IsNotEmpty()
  @IsInt()
  @IsPositive()
  interval?: number;

  @ApiPropertyOptional({ example: '2026-01-01' })
  @Type(() => Date)
  @IsDate()
  @IsNotEmpty()
  @IsOptional()
  startDate?: Date;

  @ApiPropertyOptional({ example: 1 })
  @IsOptional()
  @IsNotEmpty()
  @IsInt()
  @IsPositive()
  assignedTo?: number;
}
