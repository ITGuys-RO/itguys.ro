import type { Metadata } from "next";
import Image from "next/image";
import { Hero, CTA } from "@/components/sections";
import { Section, Card, CardTitle, CardDescription } from "@/components/ui";
import { TeamIllustration } from "@/components/illustrations";
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
  title: "About",
  description:
    "15+ years of building secure software for companies like Electronic Arts and TUI. Based in Romania, working with clients worldwide.",
};

export default function AboutPage() {
  const { hero, ourStory, experience, whatWeBelieve, certifications, team, cta } = aboutContent;

  return (
    <>
      <Hero
        headline={hero.headline}
        subheadline={hero.subheadline}
        showBadge={false}
        illustration={<TeamIllustration className="w-full h-auto max-w-md mx-auto" />}
      />

      <Section>
        <h2 className="text-2xl md:text-3xl font-bold text-zinc-900 dark:text-white">
          {ourStory.title}
        </h2>
        <div className="mt-6 space-y-4">
          {ourStory.body.map((paragraph, i) => (
            <p key={i} className="text-lg text-zinc-600 dark:text-zinc-400">
              {paragraph}
            </p>
          ))}
        </div>
      </Section>

      <Section className="bg-brand-50 dark:bg-brand-900">
        <div className="flex items-center gap-3 mb-8">
          <div className="p-2 rounded-lg bg-brand-100 dark:bg-brand-800">
            <BuildingOffice2Icon className="w-6 h-6 text-brand-600 dark:text-brand-400" />
          </div>
          <h2 className="text-2xl md:text-3xl font-bold text-zinc-900 dark:text-white">
            {experience.title}
          </h2>
        </div>
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
          {experience.companies.map((company) => (
            <div
              key={company.name}
              className="p-6 rounded-xl bg-white dark:bg-brand-800 border border-brand-200 dark:border-brand-700 flex flex-col"
            >
              <div className="h-12 mb-4 flex items-center">
                <Image
                  src={company.logo}
                  alt={`${company.name} logo`}
                  width={120}
                  height={48}
                  className="object-contain max-h-12"
                />
              </div>
              <h3 className="text-lg font-bold text-brand-600 dark:text-brand-400 mb-2">
                {company.name}
              </h3>
              <p className="text-sm text-zinc-600 dark:text-zinc-400">{company.description}</p>
            </div>
          ))}
        </div>
      </Section>

      <Section>
        <h2 className="text-2xl md:text-3xl font-bold text-zinc-900 dark:text-white">
          {whatWeBelieve.title}
        </h2>
        <div className="mt-8 grid grid-cols-1 md:grid-cols-3 gap-6">
          {whatWeBelieve.values.map((value, index) => {
            const Icon = valueIcons[index] || LightBulbIcon;
            return (
              <Card key={value.title}>
                <div className="p-2 rounded-lg bg-brand-100 dark:bg-brand-700 w-fit mb-4">
                  <Icon className="w-6 h-6 text-brand-600 dark:text-brand-400" />
                </div>
                <CardTitle>{value.title}</CardTitle>
                <CardDescription>{value.description}</CardDescription>
              </Card>
            );
          })}
        </div>
      </Section>

      <Section className="bg-brand-50 dark:bg-brand-900">
        <div className="flex items-center gap-3 mb-8">
          <div className="p-2 rounded-lg bg-brand-100 dark:bg-brand-800">
            <AcademicCapIcon className="w-6 h-6 text-brand-600 dark:text-brand-400" />
          </div>
          <h2 className="text-2xl md:text-3xl font-bold text-zinc-900 dark:text-white">
            {certifications.title}
          </h2>
        </div>
        <div className="flex flex-wrap gap-3">
          {certifications.items.map((cert) => (
            <span
              key={cert}
              className="px-4 py-2 rounded-full bg-white dark:bg-brand-800 text-brand-700 dark:text-brand-300 font-medium border border-brand-200 dark:border-brand-700"
            >
              {cert}
            </span>
          ))}
        </div>
      </Section>

      {team.members.length > 0 && (
        <Section>
          <div className="flex items-center gap-3 mb-8">
            <div className="p-2 rounded-lg bg-brand-100 dark:bg-brand-800">
              <UserCircleIcon className="w-6 h-6 text-brand-600 dark:text-brand-400" />
            </div>
            <h2 className="text-2xl md:text-3xl font-bold text-zinc-900 dark:text-white">
              {team.title}
            </h2>
          </div>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {team.members.map((member) => (
              <Card key={member.name} className="p-8">
                <CardTitle className="text-xl">{member.name}</CardTitle>
                <p className="text-brand-600 dark:text-brand-400 font-medium mb-3">
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
