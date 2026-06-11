import { INestApplication } from '@nestjs/common';
import request from 'supertest';
import { describe, it, beforeAll, afterAll, expect } from '@jest/globals';
import { createApp } from '../../utils/create-app';
import { ApiResponse, LoginResponse } from '../../test.types';
import { ChecklistTemplate } from '@prisma/client';

describe('Create Checklist template with type TEXT E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  afterAll(async () => {
    await app.close();
  });

  it('should create checklist template', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: `dhanush7825@gmail.com`,
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const listPayload = {
      name: 'Motor Preventive Maintenance Checklist',
      equipmentTypeId: 1,
      description: 'Routine inspection checklist for industrial motors',
      items: [
        {
          name: 'Inspector Remarks',
          order: 1,
          type: 'TEXT',
        },
      ],
    };

    const res = await request(server)
      .post('/api/checklist/checklist-template')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(listPayload)
      .expect(200);
    const body = res.body as ApiResponse<ChecklistTemplate>;

    expect(body).toStrictEqual({
      success: true,
      message: 'Checklist template created',
    });
  });

  it('should fail for duplicate order', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: `dhanush7825@gmail.com`,
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const listPayload = {
      name: 'Motor Preventive Maintenance Checklist',
      equipmentTypeId: 1,
      description: 'Routine inspection checklist for industrial motors',
      items: [
        {
          name: 'Inspector Remarks',
          order: 1,
          type: 'TEXT',
        },
        {
          name: 'Inspector Remarks',
          order: 1,
          type: 'TEXT',
        },
      ],
    };

    const res = await request(server)
      .post('/api/checklist/checklist-template')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(listPayload)
      .expect(400);
    const body = res.body as ApiResponse<ChecklistTemplate>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Duplicate order in checklist items',
    });
  });
});

describe('Create Checklist template with type NUMBER E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  afterAll(async () => {
    await app.close();
  });

  it('should create checklist template', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: `dhanush7825@gmail.com`,
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const listPayload = {
      name: 'Motor Preventive Maintenance Checklist',
      equipmentTypeId: 1,
      description: 'Routine inspection checklist for industrial motors',
      items: [
        {
          name: 'Inspector Remarks',
          order: 1,
          type: 'NUMBER',
          minValue: 20,
          maxValue: 40,
        },
      ],
    };

    const res = await request(server)
      .post('/api/checklist/checklist-template')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(listPayload)
      .expect(200);
    const body = res.body as ApiResponse<ChecklistTemplate>;

    expect(body).toStrictEqual({
      success: true,
      message: 'Checklist template created',
    });
  });

  it('should fail for min value', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: `dhanush7825@gmail.com`,
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const listPayload = {
      name: 'Motor Preventive Maintenance Checklist',
      equipmentTypeId: 1,
      description: 'Routine inspection checklist for industrial motors',
      items: [
        {
          name: 'Inspector Remarks',
          order: 1,
          type: 'NUMBER',
        },
      ],
    };

    const res = await request(server)
      .post('/api/checklist/checklist-template')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(listPayload)
      .expect(400);
    const body = res.body as ApiResponse<ChecklistTemplate>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Min value expected for Inspector remarks',
    });
  });

  it('should fail for max value', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: `dhanush7825@gmail.com`,
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const listPayload = {
      name: 'Motor Preventive Maintenance Checklist',
      equipmentTypeId: 1,
      description: 'Routine inspection checklist for industrial motors',
      items: [
        {
          name: 'Inspector Remarks',
          order: 1,
          type: 'NUMBER',
          minValue: 20,
        },
      ],
    };

    const res = await request(server)
      .post('/api/checklist/checklist-template')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(listPayload)
      .expect(400);
    const body = res.body as ApiResponse<ChecklistTemplate>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Max value expected for Inspector remarks',
    });
  });

  it('should fail for max value', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: `dhanush7825@gmail.com`,
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const listPayload = {
      name: 'Motor Preventive Maintenance Checklist',
      equipmentTypeId: 1,
      description: 'Routine inspection checklist for industrial motors',
      items: [
        {
          name: 'Inspector Remarks',
          order: 1,
          type: 'NUMBER',
          minValue: 20,
          maxValue: 10,
        },
      ],
    };

    const res = await request(server)
      .post('/api/checklist/checklist-template')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(listPayload)
      .expect(400);
    const body = res.body as ApiResponse<ChecklistTemplate>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Invalid range for item: Inspector remarks',
    });
  });
});

describe('Create Checklist template with type SELECT E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  afterAll(async () => {
    await app.close();
  });

  it('should create checklist template', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: `dhanush7825@gmail.com`,
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const listPayload = {
      name: 'Motor Preventive Maintenance Checklist',
      equipmentTypeId: 1,
      description: 'Routine inspection checklist for industrial motors',
      items: [
        {
          name: 'Inspector Remarks',
          order: 1,
          type: 'SELECT',
          options: ['Good', 'Average', 'Poor'],
          expectedValue: 'Average',
        },
      ],
    };

    const res = await request(server)
      .post('/api/checklist/checklist-template')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(listPayload)
      .expect(200);
    const body = res.body as ApiResponse<ChecklistTemplate>;

    expect(body).toStrictEqual({
      success: true,
      message: 'Checklist template created',
    });
  });

  it('should fail invalid options', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: `dhanush7825@gmail.com`,
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const listPayload = {
      name: 'Motor Preventive Maintenance Checklist',
      equipmentTypeId: 1,
      description: 'Routine inspection checklist for industrial motors',
      items: [
        {
          name: 'Inspector Remarks',
          order: 1,
          type: 'SELECT',
          options: [],
        },
      ],
    };

    const res = await request(server)
      .post('/api/checklist/checklist-template')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(listPayload)
      .expect(400);
    const body = res.body as ApiResponse<ChecklistTemplate>;

    expect(body).toStrictEqual({
      success: false,
      message: 'items.0.options should not be empty',
    });
  });

  it('should fail empty expected value', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: `dhanush7825@gmail.com`,
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const listPayload = {
      name: 'Motor Preventive Maintenance Checklist',
      equipmentTypeId: 1,
      description: 'Routine inspection checklist for industrial motors',
      items: [
        {
          name: 'Inspector Remarks',
          order: 1,
          type: 'SELECT',
          options: ['Good', 'Average', 'Poor'],
        },
      ],
    };

    const res = await request(server)
      .post('/api/checklist/checklist-template')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(listPayload)
      .expect(400);
    const body = res.body as ApiResponse<ChecklistTemplate>;

    expect(body).toStrictEqual({
      success: false,
      message: 'expected value required for Inspector remarks',
    });
  });

  it('should fail for invalid expected value', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: `dhanush7825@gmail.com`,
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const listPayload = {
      name: 'Motor Preventive Maintenance Checklist',
      equipmentTypeId: 1,
      description: 'Routine inspection checklist for industrial motors',
      items: [
        {
          name: 'Inspector Remarks',
          order: 1,
          type: 'SELECT',
          options: ['Good', 'Average', 'Poor'],
          expectedValue: 'Bad',
        },
      ],
    };

    const res = await request(server)
      .post('/api/checklist/checklist-template')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(listPayload)
      .expect(400);
    const body = res.body as ApiResponse<ChecklistTemplate>;

    expect(body).toStrictEqual({
      success: false,
      message:
        'The expected value must have one of the options for item: Inspector remarks',
    });
  });
});

describe('Create Checklist template with type BOOLEAN E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  afterAll(async () => {
    await app.close();
  });

  it('should create checklist template', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: `dhanush7825@gmail.com`,
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const listPayload = {
      name: 'Motor Preventive Maintenance Checklist',
      equipmentTypeId: 1,
      description: 'Routine inspection checklist for industrial motors',
      items: [
        {
          name: 'Inspector Remarks',
          order: 1,
          type: 'BOOLEAN',
          expectedValue: 'true',
        },
      ],
    };

    const res = await request(server)
      .post('/api/checklist/checklist-template')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(listPayload)
      .expect(200);
    const body = res.body as ApiResponse<ChecklistTemplate>;

    expect(body).toStrictEqual({
      success: true,
      message: 'Checklist template created',
    });
  });

  it('should fail empty expected value', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: `dhanush7825@gmail.com`,
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const listPayload = {
      name: 'Motor Preventive Maintenance Checklist',
      equipmentTypeId: 1,
      description: 'Routine inspection checklist for industrial motors',
      items: [
        {
          name: 'Inspector Remarks',
          order: 1,
          type: 'BOOLEAN',
        },
      ],
    };

    const res = await request(server)
      .post('/api/checklist/checklist-template')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(listPayload)
      .expect(400);
    const body = res.body as ApiResponse<ChecklistTemplate>;

    expect(body).toStrictEqual({
      success: false,
      message: 'expected value required for Inspector remarks',
    });
  });

  it('should fail invalid expected value', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: `dhanush7825@gmail.com`,
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const listPayload = {
      name: 'Motor Preventive Maintenance Checklist',
      equipmentTypeId: 1,
      description: 'Routine inspection checklist for industrial motors',
      items: [
        {
          name: 'Inspector Remarks',
          order: 1,
          type: 'BOOLEAN',
          expectedValue: 'not bad',
        },
      ],
    };

    const res = await request(server)
      .post('/api/checklist/checklist-template')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(listPayload)
      .expect(400);
    const body = res.body as ApiResponse<ChecklistTemplate>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Invalid expected value for Inspector remarks',
    });
  });
});
