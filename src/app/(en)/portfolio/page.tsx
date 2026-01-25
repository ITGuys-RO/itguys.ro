import type { Metadata } from "next";
import { Hero, CTA } from "@/components/sections";
import { Section, Card, CardTitle, Carousel } from "@/components/ui";
import { PortfolioIllustration } from "@/components/illustrations";
import { BreadcrumbSchema, OrganizationSchema } from "@/components/structured-data";
import { getContent } from "@/content";
import { getProjectsLocalized } from "@/lib/db";
import { ArrowTopRightOnSquareIcon } from "@heroicons/react/24/outline";

// Force dynamic rendering since we fetch from D1
export const dynamic = 'force-dynamic';

export const metadata: Metadata = {
  title: "Portfolio - Our Software Development Projects",
  description: "Projects we've built across events, audio tech, legal tech, and iGaming. Work for XtendLive, AudioMovers, and more.",
  openGraph: {
    title: "Our Portfolio - ITGuys Projects",
    description: "Projects we've built across events, audio tech, legal tech, and iGaming. Work for XtendLive, AudioMovers, and more.",
    url: "https://itguys.ro/portfolio",
    type: "website",
  },
  alternates: {
    canonical: "/portfolio",
    languages: {
      en: "/portfolio",
      ro: "/ro/portfolio",
      fr: "/fr/portfolio",
      de: "/de/portfolio",
      it: "/it/portfolio",
      es: "/es/portfolio",
    },
  },
  twitter: {
    card: "summary_large_image",
    title: "Our Portfolio - ITGuys Projects",
    description: "Projects we've built across events, audio tech, legal tech, and iGaming. Work for XtendLive, AudioMovers, and more.",
    images: ["/og-image.png"],
  },
};

export default async function PortfolioPage() {
  const content = getContent("en");
  const { hero, cta } = content.portfolioContent;

  // Fetch projects from D1
  const projects = await getProjectsLocalized('en');

  return (
    <>
      <OrganizationSchema />
      <BreadcrumbSchema items={[{ name: "Portfolio", url: "https://itguys.ro/portfolio" }]} />
      <Hero
        headline={hero.headline}
        subheadline={hero.subheadline}
        showBadge={false}
        illustration={<PortfolioIllustration className="w-full h-auto max-w-sm mx-auto" />}
      />

      <Section wide>
        {projects.length > 0 ? (
          <Carousel>
            {projects.map((project) => (
              <Card key={project.slug} className="p-6 h-full flex flex-col">
                <div className="flex flex-col gap-2 mb-4">
                  {project.url ? (
                    <a
                      href={project.url}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="group flex items-center gap-2"
                    >
                      <CardTitle className="text-xl group-hover:text-neon transition-colors">
                        {project.name}
                      </CardTitle>
                      <ArrowTopRightOnSquareIcon className="w-5 h-5 text-brand-400 group-hover:text-neon transition-colors" />
                    </a>
                  ) : (
                    <CardTitle className="text-xl">{project.name}</CardTitle>
                  )}
                  <span className="text-sm text-brand-400">
                    {project.clientType} &middot; {project.industry}
                  </span>
                </div>

                <div className="space-y-4 flex-1">
                  <div>
                    <h4 className="text-sm font-semibold text-brand-200 mb-1">
                      Challenge
                    </h4>
                    <p className="text-sm text-brand-300">
                      {project.challenge}
                    </p>
                  </div>

                  <div>
                    <h4 className="text-sm font-semibold text-brand-200 mb-1">
                      Solution
                    </h4>
                    <p className="text-sm text-brand-300">
                      {project.solution}
                    </p>
                  </div>

                  <div className="flex flex-wrap gap-2">
                    {project.tech.map((tech) => (
                      <span
                        key={tech}
                        className="px-2 py-0.5 text-xs bg-brand-800/50 border border-brand-700/30 text-brand-200 rounded-full"
                      >
                        {tech}
                      </span>
                    ))}
                  </div>
                </div>

                {project.result && (
                  <div className="pt-4 mt-4 border-t border-brand-700/30">
                    <span className="text-sm font-medium text-white">
                      Result:
                    </span>{" "}
                    <span className="text-sm text-brand-200">
                      {project.result}
                    </span>
                  </div>
                )}
              </Card>
            ))}
          </Carousel>
        ) : (
          <div className="text-center py-12">
            <p className="text-lg text-brand-200">
              Case studies coming soon. In the meantime, get in touch to discuss your project.
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
