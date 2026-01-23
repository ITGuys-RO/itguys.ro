import type { Metadata } from "next";
import { Hero, CTA } from "@/components/sections";
import { Section, Card, CardTitle, CardDescription } from "@/components/ui";
import { SecurityIllustration } from "@/components/illustrations";
import { BreadcrumbSchema, FAQSchema } from "@/components/structured-data";
import { servicesContent } from "@/content";
import {
  CodeBracketIcon,
  ShieldCheckIcon,
  CloudIcon,
  CpuChipIcon,
  DevicePhoneMobileIcon,
} from "@heroicons/react/24/outline";

const serviceIcons: Record<string, typeof CodeBracketIcon> = {
  development: CodeBracketIcon,
  mobile: DevicePhoneMobileIcon,
  security: ShieldCheckIcon,
  cloud: CloudIcon,
  consulting: CpuChipIcon,
};

export const metadata: Metadata = {
  title: "Services - Custom Software Development & Security",
  description:
    "Comprehensive software development and security services including custom web applications, mobile apps, API development, cloud solutions, security audits, and penetration testing. Expert consulting for your technology needs.",
  openGraph: {
    title: "Our Services - ITGuys",
    description:
      "Custom software and security services. Web apps, mobile apps, APIs, security audits, and penetration testing.",
    url: "https://itguys.ro/services",
    type: "website",
  },
  alternates: {
    canonical: "/services",
  },
};

export default function ServicesPage() {
  const { hero, services, cta } = servicesContent;

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
      <BreadcrumbSchema items={[{ name: "Services", url: "https://itguys.ro/services" }]} />
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
          className={index % 2 === 1 ? "bg-brand-50 dark:bg-brand-900" : ""}
        >
          <div className="flex items-center gap-3 mb-2">
            <div className="p-2 rounded-lg bg-brand-100 dark:bg-brand-800">
              <Icon className="w-6 h-6 text-brand-600 dark:text-brand-400" />
            </div>
            <h2 className="text-2xl md:text-3xl font-bold text-zinc-900 dark:text-white">
              {service.title}
            </h2>
          </div>
          <p className="mt-4 text-lg text-zinc-600 dark:text-zinc-400">
            {service.description}
          </p>
          {service.details && (
            <p className="mt-4 text-zinc-600 dark:text-zinc-400">
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
                  className="px-3 py-1 text-sm bg-brand-100 dark:bg-brand-800 text-brand-700 dark:text-brand-300 rounded-full"
                >
                  {tech}
                </span>
              ))}
            </div>
          )}

          {service.note && (
            <p className="mt-6 text-sm text-zinc-500 dark:text-zinc-500 italic">
              {service.note}
            </p>
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
