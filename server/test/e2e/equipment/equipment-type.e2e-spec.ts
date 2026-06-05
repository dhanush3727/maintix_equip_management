import { afterAll, beforeAll, describe, expect, it } from '@jest/globals';
import { INestApplication } from '@nestjs/common';
import request from 'supertest';
import { createApp } from '../../utils/create-app';
import { ApiResponse, LoginResponse } from '../../test.types';
import { EquipmentType } from '@prisma/client';

//#region create equipment type
// describe('Create Equipment Type E2E', () => {
//   let app: INestApplication;

//   beforeAll(async () => {
//     app = await createApp();
//   });

//   afterAll(async () => {
//     await app.close();
//   });

//   it('should create a equipment type', async () => {
//     const server = app.getHttpServer() as Parameters<typeof request>[0];

//     const payload = {
//       email: 'dhanush7825@gmail.com',
//       password: 'Dhanush@3727',
//     };

//     const loginRes = await request(server)
//       .post('/api/auth/login')
//       .send(payload)
//       .expect(200);
//     const loginData = loginRes.body as LoginResponse;
//     const accessToken = loginData.data.accessToken;

//     const createPayload = {
//       name: 'instrumentation',
//       code: 'Instrument',
//       description: 'This is the instrumentation type',
//     };

//     const res = await request(server)
//       .post('/api/equipment/equipment-type')
//       .set('Authorization', `Bearer ${accessToken}`)
//       .send(createPayload)
//       .expect(200);
//     const body = res.body as ApiResponse<EquipmentType>;

//     expect(body.success).toBe(true);
//     expect(body.message).toBe('Equipment type created successfully');
//   });

//   it('should fail for existing equipment type', async () => {
//     const server = app.getHttpServer() as Parameters<typeof request>[0];

//     const payload = {
//       email: 'dhanush7825@gmail.com',
//       password: 'Dhanush@3727',
//     };

//     const loginRes = await request(server)
//       .post('/api/auth/login')
//       .send(payload)
//       .expect(200);
//     const loginData = loginRes.body as LoginResponse;
//     const accessToken = loginData.data.accessToken;

//     const createPayload = {
//       name: 'instrumentation',
//       code: 'Instrument',
//       description: 'This is the instrumentation type',
//     };

//     const res = await request(server)
//       .post('/api/equipment/equipment-type')
//       .set('Authorization', `Bearer ${accessToken}`)
//       .send(createPayload)
//       .expect(400);
//     const body = res.body as ApiResponse<EquipmentType>;

//     expect(body.success).toBe(false);
//     expect(body.message).toBe('Equipment Type already exist');
//   });

//   it('should fail for access denied', async () => {
//     const server = app.getHttpServer() as Parameters<typeof request>[0];

//     const payload = {
//       email: 'dhanush1@gmail.com',
//       password: 'Dhanush@3727',
//     };

//     const loginRes = await request(server)
//       .post('/api/auth/login')
//       .send(payload)
//       .expect(200);
//     const loginData = loginRes.body as LoginResponse;
//     const accessToken = loginData.data.accessToken;

//     const createPayload = {
//       name: 'instrumentation',
//       code: 'Instrument',
//       description: 'This is the instrumentation type',
//     };

//     const res = await request(server)
//       .post('/api/equipment/equipment-type')
//       .set('Authorization', `Bearer ${accessToken}`)
//       .send(createPayload)
//       .expect(403);
//     const body = res.body as ApiResponse<EquipmentType>;

//     expect(body.success).toBe(false);
//     expect(body.message).toBe('Access denied');
//   });

//   it('should fail for invalid name', async () => {
//     const server = app.getHttpServer() as Parameters<typeof request>[0];

//     const payload = {
//       email: 'dhanush7825@gmail.com',
//       password: 'Dhanush@3727',
//     };

//     const loginRes = await request(server)
//       .post('/api/auth/login')
//       .send(payload)
//       .expect(200);
//     const loginData = loginRes.body as LoginResponse;
//     const accessToken = loginData.data.accessToken;

//     const createPayload = {
//       name: '',
//     };

//     const res = await request(server)
//       .post('/api/equipment/equipment-type')
//       .set('Authorization', `Bearer ${accessToken}`)
//       .send(createPayload)
//       .expect(400);
//     const body = res.body as ApiResponse<EquipmentType>;

//     expect(body.success).toBe(false);
//     expect(body.message).toBe('name should not be empty');
//   });

//   it('should fail for invalid code', async () => {
//     const server = app.getHttpServer() as Parameters<typeof request>[0];

//     const payload = {
//       email: 'dhanush7825@gmail.com',
//       password: 'Dhanush@3727',
//     };

//     const loginRes = await request(server)
//       .post('/api/auth/login')
//       .send(payload)
//       .expect(200);
//     const loginData = loginRes.body as LoginResponse;
//     const accessToken = loginData.data.accessToken;

//     const createPayload = {
//       name: 'new type',
//       code: '',
//     };

//     const res = await request(server)
//       .post('/api/equipment/equipment-type')
//       .set('Authorization', `Bearer ${accessToken}`)
//       .send(createPayload)
//       .expect(400);
//     const body = res.body as ApiResponse<EquipmentType>;

//     expect(body.success).toBe(false);
//     expect(body.message).toBe('code should not be empty');
//   });

//   it('should fail for invalid description', async () => {
//     const server = app.getHttpServer() as Parameters<typeof request>[0];

//     const payload = {
//       email: 'dhanush7825@gmail.com',
//       password: 'Dhanush@3727',
//     };

//     const loginRes = await request(server)
//       .post('/api/auth/login')
//       .send(payload)
//       .expect(200);
//     const loginData = loginRes.body as LoginResponse;
//     const accessToken = loginData.data.accessToken;

//     const createPayload = {
//       name: 'type',
//       code: 'type',
//       description: '',
//     };

//     const res = await request(server)
//       .post('/api/equipment/equipment-type')
//       .set('Authorization', `Bearer ${accessToken}`)
//       .send(createPayload)
//       .expect(400);
//     const body = res.body as ApiResponse<EquipmentType>;

//     expect(body.success).toBe(false);
//     expect(body.message).toBe('description should not be empty');
//   });
// });
//#endregion

//#region Get equipments type
describe('Get equipments type E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  afterAll(async () => {
    await app.close();
  });

  it('should get all equipments type', async () => {
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
      .get('/api/equipment/equipment-type')
      .set('Authorization', `Bearer ${accessToken}`)
      .expect(200);
    const body = res.body as ApiResponse<EquipmentType>;

    expect(body.success).toBe(true);
  });

  it('should fail for unauthorized', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const res = await request(server)
      .get('/api/equipment/equipment-type')
      .expect(401);
    const body = res.body as ApiResponse<EquipmentType>;

    expect(body.success).toBe(false);
    expect(body.message).toBe('Unauthorized');
  });

  it('should fail for invalid sortBy', async () => {
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
      .get('/api/equipment/equipment-type?sortBy=des')
      .set('Authorization', `Bearer ${accessToken}`)
      .expect(400);
    const body = res.body as ApiResponse<EquipmentType>;

    expect(body.success).toBe(false);
    expect(body.message).toBe('Invalid sortby');
  });
});
//#endregion

//#region Get equipment type by id
describe('Get equipment by id', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  afterAll(async () => {
    await app.close();
  });

  it('should get equipment type by id', async () => {
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
      .get('/api/equipment/equipment-type/1')
      .set('Authorization', `Bearer ${accessToken}`)
      .expect(200);
    const body = res.body as ApiResponse<EquipmentType>;

    expect(body.success).toBe(true);
  });

  it('should fail for not found', async () => {
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
      .get('/api/equipment/equipment-type/10')
      .set('Authorization', `Bearer ${accessToken}`)
      .expect(404);
    const body = res.body as ApiResponse<EquipmentType>;

    expect(body.success).toBe(false);
    expect(body.message).toBe('Equipment type not found');
  });

  it('should fail for unauthorized', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const res = await request(server)
      .get('/api/equipment/equipment-type/1')
      .expect(401);
    const body = res.body as ApiResponse<EquipmentType>;

    expect(body.success).toBe(false);
    expect(body.message).toBe('Unauthorized');
  });
});
//#endregion
