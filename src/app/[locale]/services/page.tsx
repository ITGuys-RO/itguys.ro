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
  en: "Professional Services - Cybersecurity, QA & Analytics",
  ro: "Servicii Profesionale - Securitate Cibernetică, QA & Analytics",
  fr: "Services Professionnels - Cybersécurité, QA & Analytics",
  de: "Professionelle Dienste - Cybersicherheit, QA & Analytics",
  it: "Servizi Professionali - Cybersicurezza, QA & Analytics",
  es: "Servicios Profesionales - Ciberseguridad, QA & Analytics",
};

const servicesDescriptions: Record<string, string> = {
  en: "Cybersecurity services, penetration testing, security audits, and QA testing. Expert cybersecurity team from Electronic Arts and TUI veterans.",
  ro: "Servicii de securitate cibernetică, teste de penetrare, audituri de securitate și testare QA. Experți în cybersecurity de la Electronic Arts și TUI.",
  fr: "Services de cybersécurité, tests de pénétration, audits de sécurité et tests QA. Équipe experte en cybersécurité d'Electronic Arts et TUI.",
  de: "Cybersicherheitsdienste, Penetrationstests, Sicherheitsaudits und QA-Tests. Cybersecurity-Expertenteam von Electronic Arts und TUI.",
  it: "Servizi di cybersicurezza, penetration test, audit di sicurezza e test QA. Team esperto di cybersecurity da Electronic Arts e TUI.",
  es: "Servicios de ciberseguridad, pruebas de penetración, auditorías de seguridad y pruebas QA. Equipo experto en ciberseguridad de Electronic Arts y TUI.",
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
