import { afterAll, beforeAll, describe, expect, it } from '@jest/globals';
import { INestApplication } from '@nestjs/common';
import { createApp } from '../../utils/create-app';
import request from 'supertest';
import { ApiResponse, LoginResponse } from '../../test.types';
import { User } from '@prisma/client';

// #region Test for update user email
describe('Update user email E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  afterAll(async () => {
    await app.close();
  });

  it('should update user email', async () => {
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

    const updatePayload = {
      email: 'dhanush1@gmail.com',
    };

    const res = await request(server)
      .patch('/api/users/orgs/user/4/email')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(updatePayload)
      .expect(200);
    const body = res.body as ApiResponse<User>;

    expect(body.success).toBe(true);
    expect(body.message).toBe('User email updated successfully');
  });

  it('should fail for empty email', async () => {
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

    const updatePayload = {
      email: '',
    };

    const res = await request(server)
      .patch('/api/users/orgs/user/4/email')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(updatePayload)
      .expect(400);
    const body = res.body as ApiResponse<User>;

    expect(body.success).toBe(false);
    expect(body.message).toBe('email should not be empty');
  });

  it('should fail for invalid email', async () => {
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

    const updatePayload = {
      email: 'dhanys',
    };

    const res = await request(server)
      .patch('/api/users/orgs/user/4/email')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(updatePayload)
      .expect(400);
    const body = res.body as ApiResponse<User>;

    expect(body.success).toBe(false);
    expect(body.message).toBe('email must be an email');
  });

  it('should fail user not found', async () => {
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

    const updatePayload = {
      email: 'dhanush7825@gmail.com',
    };

    const res = await request(server)
      .patch('/api/users/orgs/user/5/email')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(updatePayload)
      .expect(404);
    const body = res.body as ApiResponse<User>;

    expect(body.success).toBe(false);
    expect(body.message).toBe('User not found');
  });

  it('should fail existing email', async () => {
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

    const updatePayload = {
      email: 'dhanush7825@gmail.com',
    };

    const res = await request(server)
      .patch('/api/users/orgs/user/4/email')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(updatePayload)
      .expect(409);
    const body = res.body as ApiResponse<User>;

    expect(body.success).toBe(false);
    expect(body.message).toBe('This email already exist');
  });
});
//#endregion

//#region Test for update user role
describe('Update user roles E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  afterAll(async () => {
    await app.close();
  });

  it('should update user role', async () => {
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

    const updatePayload = {
      roleIds: [2, 3],
    };

    const res = await request(server)
      .patch('/api/users/orgs/user/4/roles')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(updatePayload)
      .expect(200);
    const body = res.body as ApiResponse<User>;

    expect(body.success).toBe(true);
    expect(body.message).toBe('User role updated successfully');
  });

  it('should fail for empty roles', async () => {
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

    const updatePayload = {
      roleIds: [],
    };

    const res = await request(server)
      .patch('/api/users/orgs/user/4/roles')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(updatePayload)
      .expect(400);
    const body = res.body as ApiResponse<User>;

    expect(body.success).toBe(false);
    expect(body.message).toBe('roleIds should not be empty');
  });

  it('should fail for invalid role id', async () => {
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

    const updatePayload = {
      roleIds: [2, 3, 6],
    };

    const res = await request(server)
      .patch('/api/users/orgs/user/4/roles')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(updatePayload)
      .expect(400);
    const body = res.body as ApiResponse<User>;

    expect(body.success).toBe(false);
    expect(body.message).toBe('Invalid roles provided');
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

    const updatePayload = {
      roleIds: [3, 2],
    };

    const res = await request(server)
      .patch('/api/users/orgs/user/5/roles')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(updatePayload)
      .expect(404);
    const body = res.body as ApiResponse<User>;

    expect(body.success).toBe(false);
    expect(body.message).toBe('User not found');
  });
});
//#endregion

//#region Test for update user department
describe('Update user department E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  afterAll(async () => {
    await app.close();
  });

  it('should update user department', async () => {
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

    const updatePayload = {
      departmentId: 11,
    };

    const res = await request(server)
      .patch('/api/users/orgs/user/4/department')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(updatePayload)
      .expect(200);
    const body = res.body as ApiResponse<User>;

    expect(body.success).toBe(true);
    expect(body.message).toBe('User department updated successfully');
  });

  it('should fail for empty department', async () => {
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

    const updatePayload = {
      departmentId: '',
    };

    const res = await request(server)
      .patch('/api/users/orgs/user/4/department')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(updatePayload)
      .expect(400);
    const body = res.body as ApiResponse<User>;

    expect(body.success).toBe(false);
    expect(body.message).toBe('departmentId should not be empty');
  });

  it('should fail for invalid departmentId', async () => {
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

    const updatePayload = {
      departmentId: 2,
    };

    const res = await request(server)
      .patch('/api/users/orgs/user/4/department')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(updatePayload)
      .expect(400);
    const body = res.body as ApiResponse<User>;

    expect(body.success).toBe(false);
    expect(body.message).toBe('Invalid department');
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

    const updatePayload = {
      departmentId: 10,
    };

    const res = await request(server)
      .patch('/api/users/orgs/user/5/department')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(updatePayload)
      .expect(404);
    const body = res.body as ApiResponse<User>;

    expect(body.success).toBe(false);
    expect(body.message).toBe('User not found');
  });
});
//#endregion
