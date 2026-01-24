import type { Metadata } from "next";
import { Hero } from "@/components/sections";
import { ContactForm } from "@/components/sections";
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

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { locale } = await params;
  const isRomanian = locale === "ro";

  return {
    title: isRomanian
      ? "Contactează-ne - Obține o consultație gratuită pentru proiect"
      : "Contact Us - Get a Free Project Consultation",
    description: isRomanian
      ? "Ai un proiect în minte? Spune-ne despre nevoile tale de dezvoltare software sau securitate. Vom răspunde în 1-2 zile lucrătoare cu o consultație. Bazați în România, servind clienți din toată lumea."
      : "Have a project in mind? Tell us about your software development or security needs. We'll respond within 1-2 business days with a consultation. Based in Romania, serving clients worldwide.",
    openGraph: {
      title: isRomanian ? "Contactează ITGuys - Consultație gratuită" : "Contact ITGuys - Free Consultation",
      description: isRomanian
        ? "Ai un proiect în minte? Spune-ne despre el. Vom răspunde în 1-2 zile lucrătoare."
        : "Have a project in mind? Tell us about it. We'll respond within 1-2 business days.",
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
      },
    },
    twitter: {
      card: "summary_large_image",
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
      <Hero headline={hero.headline} subheadline={hero.subheadline} badgeText={homeHero.badgeText} />

      <Section id="contact-form">
        <div className="grid grid-cols-1 lg:grid-cols-5 gap-12">
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
