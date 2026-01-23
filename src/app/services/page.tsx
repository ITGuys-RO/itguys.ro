import type { Metadata } from "next";
import { Hero, CTA } from "@/components/sections";
import { Section, Card, CardTitle, CardDescription } from "@/components/ui";
import { SecurityIllustration } from "@/components/illustrations";
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
  title: "Services",
  description:
    "Custom software and security services. Web apps, mobile apps, APIs, security audits, and penetration testing.",
};

export default function ServicesPage() {
  const { hero, services, cta } = servicesContent;

  return (
    <>
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
