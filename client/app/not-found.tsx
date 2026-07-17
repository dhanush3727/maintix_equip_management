import { Button } from "@/components/ui";
import Link from "next/link";

export default function NotFound() {
  return (
    <main className="flex min-h-screen items-center justify-center px-6">
      <div className="max-w-md text-center">
        <h1 className="text-7xl font-bold">404</h1>

        <h2 className="mt-4 text-3xl font-semibold">Page Not Found</h2>

        <p className="mt-4 text-muted-foreground">
          The page you&apos;re looking for doesn&apos;t exist or may have been
          moved.
        </p>

        <Link href={"/"}>
          <Button className="mt-8">Back to Home</Button>
        </Link>
      </div>
    </main>
  );
}
