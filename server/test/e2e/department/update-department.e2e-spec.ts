import { afterAll, beforeAll, describe, expect, it } from '@jest/globals';
import { INestApplication } from '@nestjs/common';
import request from 'supertest';
import { createApp } from '../../utils/create-app';
import { ApiResponse, LoginResponse } from '../../test.types';
import { Department } from '@prisma/client';

describe('Update Department E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  afterAll(async () => {
    await app.close();
  });

  it('should update department name', async () => {
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
      name: '    civil ',
    };

    const res = await request(server)
      .patch('/api/organization/department/1')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(locPayload)
      .expect(200);

    const body = res.body as ApiResponse<Department>;

    expect(body.success).toBe(true);
    expect(body.message).toBe('Department updated successfully');
  });

  it('should update department type', async () => {
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
      type: 'CIVIL',
    };

    const res = await request(server)
      .patch('/api/organization/department/1')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(locPayload)
      .expect(200);

    const body = res.body as ApiResponse<Department>;

    expect(body.success).toBe(true);
    expect(body.message).toBe('Department updated successfully');
  });

  it('should update department code', async () => {
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
      code: '   civ    ',
    };

    const res = await request(server)
      .patch('/api/organization/department/1')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(locPayload)
      .expect(200);

    const body = res.body as ApiResponse<Department>;

    expect(body.success).toBe(true);
    expect(body.message).toBe('Department updated successfully');
  });

  it('should fail for without token', async () => {
    const locPayload = {
      address: '   no 69 daniel road    ',
    };

    const server = app.getHttpServer() as Parameters<typeof request>[0];
    await request(server)
      .patch('/api/organization/department/1')
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
      type: 'civil',
    };

    const res = await request(server)
      .patch('/api/organization/department/1')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(locPayload)
      .expect(400);

    const body = res.body as ApiResponse<Department>;

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
      type: 'CIVIL',
    };

    const res = await request(server)
      .patch('/api/organization/department/10')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(locPayload)
      .expect(404);

    const body = res.body as ApiResponse<Department>;

    expect(body.success).toBe(false);
    expect(body.message).toBe('Department not found');
  });

  it('should fail for department already exist for name', async () => {
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
      name: 'Mechanical',
    };

    const res = await request(server)
      .patch('/api/organization/department/1')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(locPayload)
      .expect(400);

    const body = res.body as ApiResponse<Department>;

    expect(body.success).toBe(false);
    expect(body.message).toBe('Department already exist');
  });

  it('should fail for department already exist for code', async () => {
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
      code: 'MECH1',
    };

    const res = await request(server)
      .patch('/api/organization/department/1')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(locPayload)
      .expect(400);

    const body = res.body as ApiResponse<Department>;

    expect(body.success).toBe(false);
    expect(body.message).toBe('Department already exist');
  });
});
