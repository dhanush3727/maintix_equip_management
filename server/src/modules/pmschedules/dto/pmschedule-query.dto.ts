import { ApiPropertyOptional } from '@nestjs/swagger';
import { QueryDto } from '../../../common/dto/query.dto';
import { IsDate, IsEnum, IsOptional, IsString } from 'class-validator';
import { FrequencyType } from '@prisma/client';
import { Type } from 'class-transformer';

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

  @ApiPropertyOptional()
  @Type(() => Date)
  @IsDate()
  @IsOptional()
  from?: Date;

  @ApiPropertyOptional()
  @Type(() => Date)
  @IsDate()
  @IsOptional()
  to?: Date;
}
