import { Card, CardContent } from "@/components/ui";
import { FEATURE_CARD, FEATURE_CONTENT } from "../constants/feature.constant";

export function Feature() {
  return (
    <section id="features" className="px-[5%]">
      <div className="p-[3%]">
        <div className="text-center mb-10 md:text-start">
          <p className="text-primary mb-3 tracking-widest font-semibold text-xs">
            {FEATURE_CONTENT.badge}
          </p>

          <h1 className="text-4xl font-bold md:text-5xl">
            {FEATURE_CONTENT.title1}
          </h1>
          <h1 className="text-4xl font-bold md:text-5xl">
            {FEATURE_CONTENT.title2}
          </h1>
        </div>

        <div className="grid gap-6 md:grid-cols-2 xl:grid-cols-4">
          {FEATURE_CARD.map((card) => {
            const Icon = card.icon;

            return (
              <Card
                size="sm"
                key={card.title}
                className="bg-background transition-all duration-300 hover:-translate-y-1 hover:shadow-lg"
              >
                <CardContent className="p-6">
                  <div
                    className={`${card.text} ${card.bg} flex justify-center items-center w-10 h-10 mb-6 rounded-md`}
                  >
                    <Icon size={20} />
                  </div>
                  <h2 className="text-lg font-bold">{card.title}</h2>
                  <p className="text-sm">{card.description}</p>
                </CardContent>
              </Card>
            );
          })}
        </div>
      </div>
    </section>
  );
}
