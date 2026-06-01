import { ApiProperty } from '@nestjs/swagger';
import {
  IsEmail,
  IsNotEmpty,
  MinLength,
  Matches,
  IsOptional,
} from 'class-validator';

export class RegisterDto {
  @ApiProperty({
    example: 'Acme Corporation',
    description: 'The name of the company the user is registering with',
  })
  @IsNotEmpty()
  companyName!: string;

  @ApiProperty({
    example: 'John Doe',
    description: 'The name of the user registering',
  })
  @IsNotEmpty()
  name!: string;

  @ApiProperty({
    example: 'user@example.com',
    description: 'The email address of the user',
  })
  @IsEmail()
  @IsNotEmpty()
  email!: string;

  @ApiProperty({
    example: 'Password@123',
    description:
      'The password for the user account. Must be at least 8 characters long and include at least one uppercase letter, one number, and one special character.',
  })
  @MinLength(8)
  @Matches(/[A-Z]/, { message: 'Must contain at least one uppercase letter' })
  @Matches(/\d/, { message: 'Must contain at least one number' })
  @Matches(/[@$!%*?&]/, {
    message: 'Must contain at least one special character',
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

// The "!" tells TypeScript:
// "This property will definitely be assigned later (by NestJS from request body)"
// Without this, TypeScript throws an error because the property is not initialized
