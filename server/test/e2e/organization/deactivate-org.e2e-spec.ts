import { afterAll, beforeAll, describe, expect, it } from '@jest/globals';
import { INestApplication } from '@nestjs/common';
import { createApp } from '../../utils/create-app';
import request from 'supertest';
import { LoginResponse } from '../../test.types';

describe('Deactivate Organization E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  afterAll(async () => {
    await app.close();
  });

  it('should deactivate organization', async () => {
    const payload = {
      email: 'dhanush3727@gmail.com',
      password: 'Dhanush@7825',
    };

    const server = app.getHttpServer() as Parameters<typeof request>[0];
    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const res = await request(server)
      .patch('/api/organization/deactivate')
      .set('Authorization', `Bearer ${accessToken}`)
      .expect(200);

    expect(res.body).toEqual({
      success: true,
      message: 'Organization Deactivate successfully',
    });
  });
});
