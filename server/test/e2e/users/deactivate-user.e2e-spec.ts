import { afterAll, beforeAll, describe, expect, it } from '@jest/globals';
import { INestApplication } from '@nestjs/common';
import { createApp } from '../../utils/create-app';
import request from 'supertest';
import { ApiResponse, LoginResponse } from '../../test.types';
import { User } from '@prisma/client';

//#region Deactivate user
describe('Deactivate User E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  afterAll(async () => {
    await app.close();
  });

  it('should deactivate user', async () => {
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
      .patch('/api/users/orgs/user/4/deactivate')
      .set('Authorization', `Bearer ${accessToken}`)
      .expect(200);

    const body = res.body as ApiResponse<User>;
    expect(body.success).toBe(true);
    expect(body.message).toBe('User deactivated successfully');
  });

  it('should fail for user not found', async () => {
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
      .patch('/api/users/orgs/user/5/deactivate')
      .set('Authorization', `Bearer ${accessToken}`)
      .expect(404);

    const body = res.body as ApiResponse<User>;
    expect(body.success).toBe(false);
    expect(body.message).toBe('User not found');
  });

  it('should fail for user already deactivated', async () => {
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
      .patch('/api/users/orgs/user/4/deactivate')
      .set('Authorization', `Bearer ${accessToken}`)
      .expect(400);

    const body = res.body as ApiResponse<User>;
    expect(body.success).toBe(false);
    expect(body.message).toBe('User already deactivated');
  });

  it('should fail for user deactivate yourself', async () => {
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
      .patch('/api/users/orgs/user/3/deactivate')
      .set('Authorization', `Bearer ${accessToken}`)
      .expect(403);

    const body = res.body as ApiResponse<User>;
    expect(body.success).toBe(false);
    expect(body.message).toBe('You cannot deactivate yourself');
  });
});
//#endregion

//#region Activate user
describe('Deactivate User E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  afterAll(async () => {
    await app.close();
  });

  it('should deactivate user', async () => {
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
      .patch('/api/users/orgs/user/4/activate')
      .set('Authorization', `Bearer ${accessToken}`)
      .expect(200);

    const body = res.body as ApiResponse<User>;
    expect(body.success).toBe(true);
    expect(body.message).toBe('User activated successfully');
  });

  it('should fail for user not found', async () => {
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
      .patch('/api/users/orgs/user/5/activate')
      .set('Authorization', `Bearer ${accessToken}`)
      .expect(404);

    const body = res.body as ApiResponse<User>;
    expect(body.success).toBe(false);
    expect(body.message).toBe('User not found');
  });

  it('should fail for user already deactivated', async () => {
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
      .patch('/api/users/orgs/user/4/activate')
      .set('Authorization', `Bearer ${accessToken}`)
      .expect(400);

    const body = res.body as ApiResponse<User>;
    expect(body.success).toBe(false);
    expect(body.message).toBe('User already active');
  });
});
//#endregion
