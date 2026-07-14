import {
  Badge,
  Button,
  Card,
  CardContent,
  CardHeader,
  CardTitle,
  Separator,
} from "@/components/ui";
import Image from "next/image";
import Logo from "@/assets/logo.png";
import { BellDot } from "lucide-react";

export function Hero() {
  return (
    <main className="flex justify-between flex-col gap-10 p-[3%]">
      <div className="text-center sm:text-start">
        <p className="text-primary mb-3 tracking-widest font-semibold text-xs">
          EQUIPMENT MAINTENANCE SYSTEM
        </p>

        <h1 className="text-4xl font-bold sm:hidden">
          Every assets. Every Check. On time.
        </h1>

        <h1 className="hidden text-6xl font-bold mb-1 sm:block">
          Every assets.
        </h1>
        <h1 className="hidden text-6xl font-bold mb-1 sm:block">
          Every check.
        </h1>
        <h1 className="hidden text-6xl font-bold sm:block">On time.</h1>

        <p className="text-xs text-muted-foreground mt-3 sm:text-sm">
          Maintix runs preventive maintenance and breakdown response for process
          plants — schedules, field checklists, and reliability metrics in one
          place.
        </p>

        <div className="mt-5 flex gap-3 justify-center">
          <Button className={"rounded-xl"}>Get Start</Button>
          <Button variant={"outline"} className={"rounded-xl"}>
            Login
          </Button>
        </div>
      </div>

      <div className="w-full relative">
        <Card className="w-full">
          <CardHeader>
            <CardTitle className="flex items-center justify-between">
              <div className="flex gap-2">
                <Image src={Logo} alt="logo.png" className="w-5 h-5" />
                <h1 className="text-sm font-medium">Dashboard</h1>
              </div>
              <BellDot size={20} />
            </CardTitle>

            <CardContent className="mt-5">
              <div className="flex justify-between">
                <div>
                  <h3 className="text-sm font-bold">150</h3>
                  <p className="text-xs text-muted-foreground">Equipemnts</p>
                </div>

                <div>
                  <h3 className="text-sm font-bold">10</h3>
                  <p className="text-xs text-muted-foreground">Due today</p>
                </div>

                <div className="text-destructive">
                  <h3 className="text-sm font-bold">5</h3>
                  <p className="text-xs text-muted-foreground">Overdue</p>
                </div>
              </div>
            </CardContent>

            <CardContent className="text-sm">
              <div className="flex justify-between py-3">
                <h4>
                  <span className="text-muted-foreground">P-401:</span> Transfer
                  Pump
                </h4>
                <Badge variant={"info"}>INPROGRESS</Badge>
              </div>
              <Separator />
              <div className="flex justify-between py-3">
                <h4>
                  <span className="text-muted-foreground">C-102:</span> Air
                  Compressor
                </h4>
                <Badge variant={"warning"}>PENDING</Badge>
              </div>
            </CardContent>
          </CardHeader>
        </Card>

        <div className="absolute right-0 -bottom-1.25">
          <Card className="w-full max-w-xs bg-foreground text-sm text-card shadow-xl">
            <CardContent className="p-3 flex gap-3 items-center">
              <div className="w-4 h-4 bg-primary rounded-lg"></div>
              <div>
                <h4>Breakdown raised - P-401</h4>
                <p className="text-muted-foreground">
                  Manager notified assign a technician
                </p>
              </div>
            </CardContent>
          </Card>
        </div>
      </div>
    </main>
  );
}
