import type { Metadata } from "next";
import { Hero, CTA } from "@/components/sections";
import { Section, Card, CardTitle, CardDescription } from "@/components/ui";
import { SecurityIllustration } from "@/components/illustrations";
import { BreadcrumbSchema, OrganizationSchema } from "@/components/structured-data";
import { getContent } from "@/content";
import { getServicesLocalized } from "@/lib/db";
import { type Locale, generateAlternates } from "@/i18n/config";
import {
  ShieldCheckIcon,
  BeakerIcon,
  ChartBarIcon,
  ChatBubbleLeftRightIcon,
  ArrowRightIcon,
} from "@heroicons/react/24/outline";
import { Link } from "@/i18n/navigation";

// Force dynamic rendering since we fetch from D1
export const dynamic = 'force-dynamic';

const serviceIcons: Record<string, typeof ShieldCheckIcon> = {
  "qa-testing": BeakerIcon,
  security: ShieldCheckIcon,
  "data-analytics": ChartBarIcon,
  consulting: ChatBubbleLeftRightIcon,
};

type Props = {
  params: Promise<{ locale: string }>;
};

const titles: Record<string, string> = {
  en: "Professional Services - Consulting, QA, Analytics & Security",
  ro: "Servicii Profesionale - Consultanță, QA, Analytics & Securitate",
  fr: "Services Professionnels - Conseil, QA, Analytics & Sécurité",
  de: "Professionelle Dienste - Beratung, QA, Analytics & Sicherheit",
  it: "Servizi Professionali - Consulenza, QA, Analytics & Sicurezza",
  es: "Servicios Profesionales - Consultoría, QA, Analytics & Seguridad",
};

const servicesDescriptions: Record<string, string> = {
  en: "Technical consulting, QA testing, data analytics, and cybersecurity services. Expert guidance from Electronic Arts, TUI, and Nagarro engineers.",
  ro: "Consultanță tehnică, testare QA, analiză de date și servicii de securitate cibernetică. Expertiză de la ingineri Electronic Arts, TUI și Nagarro.",
  fr: "Conseil technique, tests QA, analyse de données et services de cybersécurité. Expertise d'ingénieurs d'Electronic Arts, TUI et Nagarro.",
  de: "Technische Beratung, QA-Tests, Datenanalyse und Cybersicherheitsdienste. Expertenwissen von Electronic Arts, TUI und Nagarro Ingenieuren.",
  it: "Consulenza tecnica, test QA, analisi dei dati e servizi di cybersicurezza. Esperienza da ingegneri di Electronic Arts, TUI e Nagarro.",
  es: "Consultoría técnica, pruebas QA, análisis de datos y servicios de ciberseguridad. Experiencia de ingenieros de Electronic Arts, TUI y Nagarro.",
};

const learnMoreText: Record<string, string> = {
  en: "Learn more",
  ro: "Află mai multe",
  fr: "En savoir plus",
  de: "Mehr erfahren",
  it: "Scopri di più",
  es: "Más información",
};

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { locale } = await params;

  return {
    title: titles[locale] || titles.en,
    description: servicesDescriptions[locale] || servicesDescriptions.en,
    openGraph: {
      title: titles[locale] || titles.en,
      description: servicesDescriptions[locale] || servicesDescriptions.en,
      url: `https://itguys.ro${locale === "en" ? "" : `/${locale}`}/services`,
      type: "website",
    },
    alternates: generateAlternates("/services", locale as Locale),
    twitter: {
      card: "summary_large_image",
      description: servicesDescriptions[locale] || servicesDescriptions.en,
      images: ["/og-image.png"],
    },
  };
}

export default async function ProfessionalServicesPage({ params }: Props) {
  const { locale } = await params;

  const content = getContent(locale as Locale);
  const { hero, cta } = content.servicesContent;

  // Fetch services from D1
  const services = await getServicesLocalized(locale as Locale, 'professional-services');

  return (
    <>
      <OrganizationSchema />
      <BreadcrumbSchema items={[{ name: "Services", url: `https://itguys.ro${locale === "en" ? "" : `/${locale}`}/services` }]} />
      <Hero
        headline={hero.headline}
        subheadline={hero.subheadline}
        showBadge={false}
        illustration={<SecurityIllustration className="w-full h-auto max-w-sm mx-auto" />}
      />

      {services.map((service, index) => {
        const Icon = serviceIcons[service.id] || ShieldCheckIcon;
        return (
        <Section
          key={service.id}
          className={index % 2 === 1 ? "bg-brand-900/50" : ""}
        >
          <div className="flex items-center gap-3 mb-2">
            <div className="p-2 rounded-lg bg-brand-800/50 border border-brand-700/30">
              <Icon className="w-6 h-6 text-neon" />
            </div>
            <Link href={`/services/${service.slug}`} className="text-2xl md:text-3xl font-bold text-white hover:text-neon transition-colors">
              {service.title}
            </Link>
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

          {service.technologies && service.technologies.length > 0 && (
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

          {service.note && (
            <p className="mt-6 text-sm text-brand-400 italic">
              {service.note}
            </p>
          )}

          <Link
            href={`/services/${service.slug}`}
            className="mt-6 inline-flex items-center gap-2 text-neon hover:text-neon/80 font-medium transition-colors"
          >
            {learnMoreText[locale] || learnMoreText.en}
            <ArrowRightIcon className="w-4 h-4" />
          </Link>
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
