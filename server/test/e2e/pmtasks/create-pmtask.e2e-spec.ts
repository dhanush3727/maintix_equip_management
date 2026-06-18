import { describe, beforeAll, afterAll, it } from '@jest/globals';
import { INestApplication } from '@nestjs/common';
import { createApp } from '../../utils/create-app';
import request from 'supertest';
import { LoginResponse } from '../../test.types';

describe('Create PM Task E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  afterAll(async () => {
    await app.close();
  });

  it('should create pmtask', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: `dhanush7825@gmail.com`,
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;
  });
});
