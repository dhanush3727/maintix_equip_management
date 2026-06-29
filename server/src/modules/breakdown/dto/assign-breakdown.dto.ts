import { ApiProperty } from '@nestjs/swagger';
import { IsInt, IsNotEmpty } from 'class-validator';

export class AssignTechnicianDto {
  @ApiProperty({ example: 1 })
  @IsInt()
  @IsNotEmpty()
  assignedTo!: number;
}
