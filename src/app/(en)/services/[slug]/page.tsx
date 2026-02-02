import { Metadata } from 'next';
import { notFound } from 'next/navigation';
import { Section, Card, CardTitle, CardDescription, AnimateOnScroll, Breadcrumb, FAQ } from '@/components/ui';
import { BreadcrumbSchema, FAQSchema, OrganizationSchema, WebPageSchema } from '@/components/structured-data';
import { getServiceLocalized, getServiceLocaleSlugs, getFaqLocalized } from '@/lib/db';
import { getLocalizedPath, locales, type Locale } from '@/i18n/config';

export const dynamic = 'force-dynamic';

type Props = {
  params: Promise<{ slug: string }>;
};

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { slug } = await params;

  try {
    const service = await getServiceLocalized(slug, 'en');
    if (!service) return { title: 'Service Not Found | ITGuys' };

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
        url: `https://itguys.ro/services/${slug}`,
        type: 'website',
      },
      alternates: {
        canonical: `/services/${slug}`,
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
  const { slug } = await params;

  let service: Awaited<ReturnType<typeof getServiceLocalized>> = null;

  try {
    service = await getServiceLocalized(slug, 'en');
  } catch {
    // Database not available
  }

  if (!service) {
    notFound();
  }

  const faqs = await getFaqLocalized('en', service.id);

  return (
    <>
      <OrganizationSchema />
      {faqs.length > 0 && <FAQSchema items={faqs} />}
      <BreadcrumbSchema
        items={[
          { name: 'Services', url: 'https://itguys.ro/services' },
          { name: service.title, url: `https://itguys.ro/services/${slug}` },
        ]}
      />
      <WebPageSchema
        title={service.title}
        description={service.description || ''}
        url={`https://itguys.ro/services/${slug}`}
        language="en"
      />

      <Section className="pt-24 pb-16">
        <article className="max-w-6xl mx-auto">
          <AnimateOnScroll animation="fade-in-up">
            <Breadcrumb items={[
              { label: 'Services', href: '/services' },
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
                <h2 className="text-2xl font-bold text-white mb-6">What We Offer</h2>
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
                <h2 className="text-2xl font-bold text-white mb-4">Technologies</h2>
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
              <FAQ items={faqs} />
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

// Simple markdown renderer for admin-authored content (trusted source via Cloudflare Access)
function MarkdownContent({ content }: { content: string }) {
  const html = content
    .replace(/^### (.*$)/gim, '<h3 class="text-xl font-semibold text-white mt-8 mb-4">$1</h3>')
    .replace(/^## (.*$)/gim, '<h2 class="text-2xl font-semibold text-white mt-10 mb-4">$1</h2>')
    .replace(/^# (.*$)/gim, '<h1 class="text-3xl font-bold text-white mt-10 mb-4">$1</h1>')
    .replace(/\*\*(.+?)\*\*/g, '<strong class="font-semibold text-white">$1</strong>')
    .replace(/\*(.+?)\*/g, '<em>$1</em>')
    .replace(/\[([^\]]+)\]\(([^)]+)\)/g, '<a href="$2" class="text-neon hover:underline">$1</a>')
    .replace(/```(\w+)?\n?([\s\S]*?)```/g, '<pre class="bg-brand-900/60 border border-brand-700/30 p-4 rounded-lg text-sm overflow-x-auto my-6"><code class="text-brand-200">$2</code></pre>')
    .replace(/`([^`]+)`/g, '<code class="bg-brand-800/50 px-1.5 py-0.5 rounded text-sm text-neon">$1</code>')
    .replace(/^> (.*$)/gim, '<blockquote class="border-l-4 border-neon/50 pl-4 text-brand-300 italic my-6">$1</blockquote>')
    .replace(/^- (.*$)/gim, '<li class="ml-6 text-brand-300 mb-2">$1</li>')
    .replace(/(<li.*<\/li>\n?)+/g, '<ul class="list-disc my-4">$&</ul>')
    .replace(/\n\n/g, '</p><p class="text-brand-300 mb-4 leading-relaxed">')
    .replace(/\n/g, '<br />');

  return (
    <div
      className="text-brand-300 leading-relaxed"
      dangerouslySetInnerHTML={{ __html: `<p class="text-brand-300 mb-4 leading-relaxed">${html}</p>` }}
    />
  );
}
