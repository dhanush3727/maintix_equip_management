import { ApiProperty } from '@nestjs/swagger';
import { LocationType } from '@prisma/client';
import { IsEnum, IsNotEmpty, IsString } from 'class-validator';

export class CreateLocationDto {
  @ApiProperty({
    example: 'Main Warehouse',
    description: 'The name of the location',
  })
  @IsString()
  @IsNotEmpty()
  name!: string;

  @ApiProperty({
    example: 'WAREHOUSE',
    description: 'The type of the location',
  })
  @IsNotEmpty()
  @IsEnum(LocationType)
  type!: LocationType;

  @ApiProperty({
    example: '123 Main St, Anytown, USA',
    description: 'The address of the location',
  })
  @IsString()
  @IsNotEmpty()
  address!: string;
}
