import { afterAll, beforeAll, describe, expect, it } from '@jest/globals';
import { INestApplication } from '@nestjs/common';
import request from 'supertest';
import { createApp } from '../../utils/create-app';
import { ApiResponse, LoginResponse } from '../../test.types';
import { Equipment } from '@prisma/client';

describe('Get Equipments E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  afterAll(async () => {
    await app.close();
  });

  it('should get the equipments', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'dhanush7825@gmail.com',
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);
    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const res = await request(server)
      .get('/api/equipment')
      .set('Authorization', `Bearer ${accessToken}`)
      .expect(200);
    const body = res.body as ApiResponse<Equipment>;

    expect(body.success).toBe(true);
  });

  it('should get the equipments with page & limit', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'dhanush7825@gmail.com',
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);
    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const res = await request(server)
      .get('/api/equipment?page=2&limit=5')
      .set('Authorization', `Bearer ${accessToken}`)
      .expect(200);
    const body = res.body as ApiResponse<Equipment>;

    expect(body.success).toBe(true);
  });

  it('should get the equipments search with name', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'dhanush7825@gmail.com',
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);
    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const res = await request(server)
      .get('/api/equipment?search=screw')
      .set('Authorization', `Bearer ${accessToken}`)
      .expect(200);
    const body = res.body as ApiResponse<Equipment>;

    expect(body.success).toBe(true);
  });

  it('should get the equipments search with code', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'dhanush7825@gmail.com',
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);
    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const res = await request(server)
      .get('/api/equipment?search=eq-10')
      .set('Authorization', `Bearer ${accessToken}`)
      .expect(200);
    const body = res.body as ApiResponse<Equipment>;

    expect(body.success).toBe(true);
  });

  it('should get the equipments srotBy', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'dhanush7825@gmail.com',
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);
    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const res = await request(server)
      .get('/api/equipment?sortBy=name')
      .set('Authorization', `Bearer ${accessToken}`)
      .expect(200);
    const body = res.body as ApiResponse<Equipment>;

    expect(body.success).toBe(true);
  });

  it('should fail for sortBy', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'dhanush7825@gmail.com',
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);
    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const res = await request(server)
      .get('/api/equipment?sortBy=model')
      .set('Authorization', `Bearer ${accessToken}`)
      .expect(400);
    const body = res.body as ApiResponse<Equipment>;

    expect(body.success).toBe(false);
    expect(body.message).toBe('Invalid sortBy');
  });
});
