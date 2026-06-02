import { ApiPropertyOptional } from '@nestjs/swagger';
import { QueryDto } from '../../../common/dto/query.dto';
import { IsEnum, IsOptional } from 'class-validator';
import { LocationType } from '@prisma/client';

export class LocationQueryDto extends QueryDto {
  @ApiPropertyOptional()
  @IsOptional()
  @IsEnum(LocationType)
  type?: LocationType;
}
