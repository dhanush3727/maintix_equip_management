export function Loading() {
  return (
    <div className="flex items-center gap-1">
      <div className="size-3 animate-caret-blink rounded-full bg-primary [animation-delay:-0.3s]"></div>
      <div className="size-3 animate-caret-blink rounded-full bg-primary [animation-delay:-0.10s]"></div>
      <div className="size-3 animate-caret-blink rounded-full bg-primary"></div>
    </div>
  );
}
