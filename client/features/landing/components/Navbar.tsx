import { Button } from "@/components/ui";
import Logo from "@/constants/logo.constant";
import Image from "next/image";
import Link from "next/link";
import { APP_NAME } from "../constants/landing.constant";
import { NAV_BUTTON, NAV_ITEMS } from "../constants/navbar.constant";

export function Navbar() {
  return (
    <nav className="flex justify-between mb-15 px-[3%]">
      <div className="flex items-center gap-10">
        <div className="flex items-center gap-2">
          <Image src={Logo} alt="Logo.png" className="w-6 h-6 sm:w-8 sm:h-8" />
          <h1 className="text-base font-bold sm:text-lg">{APP_NAME}</h1>
        </div>
        <div className="text-sm gap-5 text-muted-foreground hidden sm:flex">
          {NAV_ITEMS.map((item) => (
            // Use a stable unique key so React can efficiently track list items.
            <a key={item.label} href={item.href}>
              {item.label}
            </a>
          ))}
        </div>
      </div>

      <div className="flex gap-3">
        {NAV_BUTTON.map((item) => (
          <Link key={item.label} href={item.href}>
            <Button
              variant={`${item.label === "Login" ? "ghost" : "default"}`}
              className={`${item.label === "Register" && "rounded-xl"}`}
            >
              {item.label}
            </Button>
          </Link>
        ))}
      </div>
    </nav>
  );
}
