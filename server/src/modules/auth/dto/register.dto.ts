import {
  IsEmail,
  IsNotEmpty,
  MinLength,
  Matches,
  IsOptional,
} from 'class-validator';

export class RegisterDto {
  @IsNotEmpty()
  companyName!: string;

  @IsNotEmpty()
  name!: string;

  @IsEmail()
  @IsNotEmpty()
  email!: string;

  @MinLength(8)
  @Matches(/[A-Z]/, { message: 'Must contain at least one uppercase letter' })
  @Matches(/\d/, { message: 'Must contain at least one number' })
  @Matches(/[@$!%*?&]/, {
    message: 'Must contain at least one special character',
  })
  @IsNotEmpty()
  password!: string;

  @IsOptional()
  deviceInfo?: string;
}

// The "!" tells TypeScript:
// "This property will definitely be assigned later (by NestJS from request body)"
// Without this, TypeScript throws an error because the property is not initialized
