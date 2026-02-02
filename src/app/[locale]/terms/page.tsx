import type { Metadata } from "next";
import { Hero } from "@/components/sections";
import { Section } from "@/components/ui";
import { BreadcrumbSchema, OrganizationSchema } from "@/components/structured-data";
import { TermsIllustration } from "@/components/illustrations";
import { getContent } from "@/content";
import { locales, type Locale, generateAlternates } from "@/i18n/config";

type Props = {
  params: Promise<{ locale: string }>;
};

export function generateStaticParams() {
  return locales.map((locale) => ({ locale }));
}

const termsTitles: Record<string, string> = {
  en: "Terms of Service - ITGuys",
  ro: "Termeni si Conditii - ITGuys",
  fr: "Conditions d'Utilisation - ITGuys",
  de: "Nutzungsbedingungen - ITGuys",
  it: "Termini di Servizio - ITGuys",
  es: "Terminos de Servicio - ITGuys",
};

const termsDescriptions: Record<string, string> = {
  en: "Read the terms and conditions for using ITGuys website and services.",
  ro: "Citeste termenii si conditiile pentru utilizarea site-ului si serviciilor ITGuys.",
  fr: "Lisez les conditions d'utilisation du site web et des services d'ITGuys.",
  de: "Lesen Sie die Nutzungsbedingungen fur die ITGuys-Website und -Dienste.",
  it: "Leggi i termini e le condizioni per l'utilizzo del sito web e dei servizi di ITGuys.",
  es: "Lee los terminos y condiciones para el uso del sitio web y los servicios de ITGuys.",
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
  en: "Terms of Service",
  ro: "Termeni si Conditii",
  fr: "Conditions d'Utilisation",
  de: "Nutzungsbedingungen",
  it: "Termini di Servizio",
  es: "Terminos de Servicio",
};

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { locale } = await params;

  return {
    title: termsTitles[locale] || termsTitles.en,
    description: termsDescriptions[locale] || termsDescriptions.en,
    openGraph: {
      title: termsTitles[locale] || termsTitles.en,
      description: termsDescriptions[locale] || termsDescriptions.en,
      url: `https://itguys.ro${locale === "en" ? "" : `/${locale}`}/terms`,
      type: "website",
    },
    alternates: generateAlternates("/terms", locale as Locale),
    twitter: {
      card: "summary_large_image",
      description: termsDescriptions[locale] || termsDescriptions.en,
      images: ["/og-image.png"],
    },
  };
}

export default async function TermsPage({ params }: Props) {
  const { locale } = await params;
  const content = getContent(locale as Locale);
  const { hero, lastUpdated, sections } = content.termsContent;

  return (
    <>
      <OrganizationSchema />
      <BreadcrumbSchema
        items={[
          {
            name: breadcrumbNames[locale] || breadcrumbNames.en,
            url: `https://itguys.ro${locale === "en" ? "" : `/${locale}`}/terms`,
          },
        ]}
      />

      <Hero
        headline={hero.headline}
        subheadline={hero.subheadline}
        showBadge={false}
        illustration={<TermsIllustration className="w-full h-auto max-w-sm mx-auto" />}
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
