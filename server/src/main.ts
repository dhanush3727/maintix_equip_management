import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import cookieParser from 'cookie-parser';
import { ConfigService } from '@nestjs/config';
import { ValidationPipe } from '@nestjs/common';
import { HttpExceptionFilter } from './common/filters/http-exception.filter';
import { ResponseInterceptor } from './common/interceptors/response.interceptor';
import { SwaggerModule, DocumentBuilder } from '@nestjs/swagger';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  // Enable shutdown hooks to gracefully handle application termination signals.
  app.enableShutdownHooks();

  const configService = app.get(ConfigService);
  const port = configService.get<number>('app.port') || 5000;

  app.use(cookieParser());

  app.enableCors({
    origin: true,
    credentials: true,
  });

  app.setGlobalPrefix('api');

  app.useGlobalPipes(
    new ValidationPipe({
      whitelist: true, // Removes fields not defined in DTO
      forbidNonWhitelisted: true, // Throws error if extra fields exist
      transform: true, // Converts request data types automatically
      // Format the validation errors to return a more user-friendly response
      // exceptionFactory: (errors) => {
      //   const formattedErrors = errors.map((error) => ({
      //     field: error.property,
      //     errors: Object.values(error.constraints || {}),
      //   }));

      //   return new BadRequestException({
      //     message: 'Validation Failed',
      //     errors: formattedErrors,
      //   });
      // },
    }),
  );

  app.useGlobalFilters(new HttpExceptionFilter());
  app.useGlobalInterceptors(new ResponseInterceptor());

  // Set up Swagger documentation
  const config = new DocumentBuilder() // Use DocumentBuilder to create the Swagger configuration
    .setTitle('Maintix API') // Set the title of the API documentation
    .setDescription('Maintix API Docs') // Set the description of the API documentation
    .setVersion('1.0') // Set the version of the API
    .addBearerAuth() // Add Bearer authentication support to the API documentation
    .build(); // Build the Swagger configuration

  // Create the Swagger document using the configuration and the NestJS application instance
  const document = SwaggerModule.createDocument(app, config);

  // Set up the Swagger UI at the '/api' endpoint, allowing users to access the API documentation through a web interface
  SwaggerModule.setup('api', app, document);

  await app.listen(port);
  console.log(`Server is running on port ${port}`);
}
bootstrap();
