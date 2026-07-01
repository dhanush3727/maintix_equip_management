import { ApiProperty } from '@nestjs/swagger';
import { Transform } from 'class-transformer';
import { IsNotEmpty, IsString } from 'class-validator';

export class ResolveBreakdownDto {
  @ApiProperty({ example: 'Root Cause' })
  @IsString()
  @IsNotEmpty()
  @Transform(({ value }: { value: string }) => {
    if (typeof value !== 'string') return value;

    return value.trim().replace(/\s+/g, ' ');
  })
  rootCause!: string;
}
