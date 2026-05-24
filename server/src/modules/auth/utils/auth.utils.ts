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
export async function generateSlug(companyName: string): Promise<string> {
  // Dynamically import nanoid
  const { customAlphabet } = await import('nanoid');

  const nanoid = customAlphabet('abcdefghijklmnopqrstuvwxyz', 6);

  const baseSlug = companyName
    .toLowerCase()
    .trim()
    .replace(/[^a-z0-9\s]/g, '')
    .replace(/\s+/g, '-')
    .replace(/-+/g, '-');

  const uniqueSuffix = nanoid();

  return `${baseSlug}-${uniqueSuffix}`;
}

// Hash reset token
export function hashVerificationToken(token: string): string {
  return crypto.createHash('sha256').update(token).digest('hex');
}
