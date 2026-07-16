import { Button, Separator } from "@/components/ui";
import { FOOTER_CONTENT } from "../constants/footer.constant";

export function Footer() {
  return (
    <footer className="px-[5%] my-10">
      <div>
        <div className="p-[3%]">
          <h1 className="text-3xl font-bold">{FOOTER_CONTENT.title}</h1>
          <Button className="rounded-xl">{FOOTER_CONTENT.button}</Button>
        </div>
        <Separator />
      </div>
    </footer>
  );
}
