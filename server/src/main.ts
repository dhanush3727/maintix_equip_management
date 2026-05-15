import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import cookieParser from 'cookie-parser';
import { ConfigService } from '@nestjs/config';
import { BadRequestException, ValidationPipe } from '@nestjs/common';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  // Enable shutdown hooks to gracefully handle application termination signals.
  app.enableShutdownHooks();

  const configService = app.get(ConfigService);
  const port = configService.get<number>('app.port') || 3000;

  app.use(cookieParser());

  app.enableCors({
    origin: true,
    credetials: true,
  });

  app.setGlobalPrefix('api');

  app.useGlobalPipes(
    new ValidationPipe({
      whitelist: true, // Removes fields not defined in DTO
      forbidNonWhitelisted: true, // Throws error if extra fields exist
      transform: true, // Converts request data types automatically
      // Format the validation errors to return a more user-friendly response
      exceptionFactory: (errors) => {
        const formattedErrors = errors.map((error) => ({
          field: error.property,
          errors: Object.values(error.constraints || {}),
        }));

        return new BadRequestException({
          message: 'Validation Failed',
          errors: formattedErrors,
        });
      },
    }),
  );

  await app.listen(port);
  console.log(`Server is running port ${port}`);
}
bootstrap();
