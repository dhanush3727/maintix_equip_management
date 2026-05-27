import { CompanySize, IndustryType } from '@prisma/client';
import { IsString, IsEnum, IsOptional } from 'class-validator';

export class CreateOrganizationDto {
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
