import { Hero } from "./Hero";
import { Navbar } from "./Navbar";

export function Landing() {
  return (
    <div className="px-[5%] py-5 h-screen">
      <Navbar />
      <Hero />
    </div>
  );
}
