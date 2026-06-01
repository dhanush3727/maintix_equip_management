import { ApiProperty } from '@nestjs/swagger';
import { IsString, MinLength, IsNotEmpty, Matches } from 'class-validator';

export class AcceptInviteDto {
  @ApiProperty({
    example: 'invite_token_1234567890',
    description: 'The token sent to the user for accepting the invitation',
  })
  @IsString()
  @IsNotEmpty()
  token!: string;

  @ApiProperty({
    example: 'John Doe',
    description: 'The name of the user accepting the invitation',
  })
  @IsString()
  @IsNotEmpty()
  name!: string;

  @ApiProperty({
    example: 'Password@123',
    description:
      'The password for the user account. Must be at least 8 characters long and include at least one uppercase letter, one number, and one special character.',
  })
  @IsString()
  @MinLength(8)
  @Matches(/[A-Z]/, { message: 'Must contain at least one uppercase letter' })
  @Matches(/\d/, { message: 'Must contain at least one number' })
  @Matches(/[@$!%*?&]/, {
    message: 'Must contain at least one special character',
  })
  @IsNotEmpty()
  password!: string;
}
