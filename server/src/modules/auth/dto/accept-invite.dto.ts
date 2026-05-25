import { IsString, MinLength, IsNotEmpty, Matches } from 'class-validator';

export class AcceptInviteDto {
  @IsString()
  @IsNotEmpty()
  token!: string;

  @IsString()
  @IsNotEmpty()
  name!: string;

  @MinLength(8)
  @Matches(/[A-Z]/, { message: 'Must contain at least one uppercase letter' })
  @Matches(/\d/, { message: 'Must contain at least one number' })
  @Matches(/[@$!%*?&]/, {
    message: 'Must contain at least one special character',
  })
  @IsNotEmpty()
  password!: string;
}
