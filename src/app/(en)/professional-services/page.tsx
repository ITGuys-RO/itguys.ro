import type { Metadata } from "next";
import { Hero, CTA } from "@/components/sections";
import { Section, Card, CardTitle, CardDescription } from "@/components/ui";
import { SecurityIllustration } from "@/components/illustrations";
import { BreadcrumbSchema, FAQSchema, OrganizationSchema } from "@/components/structured-data";
import { getContent } from "@/content";
import {
  ShieldCheckIcon,
  BeakerIcon,
  ChartBarIcon,
  ChatBubbleLeftRightIcon,
} from "@heroicons/react/24/outline";

const serviceIcons: Record<string, typeof ShieldCheckIcon> = {
  "qa-testing": BeakerIcon,
  security: ShieldCheckIcon,
  "data-analytics": ChartBarIcon,
  consulting: ChatBubbleLeftRightIcon,
};

export const metadata: Metadata = {
  title: "Professional Services - QA, Security & Analytics",
  description: "Professional IT services including quality assurance, security audits, penetration testing, and data analytics. Expert consulting backed by experience at Electronic Arts and TUI.",
  openGraph: {
    title: "Professional Services - ITGuys",
    description: "QA testing, security audits, penetration testing, and analytics services from experts with EA and TUI backgrounds.",
    url: "https://itguys.ro/professional-services",
    type: "website",
  },
  alternates: {
    canonical: "/professional-services",
    languages: {
      en: "/professional-services",
      ro: "/ro/professional-services",
      fr: "/fr/professional-services",
      de: "/de/professional-services",
    },
  },
  twitter: {
    card: "summary_large_image",
    title: "Professional Services - QA, Security & Analytics",
    description: "QA testing, security audits, and analytics from experts with EA and TUI backgrounds.",
    images: ["/og-image.png"],
  },
};

const faqItems = [
  {
    question: "What security testing services do you offer?",
    answer: "We provide penetration testing, security audits, cloud security reviews, DDoS protection, and incident response services. Our team has backgrounds at Electronic Arts and TUI, bringing enterprise-level security expertise.",
  },
  {
    question: "Do you offer QA services for existing projects?",
    answer: "Yes, we can integrate with your existing development team to provide manual testing, automated testing, performance testing, and security testing services. We work with Selenium, Appium, JMeter, and other industry-standard tools.",
  },
  {
    question: "What analytics solutions do you provide?",
    answer: "We implement custom dashboards, real-time monitoring, performance tracking, and competitive analysis. We help you transform raw data into actionable business intelligence using tools like Google Analytics, Mixpanel, and Grafana.",
  },
  {
    question: "Can you help with compliance and data privacy?",
    answer: "Absolutely. We help organizations achieve compliance with GDPR, CCPA, HIPAA, and other regulations. Our security audits include data privacy assessments and recommendations for regulatory compliance.",
  },
];

export default function ProfessionalServicesPage() {
  const content = getContent("en");
  const { hero, services, cta } = content.professionalServicesContent;

  return (
    <>
      <OrganizationSchema />
      <BreadcrumbSchema items={[{ name: "Professional Services", url: "https://itguys.ro/professional-services" }]} />
      <FAQSchema items={faqItems} />
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
