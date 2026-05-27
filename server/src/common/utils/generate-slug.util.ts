import * as crypto from 'crypto';

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
