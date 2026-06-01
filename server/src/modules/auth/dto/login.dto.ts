import { ApiProperty } from '@nestjs/swagger';
import { IsEmail, IsNotEmpty, IsOptional } from 'class-validator';

export class LoginDto {
  @ApiProperty({
    example: 'user@example.com',
    description: 'The email address of the user',
  })
  @IsEmail()
  @IsNotEmpty()
  email!: string;

  @ApiProperty({
    example: 'Password@123',
    description: 'The password of the user',
  })
  @IsNotEmpty()
  password!: string;

  @ApiProperty({
    example: 'Device Info',
    description: 'Optional device information',
    required: false,
  })
  @IsOptional()
  deviceInfo?: string;
}
