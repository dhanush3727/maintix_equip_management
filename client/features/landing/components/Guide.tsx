import { GUIDE_CONTENT } from "../constants/guide.constant";

export function Guide() {
  return (
    <section id="how-it-work" className="px-[5%] my-10">
      <div className="p-[3%]">
        <div className="text-center mb-10 md:text-start">
          <p className="text-primary mb-3 tracking-widest font-semibold text-xs">
            {GUIDE_CONTENT.badge}
          </p>
        </div>

        <div className="grid gap-6 md:grid-cols-3">
          {GUIDE_CONTENT.steps.map((item) => (
            <div key={item.step} className="text-center md:text-start">
              <h1 className="text-5xl font-bold text-muted-foreground/40 mb-3">
                {item.step}
              </h1>

              <h3 className="text-lg font-bold mb-2">{item.title}</h3>

              <p className="text-sm text-muted-foreground">
                {item.description}
              </p>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
