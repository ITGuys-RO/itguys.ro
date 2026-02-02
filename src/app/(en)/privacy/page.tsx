import type { Metadata } from "next";
import { Hero } from "@/components/sections";
import { Section } from "@/components/ui";
import { BreadcrumbSchema, OrganizationSchema } from "@/components/structured-data";
import { PrivacyIllustration } from "@/components/illustrations";
import { getContent } from "@/content";
import { generateAlternates } from "@/i18n";

export const metadata: Metadata = {
  title: "Privacy Policy - ITGuys",
  description: "Learn how ITGuys collects, uses, and protects your personal data. GDPR-compliant privacy policy.",
  openGraph: {
    title: "Privacy Policy - ITGuys",
    description: "Learn how ITGuys collects, uses, and protects your personal data. GDPR-compliant privacy policy.",
    url: "https://itguys.ro/privacy",
    type: "website",
  },
  alternates: generateAlternates("/privacy"),
  twitter: {
    card: "summary_large_image",
    title: "Privacy Policy - ITGuys",
    description: "Learn how ITGuys collects, uses, and protects your personal data. GDPR-compliant privacy policy.",
    images: ["/og-image.png"],
  },
};

export default function PrivacyPage() {
  const content = getContent("en");
  const { hero, lastUpdated, sections } = content.privacyContent;

  return (
    <>
      <OrganizationSchema />
      <BreadcrumbSchema items={[{ name: "Privacy Policy", url: "https://itguys.ro/privacy" }]} />

      <Hero
        headline={hero.headline}
        subheadline={hero.subheadline}
        showBadge={false}
        illustration={<PrivacyIllustration className="w-full h-auto max-w-sm mx-auto" />}
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
