import type { Metadata } from "next";
import Image from "next/image";
import { Hero, CTA } from "@/components/sections";
import { Section, Card, CardTitle, CardDescription } from "@/components/ui";
import { BreadcrumbSchema, OrganizationSchema } from "@/components/structured-data";
import { AboutIllustration } from "@/components/illustrations";
import { getContent } from "@/content";
import { getGravatarUrl } from "@/lib/gravatar";
import { getTeamMembersLocalized, getCompaniesLocalized } from "@/lib/db";
import { locales, type Locale } from "@/i18n/config";
import {
  AcademicCapIcon,
  UserGroupIcon,
  BuildingOffice2Icon,
  CheckBadgeIcon,
} from "@heroicons/react/24/outline";

// Force dynamic rendering since we fetch from D1
export const dynamic = 'force-dynamic';

type Props = {
  params: Promise<{ locale: string }>;
};

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { locale } = await params;
  const content = getContent(locale as Locale);
  const { hero } = content.aboutContent;

  const titles: Record<string, string> = {
    en: "About Us - ITGuys",
    ro: "Despre Noi - ITGuys",
    fr: "À Propos - ITGuys",
    de: "Über Uns - ITGuys",
    it: "Chi Siamo - ITGuys",
    es: "Sobre Nosotros - ITGuys",
  };

  const descriptions: Record<string, string> = {
    en: "Meet our team of software experts from EA, TUI, and Nagarro. Web, mobile, and security specialists based in Romania.",
    ro: "Echipa noastra de experti software de la EA, TUI si Nagarro. Specialisti web, mobile si securitate din Romania.",
    fr: "Notre equipe d'experts logiciels issus d'EA, TUI et Nagarro. Specialistes web, mobile et securite bases en Roumanie.",
    de: "Unser Expertenteam von EA, TUI und Nagarro. Web-, Mobile- und Sicherheitsspezialisten aus Rumanien.",
    it: "Il nostro team di esperti software da EA, TUI e Nagarro. Specialisti web, mobile e sicurezza dalla Romania.",
    es: "Nuestro equipo de expertos en software de EA, TUI y Nagarro. Especialistas web, movil y seguridad de Rumania.",
  };

  return {
    title: titles[locale] || titles.en,
    description: descriptions[locale] || descriptions.en,
    openGraph: {
      title: titles[locale] || titles.en,
      description: hero.subheadline,
      url: `https://itguys.ro${locale === "en" ? "" : `/${locale}`}/about`,
      type: "website",
    },
    alternates: {
      canonical: locale === "en" ? "/about" : `/${locale}/about`,
      languages: {
        en: "/about",
        ro: "/ro/about",
        fr: "/fr/about",
        de: "/de/about",
        it: "/it/about",
        es: "/es/about",
      },
    },
  };
}

export default async function AboutPage({ params }: Props) {
  const { locale } = await params;
  const content = getContent(locale as Locale);
  const {
    hero,
    vision,
    ourStory,
    mission,
    experience,
    whatWeBelieve,
    deliveryModels,
    certifications,
    team,
    cta,
  } = content.aboutContent;

  // Fetch dynamic data from D1
  const [teamMembers, companies] = await Promise.all([
    getTeamMembersLocalized(locale as Locale),
    getCompaniesLocalized(locale as Locale),
  ]);

  return (
    <>
      <OrganizationSchema />
      <BreadcrumbSchema
        items={[
          {
            name: locale === "ro" ? "Despre" : locale === "fr" ? "À propos" : locale === "de" ? "Über uns" : "About",
            url: `https://itguys.ro${locale === "en" ? "" : `/${locale}`}/about`,
          },
        ]}
      />

      <Hero
        headline={hero.headline}
        subheadline={hero.subheadline}
        showBadge={false}
        illustration={<AboutIllustration className="w-full h-auto max-w-sm mx-auto" />}
      />

      {/* Vision */}
      <Section>
        <h2 className="text-2xl md:text-3xl font-bold text-white mb-6">
          {vision.title}
        </h2>
        <div className="space-y-4">
          {vision.body.map((paragraph, index) => (
            <p key={index} className="text-brand-200 text-lg">
              {paragraph}
            </p>
          ))}
        </div>
        <p className="mt-6 text-xl font-semibold text-neon">
          {vision.highlight}
        </p>
      </Section>

      {/* Our Story */}
      <Section className="bg-brand-900/50">
        <h2 className="text-2xl md:text-3xl font-bold text-white mb-6">
          {ourStory.title}
        </h2>
        <div className="space-y-4">
          {ourStory.body.map((paragraph, index) => (
            <p key={index} className="text-brand-200 text-lg">
              {paragraph}
            </p>
          ))}
        </div>
      </Section>

      {/* Mission */}
      <Section>
        <h2 className="text-2xl md:text-3xl font-bold text-white mb-6">
          {mission.title}
        </h2>
        <div className="space-y-4">
          {mission.body.map((paragraph, index) => (
            <p key={index} className="text-brand-200 text-lg">
              {paragraph}
            </p>
          ))}
        </div>
      </Section>

      {/* Partners / Experience */}
      <Section className="bg-brand-900/50">
        <div className="flex items-center gap-3 mb-6">
          <div className="p-2 rounded-lg bg-brand-800/50 border border-brand-700/30">
            <BuildingOffice2Icon className="w-6 h-6 text-neon" />
          </div>
          <h2 className="text-2xl md:text-3xl font-bold text-white">
            {experience.title}
          </h2>
        </div>
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          {companies.map((company) => (
            <Card key={company.slug}>
              <CardTitle>{company.name}</CardTitle>
              <CardDescription>{company.description}</CardDescription>
            </Card>
          ))}
        </div>
      </Section>

      {/* Principles / Values */}
      <Section>
        <div className="flex items-center gap-3 mb-4">
          <div className="p-2 rounded-lg bg-brand-800/50 border border-brand-700/30">
            <CheckBadgeIcon className="w-6 h-6 text-neon" />
          </div>
          <h2 className="text-2xl md:text-3xl font-bold text-white">
            {whatWeBelieve.title}
          </h2>
        </div>
        <p className="text-brand-200 text-lg mb-8">{whatWeBelieve.intro}</p>
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {whatWeBelieve.values.map((value) => (
            <Card key={value.title}>
              <CardTitle>{value.title}</CardTitle>
              <CardDescription>{value.description}</CardDescription>
            </Card>
          ))}
        </div>
      </Section>

      {/* How We Work */}
      <Section className="bg-brand-900/50">
        <h2 className="text-2xl md:text-3xl font-bold text-white mb-6">
          {deliveryModels.title}
        </h2>
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          {deliveryModels.models.map((model) => (
            <Card key={model.title}>
              <CardTitle>{model.title}</CardTitle>
              <CardDescription>{model.description}</CardDescription>
              <p className="mt-4 text-sm text-neon font-medium">{model.ideal}</p>
            </Card>
          ))}
        </div>
      </Section>

      {/* Certifications */}
      <Section>
        <div className="flex items-center gap-3 mb-6">
          <div className="p-2 rounded-lg bg-brand-800/50 border border-brand-700/30">
            <AcademicCapIcon className="w-6 h-6 text-neon" />
          </div>
          <h2 className="text-2xl md:text-3xl font-bold text-white">
            {certifications.title}
          </h2>
        </div>
        <div className="flex flex-wrap gap-3">
          {certifications.items.map((cert) => (
            <span
              key={cert}
              className="px-4 py-2 bg-brand-800/50 border border-brand-700/30 text-brand-200 rounded-lg"
            >
              {cert}
            </span>
          ))}
        </div>
      </Section>

      {/* Team */}
      <Section className="bg-brand-900/50">
        <div className="flex items-center gap-3 mb-6">
          <div className="p-2 rounded-lg bg-brand-800/50 border border-brand-700/30">
            <UserGroupIcon className="w-6 h-6 text-neon" />
          </div>
          <h2 className="text-2xl md:text-3xl font-bold text-white">
            {team.title}
          </h2>
        </div>
        <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
          {teamMembers.map((member) => (
            <div
              key={member.slug}
              className="p-6 rounded-xl bg-brand-800/30 border border-brand-700/30"
            >
              <div className="flex items-start gap-4">
                {(member.gravatarEmail || member.email) && (
                  <Image
                    src={getGravatarUrl(member.gravatarEmail || member.email!, 160)}
                    alt={member.name}
                    width={80}
                    height={80}
                    className="rounded-full border-2 border-brand-700/50 shrink-0"
                  />
                )}
                <div>
                  <h3 className="text-xl font-bold text-white">{member.name}</h3>
                  <p className="text-neon font-medium mt-1">{member.role}</p>
                </div>
              </div>
              <p className="text-brand-200 mt-4">{member.bio}</p>
              <div className="mt-4 flex gap-4">
                {member.linkedIn && (
                  <a
                    href={member.linkedIn}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="text-brand-300 hover:text-neon transition-colors"
                  >
                    LinkedIn
                  </a>
                )}
                {member.email && (
                  <a
                    href={`mailto:${member.email}`}
                    className="text-brand-300 hover:text-neon transition-colors"
                  >
                    Email
                  </a>
                )}
              </div>
            </div>
          ))}
        </div>
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
