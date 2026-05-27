import { LocationType } from '@prisma/client';
import { IsEnum, IsNotEmpty, IsString } from 'class-validator';

export class CreateLocationDto {
  @IsString()
  @IsNotEmpty()
  name!: string;

  @IsEnum(LocationType)
  type!: LocationType;

  @IsString()
  @IsNotEmpty()
  address!: string;
}
