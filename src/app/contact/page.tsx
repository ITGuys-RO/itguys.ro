import type { Metadata } from "next";
import { Hero } from "@/components/sections";
import { ContactForm } from "@/components/sections";
import { Section } from "@/components/ui";
import { contactContent } from "@/content";

export const metadata: Metadata = {
  title: "Contact",
  description:
    "Have a project in mind? Tell us about it. We'll respond within 1-2 business days.",
};

export default function ContactPage() {
  const { hero, directEmail, phone, whatHappensNext } = contactContent;

  return (
    <>
      <Hero headline={hero.headline} subheadline={hero.subheadline} />

      <Section id="contact-form">
        <div className="grid grid-cols-1 lg:grid-cols-5 gap-12">
          <div className="lg:col-span-3">
            <ContactForm />
          </div>

          <div className="lg:col-span-2">
            <div className="sticky top-24">
              <div className="space-y-3 mb-6">
                <p className="text-zinc-600 dark:text-zinc-400">
                  Or reach out directly:
                </p>
                <p>
                  <a
                    href={`mailto:${directEmail}`}
                    className="text-brand-600 dark:text-brand-400 font-medium hover:underline"
                  >
                    {directEmail}
                  </a>
                </p>
                <p>
                  <a
                    href={`tel:${phone.replace(/\s/g, "")}`}
                    className="text-brand-600 dark:text-brand-400 font-medium hover:underline"
                  >
                    {phone}
                  </a>
                </p>
              </div>

              <div className="p-6 rounded-xl bg-brand-50 dark:bg-brand-900 border border-brand-200 dark:border-brand-800">
                <h3 className="text-lg font-semibold text-zinc-900 dark:text-white mb-4">
                  {whatHappensNext.title}
                </h3>
                <div className="space-y-3">
                  {whatHappensNext.body.map((paragraph, i) => (
                    <p
                      key={i}
                      className="text-sm text-zinc-600 dark:text-zinc-400"
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
