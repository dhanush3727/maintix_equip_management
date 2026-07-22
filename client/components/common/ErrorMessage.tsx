export type ErrorMessageProps = {
  error: string;
};

export function ErrorMessage({ error }: ErrorMessageProps) {
  return (
    <div
      role="alert" // Announces login/register errors to screen readers immediately.
      className="border border-danger text-danger text-center text-sm mb-6 p-2"
    >
      {error}
    </div>
  );
}
