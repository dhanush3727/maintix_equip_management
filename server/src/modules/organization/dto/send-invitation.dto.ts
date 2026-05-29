import { Transform } from 'class-transformer';
import { IsEmail, IsInt, IsNotEmpty } from 'class-validator';

export class SendInvitationDto {
  @IsEmail()
  @IsNotEmpty()
  @Transform(({ value }: { value: string }) => {
    const result = value.trim().toLowerCase();
    return result;
  })
  email!: string;

  @IsInt()
  @IsNotEmpty()
  roleId!: number;

  @IsInt()
  @IsNotEmpty()
  departmentId!: number;
}
