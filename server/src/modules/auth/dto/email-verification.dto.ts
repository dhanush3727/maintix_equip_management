import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsString } from 'class-validator';

export class EmailVerificationDto {
  @ApiProperty({
    example: 'verification_token_1234567890',
    description: 'The token sent to the user for email verification',
  })
  @IsString()
  @IsNotEmpty()
  token!: string;
}
