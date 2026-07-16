import { Separator } from "@/components/ui";
import { Feature } from "./Feature";
import { Hero } from "./Hero";
import { Navbar } from "./Navbar";
import { Guide } from "./Guide";
import { Highlights } from "./Highlights";
import { Footer } from "./Footer";

export function Landing() {
  return (
    <>
      <div className="px-[5%] py-5">
        <Navbar />
        <Hero />
      </div>

      <div className="my-10 bg-card">
        <Separator />
        <Feature />
        <Separator />
      </div>

      <Guide />

      <Highlights />

      <Footer />
    </>
  );
}
