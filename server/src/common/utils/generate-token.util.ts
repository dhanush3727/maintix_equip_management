import * as crypto from 'crypto';

// Hash reset token
export function hashVerificationToken(token: string): string {
  return crypto.createHash('sha256').update(token).digest('hex');
}
