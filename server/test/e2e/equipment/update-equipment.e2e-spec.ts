import { afterAll, beforeAll, describe, expect, it } from '@jest/globals';
import { INestApplication } from '@nestjs/common';
import request from 'supertest';
import { createApp } from '../../utils/create-app';
import { ApiResponse, LoginResponse } from '../../test.types';
import { Equipment } from '@prisma/client';

describe('Update Equipment E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  afterAll(async () => {
    await app.close();
  });

  it('should update equipment name', async () => {
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
      name: 'hand saw',
    };

    const res = await request(server)
      .patch('/api/equipment/5')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(updatePayload)
      .expect(200);
    const body = res.body as ApiResponse<Equipment>;

    expect(body).toStrictEqual({
      success: true,
      message: 'Equipment updated successfully',
    });
  });

  it('should update equipment code', async () => {
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
      code: 'eq-003',
    };

    const res = await request(server)
      .patch('/api/equipment/5')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(updatePayload)
      .expect(200);
    const body = res.body as ApiResponse<Equipment>;

    expect(body).toStrictEqual({
      success: true,
      message: 'Equipment updated successfully',
    });
  });

  it('should update equipment other details', async () => {
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
      equipmentTypeId: 6,
      locationId: 2,
      departmentId: 10,
      serialNumber: '003',
      installedDate: '2024-10-14',
      warrantyExpiry: '2026-10-14',
      manufacturer: 'Tata steel',
      model: 'Saw',
    };

    const res = await request(server)
      .patch('/api/equipment/5')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(updatePayload)
      .expect(200);
    const body = res.body as ApiResponse<Equipment>;

    expect(body).toStrictEqual({
      success: true,
      message: 'Equipment updated successfully',
    });
  });

  it('should fail for already exists code', async () => {
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
      code: 'eq-10',
    };

    const res = await request(server)
      .patch('/api/equipment/5')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(updatePayload)
      .expect(409);
    const body = res.body as ApiResponse<Equipment>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Equipment code already exists',
    });
  });

  it('should fail for invalid fields', async () => {
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

    const updatePayload = {};

    const res = await request(server)
      .patch('/api/equipment/5')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(updatePayload)
      .expect(400);
    const body = res.body as ApiResponse<Equipment>;

    expect(body).toStrictEqual({
      success: false,
      message: 'No valid fields provided',
    });
  });

  it('should fail for equipment type is not found', async () => {
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
      equipmentTypeId: 2,
    };

    const res = await request(server)
      .patch('/api/equipment/5')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(updatePayload)
      .expect(404);
    const body = res.body as ApiResponse<Equipment>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Equipment type is not found',
    });
  });

  it('should fail for equipment type is deactivate', async () => {
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
      equipmentTypeId: 3,
    };

    const res = await request(server)
      .patch('/api/equipment/5')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(updatePayload)
      .expect(400);
    const body = res.body as ApiResponse<Equipment>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Equipment type is deactivated',
    });
  });

  it('should fail for location is not found', async () => {
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
      locationId: 3,
    };

    const res = await request(server)
      .patch('/api/equipment/5')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(updatePayload)
      .expect(404);
    const body = res.body as ApiResponse<Equipment>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Location not found',
    });
  });

  it('should fail for departmen is not found', async () => {
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
      .patch('/api/equipment/5')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(updatePayload)
      .expect(404);
    const body = res.body as ApiResponse<Equipment>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Department not found',
    });
  });
});
