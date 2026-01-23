import type { Metadata } from "next";
import { Hero, CTA } from "@/components/sections";
import { Section, Card, CardTitle, Carousel } from "@/components/ui";
import { portfolioContent } from "@/content";
import { ArrowTopRightOnSquareIcon } from "@heroicons/react/24/outline";

export const metadata: Metadata = {
  title: "Portfolio",
  description:
    "Projects we've built across events, audio, legal tech, iGaming, and more. See our work for XtendLive, AudioMovers, FSC, and others.",
};

export default function PortfolioPage() {
  const { hero, projects, cta } = portfolioContent;

  return (
    <>
      <Hero headline={hero.headline} subheadline={hero.subheadline} />

      <Section wide>
        {projects.length > 0 ? (
          <Carousel>
            {projects.map((project) => (
              <Card key={project.name} className="p-6 h-full flex flex-col">
                <div className="flex flex-col gap-2 mb-4">
                  {project.url ? (
                    <a
                      href={project.url}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="group flex items-center gap-2"
                    >
                      <CardTitle className="text-xl group-hover:text-brand-600 dark:group-hover:text-brand-400 transition-colors">
                        {project.name}
                      </CardTitle>
                      <ArrowTopRightOnSquareIcon className="w-5 h-5 text-zinc-400 group-hover:text-brand-600 dark:group-hover:text-brand-400 transition-colors" />
                    </a>
                  ) : (
                    <CardTitle className="text-xl">{project.name}</CardTitle>
                  )}
                  <span className="text-sm text-zinc-500 dark:text-zinc-500">
                    {project.clientType} &middot; {project.industry}
                  </span>
                </div>

                <div className="space-y-4 flex-1">
                  <div>
                    <h4 className="text-sm font-semibold text-zinc-700 dark:text-zinc-300 mb-1">
                      Challenge
                    </h4>
                    <p className="text-sm text-zinc-600 dark:text-zinc-400">
                      {project.challenge}
                    </p>
                  </div>

                  <div>
                    <h4 className="text-sm font-semibold text-zinc-700 dark:text-zinc-300 mb-1">
                      Solution
                    </h4>
                    <p className="text-sm text-zinc-600 dark:text-zinc-400">
                      {project.solution}
                    </p>
                  </div>

                  <div className="flex flex-wrap gap-2">
                    {project.tech.map((tech) => (
                      <span
                        key={tech}
                        className="px-2 py-0.5 text-xs bg-brand-100 dark:bg-brand-800 text-brand-700 dark:text-brand-300 rounded-full"
                      >
                        {tech}
                      </span>
                    ))}
                  </div>
                </div>

                {project.result && (
                  <div className="pt-4 mt-4 border-t border-brand-200 dark:border-brand-700">
                    <span className="text-sm font-medium text-zinc-900 dark:text-white">
                      Result:
                    </span>{" "}
                    <span className="text-sm text-zinc-600 dark:text-zinc-400">
                      {project.result}
                    </span>
                  </div>
                )}
              </Card>
            ))}
          </Carousel>
        ) : (
          <div className="text-center py-12">
            <p className="text-lg text-zinc-600 dark:text-zinc-400">
              Case studies coming soon. In the meantime, get in touch to discuss
              your project.
            </p>
          </div>
        )}
      </Section>

      <CTA
        headline={cta.headline}
        body={cta.body}
        buttonText={cta.buttonText}
        buttonHref={cta.buttonHref}
      />
    </>
  );
}
