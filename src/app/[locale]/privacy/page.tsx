import type { Metadata } from "next";
import { Hero } from "@/components/sections";
import { Section } from "@/components/ui";
import { BreadcrumbSchema, OrganizationSchema } from "@/components/structured-data";
import { PrivacyIllustration } from "@/components/illustrations";
import { getContent } from "@/content";
import { locales, type Locale, generateAlternates } from "@/i18n/config";

type Props = {
  params: Promise<{ locale: string }>;
};

export function generateStaticParams() {
  return locales.map((locale) => ({ locale }));
}

const privacyTitles: Record<string, string> = {
  en: "Privacy Policy - ITGuys",
  ro: "Politica de Confidentialitate - ITGuys",
  fr: "Politique de Confidentialite - ITGuys",
  de: "Datenschutzrichtlinie - ITGuys",
  it: "Informativa sulla Privacy - ITGuys",
  es: "Politica de Privacidad - ITGuys",
};

const privacyDescriptions: Record<string, string> = {
  en: "Learn how ITGuys collects, uses, and protects your personal data. GDPR-compliant privacy policy.",
  ro: "Afla cum ITGuys colecteaza, foloseste si protejeaza datele tale personale. Politica de confidentialitate conformata GDPR.",
  fr: "Decouvrez comment ITGuys collecte, utilise et protege vos donnees personnelles. Politique de confidentialite conforme au RGPD.",
  de: "Erfahren Sie, wie ITGuys Ihre personenbezogenen Daten erhebt, verwendet und schutzt. DSGVO-konforme Datenschutzrichtlinie.",
  it: "Scopri come ITGuys raccoglie, utilizza e protegge i tuoi dati personali. Informativa sulla privacy conforme al GDPR.",
  es: "Descubre como ITGuys recopila, usa y protege tus datos personales. Politica de privacidad conforme al RGPD.",
};

const lastUpdatedLabels: Record<string, string> = {
  en: "Last updated",
  ro: "Ultima actualizare",
  fr: "Derniere mise a jour",
  de: "Zuletzt aktualisiert",
  it: "Ultimo aggiornamento",
  es: "Ultima actualizacion",
};

const breadcrumbNames: Record<string, string> = {
  en: "Privacy Policy",
  ro: "Politica de Confidentialitate",
  fr: "Politique de Confidentialite",
  de: "Datenschutzrichtlinie",
  it: "Informativa sulla Privacy",
  es: "Politica de Privacidad",
};

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { locale } = await params;

  return {
    title: privacyTitles[locale] || privacyTitles.en,
    description: privacyDescriptions[locale] || privacyDescriptions.en,
    openGraph: {
      title: privacyTitles[locale] || privacyTitles.en,
      description: privacyDescriptions[locale] || privacyDescriptions.en,
      url: `https://itguys.ro${locale === "en" ? "" : `/${locale}`}/privacy`,
      type: "website",
    },
    alternates: generateAlternates("/privacy", locale as Locale),
    twitter: {
      card: "summary_large_image",
      description: privacyDescriptions[locale] || privacyDescriptions.en,
      images: ["/og-image.png"],
    },
  };
}

export default async function PrivacyPage({ params }: Props) {
  const { locale } = await params;
  const content = getContent(locale as Locale);
  const { hero, lastUpdated, sections } = content.privacyContent;

  return (
    <>
      <OrganizationSchema />
      <BreadcrumbSchema
        items={[
          {
            name: breadcrumbNames[locale] || breadcrumbNames.en,
            url: `https://itguys.ro${locale === "en" ? "" : `/${locale}`}/privacy`,
          },
        ]}
      />

      <Hero
        headline={hero.headline}
        subheadline={hero.subheadline}
        showBadge={false}
        illustration={<PrivacyIllustration className="w-full h-auto max-w-sm mx-auto" />}
      />

      <Section>
        <p className="text-sm text-brand-400 mb-12">
          {lastUpdatedLabels[locale] || lastUpdatedLabels.en}: {lastUpdated}
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
