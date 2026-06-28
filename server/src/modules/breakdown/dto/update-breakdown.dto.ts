import { ApiPropertyOptional } from '@nestjs/swagger';
import { BreakdownSeverity } from '@prisma/client';
import { Transform } from 'class-transformer';
import { IsEnum, IsNotEmpty, IsOptional, IsString } from 'class-validator';

export class UpdateBreakdownDto {
  @ApiPropertyOptional({ example: 'Machine failure' })
  @IsString()
  @IsOptional()
  @IsNotEmpty()
  @Transform(({ value }: { value: string }) => {
    if (typeof value !== 'string') return value;

    return value.trim().replace(/\s+/g, ' ');
  })
  title?: string;

  @ApiPropertyOptional({ example: 'Description' })
  @IsString()
  @IsOptional()
  @IsNotEmpty()
  @Transform(({ value }: { value: string }) => {
    if (typeof value !== 'string') return value;

    return value.trim().replace(/\s+/g, ' ');
  })
  description?: string;

  @ApiPropertyOptional({ example: 'LOW' })
  @IsEnum(BreakdownSeverity)
  @IsNotEmpty()
  @IsOptional()
  severity?: BreakdownSeverity;
}
