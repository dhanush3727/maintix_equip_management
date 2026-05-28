import { afterAll, beforeAll, describe, expect, it } from '@jest/globals';
import { INestApplication } from '@nestjs/common';
import request from 'supertest';
import { createApp } from '../../utils/create-app';
import { ApiResponse, LoginResponse } from '../../test.types';

describe('Update Location E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  afterAll(async () => {
    await app.close();
  });

  it('should update location name', async () => {
    const payload = {
      email: 'dhanush7825@gmail.com',
      password: 'Dhanush@3727',
    };

    const server = app.getHttpServer() as Parameters<typeof request>[0];
    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const locPayload = {
      name: '   Plant    B    ',
    };

    const res = await request(server)
      .patch('/api/organization/location/2')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(locPayload)
      .expect(200);

    const body = res.body as ApiResponse<Location>;

    expect(body.success).toBe(true);
    expect(body.message).toBe('Location updated successfully!');
  });

  it('should update location type', async () => {
    const payload = {
      email: 'dhanush7825@gmail.com',
      password: 'Dhanush@3727',
    };

    const server = app.getHttpServer() as Parameters<typeof request>[0];
    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const locPayload = {
      type: 'PLANT',
    };

    const res = await request(server)
      .patch('/api/organization/location/2')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(locPayload)
      .expect(200);

    const body = res.body as ApiResponse<Location>;

    expect(body.success).toBe(true);
    expect(body.message).toBe('Location updated successfully!');
  });

  it('should update location address', async () => {
    const payload = {
      email: 'dhanush7825@gmail.com',
      password: 'Dhanush@3727',
    };

    const server = app.getHttpServer() as Parameters<typeof request>[0];
    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const locPayload = {
      address: '   no 69 daniel road    ',
    };

    const res = await request(server)
      .patch('/api/organization/location/2')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(locPayload)
      .expect(200);

    const body = res.body as ApiResponse<Location>;

    expect(body.success).toBe(true);
    expect(body.message).toBe('Location updated successfully!');
  });

  it('should fail for without token', async () => {
    const locPayload = {
      address: '   no 69 daniel road    ',
    };

    const server = app.getHttpServer() as Parameters<typeof request>[0];
    await request(server)
      .patch('/api/organization/location/2')
      .send(locPayload)
      .expect(401);
  });

  it('should fail for invalid type', async () => {
    const payload = {
      email: 'dhanush7825@gmail.com',
      password: 'Dhanush@3727',
    };

    const server = app.getHttpServer() as Parameters<typeof request>[0];
    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const locPayload = {
      type: 'plant',
    };

    const res = await request(server)
      .patch('/api/organization/location/2')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(locPayload)
      .expect(400);

    const body = res.body as ApiResponse<Location>;

    expect(body.success).toBe(false);
  });

  it('should fail for not found', async () => {
    const payload = {
      email: 'dhanush7825@gmail.com',
      password: 'Dhanush@3727',
    };

    const server = app.getHttpServer() as Parameters<typeof request>[0];
    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const locPayload = {
      type: 'PLANT',
    };

    const res = await request(server)
      .patch('/api/organization/location/10')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(locPayload)
      .expect(404);

    const body = res.body as ApiResponse<Location>;

    expect(body.success).toBe(false);
    expect(body.message).toBe('Location not found');
  });

  it('should fail for location already exist', async () => {
    const payload = {
      email: 'dhanush7825@gmail.com',
      password: 'Dhanush@3727',
    };

    const server = app.getHttpServer() as Parameters<typeof request>[0];
    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const locPayload = {
      name: 'Plant A',
    };

    const res = await request(server)
      .patch('/api/organization/location/2')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(locPayload)
      .expect(400);

    const body = res.body as ApiResponse<Location>;

    expect(body.success).toBe(false);
    expect(body.message).toBe('Location already exist');
  });
});
