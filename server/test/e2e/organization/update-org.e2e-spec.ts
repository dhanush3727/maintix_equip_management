import { INestApplication } from '@nestjs/common';
import request from 'supertest';
import { describe, it, expect, beforeAll, afterAll } from '@jest/globals';
import { createApp } from '../../utils/create-app';
import { LoginResponse } from '../../test.types';

describe('Update Organization E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  // Clean up after all tests have run
  afterAll(async () => {
    // close the app after test
    await app.close();
  });

  it('should update organization', async () => {
    const payload = {
      email: `test@gmail.com`,
      password: 'Password@123',
    };

    const server = app.getHttpServer() as Parameters<typeof request>[0];
    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const orgPayload = {
      name: '   new company   ',
      city: '   Madurai   ',
    };

    const res = await request(server)
      .patch('/api/organization')
      .send(orgPayload)
      .set('Authorization', `Bearer ${accessToken}`);

    expect(res.status).toBe(200);
    expect(res.body).toHaveProperty('message');
  });

  it('should fail for without token', async () => {
    const payload = {
      name: 'Test company',
    };
    const server = app.getHttpServer() as Parameters<typeof request>[0];
    const res = await request(server).patch('/api/organization').send(payload);

    expect(res.status).toBe(401);
  });

  it('should fail for invalid enum', async () => {
    const payload = {
      email: `test@gmail.com`,
      password: 'Password@123',
    };

    const server = app.getHttpServer() as Parameters<typeof request>[0];
    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const orgPayload = {
      industryType: 'New Industry',
      companySize: 'Big',
    };

    const res = await request(server)
      .patch('/api/organization')
      .send(orgPayload)
      .set('Authorization', `Bearer ${accessToken}`);

    expect(res.status).toBe(400);
    expect(res.body).toHaveProperty('message');
  });

  it('should upload file', async () => {
    const payload = {
      email: `test@gmail.com`,
      password: 'Password@123',
    };

    const server = app.getHttpServer() as Parameters<typeof request>[0];
    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const res = await request(server)
      .patch('/api/organization')
      .set('Authorization', `Bearer ${accessToken}`)
      .attach('logo', 'test/fox.jpg');

    expect(res.status).toBe(200);
  });
});
