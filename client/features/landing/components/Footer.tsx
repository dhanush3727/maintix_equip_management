import { Button, Separator } from "@/components/ui";
import { FOOTER_CONTENT } from "../constants/footer.constant";
import Link from "next/link";
import { ROUTES } from "@/constants";

export function Footer() {
  return (
    <footer className="px-[5%] mt-10">
      <div className="p-[3%]">
        <div className="flex flex-col justify-center items-center gap-5 mb-5">
          <h1 className="text-3xl font-bold text-center">
            {FOOTER_CONTENT.title}
          </h1>
          <Link href={ROUTES.REGISTER}>
            <Button className="rounded-xl">{FOOTER_CONTENT.button}</Button>
          </Link>
        </div>
        <Separator className={"mb-5"} />

        <div className="text-muted-foreground/40 text-sm flex flex-col justify-center items-center text-center gap-3 sm:flex-row sm:justify-between sm:gap-0">
          <div className="flex flex-col justify-center items-center text-center gap-3 sm:flex-row">
            <Link href={ROUTES.LOGIN}>{FOOTER_CONTENT.login}</Link>
            <p>{FOOTER_CONTENT.contact}</p>
            <p>{FOOTER_CONTENT.terms}</p>
            <p>{FOOTER_CONTENT.privacy}</p>
          </div>
          <div>
            <p>&#xA9; {FOOTER_CONTENT.copyright}</p>
          </div>
        </div>
      </div>
    </footer>
  );
}
