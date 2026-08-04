import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { Transform, Type } from 'class-transformer';
import {
  ArrayNotEmpty,
  IsArray,
  IsInt,
  IsNotEmpty,
  IsOptional,
  IsPositive,
  IsString,
  ValidateNested,
} from 'class-validator';
import { CreateChecklistItemDto } from './create-checklistItem.dto';

export class CreateChecklistTemplateDto {
  @ApiProperty({ example: 'Checklist Template' })
  @IsString()
  @IsNotEmpty()
  @Transform(({ value }: { value: string }) => {
    if (typeof value !== 'string') return value;

    return value.trim().replace(/\s+/g, ' ');
  })
  name!: string;

  @ApiProperty({ example: 0 })
  @IsInt()
  @IsNotEmpty()
  @IsPositive()
  equipmentTypeId!: number;

  @ApiPropertyOptional({ example: 'Checklist template description' })
  @IsString()
  @IsOptional()
  description?: string;

  @ApiProperty()
  @IsArray()
  @ArrayNotEmpty()
  @ValidateNested({ each: true })
  @Type(() => CreateChecklistItemDto)
  items!: CreateChecklistItemDto[];
}

// @ValidateNested - Validate the objects inside this property using their own DTO rules.
