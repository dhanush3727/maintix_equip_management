import { ApiPropertyOptional } from '@nestjs/swagger';
import { QueryDto } from '../../../common/dto/query.dto';
import { IsEnum, IsOptional, IsString } from 'class-validator';
import { RoleType } from '@prisma/client';

export class UserQueryDto extends QueryDto {
  @ApiPropertyOptional()
  @IsOptional()
  @IsEnum(RoleType)
  role?: RoleType;

  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  department?: string;
}
