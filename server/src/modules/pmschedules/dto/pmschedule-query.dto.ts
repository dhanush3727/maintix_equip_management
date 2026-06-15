import { ApiPropertyOptional } from '@nestjs/swagger';
import { QueryDto } from '../../../common/dto/query.dto';
import { IsEnum, IsOptional, IsString } from 'class-validator';
import { FrequencyType } from '@prisma/client';

export class PMScheduleQueryDto extends QueryDto {
  @ApiPropertyOptional()
  @IsString()
  @IsOptional()
  equipment?: string;

  @ApiPropertyOptional()
  @IsString()
  @IsOptional()
  template?: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsEnum(FrequencyType)
  frequencyType?: FrequencyType;
}
