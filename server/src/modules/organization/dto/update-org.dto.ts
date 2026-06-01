import { ApiProperty } from '@nestjs/swagger';
import { CompanySize, IndustryType } from '@prisma/client';
import { IsString, IsEnum, IsOptional } from 'class-validator';

export class UpdateOrganizationDto {
  @ApiProperty({
    example: 'Acme Corporation',
    description: 'The name of the organization',
    required: false,
  })
  @IsString()
  @IsOptional()
  name?: string;

  @ApiProperty({
    example: 'TECH',
    description: 'The industry type of the organization',
    required: false,
  })
  @IsEnum(IndustryType)
  @IsOptional()
  industryType?: IndustryType;

  @ApiProperty({
    example: 'SMALL',
    description: 'The size of the company',
    required: false,
  })
  @IsEnum(CompanySize)
  @IsOptional()
  companySize?: CompanySize;

  @ApiProperty({
    example: 'USA',
    description: 'The country of the organization',
    required: false,
  })
  @IsString()
  @IsOptional()
  country?: string;

  @ApiProperty({
    example: 'New York',
    description: 'The city of the organization',
    required: false,
  })
  @IsString()
  @IsOptional()
  city?: string;
}
