import { INestApplication, ValidationPipe } from '@nestjs/common';
import { Test, TestingModule } from '@nestjs/testing';
import { AppModule } from '../../src/app.module';
import { HttpExceptionFilter } from '../../src/common/filters/http-exception.filter';
import { ResponseInterceptor } from '../../src/common/interceptors/response.interceptor';

export async function createApp() {
  // Create testing module
  // It will create NestJS dependency graph , includes: controller, services, guards, prisma, everything
  const moduleFixture: TestingModule = await Test.createTestingModule({
    imports: [AppModule], // it loads entire app
  }).compile();

  // Define the app variable to hold the Nest application instance
  // Create nest app instance
  const app: INestApplication = moduleFixture.createNestApplication();

  // Apply the prefix for this app instance
  app.setGlobalPrefix('api');

  // Apply global validation pipe
  app.useGlobalPipes(
    new ValidationPipe({
      whitelist: true,
      forbidNonWhitelisted: true,
      transform: true,
    }),
  );

  app.useGlobalFilters(new HttpExceptionFilter());
  app.useGlobalInterceptors(new ResponseInterceptor());

  await app.init(); // Initialize the app before running the tests

  return app;
}
