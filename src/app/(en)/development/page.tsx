import type { Metadata } from "next";
import { Hero, CTA } from "@/components/sections";
import { Section, Card, CardTitle, CardDescription } from "@/components/ui";
import { DevelopmentIllustration } from "@/components/illustrations";
import { BreadcrumbSchema, FAQSchema, OrganizationSchema } from "@/components/structured-data";
import { getContent } from "@/content";
import { getServicesLocalized } from "@/lib/db";
import { generateAlternates } from "@/i18n";
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

export const metadata: Metadata = {
  title: "Development Services - Web, Mobile, Cloud & AI",
  description: "Web apps, mobile apps, cloud infrastructure, and AI solutions. Custom software built by EA, TUI, and Nagarro experts.",
  openGraph: {
    title: "Development Services - ITGuys",
    description: "Web apps, mobile apps, cloud infrastructure, and AI solutions. Custom software built by EA, TUI, and Nagarro experts.",
    url: "https://itguys.ro/development",
    type: "website",
  },
  alternates: generateAlternates("/development"),
  twitter: {
    card: "summary_large_image",
    title: "Development Services - Web, Mobile, Cloud & AI",
    description: "Web apps, mobile apps, cloud infrastructure, and AI solutions. Custom software built by EA, TUI, and Nagarro experts.",
    images: ["/og-image.png"],
  },
};

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

export default async function ServicesPage() {
  const content = getContent("en");
  const { hero, cta } = content.developmentContent;

  // Fetch services from D1
  const services = await getServicesLocalized('en', 'development');

  return (
    <>
      <OrganizationSchema />
      <BreadcrumbSchema items={[{ name: "Development", url: "https://itguys.ro/development" }]} />
      <FAQSchema items={faqItems} />
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
