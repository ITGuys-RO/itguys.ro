import type { Metadata } from "next";
import { Hero, CTA } from "@/components/sections";
import { Section, Card, CardTitle, CardDescription, FAQ } from "@/components/ui";
import { DevelopmentIllustration } from "@/components/illustrations";
import { BreadcrumbSchema, FAQSchema, OrganizationSchema } from "@/components/structured-data";
import { getContent } from "@/content";
import { getServicesLocalized, getFaqLocalized } from "@/lib/db";
import { type Locale, generateAlternates } from "@/i18n/config";
import {
  CodeBracketIcon,
  CloudIcon,
  CpuChipIcon,
  DevicePhoneMobileIcon,
  CircleStackIcon,
  SparklesIcon,
} from "@heroicons/react/24/outline";

// Force dynamic rendering since we fetch from D1
export const dynamic = 'force-dynamic';

const serviceIcons: Record<string, typeof CodeBracketIcon> = {
  development: CodeBracketIcon,
  mobile: DevicePhoneMobileIcon,
  cloud: CloudIcon,
  backend: CpuChipIcon,
  "ai-ml": SparklesIcon,
  database: CircleStackIcon,
};

type Props = {
  params: Promise<{ locale: string }>;
};

const devTitles: Record<string, string> = {
  en: "Development Services - Web, Mobile, Cloud & AI",
  ro: "Servicii Dezvoltare - Web, Mobile, Cloud & AI",
  fr: "Services de Developpement - Web, Mobile, Cloud & IA",
  de: "Entwicklungsdienste - Web, Mobile, Cloud & KI",
  it: "Servizi di Sviluppo - Web, Mobile, Cloud & IA",
  es: "Servicios de Desarrollo - Web, Movil, Cloud & IA",
};

const devDescriptions: Record<string, string> = {
  en: "Web apps, mobile apps, cloud infrastructure, and AI solutions. Custom software built by EA, TUI, and Nagarro experts.",
  ro: "Aplicatii web, mobile, infrastructura cloud si solutii AI. Software personalizat de experti EA, TUI si Nagarro.",
  fr: "Apps web, mobiles, infrastructure cloud et solutions IA. Logiciels sur mesure par des experts EA, TUI et Nagarro.",
  de: "Web-Apps, Mobile Apps, Cloud-Infrastruktur und KI-Losungen. Software von EA-, TUI- und Nagarro-Experten.",
  it: "App web, mobile, infrastruttura cloud e soluzioni IA. Software personalizzato da esperti EA, TUI e Nagarro.",
  es: "Apps web, moviles, infraestructura cloud y soluciones IA. Software a medida de expertos EA, TUI y Nagarro.",
};

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { locale } = await params;

  return {
    title: devTitles[locale] || devTitles.en,
    description: devDescriptions[locale] || devDescriptions.en,
    openGraph: {
      title: devTitles[locale] || devTitles.en,
      description: devDescriptions[locale] || devDescriptions.en,
      url: `https://itguys.ro${locale === "en" ? "" : `/${locale}`}/development`,
      type: "website",
    },
    alternates: generateAlternates("/development", locale as Locale),
    twitter: {
      card: "summary_large_image",
      description: devDescriptions[locale] || devDescriptions.en,
      images: ["/og-image.png"],
    },
  };
}

export default async function ServicesPage({ params }: Props) {
  const { locale } = await params;

  const content = getContent(locale as Locale);
  const { hero, cta } = content.developmentContent;

  // Fetch services from D1
  const services = await getServicesLocalized(locale as Locale, 'development');

  const allFaqs = await getFaqLocalized(locale as Locale);
  const faqsByCategory = Object.groupBy(allFaqs, (f) => f.category ?? '');

  const faqTitle: Record<string, string> = {
    en: 'Frequently Asked Questions', ro: 'Intrebari frecvente', fr: 'Questions frequentes',
    de: 'Haufig gestellte Fragen', it: 'Domande frequenti', es: 'Preguntas frecuentes',
  };

  return (
    <>
      <OrganizationSchema />
      <BreadcrumbSchema items={[{ name: "Development", url: `https://itguys.ro${locale === "en" ? "" : `/${locale}`}/development` }]} />
      <FAQSchema items={allFaqs} />
      <Hero
        headline={hero.headline}
        subheadline={hero.subheadline}
        showBadge={false}
        illustration={<DevelopmentIllustration className="w-full h-auto max-w-sm mx-auto" />}
      />

      {services.map((service, index) => {
        const Icon = serviceIcons[service.id] || CodeBracketIcon;
        return (
        <Section
          key={service.id}
          className={index % 2 === 1 ? "bg-brand-900/50" : ""}
        >
          <div className="flex items-center gap-3 mb-2">
            <div className="p-2 rounded-lg bg-brand-800/50 border border-brand-700/30">
              <Icon className="w-6 h-6 text-neon" />
            </div>
            <h2 className="text-2xl md:text-3xl font-bold text-white">
              {service.title}
            </h2>
          </div>
          <p className="mt-4 text-lg text-brand-200">
            {service.description}
          </p>
          {service.details && (
            <p className="mt-4 text-brand-200">
              {service.details}
            </p>
          )}

          {service.subservices && (
            <div className="mt-8 grid grid-cols-1 md:grid-cols-2 gap-6">
              {service.subservices.map((sub) => (
                <Card key={sub.title}>
                  <CardTitle>{sub.title}</CardTitle>
                  <CardDescription>{sub.description}</CardDescription>
                </Card>
              ))}
            </div>
          )}

          {service.technologies && (
            <div className="mt-6 flex flex-wrap gap-2">
              {service.technologies.map((tech) => (
                <span
                  key={tech}
                  className="px-3 py-1 text-sm bg-brand-800/50 border border-brand-700/30 text-brand-200 rounded-full hover:border-neon/30 hover:text-neon transition-colors"
                >
                  {tech}
                </span>
              ))}
            </div>
          )}

          <FAQ items={faqsByCategory[service.id] ?? []} title={faqTitle[locale] || faqTitle.en} />
        </Section>
        );
      })}

      <CTA
        headline={cta.headline}
        body={cta.body}
        buttonText={cta.buttonText}
        buttonHref={cta.buttonHref}
      />
    </>
  );
}
