import { ApiProperty } from '@nestjs/swagger';
import { CompanySize, IndustryType } from '@prisma/client';
import { IsString, IsEnum, IsOptional } from 'class-validator';

export class CreateOrganizationDto {
  @ApiProperty({
    example: 'Acme Corporation',
    description: 'The name of the organization',
  })
  @IsString()
  name!: string;

  @ApiProperty({
    example: 'TECHNOLOGY',
    description: 'The industry type of the organization',
  })
  @IsEnum(IndustryType)
  industryType!: IndustryType;

  @ApiProperty({
    example: 'LARGE',
    description: 'The size of the organization',
  })
  @IsEnum(CompanySize)
  companySize!: CompanySize;

  @ApiProperty({
    example: 'India',
    description: 'The country where the organization is located',
  })
  @IsString()
  @IsOptional()
  country?: string;

  @ApiProperty({
    example: 'Tamil Nadu',
    description: 'The city where the organization is located',
  })
  @IsString()
  @IsOptional()
  city?: string;
}
