import { ApiProperty } from '@nestjs/swagger';
import {
  IsNotEmpty,
  IsOptional,
  IsString,
  Matches,
  MinLength,
} from 'class-validator';

export class UpdatePasswordDto {
  @ApiProperty({ example: 'Password@123', required: false })
  @IsOptional()
  @IsString()
  @IsNotEmpty()
  currentPassword?: string;

  @ApiProperty({ example: 'Password@123', required: false })
  @IsOptional()
  @MinLength(8)
  @Matches(/[A-Z]/, {
    message: 'New password must contain at least one uppercase letter',
  })
  @Matches(/\d/, { message: 'New password must contain at least one number' })
  @Matches(/[@$!%*?&]/, {
    message: 'New password must contain at least one special character',
  })
  @IsNotEmpty()
  newPassword?: string;
}
