import { CompanySize, IndustryType } from '@prisma/client';
import { IsString, IsEnum, IsOptional } from 'class-validator';

export class UpdateOrganizationDto {
  @IsString()
  @IsOptional()
  name?: string;

  @IsEnum(IndustryType)
  @IsOptional()
  industryType?: IndustryType;

  @IsEnum(CompanySize)
  @IsOptional()
  companySize?: CompanySize;

  @IsString()
  @IsOptional()
  country?: string;

  @IsString()
  @IsOptional()
  city?: string;
}
