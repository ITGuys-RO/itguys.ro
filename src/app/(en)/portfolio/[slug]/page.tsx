import { Metadata } from 'next';
import { notFound } from 'next/navigation';
import { Section, Card, AnimateOnScroll, MarkdownContent } from '@/components/ui';
import { BreadcrumbSchema, OrganizationSchema } from '@/components/structured-data';
import { getCaseStudyBySlug, getProjectLocaleSlugs } from '@/lib/db';
import { Link } from '@/i18n/navigation';
import { ArrowLeftIcon, ClockIcon, CalendarIcon } from '@heroicons/react/24/outline';

export const dynamic = 'force-dynamic';

type Props = {
  params: Promise<{ slug: string }>;
};

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { slug } = await params;

  try {
    const project = await getCaseStudyBySlug(slug, 'en');
    if (!project) return { title: 'Case Study Not Found | ITGuys' };

    const title = project.metaTitle || project.name;
    const slugs = await getProjectLocaleSlugs(project.id);

    return {
      title: `${title} | ITGuys Portfolio`,
      description: project.metaDescription || project.challenge || undefined,
      openGraph: {
        title,
        description: project.metaDescription || project.challenge || undefined,
        url: `https://itguys.ro/portfolio/${project.caseStudySlug || slug}`,
        type: 'article',
        ...(project.image && { images: [{ url: project.image }] }),
      },
      alternates: {
        canonical: `/portfolio/${project.caseStudySlug || slug}`,
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
  const { slug } = await params;

  let project: Awaited<ReturnType<typeof getCaseStudyBySlug>> = null;

  try {
    project = await getCaseStudyBySlug(slug, 'en');
  } catch {
    // Database not available
  }

  if (!project) {
    notFound();
  }

  return (
    <>
      <OrganizationSchema />
      <BreadcrumbSchema
        items={[
          { name: 'Portfolio', url: 'https://itguys.ro/portfolio' },
          { name: project.name, url: `https://itguys.ro/portfolio/${slug}` },
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
              Back to Portfolio
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
                      {new Date(project.completedAt).toLocaleDateString('en-US', {
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
                  <h3 className="text-sm font-semibold text-brand-200 mb-2">Challenge</h3>
                  <p className="text-brand-300 text-sm">{project.challenge}</p>
                </Card>
              </AnimateOnScroll>
            )}
            {project.solution && (
              <AnimateOnScroll animation="fade-in-up" delay={300}>
                <Card className="p-6 h-full">
                  <h3 className="text-sm font-semibold text-brand-200 mb-2">Solution</h3>
                  <p className="text-brand-300 text-sm">{project.solution}</p>
                </Card>
              </AnimateOnScroll>
            )}
            {project.result && (
              <AnimateOnScroll animation="fade-in-up" delay={350}>
                <Card className="p-6 h-full">
                  <h3 className="text-sm font-semibold text-brand-200 mb-2">Result</h3>
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

