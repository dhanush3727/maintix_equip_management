import { ApiPropertyOptional, ApiResponseProperty } from '@nestjs/swagger';
import { QueryDto } from '../../../common/dto/query.dto';
import { IsEnum, IsOptional, IsString } from 'class-validator';
import { EquipmentStatus } from '@prisma/client';

export class EquipmentQueryDto extends QueryDto {
  @ApiResponseProperty()
  @IsOptional()
  @IsEnum(EquipmentStatus)
  status?: EquipmentStatus;

  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  department?: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  location?: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  type?: string;
}
