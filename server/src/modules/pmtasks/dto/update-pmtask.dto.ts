import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsString } from 'class-validator';

export class UpdatePMTaskItemDto {
  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  actualValue!: string;
}
