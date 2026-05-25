import { Test, TestingModule } from '@nestjs/testing';
import { INestApplication } from '@nestjs/common';
import request from 'supertest';
import { AppModule } from '../../../src/app.module';
import { describe, it, expect, beforeAll, afterAll } from '@jest/globals';
import { ValidationPipe } from '@nestjs/common';

// This is an end-to-end test for the registration endpoint of the authentication module.
describe('Register E2E', () => {
  let app: INestApplication; // Define the app variable to hold the Nest application instance

  // Set up the testing environment before running the tests
  beforeAll(async () => {
    // Create testing module
    const moduleFixture: TestingModule = await Test.createTestingModule({
      imports: [AppModule], // it loads entire app
    }).compile();

    // Create nest app instance
    app = moduleFixture.createNestApplication();

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

    await app.init(); // Initialize the app before running the tests
  });

  // Clean up after all tests have run
  afterAll(async () => {
    // close the app after test
    await app.close();
  });

  it('should register a new user', async () => {
    // Test payload
    const payload = {
      companyName: 'Test Company',
      name: 'Test User',
      email: `test${Date.now()}@gmail.com`,
      password: 'Password@123',
    };

    // Get the underlying HTTP server from the Nest application instance to make requests against it
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    // Make a POST request to the registration endpoint with the test payload and check the response
    const res = await request(server).post('/api/auth/register').send(payload);

    // Assert that the response status is 201 (Created) and that the response body contains a message property
    expect(res.status).toBe(201);

    // Check if the response body has a message property, which indicates successful registration
    expect(res.body).toHaveProperty('message');
  });
});
