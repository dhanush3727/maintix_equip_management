import { Type } from 'class-transformer';
import { ArrayNotEmpty, ArrayUnique, IsArray, IsInt } from 'class-validator';

export class UpdateRolesDto {
  @IsArray()
  @ArrayNotEmpty()
  @ArrayUnique()
  @Type(() => Number)
  @IsInt({ each: true }) // each true ensures that every element in the array is an integer
  roleIds!: number[];
}
