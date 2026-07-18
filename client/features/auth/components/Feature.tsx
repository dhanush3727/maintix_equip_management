import { Card, CardContent } from "@/components/ui";
import { FEATURE_CARD } from "../constatnts/card.constants";

export function Feature() {
  return (
    <div className="flex justify-center items-center h-full">
      <div className="grid gap-3 grid-cols-2">
        {FEATURE_CARD.map((card) => {
          const Icon = card.icon;

          return (
            <Card size="sm" key={card.title} className="max-w-xs">
              <CardContent className="p-3">
                <div
                  className={`${card.text} ${card.bg} flex justify-center items-center w-5 h-5 mb-3 rounded-sm`}
                >
                  <Icon size={10} />
                </div>
                <h2 className="text-sm font-bold">{card.title}</h2>
                <p className="text-xs">{card.description}</p>
              </CardContent>
            </Card>
          );
        })}
      </div>
    </div>
  );
}
