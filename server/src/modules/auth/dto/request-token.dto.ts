import { ApiProperty } from '@nestjs/swagger';
import { IsEmail, IsNotEmpty } from 'class-validator';

export class RequestTokenDto {
  @ApiProperty({
    example: 'user@example.com',
    description: 'The email address of the user requesting a token',
  })
  @IsEmail()
  @IsNotEmpty()
  email!: string;
}
