import { Metadata } from 'next';
import { notFound } from 'next/navigation';
import { Section, Card, CardTitle, CardDescription, AnimateOnScroll, Breadcrumb, FAQ, MarkdownContent } from '@/components/ui';
import { BreadcrumbSchema, FAQSchema, OrganizationSchema, WebPageSchema } from '@/components/structured-data';
import { getServiceLocalized, getServiceLocaleSlugs, getFaqLocalized } from '@/lib/db';
import { getLocalizedPath, locales, type Locale } from '@/i18n/config';

export const dynamic = 'force-dynamic';

type Props = {
  params: Promise<{ slug: string; locale: Locale }>;
};

const servicesLabel: Record<Locale, string> = {
  en: 'Services',
  ro: 'Servicii',
  fr: 'Services',
  de: 'Dienstleistungen',
  it: 'Servizi',
  es: 'Servicios',
};

const whatWeOfferText: Record<Locale, string> = {
  en: 'What We Offer',
  ro: 'Ce Oferim',
  fr: 'Ce Que Nous Offrons',
  de: 'Was Wir Bieten',
  it: 'Cosa Offriamo',
  es: 'Lo Que Ofrecemos',
};

const faqText: Record<Locale, string> = {
  en: 'Frequently Asked Questions',
  ro: 'Intrebari frecvente',
  fr: 'Questions frequentes',
  de: 'Haufig gestellte Fragen',
  it: 'Domande frequenti',
  es: 'Preguntas frecuentes',
};

const technologiesText: Record<Locale, string> = {
  en: 'Technologies',
  ro: 'Tehnologii',
  fr: 'Technologies',
  de: 'Technologien',
  it: 'Tecnologie',
  es: 'Tecnologías',
};

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { slug, locale } = await params;

  try {
    const service = await getServiceLocalized(slug, locale);
    if (!service) return { title: 'Service Not Found | ITGuys' };

    const baseUrl = locale === 'en' ? '' : `/${locale}`;
    const title = service.title;
    const description = service.description || `${service.title} - Professional services from ITGuys`;

    // Get locale-specific slugs for hreflang alternates
    const slugs = await getServiceLocaleSlugs(slug);

    return {
      title: `${title} | ITGuys Services`,
      description,
      openGraph: {
        title,
        description,
        url: `https://itguys.ro${baseUrl}/services/${slug}`,
        type: 'website',
      },
      alternates: {
        canonical: `${baseUrl}${getLocalizedPath('/services', locale)}/${slug}`,
        languages: Object.fromEntries(
          locales.map((loc) => {
            const localizedServicesPath = getLocalizedPath('/services', loc as Locale);
            const slugForLocale = slugs[loc as Locale];
            if (loc === 'en') {
              return [loc, `${localizedServicesPath}/${slugForLocale}`];
            }
            return [loc, `/${loc}${localizedServicesPath}/${slugForLocale}`];
          })
        ),
      },
    };
  } catch {
    return { title: 'Services | ITGuys' };
  }
}

export default async function ServiceDetailPage({ params }: Props) {
  const { slug, locale } = await params;

  let service: Awaited<ReturnType<typeof getServiceLocalized>> = null;

  try {
    service = await getServiceLocalized(slug, locale);
  } catch {
    // Database not available
  }

  if (!service) {
    notFound();
  }

  const faqs = await getFaqLocalized(locale, service.id);
  const baseUrl = locale === 'en' ? '' : `/${locale}`;

  return (
    <>
      <OrganizationSchema />
      {faqs.length > 0 && <FAQSchema items={faqs} />}
      <BreadcrumbSchema
        items={[
          { name: 'Services', url: `https://itguys.ro${baseUrl}/services` },
          { name: service.title, url: `https://itguys.ro${baseUrl}/services/${slug}` },
        ]}
      />
      <WebPageSchema
        title={service.title}
        description={service.description || ''}
        url={`https://itguys.ro${baseUrl}/services/${slug}`}
        language={locale}
      />

      <Section className="pt-24 pb-16">
        <article className="max-w-6xl mx-auto">
          <AnimateOnScroll animation="fade-in-up">
            <Breadcrumb locale={locale} items={[
              { label: servicesLabel[locale], href: '/services' },
              { label: service.title },
            ]} />
          </AnimateOnScroll>

          <AnimateOnScroll animation="fade-in-up" delay={100}>
            <header className="mb-8">
              <h1 className="text-3xl md:text-4xl lg:text-5xl font-bold text-white mb-6 leading-tight">
                {service.title}
              </h1>

              {service.description && (
                <p className="text-xl text-brand-300 leading-relaxed">
                  {service.description}
                </p>
              )}
            </header>
          </AnimateOnScroll>

          {service.details && (
            <AnimateOnScroll animation="fade-in-up" delay={200}>
              <Card className="mb-8">
                <p className="text-brand-200 leading-relaxed">
                  {service.details}
                </p>
              </Card>
            </AnimateOnScroll>
          )}

          {service.longDescription && (
            <AnimateOnScroll animation="fade-in-up" delay={300}>
              <Card className="prose-container mb-8">
                <div className="prose prose-lg prose-invert max-w-none">
                  <MarkdownContent content={service.longDescription} />
                </div>
              </Card>
            </AnimateOnScroll>
          )}

          {service.subservices.length > 0 && (
            <AnimateOnScroll animation="fade-in-up" delay={400}>
              <div className="mb-8">
                <h2 className="text-2xl font-bold text-white mb-6">{whatWeOfferText[locale]}</h2>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                  {service.subservices.map((sub) => (
                    <Card key={sub.title}>
                      <CardTitle>{sub.title}</CardTitle>
                      {sub.description && (
                        <CardDescription>{sub.description}</CardDescription>
                      )}
                    </Card>
                  ))}
                </div>
              </div>
            </AnimateOnScroll>
          )}

          {service.technologies.length > 0 && (
            <AnimateOnScroll animation="fade-in-up" delay={500}>
              <div className="mb-8">
                <h2 className="text-2xl font-bold text-white mb-4">{technologiesText[locale]}</h2>
                <div className="flex flex-wrap gap-2">
                  {service.technologies.map((tech) => (
                    <span
                      key={tech}
                      className="px-3 py-1.5 text-sm bg-brand-800/50 border border-brand-700/30 text-brand-200 rounded-full hover:border-neon/30 hover:text-neon transition-colors"
                    >
                      {tech}
                    </span>
                  ))}
                </div>
              </div>
            </AnimateOnScroll>
          )}

          {faqs.length > 0 && (
            <AnimateOnScroll animation="fade-in-up" delay={600}>
              <FAQ items={faqs} title={faqText[locale]} />
            </AnimateOnScroll>
          )}

          {service.note && (
            <AnimateOnScroll animation="fade-in-up" delay={700}>
              <p className="text-sm text-brand-400 italic">
                {service.note}
              </p>
            </AnimateOnScroll>
          )}
        </article>
      </Section>
    </>
  );
}

