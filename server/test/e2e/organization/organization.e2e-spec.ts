import { INestApplication } from '@nestjs/common';
import request from 'supertest';
import { describe, it, expect, beforeAll, afterAll } from '@jest/globals';
import { createApp } from '../../utils/create-app';
import { CompanySize, IndustryType } from '@prisma/client';

interface LoginResponse {
  data: {
    user: {
      id: number;
      name: string;
      email: string;
    };
    accessToken: string;
  };
}

describe('Create Organization Profile E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  // Clean up after all tests have run
  afterAll(async () => {
    // close the app after test
    await app.close();
  });

  it('should create organization profile', async () => {
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
      industryType: IndustryType.GENERAL,
      companySize: CompanySize.ENTERPRISE,
      country: 'Austrila',
      city: 'Sydney',
    };

    const res = await request(server)
      .post('/api/organization')
      .send(orgPayload)
      .set('Authorization', `Bearer ${accessToken}`);

    expect(res.status).toBe(200);
  });

  it('should fail for without token', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];
    const res = await request(server)
      .post('/api/organization')
      .send({ country: 'India' });

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
      industryType: 'General',
      companySize: 'small',
      country: 'Austrila',
      city: 'Sydney',
    };

    const res = await request(server)
      .post('/api/organization')
      .send(orgPayload)
      .set('Authorization', `Bearer ${accessToken}`);

    expect(res.status).toBe(400);
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
      .post('/api/organization')
      .set('Authorization', `Bearer ${accessToken}`)
      .attach('logo', 'test/spanner.png')
      .field('industryType', IndustryType.GENERAL)
      .field('companySize', CompanySize.ENTERPRISE);

    expect(res.status).toBe(200);
  });
});
