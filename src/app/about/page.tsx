import type { Metadata } from "next";
import Image from "next/image";
import { Hero, CTA } from "@/components/sections";
import { Section, Card, CardTitle, CardDescription } from "@/components/ui";
import { TeamIllustration } from "@/components/illustrations";
import { BreadcrumbSchema } from "@/components/structured-data";
import { aboutContent } from "@/content";
import {
  LightBulbIcon,
  ShieldCheckIcon,
  ChatBubbleBottomCenterTextIcon,
  BuildingOffice2Icon,
  AcademicCapIcon,
  UserCircleIcon,
} from "@heroicons/react/24/outline";

const valueIcons = [LightBulbIcon, ShieldCheckIcon, ChatBubbleBottomCenterTextIcon];

export const metadata: Metadata = {
  title: "About Us - Expert Software Development Team",
  description:
    "15+ years of building secure, scalable software for global companies including Electronic Arts, TUI, and Nagarro. Based in Romania, delivering custom software solutions worldwide with expertise in web, mobile, and security.",
  openGraph: {
    title: "About ITGuys - Expert Software Development Team",
    description:
      "15+ years of building secure software for companies like Electronic Arts and TUI. Based in Romania, working with clients worldwide.",
    url: "https://itguys.ro/about",
    type: "website",
  },
  alternates: {
    canonical: "/about",
  },
};

export default function AboutPage() {
  const { hero, ourStory, experience, whatWeBelieve, certifications, team, cta } = aboutContent;

  return (
    <>
      <BreadcrumbSchema items={[{ name: "About", url: "https://itguys.ro/about" }]} />
      <Hero
        headline={hero.headline}
        subheadline={hero.subheadline}
        showBadge={false}
        illustration={<TeamIllustration className="w-full h-auto max-w-md mx-auto" />}
      />

      <Section>
        <h2 className="text-2xl md:text-3xl font-bold text-white">
          {ourStory.title}
        </h2>
        <div className="mt-6 space-y-4">
          {ourStory.body.map((paragraph, i) => (
            <p key={i} className="text-lg text-brand-200">
              {paragraph}
            </p>
          ))}
        </div>
      </Section>

      <Section className="bg-brand-900/50">
        <div className="flex items-center gap-3 mb-8">
          <div className="p-2 rounded-lg bg-brand-800/50 border border-brand-700/30">
            <BuildingOffice2Icon className="w-6 h-6 text-neon" />
          </div>
          <h2 className="text-2xl md:text-3xl font-bold text-white">
            {experience.title}
          </h2>
        </div>
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
          {experience.companies.map((company) => (
            <div
              key={company.name}
              className="p-6 rounded-xl bg-brand-900/60 backdrop-blur-sm border border-brand-700/30 flex flex-col hover:border-brand-400/40 transition-all duration-300 hover:shadow-[0_0_20px_rgba(81,116,161,0.1)]"
            >
              <div className="h-12 mb-4 flex items-center">
                <Image
                  src={company.logo}
                  alt={`${company.name} logo`}
                  width={120}
                  height={48}
                  className="object-contain max-h-12 brightness-0 invert opacity-70"
                />
              </div>
              <h3 className="text-lg font-bold text-brand-300 mb-2">
                {company.name}
              </h3>
              <p className="text-sm text-brand-200">{company.description}</p>
            </div>
          ))}
        </div>
      </Section>

      <Section>
        <h2 className="text-2xl md:text-3xl font-bold text-white">
          {whatWeBelieve.title}
        </h2>
        <div className="mt-8 grid grid-cols-1 md:grid-cols-3 gap-6">
          {whatWeBelieve.values.map((value, index) => {
            const Icon = valueIcons[index] || LightBulbIcon;
            return (
              <Card key={value.title} cornerAccents>
                <div className="p-2 rounded-lg bg-brand-800/50 border border-brand-700/30 w-fit mb-4">
                  <Icon className="w-6 h-6 text-brand-300" />
                </div>
                <CardTitle>{value.title}</CardTitle>
                <CardDescription>{value.description}</CardDescription>
              </Card>
            );
          })}
        </div>
      </Section>

      <Section className="bg-brand-900/50">
        <div className="flex items-center gap-3 mb-8">
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
              className="px-4 py-2 rounded-full bg-brand-800/50 border border-brand-700/30 text-brand-200 font-medium hover:border-neon/30 hover:text-neon transition-colors"
            >
              {cert}
            </span>
          ))}
        </div>
      </Section>

      {team.members.length > 0 && (
        <Section>
          <div className="flex items-center gap-3 mb-8">
            <div className="p-2 rounded-lg bg-brand-800/50 border border-brand-700/30">
              <UserCircleIcon className="w-6 h-6 text-neon" />
            </div>
            <h2 className="text-2xl md:text-3xl font-bold text-white">
              {team.title}
            </h2>
          </div>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {team.members.map((member) => (
              <Card key={member.name} className="p-8">
                <CardTitle className="text-xl">{member.name}</CardTitle>
                <p className="text-brand-300 font-medium mb-3">
                  {member.role}
                </p>
                <CardDescription>{member.bio}</CardDescription>
              </Card>
            ))}
          </div>
        </Section>
      )}

      <CTA
        headline={cta.headline}
        body={cta.body}
        buttonText={cta.buttonText}
        buttonHref={cta.buttonHref}
      />
    </>
  );
}
