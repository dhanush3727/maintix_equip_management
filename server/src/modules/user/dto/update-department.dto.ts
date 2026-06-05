import { ApiProperty } from '@nestjs/swagger';
import { IsInt, IsNotEmpty, IsPositive } from 'class-validator';

export class UpdateDepartmentDto {
  @ApiProperty({ example: 0 })
  @IsInt()
  @IsNotEmpty()
  @IsPositive({ each: true })
  departmentId!: number;
}
