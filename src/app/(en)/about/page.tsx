import type { Metadata } from "next";
import Image from "next/image";
import { Hero, CTA } from "@/components/sections";
import { Section, Card, CardTitle, CardDescription } from "@/components/ui";
import { BreadcrumbSchema } from "@/components/structured-data";
import { getContent } from "@/content";
import { getGravatarUrl } from "@/lib/gravatar";
import {
  AcademicCapIcon,
  UserGroupIcon,
  BuildingOffice2Icon,
  CheckBadgeIcon,
} from "@heroicons/react/24/outline";

export const metadata: Metadata = {
  title: "About Us - ITGuys",
  description: "Learn about ITGuys - a team with 25+ years combined experience from EA, TUI, and Nagarro. Web, mobile, and security experts based in Romania.",
  openGraph: {
    title: "About Us - ITGuys",
    description: "Learn about ITGuys - a team with 25+ years combined experience from EA, TUI, and Nagarro.",
    url: "https://itguys.ro/about",
    type: "website",
  },
  alternates: {
    canonical: "/about",
    languages: {
      en: "/about",
      ro: "/ro/about",
      fr: "/fr/about",
      de: "/de/about",
    },
  },
};

export default function AboutPage() {
  const content = getContent("en");
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

  return (
    <>
      <BreadcrumbSchema
        items={[
          {
            name: "About",
            url: "https://itguys.ro/about",
          },
        ]}
      />

      <Hero
        headline={hero.headline}
        subheadline={hero.subheadline}
        showBadge={false}
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
          {experience.companies.map((company) => (
            <Card key={company.name}>
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
          {team.members.map((member) => (
            <div
              key={member.name}
              className="p-6 rounded-xl bg-brand-800/30 border border-brand-700/30"
            >
              <div className="flex items-start gap-4">
                {member.email && (
                  <Image
                    src={getGravatarUrl(member.email, 160)}
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
