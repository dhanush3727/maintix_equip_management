import request from 'supertest';
import { afterAll, beforeAll, describe, expect, it } from '@jest/globals';
import { INestApplication } from '@nestjs/common';
import { createApp } from '../../utils/create-app';
import { ApiResponse, LoginResponse } from '../../test.types';
import { BreakdownAction } from '@prisma/client';

describe('Create Actions E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  afterAll(async () => {
    await app.close();
  });

  it('should create breakdown action', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'technicianuser@gmail.com',
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);
    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const createPayload = {
      action: 'Test action',
      remarks: 'Test remarks',
    };

    const res = await request(server)
      .post('/api/breakdowns/2/actions')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(createPayload)
      .expect(200);
    const body = res.body as ApiResponse<BreakdownAction>;

    expect(body).toStrictEqual({
      success: true,
      message: 'Action added',
    });
  });

  it('should fail for technician', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'technicianuser3@gmail.com',
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);
    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const createPayload = {
      action: 'Test action',
      remarks: 'Test remarks',
    };

    const res = await request(server)
      .post('/api/breakdowns/2/actions')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(createPayload)
      .expect(403);
    const body = res.body as ApiResponse<BreakdownAction>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Only assigned technician can add action',
    });
  });

  it('should fail for invalid breakdown', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'technicianuser@gmail.com',
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);
    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const createPayload = {
      action: 'Test action',
      remarks: 'Test remarks',
    };

    const res = await request(server)
      .post('/api/breakdowns/10/actions')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(createPayload)
      .expect(404);
    const body = res.body as ApiResponse<BreakdownAction>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Breakdown not found',
    });
  });

  it('should fail for invalid breakdown status', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'technicianuser@gmail.com',
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);
    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const createPayload = {
      action: 'Test action',
      remarks: 'Test remarks',
    };

    const res = await request(server)
      .post('/api/breakdowns/1/actions')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(createPayload)
      .expect(400);
    const body = res.body as ApiResponse<BreakdownAction>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Breakdown is not in progress',
    });
  });
});

describe('Update Actions E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  afterAll(async () => {
    await app.close();
  });

  it('should update breakdown action', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'technicianuser@gmail.com',
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);
    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const updatePayload = {
      action: 'update action',
      remarks: 'update remarks',
    };

    const res = await request(server)
      .patch('/api/breakdowns/2/actions/9')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(updatePayload)
      .expect(200);
    const body = res.body as ApiResponse<BreakdownAction>;

    expect(body).toStrictEqual({
      success: true,
      message: 'Action updated',
    });
  });

  it('should fail for technician', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'technicianuser3@gmail.com',
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);
    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const updatePayload = {
      action: 'update action',
      remarks: 'upate remarks',
    };

    const res = await request(server)
      .patch('/api/breakdowns/5/actions/1')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(updatePayload)
      .expect(403);
    const body = res.body as ApiResponse<BreakdownAction>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Only assigned technician can update action',
    });
  });

  it('should fail for invalid breakdown', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'technicianuser@gmail.com',
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);
    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const updatePayload = {
      action: 'update action',
      remarks: 'update remarks',
    };

    const res = await request(server)
      .patch('/api/breakdowns/10/actions/1')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(updatePayload)
      .expect(404);
    const body = res.body as ApiResponse<BreakdownAction>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Breakdown not found',
    });
  });

  it('should fail for invalid breakdown action', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'technicianuser@gmail.com',
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);
    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const updatePayload = {
      action: 'update action',
      remarks: 'update remarks',
    };

    const res = await request(server)
      .patch('/api/breakdowns/2/actions/20')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(updatePayload)
      .expect(404);
    const body = res.body as ApiResponse<BreakdownAction>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Breakdown Action not found',
    });
  });

  it('should fail for invalid breakdown status', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'technicianuser@gmail.com',
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);
    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const updatePayload = {
      action: 'update action',
      remarks: 'update remarks',
    };

    const res = await request(server)
      .patch('/api/breakdowns/1/actions/1')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(updatePayload)
      .expect(400);
    const body = res.body as ApiResponse<BreakdownAction>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Breakdown is not in progress',
    });
  });
});

describe('Delete Actions E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  afterAll(async () => {
    await app.close();
  });

  it('should delete breakdown action', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'technicianuser@gmail.com',
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);
    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const res = await request(server)
      .delete('/api/breakdowns/5/actions/3')
      .set('Authorization', `Bearer ${accessToken}`)
      .expect(200);
    const body = res.body as ApiResponse<BreakdownAction>;

    expect(body).toStrictEqual({
      success: true,
      message: 'Action deleted',
    });
  });

  it('should fail for technician', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'technicianuser3@gmail.com',
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);
    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const res = await request(server)
      .delete('/api/breakdowns/5/actions/4')
      .set('Authorization', `Bearer ${accessToken}`)
      .expect(403);
    const body = res.body as ApiResponse<BreakdownAction>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Only assigned technician can delete action',
    });
  });

  it('should fail for invalid breakdown', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'technicianuser@gmail.com',
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);
    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const res = await request(server)
      .delete('/api/breakdowns/10/actions/1')
      .set('Authorization', `Bearer ${accessToken}`)
      .expect(404);
    const body = res.body as ApiResponse<BreakdownAction>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Breakdown not found',
    });
  });

  it('should fail for invalid breakdown action', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'technicianuser@gmail.com',
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);
    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const res = await request(server)
      .delete('/api/breakdowns/2/actions/20')
      .set('Authorization', `Bearer ${accessToken}`)
      .expect(404);
    const body = res.body as ApiResponse<BreakdownAction>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Action not found',
    });
  });

  it('should fail for invalid breakdown status', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'technicianuser@gmail.com',
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);
    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const res = await request(server)
      .delete('/api/breakdowns/1/actions/1')
      .set('Authorization', `Bearer ${accessToken}`)
      .expect(400);
    const body = res.body as ApiResponse<BreakdownAction>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Breakdown is not in progress',
    });
  });
});
