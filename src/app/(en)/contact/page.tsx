import type { Metadata } from "next";
import { Hero } from "@/components/sections";
import { ContactForm } from "@/components/sections";
import { Section } from "@/components/ui";
import { BreadcrumbSchema } from "@/components/structured-data";
import { getContent } from "@/content";

export const metadata: Metadata = {
  title: "Contact Us - Get a Free Project Consultation",
  description: "Have a project in mind? Tell us about your software development or security needs. We'll respond within 1-2 business days with a consultation. Based in Romania, serving clients worldwide.",
  openGraph: {
    title: "Contact ITGuys - Free Consultation",
    description: "Have a project in mind? Tell us about it. We'll respond within 1-2 business days.",
    url: "https://itguys.ro/contact",
    type: "website",
  },
  alternates: {
    canonical: "/contact",
    languages: {
      en: "/contact",
      ro: "/ro/contact",
    },
  },
};

export default function ContactPage() {
  const content = getContent("en");
  const { hero, directEmail, phone, whatHappensNext } = content.contactContent;

  return (
    <>
      <BreadcrumbSchema items={[{ name: "Contact", url: "https://itguys.ro/contact" }]} />
      <Hero headline={hero.headline} subheadline={hero.subheadline} />

      <Section id="contact-form">
        <div className="grid grid-cols-1 lg:grid-cols-5 gap-12">
          <div className="lg:col-span-3">
            <ContactForm locale="en" />
          </div>

          <div className="lg:col-span-2">
            <div className="sticky top-24">
              <div className="space-y-3 mb-6">
                <p className="text-brand-200">
                  Or reach out directly:
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
