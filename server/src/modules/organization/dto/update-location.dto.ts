import { ApiProperty } from '@nestjs/swagger';
import { LocationType } from '@prisma/client';
import { IsEnum, IsOptional, IsString } from 'class-validator';

export class UpdateLocationDto {
  @ApiProperty({
    example: 'Headquarters',
    description: 'The name of the location',
    required: false,
  })
  @IsString()
  @IsOptional()
  name?: string;

  @ApiProperty({
    example: 'OFFICE',
    description: 'The type of the location',
    required: false,
  })
  @IsEnum(LocationType)
  @IsOptional()
  type?: LocationType;

  @ApiProperty({
    example: '456 Elm St, Othertown, USA',
    description: 'The address of the location',
    required: false,
  })
  @IsString()
  @IsOptional()
  address?: string;
}
