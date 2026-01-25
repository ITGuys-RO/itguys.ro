import type { Metadata } from "next";
import { Hero } from "@/components/sections";
import { ContactForm } from "@/components/sections";
import { ContactIllustration } from "@/components/illustrations";
import { Section } from "@/components/ui";
import { BreadcrumbSchema, OrganizationSchema, LocalBusinessSchema } from "@/components/structured-data";
import { getContent } from "@/content";
import { locales, type Locale } from "@/i18n/config";

type Props = {
  params: Promise<{ locale: string }>;
};

export function generateStaticParams() {
  return locales.map((locale) => ({ locale }));
}

const contactTitles: Record<string, string> = {
  en: "Contact Us - Free Project Consultation",
  ro: "Contacteaza-ne - Consultatie Gratuita",
  fr: "Contactez-nous - Consultation Gratuite",
  de: "Kontakt - Kostenlose Projektberatung",
  it: "Contattaci - Consulenza Gratuita",
  es: "Contactanos - Consulta Gratuita",
};

const contactDescriptions: Record<string, string> = {
  en: "Have a project in mind? Tell us about it. We respond within 1-2 business days. Based in Romania, serving worldwide.",
  ro: "Ai un proiect in minte? Spune-ne despre el. Raspundem in 1-2 zile lucratoare. Din Romania, pentru toata lumea.",
  fr: "Un projet en tete? Parlez-nous en. Reponse sous 1-2 jours ouvrables. Bases en Roumanie, clients mondiaux.",
  de: "Ein Projekt im Sinn? Erzahlen Sie uns davon. Antwort in 1-2 Werktagen. Aus Rumanien, weltweit tatig.",
  it: "Hai un progetto in mente? Raccontacelo. Rispondiamo in 1-2 giorni lavorativi. Dalla Romania, per tutto il mondo.",
  es: "Tienes un proyecto en mente? Cuentanos. Respondemos en 1-2 dias habiles. Desde Rumania, servicio mundial.",
};

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { locale } = await params;

  return {
    title: contactTitles[locale] || contactTitles.en,
    description: contactDescriptions[locale] || contactDescriptions.en,
    openGraph: {
      title: contactTitles[locale] || contactTitles.en,
      description: contactDescriptions[locale] || contactDescriptions.en,
      url: `https://itguys.ro${locale === "en" ? "" : `/${locale}`}/contact`,
      type: "website",
    },
    alternates: {
      canonical: locale === "en" ? "/contact" : `/${locale}/contact`,
      languages: {
        en: "/contact",
        ro: "/ro/contact",
        fr: "/fr/contact",
        de: "/de/contact",
        it: "/it/contact",
        es: "/es/contact",
      },
    },
    twitter: {
      card: "summary_large_image",
      description: contactDescriptions[locale] || contactDescriptions.en,
      images: ["/og-image.png"],
    },
  };
}

export default async function ContactPage({ params }: Props) {
  const { locale } = await params;

  const content = getContent(locale as Locale);
  const { hero, directEmail, phone, whatHappensNext } = content.contactContent;
  const { hero: homeHero } = content.homeContent;

  return (
    <>
      <OrganizationSchema />
      <LocalBusinessSchema />
      <BreadcrumbSchema items={[{ name: "Contact", url: `https://itguys.ro${locale === "en" ? "" : `/${locale}`}/contact` }]} />
      <Hero
        headline={hero.headline}
        subheadline={hero.subheadline}
        badgeText={homeHero.badgeText}
        illustration={<ContactIllustration className="w-full h-auto max-w-sm mx-auto" />}
      />

      <Section id="contact-form">
        <div className="grid grid-cols-1 lg:grid-cols-5 gap-8">
          <div className="lg:col-span-3">
            <ContactForm locale={locale as Locale} />
          </div>

          <div className="lg:col-span-2">
            <div className="sticky top-24">
              <div className="space-y-3 mb-6">
                <p className="text-brand-200">
                  {locale === "ro" ? "Sau contactează-ne direct:" : "Or reach out directly:"}
                </p>
                <p>
                  <a
                    href={`mailto:${directEmail}`}
                    className="text-neon font-medium hover:drop-shadow-[0_0_8px_rgba(0,212,255,0.5)] transition-all duration-300"
                  >
                    {directEmail}
                  </a>
                </p>
                <p>
                  <a
                    href={`tel:${phone.replace(/\s/g, "")}`}
                    className="text-neon font-medium hover:drop-shadow-[0_0_8px_rgba(0,212,255,0.5)] transition-all duration-300"
                  >
                    {phone}
                  </a>
                </p>
              </div>

              <div className="relative p-6 rounded-xl bg-brand-900/60 backdrop-blur-sm border border-brand-700/30">
                {/* Corner accents */}
                <div className="absolute top-0 left-0 w-4 h-4 border-t border-l border-neon/40 rounded-tl-lg" />
                <div className="absolute top-0 right-0 w-4 h-4 border-t border-r border-neon/40 rounded-tr-lg" />
                <div className="absolute bottom-0 left-0 w-4 h-4 border-b border-l border-neon/40 rounded-bl-lg" />
                <div className="absolute bottom-0 right-0 w-4 h-4 border-b border-r border-neon/40 rounded-br-lg" />

                <h3 className="text-lg font-semibold text-white mb-4">
                  {whatHappensNext.title}
                </h3>
                <div className="space-y-3">
                  {whatHappensNext.body.map((paragraph, i) => (
                    <p
                      key={i}
                      className="text-sm text-brand-200"
                    >
                      {paragraph}
                    </p>
                  ))}
                </div>
              </div>
            </div>
          </div>
        </div>
      </Section>
    </>
  );
}
