import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { IsNotEmpty, IsOptional, IsString } from 'class-validator';

export class UpdatePMTaskItemDto {
  @ApiProperty({ example: 'Give the result of the list' })
  @IsString()
  @IsNotEmpty()
  actualValue!: string;

  @ApiPropertyOptional({ example: 'string' })
  @IsString()
  @IsOptional()
  @IsNotEmpty()
  remarks?: string;
}
