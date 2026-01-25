import type { Metadata } from "next";
import { Hero, CTA } from "@/components/sections";
import { Section, Card, CardTitle, Carousel } from "@/components/ui";
import { BreadcrumbSchema, OrganizationSchema } from "@/components/structured-data";
import { getContent } from "@/content";
import { getProjectsLocalized } from "@/lib/db";
import { type Locale } from "@/i18n/config";
import { ArrowTopRightOnSquareIcon } from "@heroicons/react/24/outline";

// Force dynamic rendering since we fetch from D1
export const dynamic = 'force-dynamic';

type Props = {
  params: Promise<{ locale: string }>;
};

const portfolioTitles: Record<string, string> = {
  en: "Portfolio - Our Software Development Projects",
  ro: "Portofoliu - Proiectele Noastre Software",
  fr: "Portfolio - Nos Projets de Developpement",
  de: "Portfolio - Unsere Softwareprojekte",
  it: "Portfolio - I Nostri Progetti Software",
  es: "Portafolio - Nuestros Proyectos de Software",
};

const portfolioDescriptions: Record<string, string> = {
  en: "Projects we've built across events, audio tech, legal tech, and iGaming. Work for XtendLive, AudioMovers, and more.",
  ro: "Proiecte in evenimente, audio tech, legal tech si iGaming. Lucram pentru XtendLive, AudioMovers si altii.",
  fr: "Projets realises dans l'evenementiel, audio tech, legal tech et iGaming. Pour XtendLive, AudioMovers et plus.",
  de: "Projekte in Events, Audio-Tech, Legal-Tech und iGaming. Fur XtendLive, AudioMovers und weitere Kunden.",
  it: "Progetti in eventi, audio tech, legal tech e iGaming. Lavori per XtendLive, AudioMovers e altri clienti.",
  es: "Proyectos en eventos, audio tech, legal tech e iGaming. Trabajo para XtendLive, AudioMovers y mas.",
};

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { locale } = await params;

  return {
    title: portfolioTitles[locale] || portfolioTitles.en,
    description: portfolioDescriptions[locale] || portfolioDescriptions.en,
    openGraph: {
      title: portfolioTitles[locale] || portfolioTitles.en,
      description: portfolioDescriptions[locale] || portfolioDescriptions.en,
      url: `https://itguys.ro${locale === "en" ? "" : `/${locale}`}/portfolio`,
      type: "website",
    },
    alternates: {
      canonical: locale === "en" ? "/portfolio" : `/${locale}/portfolio`,
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
      description: portfolioDescriptions[locale] || portfolioDescriptions.en,
      images: ["/og-image.png"],
    },
  };
}

export default async function PortfolioPage({ params }: Props) {
  const { locale } = await params;

  const content = getContent(locale as Locale);
  const { hero, cta } = content.portfolioContent;
  const { hero: homeHero } = content.homeContent;

  // Fetch projects from D1
  const projects = await getProjectsLocalized(locale as Locale);

  return (
    <>
      <OrganizationSchema />
      <BreadcrumbSchema items={[{ name: "Portfolio", url: `https://itguys.ro${locale === "en" ? "" : `/${locale}`}/portfolio` }]} />
      <Hero headline={hero.headline} subheadline={hero.subheadline} badgeText={homeHero.badgeText} />

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
                      {locale === "ro" ? "Provocare" : "Challenge"}
                    </h4>
                    <p className="text-sm text-brand-300">
                      {project.challenge}
                    </p>
                  </div>

                  <div>
                    <h4 className="text-sm font-semibold text-brand-200 mb-1">
                      {locale === "ro" ? "Soluție" : "Solution"}
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
                      {locale === "ro" ? "Rezultat:" : "Result:"}
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
              {locale === "ro"
                ? "Studii de caz in curand. Intre timp, ia legatura pentru a discuta proiectul tau."
                : "Case studies coming soon. In the meantime, get in touch to discuss your project."}
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
