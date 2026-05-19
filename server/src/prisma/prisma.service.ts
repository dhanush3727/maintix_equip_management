import { Injectable, OnModuleInit, OnModuleDestroy } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';
import { PrismaPg } from '@prisma/adapter-pg';

@Injectable()
// This is a custom PrismaService that extends the PrismaClient and implements the lifecycle hooks for NestJS modules.
export class PrismaService
  extends PrismaClient
  implements OnModuleInit, OnModuleDestroy
{
  constructor() {
    // Initialize the PrismaClient with the PostgreSQL adapter.
    const adapter = new PrismaPg(
      {
        connectionString: process.env.DATABASE_URL as string,
      },
      {
        schema: 'maintix',
      },
    );

    // Call the super constructor with the adapter and logging options.
    //The super is used to call the constructor of the parent class (PrismaClient) and pass the adapter and logging options to it.
    // The logging options specify that we want to log all queries, errors, warnings, and informational messages from Prisma.
    super({ adapter, log: ['query', 'error', 'warn', 'info'] });
  }

  async onModuleInit() {
    // Connect to the database when the module is initialized.
    await this.$connect();
  }

  async onModuleDestroy() {
    // Disconnect from the database when the module is destroyed.
    await this.$disconnect();
  }
}
