import { INestApplication } from '@nestjs/common';
import request from 'supertest';
import { describe, it, beforeAll, afterAll, expect } from '@jest/globals';
import { createApp } from '../../utils/create-app';
import { LoginResponse } from '../../test.types';

describe('Create Location E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  afterAll(async () => {
    await app.close();
  });

  it('should create location', async () => {
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

    const locPayload = {
      name: 'Warehouse 2',
      address: '73 ammankudi',
      type: 'WAREHOUSE',
    };

    const res = await request(server)
      .post('/api/organization/location')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(locPayload);

    expect(res.status).toBe(201);
  });

  it('should fail for exist location', async () => {
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

    const locPayload = {
      name: 'Plant A',
      address: '73 ammankudi',
      type: 'PLANT',
    };

    const res = await request(server)
      .post('/api/organization/location')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(locPayload);

    expect(res.status).toBe(400);
  });

  it('should fail for without authorization', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const locPayload = {
      name: 'Plant A',
      address: '73 ammankudi',
      type: 'PLANT',
    };

    const res = await request(server)
      .post('/api/organization/location')
      .send(locPayload)
      .expect(401);

    expect(res.body).toEqual({
      statusCode: 401,
      message: 'Unauthorized',
    });
  });

  it('should fail for invalid enum', async () => {
    const payload = {
      email: `test@gmail.com`,
      password: 'Password@123',
    };

    const server = app.getHttpServer() as Parameters<typeof request>[0];
    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const locPayload = {
      name: 'Warehouse 1',
      address: '73 ammankudi',
      type: 'any house',
    };

    const res = await request(server)
      .post('/api/organization/location')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(locPayload)
      .expect(400);

    expect(res.status).toBe(400);
  });
});
