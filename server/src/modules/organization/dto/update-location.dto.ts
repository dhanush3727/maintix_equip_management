import { LocationType } from '@prisma/client';
import { IsEnum, IsOptional, IsString } from 'class-validator';

export class UpdateLocationDto {
  @IsString()
  @IsOptional()
  name?: string;

  @IsEnum(LocationType)
  @IsOptional()
  type?: LocationType;

  @IsString()
  @IsOptional()
  address?: string;
}
