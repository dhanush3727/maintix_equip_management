import { ApiPropertyOptional } from '@nestjs/swagger';
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
import { UpdateChecklistItemDto } from './update-checklistItem.dto';

export class UpdateChecklistTemplateDto {
  @ApiPropertyOptional({ example: 'Checklist Template' })
  @IsString()
  @IsOptional()
  @IsNotEmpty()
  @Transform(({ value }: { value: string }) => {
    if (typeof value !== 'string') return value;

    return value.trim().replace(/\s+/g, ' ');
  })
  name?: string;

  @ApiPropertyOptional({ example: 0 })
  @IsInt()
  @IsOptional()
  @IsNotEmpty()
  @IsPositive()
  equipmentTypeId?: number;

  @ApiPropertyOptional({ example: 'Checklist template description' })
  @IsString()
  @IsOptional()
  @IsNotEmpty()
  description?: string;

  @ApiPropertyOptional()
  @IsArray()
  @ArrayNotEmpty()
  @ValidateNested({ each: true })
  @Type(() => UpdateChecklistItemDto)
  items!: UpdateChecklistItemDto[];
}
