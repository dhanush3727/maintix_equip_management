import { CompanySize, IndustryType } from '@prisma/client';
import { IsString, IsEnum, IsOptional } from 'class-validator';

export class UpdateOrganizationDto {
  @IsEnum(IndustryType)
  industryType!: IndustryType;

  @IsEnum(CompanySize)
  companySize!: CompanySize;

  @IsString()
  @IsOptional()
  country?: string;

  @IsString()
  @IsOptional()
  city?: string;
}
