import { ApiPropertyOptional } from '@nestjs/swagger';
import { QueryDto } from '../../../common/dto/query.dto';
import { IsEnum, IsOptional } from 'class-validator';
import { DepartmentType } from '@prisma/client';

export class DepartmentQueryDto extends QueryDto {
  @ApiPropertyOptional()
  @IsOptional()
  @IsEnum(DepartmentType)
  type?: DepartmentType;
}
