import { IsNotEmpty, IsString, MinLength, Matches } from 'class-validator';

export class ResetPasswordDto {
  @IsString()
  @IsNotEmpty()
  token!: string;

  @MinLength(8)
  @Matches(/[A-Z]/, { message: 'Must contain at least one uppercase letter' })
  @Matches(/\d/, { message: 'Must contain at least one number' })
  @Matches(/[@$!%*?&]/, {
    message: 'Must contain at least one special character',
  })
  @IsNotEmpty()
  password!: string;
}
