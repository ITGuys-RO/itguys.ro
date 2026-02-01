import { Metadata } from 'next';
import { Hero } from '@/components/sections';
import { Section, Card, AnimateOnScroll } from '@/components/ui';
import { BlogIllustration } from '@/components/illustrations';
import { BreadcrumbSchema, OrganizationSchema } from '@/components/structured-data';
import { getPostsLocalized } from '@/lib/db';
import { Link } from '@/i18n/navigation';
import { CalendarIcon, UserIcon, TagIcon } from '@heroicons/react/24/outline';
import { locales, type Locale, generateAlternates } from '@/i18n/config';

export const dynamic = 'force-dynamic';

type Props = {
  params: Promise<{ locale: Locale }>;
};

const content: Record<Locale, { headline: string; subheadline: string; empty: string; emptyDesc: string }> = {
  en: {
    headline: 'Blog',
    subheadline: 'Insights on software development, security, and technology from our team.',
    empty: 'No posts yet',
    emptyDesc: 'Check back soon for articles on development and security.',
  },
  ro: {
    headline: 'Blog',
    subheadline: 'Perspective despre dezvoltare software, securitate și tehnologie de la echipa noastră.',
    empty: 'Niciun articol încă',
    emptyDesc: 'Reveniți în curând pentru articole despre dezvoltare și securitate.',
  },
  fr: {
    headline: 'Blog',
    subheadline: 'Perspectives sur le développement logiciel, la sécurité et la technologie de notre équipe.',
    empty: 'Pas encore d\'articles',
    emptyDesc: 'Revenez bientôt pour des articles sur le développement et la sécurité.',
  },
  de: {
    headline: 'Blog',
    subheadline: 'Einblicke in Softwareentwicklung, Sicherheit und Technologie von unserem Team.',
    empty: 'Noch keine Beiträge',
    emptyDesc: 'Schauen Sie bald wieder vorbei für Artikel über Entwicklung und Sicherheit.',
  },
  it: {
    headline: 'Blog',
    subheadline: 'Approfondimenti sullo sviluppo software, sicurezza e tecnologia dal nostro team.',
    empty: 'Nessun articolo ancora',
    emptyDesc: 'Torna presto per articoli su sviluppo e sicurezza.',
  },
  es: {
    headline: 'Blog',
    subheadline: 'Perspectivas sobre desarrollo de software, seguridad y tecnología de nuestro equipo.',
    empty: 'Sin artículos aún',
    emptyDesc: 'Vuelve pronto para artículos sobre desarrollo y seguridad.',
  },
};

export function generateStaticParams() {
  return locales.map((locale) => ({ locale }));
}

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { locale } = await params;

  return {
    title: 'Blog - ITGuys',
    description: content[locale]?.subheadline || content.en.subheadline,
    alternates: generateAlternates('/blog', locale),
  };
}

export default async function BlogPage({ params }: Props) {
  const { locale } = await params;
  const t = content[locale] || content.en;

  let posts: Awaited<ReturnType<typeof getPostsLocalized>> = [];

  try {
    posts = await getPostsLocalized(locale);
  } catch {
    // Database not available
  }

  return (
    <>
      <OrganizationSchema />
      <BreadcrumbSchema items={[{ name: 'Blog', url: `https://itguys.ro${locale === 'en' ? '' : `/${locale}`}/blog` }]} />

      <Hero
        headline={t.headline}
        subheadline={t.subheadline}
        showBadge={false}
        illustration={<BlogIllustration className="w-full h-auto max-w-sm mx-auto" />}
      />

      <Section>
        <div className="max-w-6xl mx-auto">
          {posts.length === 0 ? (
            <AnimateOnScroll animation="fade-in-up">
              <Card className="text-center py-16">
                <div className="text-brand-400 mb-4">
                  <TagIcon className="w-12 h-12 mx-auto opacity-50" />
                </div>
                <p className="text-xl text-brand-300 mb-2">{t.empty}</p>
                <p className="text-brand-400">{t.emptyDesc}</p>
              </Card>
            </AnimateOnScroll>
          ) : (
            <div className="space-y-6">
              {posts.map((post, index) => (
                <AnimateOnScroll
                  key={post.id}
                  animation="fade-in-up"
                  delay={index * 100}
                >
                  <Link href={`/blog/${post.slug}`} className="block group">
                    <Card className="overflow-hidden hover:border-neon/40 transition-all duration-300" cornerAccents>
                      <div className="flex flex-col md:flex-row gap-6">
                        {post.imagePath && (
                          <div className="md:w-56 flex-shrink-0">
                            <div className="aspect-video md:aspect-[4/3] rounded-lg overflow-hidden bg-brand-800/50">
                              <img
                                src={post.imagePath}
                                alt={post.title}
                                loading="lazy"
                                className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
                              />
                            </div>
                          </div>
                        )}
                        <div className="flex-1 flex flex-col">
                          {post.tags.length > 0 && (
                            <div className="flex flex-wrap gap-2 mb-3">
                              {post.tags.map((tag) => (
                                <span
                                  key={tag}
                                  className="px-2.5 py-1 bg-brand-800/50 text-brand-300 text-xs font-medium rounded-full border border-brand-700/30"
                                >
                                  {tag}
                                </span>
                              ))}
                            </div>
                          )}
                          <h2 className="text-xl font-semibold text-white mb-2 group-hover:text-neon transition-colors">
                            {post.title}
                          </h2>
                          {post.excerpt && (
                            <p className="text-brand-300 mb-4 line-clamp-2 flex-grow">
                              {post.excerpt}
                            </p>
                          )}
                          <div className="flex items-center gap-4 text-sm text-brand-400">
                            {post.publishedAt && (
                              <div className="flex items-center gap-1.5">
                                <CalendarIcon className="w-4 h-4" />
                                <time dateTime={post.publishedAt}>
                                  {new Date(post.publishedAt).toLocaleDateString(locale, {
                                    year: 'numeric',
                                    month: 'short',
                                    day: 'numeric',
                                  })}
                                </time>
                              </div>
                            )}
                            {post.author && (
                              <div className="flex items-center gap-1.5">
                                <UserIcon className="w-4 h-4" />
                                <span>{post.author.name}</span>
                              </div>
                            )}
                          </div>
                        </div>
                      </div>
                    </Card>
                  </Link>
                </AnimateOnScroll>
              ))}
            </div>
          )}
        </div>
      </Section>
    </>
  );
}
