import { Metadata } from 'next';
import { notFound } from 'next/navigation';
import { Section, Card, AnimateOnScroll } from '@/components/ui';
import { BreadcrumbSchema, OrganizationSchema } from '@/components/structured-data';
import { getCaseStudyBySlug, getProjectLocaleSlugs } from '@/lib/db';
import { Link } from '@/i18n/navigation';
import { ArrowLeftIcon, ClockIcon, CalendarIcon } from '@heroicons/react/24/outline';
import type { Locale } from '@/i18n/config';

export const dynamic = 'force-dynamic';

type Props = {
  params: Promise<{ slug: string; locale: Locale }>;
};

const backText: Record<Locale, string> = {
  en: 'Back to Portfolio',
  ro: 'Înapoi la Portofoliu',
  fr: 'Retour au Portfolio',
  de: 'Zurück zum Portfolio',
  it: 'Torna al Portfolio',
  es: 'Volver al Portafolio',
};

const sectionLabels: Record<Locale, { challenge: string; solution: string; result: string }> = {
  en: { challenge: 'Challenge', solution: 'Solution', result: 'Result' },
  ro: { challenge: 'Provocare', solution: 'Soluție', result: 'Rezultat' },
  fr: { challenge: 'Défi', solution: 'Solution', result: 'Résultat' },
  de: { challenge: 'Herausforderung', solution: 'Lösung', result: 'Ergebnis' },
  it: { challenge: 'Sfida', solution: 'Soluzione', result: 'Risultato' },
  es: { challenge: 'Desafío', solution: 'Solución', result: 'Resultado' },
};

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { slug, locale } = await params;

  try {
    const project = await getCaseStudyBySlug(slug, locale);
    if (!project) return { title: 'Case Study Not Found | ITGuys' };

    const baseUrl = locale === 'en' ? '' : `/${locale}`;
    const title = project.metaTitle || project.name;
    const slugs = await getProjectLocaleSlugs(project.id);

    return {
      title: `${title} | ITGuys Portfolio`,
      description: project.metaDescription || project.challenge || undefined,
      openGraph: {
        title,
        description: project.metaDescription || project.challenge || undefined,
        url: `https://itguys.ro${baseUrl}/portfolio/${project.caseStudySlug || slug}`,
        type: 'article',
        ...(project.image && { images: [{ url: project.image }] }),
      },
      alternates: {
        canonical: `${baseUrl}/portfolio/${project.caseStudySlug || slug}`,
        languages: {
          en: `/portfolio/${slugs.en || slug}`,
          ro: `/ro/portofoliu/${slugs.ro || slug}`,
          fr: `/fr/portfolio/${slugs.fr || slug}`,
          de: `/de/portfolio/${slugs.de || slug}`,
          it: `/it/portfolio/${slugs.it || slug}`,
          es: `/es/portafolio/${slugs.es || slug}`,
        },
      },
    };
  } catch {
    return { title: 'Portfolio | ITGuys' };
  }
}

export default async function CaseStudyPage({ params }: Props) {
  const { slug, locale } = await params;

  let project: Awaited<ReturnType<typeof getCaseStudyBySlug>> = null;

  try {
    project = await getCaseStudyBySlug(slug, locale);
  } catch {
    // Database not available
  }

  if (!project) {
    notFound();
  }

  const baseUrl = locale === 'en' ? '' : `/${locale}`;
  const labels = sectionLabels[locale] || sectionLabels.en;

  return (
    <>
      <OrganizationSchema />
      <BreadcrumbSchema
        items={[
          { name: 'Portfolio', url: `https://itguys.ro${baseUrl}/portfolio` },
          { name: project.name, url: `https://itguys.ro${baseUrl}/portfolio/${slug}` },
        ]}
      />

      <Section className="pt-24 pb-16">
        <article className="max-w-6xl mx-auto">
          <AnimateOnScroll animation="fade-in-up">
            <Link
              href="/portfolio"
              className="inline-flex items-center gap-2 text-brand-400 hover:text-neon text-sm font-medium mb-8 transition-colors"
            >
              <ArrowLeftIcon className="w-4 h-4" />
              {backText[locale]}
            </Link>
          </AnimateOnScroll>

          <AnimateOnScroll animation="fade-in-up" delay={100}>
            <header className="mb-8">
              <div className="flex flex-wrap gap-2 mb-4">
                {project.industry && (
                  <span className="px-3 py-1 bg-brand-800/50 text-brand-300 text-sm font-medium rounded-full border border-brand-700/30">
                    {project.industry}
                  </span>
                )}
                {project.clientType && (
                  <span className="px-3 py-1 bg-brand-800/50 text-brand-300 text-sm font-medium rounded-full border border-brand-700/30">
                    {project.clientType}
                  </span>
                )}
              </div>

              <h1 className="text-3xl md:text-4xl lg:text-5xl font-bold text-white mb-6 leading-tight">
                {project.name}
              </h1>

              <div className="flex flex-wrap items-center gap-4 text-sm text-brand-400">
                {project.duration && (
                  <div className="flex items-center gap-2">
                    <ClockIcon className="w-4 h-4" />
                    <span>{project.duration}</span>
                  </div>
                )}
                {project.completedAt && (
                  <div className="flex items-center gap-2">
                    <CalendarIcon className="w-4 h-4" />
                    <time dateTime={project.completedAt}>
                      {new Date(project.completedAt).toLocaleDateString(locale, {
                        year: 'numeric',
                        month: 'long',
                      })}
                    </time>
                  </div>
                )}
              </div>
            </header>
          </AnimateOnScroll>

          {project.image && (
            <AnimateOnScroll animation="fade-in-up" delay={200}>
              <div className="mb-10 rounded-xl overflow-hidden border border-brand-700/30">
                <img
                  src={project.image}
                  alt={project.name}
                  className="w-full"
                />
              </div>
            </AnimateOnScroll>
          )}

          <div className="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-10">
            {project.challenge && (
              <AnimateOnScroll animation="fade-in-up" delay={250}>
                <Card className="p-6 h-full">
                  <h3 className="text-sm font-semibold text-brand-200 mb-2">{labels.challenge}</h3>
                  <p className="text-brand-300 text-sm">{project.challenge}</p>
                </Card>
              </AnimateOnScroll>
            )}
            {project.solution && (
              <AnimateOnScroll animation="fade-in-up" delay={300}>
                <Card className="p-6 h-full">
                  <h3 className="text-sm font-semibold text-brand-200 mb-2">{labels.solution}</h3>
                  <p className="text-brand-300 text-sm">{project.solution}</p>
                </Card>
              </AnimateOnScroll>
            )}
            {project.result && (
              <AnimateOnScroll animation="fade-in-up" delay={350}>
                <Card className="p-6 h-full">
                  <h3 className="text-sm font-semibold text-brand-200 mb-2">{labels.result}</h3>
                  <p className="text-brand-300 text-sm">{project.result}</p>
                </Card>
              </AnimateOnScroll>
            )}
          </div>

          {project.tech.length > 0 && (
            <AnimateOnScroll animation="fade-in-up" delay={400}>
              <div className="flex flex-wrap gap-2 mb-10">
                {project.tech.map((tech) => (
                  <span
                    key={tech}
                    className="px-3 py-1 bg-brand-800/50 text-brand-200 text-sm rounded-full border border-brand-700/30"
                  >
                    {tech}
                  </span>
                ))}
              </div>
            </AnimateOnScroll>
          )}

          {project.content && (
            <AnimateOnScroll animation="fade-in-up" delay={450}>
              <Card className="prose-container">
                <div className="prose prose-lg prose-invert max-w-none">
                  <MarkdownContent content={project.content} />
                </div>
              </Card>
            </AnimateOnScroll>
          )}
        </article>
      </Section>
    </>
  );
}

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
      // Content is from admin panel (Cloudflare Access protected), not user input
      dangerouslySetInnerHTML={{ __html: `<p class="text-brand-300 mb-4 leading-relaxed">${html}</p>` }}
    />
  );
}
