/* eslint-disable @typescript-eslint/no-unsafe-call */
import {
  IsEmail,
  IsNotEmpty,
  MinLength,
  Matches,
  IsOptional,
} from 'class-validator';

export class LoginDto {
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
