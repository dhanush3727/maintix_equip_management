import { IsEmail, IsNotEmpty, MinLength, Matches } from 'class-validator';

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
}
