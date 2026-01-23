import type { Metadata } from "next";
import Link from "next/link";
import { Hero, CTA } from "@/components/sections";
import { WebPageSchema } from "@/components/structured-data";
import { Section, Card, CardTitle, CardDescription, AnimateOnScroll } from "@/components/ui";
import { HeroIllustration } from "@/components/illustrations";
import { homeContent } from "@/content";
import {
  SparklesIcon,
  RocketLaunchIcon,
  BuildingOffice2Icon,
  CodeBracketIcon,
  DevicePhoneMobileIcon,
  ServerStackIcon,
  ShieldCheckIcon,
  ArrowRightIcon,
} from "@heroicons/react/24/outline";

const clientIcons = [RocketLaunchIcon, BuildingOffice2Icon];

const buildIcons = [
  { icon: CodeBracketIcon, label: "Web Apps" },
  { icon: DevicePhoneMobileIcon, label: "Mobile Apps" },
  { icon: ServerStackIcon, label: "APIs & Backends" },
  { icon: ShieldCheckIcon, label: "Security" },
];

export const metadata: Metadata = {
  alternates: {
    canonical: "/",
  },
  openGraph: {
    url: "https://itguys.ro",
  },
};

export default function HomePage() {
  const { hero, stats, whatSetsUsApart, whoWeWorkWith, whatWeBuild, cta } = homeContent;

  return (
    <>
      <WebPageSchema
        title="ITGuys - Custom Software Development & Security Services"
        description="Custom web and mobile apps, plus security services. We build software with the right technology for your problem."
        url="https://itguys.ro"
      />
      <Hero
        headline={hero.headline}
        subheadline={hero.subheadline}
        cta={hero.cta}
        illustration={<HeroIllustration className="w-full h-auto max-w-lg mx-auto" />}
      />

      {/* Stats bar */}
      <div className="border-y border-brand-200 dark:border-brand-800 bg-brand-50 dark:bg-brand-900">
        <div className="max-w-4xl mx-auto px-6 md:px-8 py-8">
          <div className="grid grid-cols-3 gap-8">
            {stats.map((stat, index) => (
              <AnimateOnScroll key={stat.label} animation="fade-in-up" delay={index * 100}>
                <div className="text-center">
                  <div className="text-3xl md:text-4xl font-bold text-brand-600 dark:text-brand-400">
                    {stat.value}
                  </div>
                  <div className="mt-1 text-sm text-zinc-600 dark:text-zinc-400">
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
            <div className="p-2 rounded-lg bg-brand-100 dark:bg-brand-800">
              <SparklesIcon className="w-6 h-6 text-brand-600 dark:text-brand-400" />
            </div>
            <h2 className="text-2xl md:text-3xl font-bold text-zinc-900 dark:text-white">
              {whatSetsUsApart.title}
            </h2>
          </div>
        </AnimateOnScroll>
        <div className="space-y-4 pl-0 md:pl-14">
          {whatSetsUsApart.body.map((paragraph, i) => (
            <AnimateOnScroll key={i} animation="fade-in-up" delay={i * 100}>
              <p className="text-lg text-zinc-600 dark:text-zinc-400">
                {paragraph}
              </p>
            </AnimateOnScroll>
          ))}
        </div>
      </Section>

      <Section className="bg-brand-50 dark:bg-brand-900">
        <AnimateOnScroll animation="fade-in-up">
          <h2 className="text-2xl md:text-3xl font-bold text-zinc-900 dark:text-white mb-8">
            {whoWeWorkWith.title}
          </h2>
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
                <Card className="relative overflow-hidden h-full">
                  <div className="flex items-start gap-4">
                    <div className="p-3 rounded-xl bg-brand-100 dark:bg-brand-700 shrink-0">
                      <Icon className="w-6 h-6 text-brand-600 dark:text-brand-400" />
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
        <AnimateOnScroll animation="fade-in-up">
          <h2 className="text-2xl md:text-3xl font-bold text-zinc-900 dark:text-white">
            {whatWeBuild.title}
          </h2>
        </AnimateOnScroll>
        <div className="mt-8 grid grid-cols-2 md:grid-cols-4 gap-4">
          {buildIcons.map(({ icon: Icon, label }, index) => (
            <AnimateOnScroll key={label} animation="scale-in" delay={index * 100}>
              <div className="flex flex-col items-center gap-3 p-4 rounded-xl bg-white dark:bg-brand-800 border border-brand-200 dark:border-brand-700 shadow-sm shadow-brand-200/50 dark:shadow-brand-950/50 h-full">
                <div className="p-3 rounded-full bg-brand-100 dark:bg-brand-700">
                  <Icon className="w-6 h-6 text-brand-600 dark:text-brand-400" />
                </div>
                <span className="text-sm font-medium text-zinc-700 dark:text-zinc-300">
                  {label}
                </span>
              </div>
            </AnimateOnScroll>
          ))}
        </div>
        <div className="mt-8 space-y-4">
          {whatWeBuild.body.map((paragraph, i) => (
            <AnimateOnScroll key={i} animation="fade-in-up" delay={i * 100}>
              <p className="text-lg text-zinc-600 dark:text-zinc-400">
                {paragraph}
              </p>
            </AnimateOnScroll>
          ))}
        </div>
        <AnimateOnScroll animation="fade-in-up" delay={200}>
          <div className="mt-6">
            <Link
              href={whatWeBuild.link.href}
              className="inline-flex items-center gap-2 text-brand-600 dark:text-brand-400 font-medium hover:underline"
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
