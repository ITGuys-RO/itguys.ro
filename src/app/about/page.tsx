import type { Metadata } from "next";
import Image from "next/image";
import Link from "next/link";
import crypto from "crypto";
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
  SparklesIcon,
  ArrowPathIcon,
  CubeTransparentIcon,
  WrenchScrewdriverIcon,
  RocketLaunchIcon,
  UserGroupIcon,
  EyeIcon,
  FlagIcon,
} from "@heroicons/react/24/outline";

function getGravatarUrl(email: string, size = 128) {
  const hash = crypto.createHash("md5").update(email.toLowerCase().trim()).digest("hex");
  return `https://www.gravatar.com/avatar/${hash}?s=${size}&d=mp`;
}

const valueIcons = [
  SparklesIcon,         // Simplicity
  ShieldCheckIcon,      // Reliability
  ArrowPathIcon,        // Adaptability
  LightBulbIcon,        // Security
  WrenchScrewdriverIcon, // Right tool for the job
  ChatBubbleBottomCenterTextIcon, // Clear communication
];

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
  const { hero, vision, ourStory, mission, experience, whatWeBelieve, deliveryModels, certifications, team, cta } = aboutContent;

  return (
    <>
      <BreadcrumbSchema items={[{ name: "About", url: "https://itguys.ro/about" }]} />
      <Hero
        headline={hero.headline}
        subheadline={hero.subheadline}
        showBadge={false}
        illustration={<TeamIllustration className="w-full h-auto max-w-md mx-auto" />}
      />

      <Section className="bg-brand-900/50">
        <div className="flex items-center gap-3 mb-6">
          <div className="p-2 rounded-lg bg-brand-800/50 border border-brand-700/30">
            <EyeIcon className="w-6 h-6 text-neon" />
          </div>
          <h2 className="text-2xl md:text-3xl font-bold text-white">
            {vision.title}
          </h2>
        </div>
        <div className="space-y-4">
          {vision.body.map((paragraph, i) => (
            <p key={i} className="text-lg text-brand-200">
              {paragraph}
            </p>
          ))}
          <p className="text-xl font-semibold text-neon mt-6">
            {vision.highlight}
          </p>
        </div>
      </Section>

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
        <div className="flex items-center gap-3 mb-6">
          <div className="p-2 rounded-lg bg-brand-800/50 border border-brand-700/30">
            <FlagIcon className="w-6 h-6 text-neon" />
          </div>
          <h2 className="text-2xl md:text-3xl font-bold text-white">
            {mission.title}
          </h2>
        </div>
        <div className="space-y-4">
          {mission.body.map((paragraph, i) => (
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
        {whatWeBelieve.intro && (
          <p className="mt-4 text-lg text-brand-200 max-w-3xl">
            {whatWeBelieve.intro}
          </p>
        )}
        <div className="mt-8 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
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
        <div className="flex items-center gap-3 mb-6">
          <div className="p-2 rounded-lg bg-brand-800/50 border border-brand-700/30">
            <RocketLaunchIcon className="w-6 h-6 text-neon" />
          </div>
          <h2 className="text-2xl md:text-3xl font-bold text-white">
            {deliveryModels.title}
          </h2>
        </div>
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          {deliveryModels.models.map((model) => (
            <Card key={model.title} cornerAccents className="p-8">
              <div className="p-2 rounded-lg bg-brand-800/50 border border-brand-700/30 w-fit mb-4">
                <UserGroupIcon className="w-6 h-6 text-brand-300" />
              </div>
              <CardTitle className="text-xl mb-3">{model.title}</CardTitle>
              <CardDescription className="mb-4">{model.description}</CardDescription>
              <p className="text-sm text-neon font-medium">{model.ideal}</p>
            </Card>
          ))}
        </div>
      </Section>

      <Section>
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
                <div className="flex items-center gap-4 mb-4">
                  {member.email ? (
                    <Image
                      src={getGravatarUrl(member.email)}
                      alt={member.name}
                      width={64}
                      height={64}
                      className="rounded-full object-cover w-16 h-16"
                    />
                  ) : (
                    <div className="w-16 h-16 rounded-full bg-brand-800/50 border border-brand-700/30 flex items-center justify-center">
                      <UserCircleIcon className="w-10 h-10 text-brand-400" />
                    </div>
                  )}
                  <div>
                    <CardTitle className="text-xl mb-1">
                      {member.linkedIn ? (
                        <Link
                          href={member.linkedIn}
                          target="_blank"
                          rel="noopener noreferrer"
                          className="hover:text-neon transition-colors"
                        >
                          {member.name}
                        </Link>
                      ) : (
                        member.name
                      )}
                    </CardTitle>
                    <p className="text-brand-300 font-medium">
                      {member.role}
                    </p>
                  </div>
                </div>
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
