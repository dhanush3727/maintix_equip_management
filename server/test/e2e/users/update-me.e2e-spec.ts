import { afterAll, beforeAll, describe, expect, it } from '@jest/globals';
import { INestApplication } from '@nestjs/common';
import { createApp } from '../../utils/create-app';
import request from 'supertest';
import { ApiResponse, LoginResponse } from '../../test.types';
import { User } from '@prisma/client';

describe('Update me E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  afterAll(async () => {
    await app.close();
  });

  it('should update name', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'dhanush3727@gmail.com',
      password: 'Dhanush@7825',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const updatePayload = {
      name: 'Dhanush Kumar',
    };

    const res = await request(server)
      .patch('/api/users/me')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(updatePayload)
      .expect(200);

    const body = res.body as ApiResponse<User>;

    expect(body.success).toBe(true);
    expect(body.message).toBe('User updated successfully');
  });

  it('should update password', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'dhanush3727@gmail.com',
      password: 'Dhanush@7825',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const updatePayload = {
      currentPassword: 'Dhanush@7825',
      newPassword: 'Dhanush@3727',
    };

    const res = await request(server)
      .patch('/api/users/me')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(updatePayload)
      .expect(200);

    const body = res.body as ApiResponse<User>;

    expect(body.success).toBe(true);
    expect(body.message).toBe('User updated successfully');
  });

  it('should fail for name empty', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'dhanush3727@gmail.com',
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const updatePayload = {
      name: '',
    };

    const res = await request(server)
      .patch('/api/users/me')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(updatePayload)
      .expect(400);

    const body = res.body as ApiResponse<User>;

    expect(body.success).toBe(false);
    expect(body.message).toBe('name should not be empty');
  });

  it('should fail for current password empty', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'dhanush3727@gmail.com',
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const updatePayload = {
      currentPassword: '',
    };

    const res = await request(server)
      .patch('/api/users/me')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(updatePayload)
      .expect(400);

    const body = res.body as ApiResponse<User>;

    expect(body.success).toBe(false);
    expect(body.message).toBe('currentPassword should not be empty');
  });

  it('should fail for new password is not there', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'dhanush3727@gmail.com',
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const updatePayload = {
      currentPassword: 'Dhansus',
    };

    const res = await request(server)
      .patch('/api/users/me')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(updatePayload)
      .expect(400);

    const body = res.body as ApiResponse<User>;

    expect(body.success).toBe(false);
    expect(body.message).toBe('Enter new password');
  });

  it('should fail for new password is empty', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'dhanush3727@gmail.com',
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const updatePayload = {
      currentPassword: 'Dhansus',
      newPassword: '',
    };

    const res = await request(server)
      .patch('/api/users/me')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(updatePayload)
      .expect(400);

    const body = res.body as ApiResponse<User>;

    expect(body.success).toBe(false);
    expect(body.message).toBe('newPassword should not be empty');
  });

  it('should fail for current password is wrong', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'dhanush3727@gmail.com',
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const updatePayload = {
      currentPassword: 'Dhansus',
      newPassword: 'Dhanush@3727',
    };

    const res = await request(server)
      .patch('/api/users/me')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(updatePayload)
      .expect(400);

    const body = res.body as ApiResponse<User>;

    expect(body.success).toBe(false);
    expect(body.message).toBe('Current password is wrong');
  });
});
