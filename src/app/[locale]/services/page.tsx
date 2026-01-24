import type { Metadata } from "next";
import { Hero, CTA } from "@/components/sections";
import { Section, Card, CardTitle, CardDescription } from "@/components/ui";
import { SecurityIllustration } from "@/components/illustrations";
import { BreadcrumbSchema, FAQSchema } from "@/components/structured-data";
import { getContent } from "@/content";
import { locales, type Locale } from "@/i18n/config";
import {
  CodeBracketIcon,
  CloudIcon,
  CpuChipIcon,
  DevicePhoneMobileIcon,
  CircleStackIcon,
  SparklesIcon,
} from "@heroicons/react/24/outline";

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

export function generateStaticParams() {
  return locales.map((locale) => ({ locale }));
}

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { locale } = await params;
  const isRomanian = locale === "ro";

  return {
    title: isRomanian
      ? "Servicii Dezvoltare - Web, Mobile, Cloud & AI"
      : "Development Services - Web, Mobile, Cloud & AI",
    description: isRomanian
      ? "Servicii de dezvoltare software personalizate incluzand aplicatii web, aplicatii mobile, infrastructura cloud, API-uri, solutii AI/ML si design baze de date. Construite de experti de la EA, TUI si Nagarro."
      : "Custom software development services including web applications, mobile apps, cloud infrastructure, APIs, AI/ML solutions, and database design. Built by experts from EA, TUI, and Nagarro.",
    openGraph: {
      title: isRomanian ? "Servicii Dezvoltare - ITGuys" : "Development Services - ITGuys",
      description: isRomanian
        ? "Dezvoltare software personalizata: aplicatii web, aplicatii mobile, infrastructura cloud, AI/ML si solutii baze de date."
        : "Custom software development: web apps, mobile apps, cloud infrastructure, AI/ML, and database solutions.",
      url: `https://itguys.ro${locale === "en" ? "" : `/${locale}`}/services`,
      type: "website",
    },
    alternates: {
      canonical: locale === "en" ? "/services" : `/${locale}/services`,
      languages: {
        en: "/services",
        ro: "/ro/services",
      },
    },
  };
}

export default async function ServicesPage({ params }: Props) {
  const { locale } = await params;

  const content = getContent(locale as Locale);
  const { hero, services, cta } = content.servicesContent;

  const faqItems = [
    {
      question: "What types of software do you develop?",
      answer: "We develop custom web applications, mobile apps (iOS and Android), APIs, backend systems, and cloud-based solutions. We specialize in React, Next.js, Node.js, and modern JavaScript technologies.",
    },
    {
      question: "Do you offer security testing services?",
      answer: "Yes, we provide comprehensive security services including security audits, penetration testing, vulnerability assessments, and security consulting to help protect your applications and infrastructure.",
    },
    {
      question: "What is your development process?",
      answer: "We follow agile methodologies with iterative development cycles. We start with requirements gathering, then move through design, development, testing, and deployment phases with continuous client communication.",
    },
    {
      question: "Do you work with clients outside Romania?",
      answer: "Absolutely. While we're based in Romania, we serve clients worldwide across Europe, UK, and other regions. We're experienced in remote collaboration and working across time zones.",
    },
    {
      question: "What technologies do you specialize in?",
      answer: "Our core expertise includes React, Next.js, Node.js, TypeScript, PostgreSQL, MongoDB, AWS, and various modern web and mobile frameworks. We choose the right technology stack based on your specific needs.",
    },
  ];

  return (
    <>
      <BreadcrumbSchema items={[{ name: "Services", url: `https://itguys.ro${locale === "en" ? "" : `/${locale}`}/services` }]} />
      <FAQSchema items={faqItems} />
      <Hero
        headline={hero.headline}
        subheadline={hero.subheadline}
        showBadge={false}
        illustration={<SecurityIllustration className="w-full h-auto max-w-sm mx-auto" />}
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
