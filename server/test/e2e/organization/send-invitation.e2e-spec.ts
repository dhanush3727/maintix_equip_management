import { afterAll, beforeAll, describe, expect, it } from '@jest/globals';
import { INestApplication } from '@nestjs/common';
import { createApp } from '../../utils/create-app';
import request from 'supertest';
import { ApiResponse, LoginResponse } from '../../test.types';
import { Invitation } from '@prisma/client';

describe('Send Invitation E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  afterAll(async () => {
    await app.close();
  });

  it('should send invitation', async () => {
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

    const invitePayload = {
      email: 'myfreegames003@gmail.com',
      roleId: 3,
      departmentId: 1,
    };

    const res = await request(server)
      .post('/api/organization/send-invite')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(invitePayload)
      .expect(200);

    const body = res.body as ApiResponse<Invitation>;

    expect(body.message).toBe('Invitation send successfully');
    expect(body.success).toBe(true);
  });

  it('should fail for already used email', async () => {
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

    const invitePayload = {
      email: 'dhanush3727@gmail.com',
      roleId: 3,
      departmentId: 1,
    };

    const res = await request(server)
      .post('/api/organization/send-invite')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(invitePayload)
      .expect(409);

    const body = res.body as ApiResponse<Invitation>;

    expect(body.message).toBe('This email alreay register');
    expect(body.success).toBe(false);
  });

  it('should fail for already used email in the organization', async () => {
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

    const invitePayload = {
      email: 'dhanush7825@gmail.com',
      roleId: 3,
      departmentId: 1,
    };

    const res = await request(server)
      .post('/api/organization/send-invite')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(invitePayload)
      .expect(400);

    const body = res.body as ApiResponse<Invitation>;

    expect(body.message).toBe('User already in this organization');
    expect(body.success).toBe(false);
  });

  it('should fail for invalid role', async () => {
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

    const invitePayload = {
      email: 'dhanushs4827@gmail.com',
      roleId: 10,
      departmentId: 1,
    };

    const res = await request(server)
      .post('/api/organization/send-invite')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(invitePayload)
      .expect(400);

    const body = res.body as ApiResponse<Invitation>;

    expect(body.message).toBe('Invalid role');
    expect(body.success).toBe(false);
  });

  it('should fail for invalid department', async () => {
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

    const invitePayload = {
      email: 'dhanushs4827@gmail.com',
      roleId: 3,
      departmentId: 2,
    };

    const res = await request(server)
      .post('/api/organization/send-invite')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(invitePayload)
      .expect(400);

    const body = res.body as ApiResponse<Invitation>;

    expect(body.message).toBe('Invalid department');
    expect(body.success).toBe(false);
  });

  it('should fail for already sent invitation', async () => {
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

    const invitePayload = {
      email: 'myfreegames003@gmail.com',
      roleId: 3,
      departmentId: 1,
    };

    const res = await request(server)
      .post('/api/organization/send-invite')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(invitePayload)
      .expect(400);

    const body = res.body as ApiResponse<Invitation>;

    expect(body.message).toBe('Invitation already sent');
    expect(body.success).toBe(false);
  });

  it('should fail for without token', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const invitePayload = {
      email: 'myfreegames003@gmail.com',
      roleId: 3,
      departmentId: 1,
    };

    await request(server)
      .post('/api/organization/send-invite')
      .send(invitePayload)
      .expect(401);
  });
});
