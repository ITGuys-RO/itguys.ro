import type { Metadata } from "next";
import { Hero, CTA } from "@/components/sections";
import { Section, Card, CardTitle, Carousel } from "@/components/ui";
import { BreadcrumbSchema, OrganizationSchema } from "@/components/structured-data";
import { getContent } from "@/content";
import { locales, type Locale } from "@/i18n/config";
import { ArrowTopRightOnSquareIcon } from "@heroicons/react/24/outline";

type Props = {
  params: Promise<{ locale: string }>;
};

export function generateStaticParams() {
  return locales.map((locale) => ({ locale }));
}

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { locale } = await params;
  const isRomanian = locale === "ro";

  return {
    title: isRomanian
      ? "Portofoliu - Proiectele Noastre de Dezvoltare Software"
      : "Portfolio - Our Software Development Projects",
    description: isRomanian
      ? "Explorează proiectele de succes pe care le-am livrat în evenimente, tehnologie audio, legal tech, iGaming și altele. Soluții din lumea reală pentru XtendLive, AudioMovers, FSC și alte companii inovatoare. Vezi cum rezolvăm provocări tehnice complexe."
      : "Explore successful projects we've delivered across events, audio technology, legal tech, iGaming, and more. Real-world solutions for XtendLive, AudioMovers, FSC, and other innovative companies. See how we solve complex technical challenges.",
    openGraph: {
      title: isRomanian ? "Portofoliul Nostru - Proiecte ITGuys" : "Our Portfolio - ITGuys Projects",
      description: isRomanian
        ? "Proiecte pe care le-am construit în evenimente, audio, legal tech, iGaming și altele. Vezi munca noastră pentru XtendLive, AudioMovers, FSC și alții."
        : "Projects we've built across events, audio, legal tech, iGaming, and more. See our work for XtendLive, AudioMovers, FSC, and others.",
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
      },
    },
    twitter: {
      card: "summary_large_image",
      images: ["/og-image.png"],
    },
  };
}

export default async function PortfolioPage({ params }: Props) {
  const { locale } = await params;

  const content = getContent(locale as Locale);
  const { hero, projects, cta } = content.portfolioContent;
  const { hero: homeHero } = content.homeContent;

  return (
    <>
      <OrganizationSchema />
      <BreadcrumbSchema items={[{ name: "Portfolio", url: `https://itguys.ro${locale === "en" ? "" : `/${locale}`}/portfolio` }]} />
      <Hero headline={hero.headline} subheadline={hero.subheadline} badgeText={homeHero.badgeText} />

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
