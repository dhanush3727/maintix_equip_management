import { Feature } from "./Feature";
import { Hero } from "./Hero";
import { Navbar } from "./Navbar";

export function Landing() {
  return (
    <>
      <div className="px-[5%] py-5">
        <Navbar />
        <Hero />
      </div>
      <Feature />
    </>
  );
}
