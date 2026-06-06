import { afterAll, beforeAll, describe, expect, it } from '@jest/globals';
import { INestApplication } from '@nestjs/common';
import request from 'supertest';
import { createApp } from '../../utils/create-app';
import { ApiResponse, LoginResponse } from '../../test.types';
import { Equipment } from '@prisma/client';

describe('Create equipment E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  afterAll(async () => {
    await app.close();
  });

  it('should create equipment', async () => {
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

    const createPayload = {
      name: 'screw',
      code: 'eq-07',
      equipmentTypeId: 6,
      locationId: 1,
      departmentId: 1,
      serialNumber: '4',
      installedDate: '2003-10-09',
      warrantyExpiry: '2026-10-09',
      manufacturer: '  MCF ',
      model: '  screw type ',
    };

    const res = await request(server)
      .post('/api/equipment')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(createPayload)
      .expect(201);
    const body = res.body as ApiResponse<Equipment>;

    expect(body).toStrictEqual({
      success: true,
      message: 'Equipment created successfully',
    });
  });

  it('should fail for empty name', async () => {
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

    const createPayload = {
      name: '',
    };

    const res = await request(server)
      .post('/api/equipment')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(createPayload)
      .expect(400);
    const body = res.body as ApiResponse<Equipment>;

    expect(body).toStrictEqual({
      success: false,
      message: 'name should not be empty',
    });
  });

  it('should fail for empty code', async () => {
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

    const createPayload = {
      name: 'new equip',
      code: '',
    };

    const res = await request(server)
      .post('/api/equipment')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(createPayload)
      .expect(400);
    const body = res.body as ApiResponse<Equipment>;

    expect(body).toStrictEqual({
      success: false,
      message: 'code should not be empty',
    });
  });

  it('should fail for exists code', async () => {
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

    const createPayload = {
      name: 'new equip',
      code: 'eq-04',
      equipmentTypeId: 1,
      locationId: 1,
      departmentId: 1,
    };

    const res = await request(server)
      .post('/api/equipment')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(createPayload)
      .expect(409);
    const body = res.body as ApiResponse<Equipment>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Equipment code already exist',
    });
  });

  it('should fail for invalid equipment type id', async () => {
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

    const createPayload = {
      name: 'new equip',
      code: 'eq-10',
      equipmentTypeId: 0,
    };

    const res = await request(server)
      .post('/api/equipment')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(createPayload)
      .expect(400);
    const body = res.body as ApiResponse<Equipment>;

    expect(body).toStrictEqual({
      success: false,
      message: 'equipmentTypeId must be a positive number',
    });
  });

  it('should fail for equipment type not found', async () => {
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

    const createPayload = {
      name: 'new equip',
      code: 'eq-10',
      equipmentTypeId: 10,
      locationId: 1,
      departmentId: 1,
    };

    const res = await request(server)
      .post('/api/equipment')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(createPayload)
      .expect(404);
    const body = res.body as ApiResponse<Equipment>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Equipment type not found',
    });
  });

  it('should fail for invalid location id', async () => {
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

    const createPayload = {
      name: 'new equip',
      code: 'eq-10',
      equipmentTypeId: 1,
      locationId: 0,
    };

    const res = await request(server)
      .post('/api/equipment')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(createPayload)
      .expect(400);
    const body = res.body as ApiResponse<Equipment>;

    expect(body).toStrictEqual({
      success: false,
      message: 'locationId must be a positive number',
    });
  });

  it('should fail for location not found', async () => {
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

    const createPayload = {
      name: 'new equip',
      code: 'eq-10',
      equipmentTypeId: 1,
      locationId: 10,
      departmentId: 1,
    };

    const res = await request(server)
      .post('/api/equipment')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(createPayload)
      .expect(404);
    const body = res.body as ApiResponse<Equipment>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Location not found',
    });
  });

  it('should fail for invalid department id', async () => {
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

    const createPayload = {
      name: 'new equip',
      code: 'eq-10',
      equipmentTypeId: 1,
      locationId: 1,
      departmentId: 0,
    };

    const res = await request(server)
      .post('/api/equipment')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(createPayload)
      .expect(400);
    const body = res.body as ApiResponse<Equipment>;

    expect(body).toStrictEqual({
      success: false,
      message: 'departmentId must be a positive number',
    });
  });

  it('should fail for deaprtment not found', async () => {
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

    const createPayload = {
      name: 'new equip',
      code: 'eq-10',
      equipmentTypeId: 1,
      locationId: 1,
      departmentId: 2,
    };

    const res = await request(server)
      .post('/api/equipment')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(createPayload)
      .expect(404);
    const body = res.body as ApiResponse<Equipment>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Department not found',
    });
  });
});
