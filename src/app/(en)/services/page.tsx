import type { Metadata } from "next";
import { Hero, CTA } from "@/components/sections";
import { Section, Card, CardTitle, CardDescription } from "@/components/ui";
import { SecurityIllustration } from "@/components/illustrations";
import { BreadcrumbSchema, OrganizationSchema } from "@/components/structured-data";
import { getContent } from "@/content";
import { getServicesLocalized } from "@/lib/db";
import {
  ShieldCheckIcon,
  BeakerIcon,
  ChartBarIcon,
  ChatBubbleLeftRightIcon,
  ArrowRightIcon,
} from "@heroicons/react/24/outline";
import { Link } from "@/i18n/navigation";
import { generateAlternates } from "@/i18n";

// Force dynamic rendering since we fetch from D1
export const dynamic = 'force-dynamic';

const serviceIcons: Record<string, typeof ShieldCheckIcon> = {
  "qa-testing": BeakerIcon,
  security: ShieldCheckIcon,
  "data-analytics": ChartBarIcon,
  consulting: ChatBubbleLeftRightIcon,
};

export const metadata: Metadata = {
  title: "Professional Services - Cybersecurity, QA & Analytics",
  description: "Cybersecurity services, penetration testing, security audits, and QA testing. Expert cybersecurity team from Electronic Arts and TUI veterans.",
  openGraph: {
    title: "Professional Services - Cybersecurity & QA | ITGuys",
    description: "Cybersecurity services, penetration testing, security audits, and QA testing. Expert cybersecurity team from Electronic Arts and TUI veterans.",
    url: "https://itguys.ro/services",
    type: "website",
  },
  alternates: generateAlternates("/services"),
  twitter: {
    card: "summary_large_image",
    title: "Professional Services - Cybersecurity, QA & Analytics",
    description: "Cybersecurity services, penetration testing, security audits, and QA testing. Expert cybersecurity team from Electronic Arts and TUI veterans.",
    images: ["/og-image.png"],
  },
};

export default async function ProfessionalServicesPage() {
  const content = getContent("en");
  const { hero, cta } = content.servicesContent;

  // Fetch services from D1
  const services = await getServicesLocalized('en', 'professional-services');

  return (
    <>
      <OrganizationSchema />
      <BreadcrumbSchema items={[{ name: "Services", url: "https://itguys.ro/services" }]} />
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
            Learn more
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
