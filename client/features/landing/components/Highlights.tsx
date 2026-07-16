import { HIGHLIGHT_CONTENT } from "../constants/hightlight.constant";

export function Highlights() {
  return (
    <section className="bg-foreground px-[5%] my-10">
      <div className="p-[3%] text-card text-center">
        <p className="text-2xl">
          &ldquo;{HIGHLIGHT_CONTENT.description}&rdquo;
        </p>
      </div>
    </section>
  );
}
