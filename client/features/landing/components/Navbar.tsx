import { Button } from "@/components/ui";
import Logo from "@/assets/logo.png";
import Image from "next/image";
import Link from "next/link";

export function Navbar() {
  return (
    <nav className="flex justify-between mb-15 px-[3%]">
      <div className="flex items-center gap-10">
        <div className="flex items-center gap-2">
          <Image src={Logo} alt="Logo.png" className="w-6 h-6 sm:w-8 sm:h-8" />
          <h1 className="text-base font-bold sm:text-lg">Maintix</h1>
        </div>
        <div className="text-sm gap-5 text-muted-foreground hidden sm:flex">
          <Link href={"#"}>Features</Link>
          <Link href={"#"}>How it works</Link>
        </div>
      </div>

      <div className="flex gap-3">
        <Button variant="ghost">Login</Button>
        <Button className="rounded-xl">Register</Button>
      </div>
    </nav>
  );
}
