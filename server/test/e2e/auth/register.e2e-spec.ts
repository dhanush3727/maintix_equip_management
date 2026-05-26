import { INestApplication } from '@nestjs/common';
import request from 'supertest';
import { describe, it, expect, beforeAll, afterAll } from '@jest/globals';
import { createApp } from '../../utils/create-app';

// This is an end-to-end test for the registration endpoint of the authentication module.
describe('Register E2E', () => {
  let app: INestApplication; // Define the app variable to hold the Nest application instance

  // Set up the testing environment before running the tests
  // in this case we create a app instance before run every tests
  beforeAll(async () => {
    app = await createApp();
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
    expect(res.body).toHaveProperty('data');
  });

  it('should fail if email already exists', async () => {
    const payload = {
      companyName: 'Test Company',
      name: 'Test User',
      email: `test@gmail.com`,
      password: 'Password@123',
    };

    const server = app.getHttpServer() as Parameters<typeof request>[0];
    const res = await request(server).post('/api/auth/register').send(payload);
    expect(res.status).toBe(409);
    expect(res.body).toHaveProperty('message');
  });

  it('should fail for invalid email', async () => {
    const payload = {
      companyName: 'Test Company',
      name: 'Test User',
      email: `test${Date.now()}.com`,
      password: 'Password@123',
    };

    const server = app.getHttpServer() as Parameters<typeof request>[0];
    const res = await request(server).post('/api/auth/register').send(payload);
    expect(res.status).toBe(400);
  });

  it('should fail for weak password', async () => {
    const payload = {
      companyName: 'Test Company',
      name: 'Test User',
      email: `test${Date.now()}.com`,
      password: '1234',
    };

    const server = app.getHttpServer() as Parameters<typeof request>[0];
    const res = await request(server).post('/api/auth/register').send(payload);
    expect(res.status).toBe(400);
  });

  it('should fail if name is missing', async () => {
    const payload = {
      companyName: 'Test Company',
      email: `test${Date.now()}.com`,
      password: '1234',
    };

    const server = app.getHttpServer() as Parameters<typeof request>[0];
    const res = await request(server).post('/api/auth/register').send(payload);
    expect(res.status).toBe(400);
  });
});
