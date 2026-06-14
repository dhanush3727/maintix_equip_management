import { ApiProperty } from '@nestjs/swagger';
import { FrequencyType } from '@prisma/client';
import { Type } from 'class-transformer';
import { IsDate, IsEnum, IsInt, IsNotEmpty, IsPositive } from 'class-validator';

export class CreatePMScheduleDto {
  @ApiProperty({ example: 1 })
  @IsNotEmpty()
  @IsInt()
  @IsPositive()
  equipmentId!: number;

  @ApiProperty({ example: 1 })
  @IsNotEmpty()
  @IsInt()
  @IsPositive()
  templateId!: number;

  @ApiProperty({ example: 'DAILY' })
  @IsNotEmpty()
  @IsEnum(FrequencyType)
  frequencyType!: FrequencyType;

  @ApiProperty({ example: 2 })
  @IsNotEmpty()
  @IsInt()
  @IsPositive()
  interval!: number;

  @ApiProperty({ example: '2026-01-01' })
  @Type(() => Date)
  @IsDate()
  @IsNotEmpty()
  startDate!: Date;

  @ApiProperty({ example: '2026-01-01' })
  @Type(() => Date)
  @IsDate()
  @IsNotEmpty()
  nextDueDate!: Date;

  @ApiProperty({ example: 1 })
  @IsNotEmpty()
  @IsInt()
  @IsPositive()
  assignedTo!: number;
}
