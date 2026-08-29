// This is before running the E2E test suite, execute the Prisma seed command.
import { execSync } from 'child_process';

export default function globalSetup(): void {
  execSync('npx prisma db seed', {
    stdio: 'inherit',
  });
}
