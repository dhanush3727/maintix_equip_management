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
import {
  HERO_BUTTON,
  HERO_CARD,
  HERO_CONTENT,
} from "../constants/hero.constant";
import Link from "next/link";
import React from "react";

export function Hero() {
  return (
    <main className="my-10 flex justify-between flex-col gap-10 p-[3%] lg:flex-row">
      <div className="text-center md:text-start">
        <p className="text-primary mb-3 tracking-widest font-semibold text-xs">
          {HERO_CONTENT.badge}
        </p>

        <h1 className="text-4xl font-bold md:hidden">
          {HERO_CONTENT.title.mobile}
        </h1>

        {HERO_CONTENT.title.desktop.map((item) => (
          <h1 key={item} className="hidden text-6xl font-bold mb-1 md:block">
            {item}
          </h1>
        ))}

        <p className="text-xs text-muted-foreground mt-3 md:text-sm">
          {HERO_CONTENT.description}
        </p>

        <div className="mt-5 flex gap-3 justify-center md:justify-start">
          {HERO_BUTTON.map((item) => (
            <Link key={item.label} href={item.href}>
              <Button
                className="rounded-xl"
                variant={`${item.label === "Login" ? "outline" : "default"}`}
              >
                {item.label}
              </Button>
            </Link>
          ))}
        </div>
      </div>

      <div className="w-full relative">
        <Card className="w-full px-6">
          <CardHeader>
            <CardTitle className="flex items-center justify-between">
              <div className="flex gap-2">
                <Image
                  src={Logo}
                  alt="logo.png"
                  className="w-5 h-5 lg:w-6 lg:h-6"
                />
                <h1 className="text-sm font-medium lg:text-base">
                  {HERO_CARD.title}
                </h1>
              </div>
              <BellDot size={20} />
            </CardTitle>
          </CardHeader>

          <CardContent className="mt-5">
            <div className="flex justify-between">
              {HERO_CARD.counts.map((item) => (
                <div
                  key={item.label}
                  className={`${item.label === "Overdue" && "text-destructive"}`}
                >
                  <h3 className="text-sm font-bold lg:text-base">
                    {item.count}
                  </h3>
                  <p
                    className={`text-xs lg:text-sm ${item.label !== "Overdue" && "text-muted-foreground"}`}
                  >
                    {item.label}
                  </p>
                </div>
              ))}
            </div>
          </CardContent>

          <CardContent className="text-sm lg:text-base">
            {HERO_CARD.list.map((item, index) => (
              <React.Fragment key={item.equipment}>
                <div className="flex justify-between py-3">
                  <h4>
                    <span className="text-muted-foreground">
                      {item.equipId}:{" "}
                    </span>
                    {item.equipment}
                  </h4>
                  <Badge variant={item.variant}>{item.badge}</Badge>
                </div>

                {/* Render a separator after each item except the last one */}
                {index < HERO_CARD.list.length - 1 && <Separator />}
              </React.Fragment>
            ))}
          </CardContent>
        </Card>

        <div className="absolute -bottom-5 -right-10 lg:bottom-5">
          <Card className="w-full max-w-xs bg-foreground text-sm text-card shadow-xl">
            <CardContent className="p-3 flex gap-3 items-center">
              <div className="w-4 h-4 bg-primary rounded-lg"></div>
              <div>
                <h4>{HERO_CARD.sub_card.title}</h4>
                <p className="text-muted-foreground">
                  {HERO_CARD.sub_card.description}
                </p>
              </div>
            </CardContent>
          </Card>
        </div>
      </div>
    </main>
  );
}
