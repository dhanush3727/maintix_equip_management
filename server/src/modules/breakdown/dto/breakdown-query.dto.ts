import { ApiPropertyOptional } from '@nestjs/swagger';
import { BreakdownSeverity, BreakdownStatus } from '@prisma/client';
import { IsEnum, IsOptional, IsString } from 'class-validator';
import { QueryDto } from '../../../common/dto/query.dto';

export class BreakdownQueryDto extends QueryDto {
  @ApiPropertyOptional({ example: 'Motor' })
  @IsString()
  @IsOptional()
  equipment?: string;

  @ApiPropertyOptional({ example: 'LOW' })
  @IsOptional()
  @IsEnum(BreakdownSeverity)
  severity?: BreakdownSeverity;

  @ApiPropertyOptional({ example: 'LOW' })
  @IsOptional()
  @IsEnum(BreakdownStatus)
  status?: BreakdownStatus;
}
