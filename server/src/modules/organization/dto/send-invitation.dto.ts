import { ApiProperty } from '@nestjs/swagger';
import { Transform } from 'class-transformer';
import { IsEmail, IsInt, IsNotEmpty } from 'class-validator';

export class SendInvitationDto {
  @ApiProperty({
    example: 'user@example.com',
    description: 'The email address of the invitee',
  })
  @IsEmail()
  @IsNotEmpty()
  @Transform(({ value }: { value: string }) => {
    if (typeof value !== 'string') return value;

    const result = value.trim().toLowerCase();
    return result;
  })
  email!: string;

  @ApiProperty({
    example: 1,
    description: 'The ID of the role assigned to the invitee',
  })
  @IsInt()
  @IsNotEmpty()
  roleId!: number;

  @ApiProperty({
    example: 1,
    description: 'The ID of the department the invitee belongs to',
  })
  @IsInt()
  @IsNotEmpty()
  departmentId!: number;
}
