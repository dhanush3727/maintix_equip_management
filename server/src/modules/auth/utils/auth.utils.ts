import * as bcrypt from 'bcrypt';
import * as crypto from 'crypto';

// hash refresh token before storing
export async function hashToken(token: string): Promise<string> {
  return await bcrypt.hash(token, 10);
}

// compare raw token with hashed token
export async function compareToken(
  rawToken: string,
  hashToken: string,
): Promise<boolean> {
  return await bcrypt.compare(rawToken, hashToken);
}

// Hash reset token
export function hashVerificationToken(token: string): string {
  return crypto.createHash('sha256').update(token).digest('hex');
}
