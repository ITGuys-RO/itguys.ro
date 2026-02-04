import type { Metadata } from "next";
import { Hero, CTA } from "@/components/sections";
import { WebPageSchema, OrganizationSchema } from "@/components/structured-data";
import { Section, Card, CardTitle, CardDescription, AnimateOnScroll } from "@/components/ui";
import { HeroIllustration } from "@/components/illustrations";
import { getContent } from "@/content";
import { Link } from "@/i18n/navigation";
import { generateAlternates } from "@/i18n";
import {
  SparklesIcon,
  RocketLaunchIcon,
  BuildingOffice2Icon,
  CodeBracketIcon,
  DevicePhoneMobileIcon,
  ServerStackIcon,
  ShieldCheckIcon,
  ArrowRightIcon,
  UserGroupIcon,
  WrenchScrewdriverIcon,
} from "@heroicons/react/24/outline";

const clientIcons = [RocketLaunchIcon, BuildingOffice2Icon];

const buildIcons = [CodeBracketIcon, DevicePhoneMobileIcon, ServerStackIcon, ShieldCheckIcon];

export const metadata: Metadata = {
  alternates: generateAlternates("/"),
  openGraph: {
    url: "https://itguys.ro",
    images: [
      {
        url: "/og-image.png",
        width: 1200,
        height: 630,
        alt: "ITGuys - Custom Software Development",
      },
    ],
  },
  twitter: {
    card: "summary_large_image",
    images: ["/og-image.png"],
  },
};

export default function HomePage() {
  const content = getContent("en");
  const { hero, stats, whatSetsUsApart, whoWeWorkWith, whatWeBuild, cta } = content.homeContent;

  return (
    <>
      <OrganizationSchema />
      <WebPageSchema
        title="ITGuys - Custom Software Development & Cybersecurity Services"
        description="Custom software development and cybersecurity services. Web apps, mobile development, and security solutions from EA, TUI, and Nagarro veterans."
        url="https://itguys.ro"
        language="en"
      />
      <Hero
        headline={hero.headline}
        subheadline={hero.subheadline}
        cta={hero.cta}
        secondaryCta={hero.secondaryCta}
        badgeText={hero.badgeText}
        illustration={<HeroIllustration className="w-full h-auto max-w-lg mx-auto" />}
      />

      <div className="relative border-y border-brand-700/30 bg-brand-900/80 backdrop-blur-sm">
        <div className="absolute top-0 left-0 right-0 h-px bg-gradient-to-r from-transparent via-neon/30 to-transparent" />
        <div className="max-w-6xl mx-auto px-6 md:px-8 py-8">
          <div className="grid grid-cols-2 md:grid-cols-4 gap-8">
            {stats.map((stat, index) => (
              <AnimateOnScroll key={stat.label} animation="fade-in-up" delay={index * 100}>
                <div className="text-center">
                  <div className="text-3xl md:text-4xl font-bold text-neon drop-shadow-[0_0_10px_rgba(0,212,255,0.3)]">
                    {stat.value}
                  </div>
                  <div className="mt-1 text-sm text-brand-200">
                    {stat.label}
                  </div>
                </div>
              </AnimateOnScroll>
            ))}
          </div>
        </div>
      </div>

      <Section>
        <AnimateOnScroll animation="slide-in-left">
          <div className="flex items-center gap-3 mb-6">
            <div className="p-2 rounded-lg bg-brand-800/50 border border-brand-700/30">
              <SparklesIcon className="w-6 h-6 text-neon" />
            </div>
            <h2 className="text-2xl md:text-3xl font-bold text-white">
              {whatSetsUsApart.title}
            </h2>
          </div>
        </AnimateOnScroll>
        <div className="space-y-4 pl-0 md:pl-14">
          {whatSetsUsApart.body.map((paragraph, i) => (
            <AnimateOnScroll key={i} animation="fade-in-up" delay={i * 100}>
              <p className="text-lg text-brand-200">
                {paragraph}
              </p>
            </AnimateOnScroll>
          ))}
        </div>
      </Section>

      <Section className="bg-brand-900/50">
        <AnimateOnScroll animation="slide-in-left">
          <div className="flex items-center gap-3 mb-8">
            <div className="p-2 rounded-lg bg-brand-800/50 border border-brand-700/30">
              <UserGroupIcon className="w-6 h-6 text-neon" />
            </div>
            <h2 className="text-2xl md:text-3xl font-bold text-white">
              {whoWeWorkWith.title}
            </h2>
          </div>
        </AnimateOnScroll>
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          {whoWeWorkWith.items.map((item, index) => {
            const Icon = clientIcons[index];
            return (
              <AnimateOnScroll
                key={item.title}
                animation={index === 0 ? "slide-in-left" : "slide-in-right"}
                delay={index * 150}
              >
                <Card className="relative overflow-hidden h-full" cornerAccents>
                  <div className="flex items-start gap-4">
                    <div className="p-3 rounded-xl bg-brand-800/50 border border-brand-700/30 shrink-0">
                      <Icon className="w-6 h-6 text-brand-300" />
                    </div>
                    <div>
                      <CardTitle>{item.title}</CardTitle>
                      <CardDescription>{item.description}</CardDescription>
                    </div>
                  </div>
                </Card>
              </AnimateOnScroll>
            );
          })}
        </div>
      </Section>

      <Section>
        <AnimateOnScroll animation="slide-in-left">
          <div className="flex items-center gap-3 mb-2">
            <div className="p-2 rounded-lg bg-brand-800/50 border border-brand-700/30">
              <WrenchScrewdriverIcon className="w-6 h-6 text-neon" />
            </div>
            <h2 className="text-2xl md:text-3xl font-bold text-white">
              {whatWeBuild.title}
            </h2>
          </div>
        </AnimateOnScroll>
        <div className="mt-8 grid grid-cols-2 md:grid-cols-4 gap-4">
          {whatWeBuild.categories.map((label, index) => {
            const Icon = buildIcons[index];
            return (
              <AnimateOnScroll key={label} animation="scale-in" delay={index * 100}>
                <div className="flex flex-col items-center gap-3 p-4 rounded-xl bg-brand-900/60 backdrop-blur-sm border border-brand-700/30 hover:border-brand-400/40 transition-all duration-300 hover:shadow-[0_0_20px_rgba(81,116,161,0.15)] h-full group">
                  <div className="p-3 rounded-full bg-brand-800/50 border border-brand-700/30 group-hover:border-neon/30 transition-colors">
                    <Icon className="w-6 h-6 text-brand-300 group-hover:text-neon transition-colors" />
                  </div>
                  <span className="text-sm font-medium text-brand-200">
                    {label}
                  </span>
                </div>
              </AnimateOnScroll>
            );
          })}
        </div>
        <div className="mt-8 space-y-4">
          {whatWeBuild.body.map((paragraph, i) => (
            <AnimateOnScroll key={i} animation="fade-in-up" delay={i * 100}>
              <p className="text-lg text-brand-200">
                {paragraph}
              </p>
            </AnimateOnScroll>
          ))}
        </div>
        <AnimateOnScroll animation="fade-in-up" delay={200}>
          <div className="mt-6">
            <Link
              href={whatWeBuild.link.href}
              className="inline-flex items-center gap-2 text-neon font-medium hover:drop-shadow-[0_0_8px_rgba(0,212,255,0.5)] transition-all duration-300"
            >
              {whatWeBuild.link.text}
              <ArrowRightIcon className="w-4 h-4" />
            </Link>
          </div>
        </AnimateOnScroll>
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
