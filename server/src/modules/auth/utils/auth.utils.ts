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

// Generate slug
export function generateSlug(companyName: string): string {
  const baseSlug = companyName
    .toLowerCase()
    .trim()
    .replace(/[^a-z0-9\s]/g, '')
    .replace(/\s+/g, '-')
    .replace(/-+/g, '-');

  const uniqueSuffix = crypto.randomBytes(6).toString('hex').slice(0, 6);

  return `${baseSlug}-${uniqueSuffix}`;
}

// Hash reset token
export function hashVerificationToken(token: string): string {
  return crypto.createHash('sha256').update(token).digest('hex');
}
