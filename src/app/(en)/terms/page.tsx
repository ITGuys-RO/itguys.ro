import type { Metadata } from "next";
import { Hero } from "@/components/sections";
import { Section } from "@/components/ui";
import { BreadcrumbSchema, OrganizationSchema } from "@/components/structured-data";
import { TermsIllustration } from "@/components/illustrations";
import { getContent } from "@/content";
import { generateAlternates } from "@/i18n";

export const metadata: Metadata = {
  title: "Terms of Service - ITGuys",
  description: "Read the terms and conditions for using ITGuys website and services.",
  openGraph: {
    title: "Terms of Service - ITGuys",
    description: "Read the terms and conditions for using ITGuys website and services.",
    url: "https://itguys.ro/terms",
    type: "website",
  },
  alternates: generateAlternates("/terms"),
  twitter: {
    card: "summary_large_image",
    title: "Terms of Service - ITGuys",
    description: "Read the terms and conditions for using ITGuys website and services.",
    images: ["/og-image.png"],
  },
};

export default function TermsPage() {
  const content = getContent("en");
  const { hero, lastUpdated, sections } = content.termsContent;

  return (
    <>
      <OrganizationSchema />
      <BreadcrumbSchema items={[{ name: "Terms of Service", url: "https://itguys.ro/terms" }]} />

      <Hero
        headline={hero.headline}
        subheadline={hero.subheadline}
        showBadge={false}
        illustration={<TermsIllustration className="w-full h-auto max-w-sm mx-auto" />}
      />

      <Section>
        <p className="text-sm text-brand-400 mb-12">
          Last updated: {lastUpdated}
        </p>

        <div className="space-y-10">
          {sections.map((section) => (
            <div key={section.title}>
              <h2 className="text-xl md:text-2xl font-semibold text-white mb-4">
                {section.title}
              </h2>
              <div className="space-y-3">
                {section.body.map((paragraph, i) => (
                  <p key={i} className="text-brand-200 leading-relaxed">
                    {paragraph}
                  </p>
                ))}
              </div>
            </div>
          ))}
        </div>
      </Section>
    </>
  );
}
