import { Metadata } from 'next';
import { Hero } from '@/components/sections';
import { Section, Card, AnimateOnScroll } from '@/components/ui';
import { BlogIllustration } from '@/components/illustrations';
import { BreadcrumbSchema, OrganizationSchema } from '@/components/structured-data';
import { getPostsLocalized, getPublishedPostCount } from '@/lib/db';
import { Link } from '@/i18n/navigation';
import { CalendarIcon, UserIcon, TagIcon, ChevronLeftIcon, ChevronRightIcon } from '@heroicons/react/24/outline';
import { locales, type Locale, generateAlternates } from '@/i18n/config';

export const dynamic = 'force-dynamic';

type Props = {
  params: Promise<{ locale: Locale }>;
  searchParams: Promise<{ page?: string }>;
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

const POSTS_PER_PAGE = 12;

export default async function BlogPage({ params, searchParams }: Props) {
  const { locale } = await params;
  const { page: pageParam } = await searchParams;
  const t = content[locale] || content.en;
  const currentPage = Math.max(1, parseInt(pageParam || '1', 10) || 1);
  const offset = (currentPage - 1) * POSTS_PER_PAGE;

  let posts: Awaited<ReturnType<typeof getPostsLocalized>> = [];
  let totalPosts = 0;

  try {
    [posts, totalPosts] = await Promise.all([
      getPostsLocalized(locale, { limit: POSTS_PER_PAGE, offset }),
      getPublishedPostCount(),
    ]);
  } catch {
    // Database not available
  }

  const totalPages = Math.ceil(totalPosts / POSTS_PER_PAGE);
  const blogBase = `/${locale}/blog`;

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
            <>
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

              {totalPages > 1 && (
                <nav className="flex justify-center items-center gap-2 mt-12" aria-label="Pagination">
                  {currentPage > 1 ? (
                    <a
                      href={`${blogBase}${currentPage === 2 ? '' : `?page=${currentPage - 1}`}`}
                      className="p-2 bg-brand-800/50 text-brand-300 rounded-lg hover:bg-brand-700/50 transition-colors border border-brand-700/30"
                      aria-label="Previous page"
                    >
                      <ChevronLeftIcon className="w-5 h-5" />
                    </a>
                  ) : (
                    <span className="p-2 text-brand-600 rounded-lg border border-brand-800/30">
                      <ChevronLeftIcon className="w-5 h-5" />
                    </span>
                  )}

                  <div className="flex gap-1">
                    {Array.from({ length: totalPages }, (_, i) => i + 1)
                      .filter(page =>
                        page === 1 || page === totalPages || Math.abs(page - currentPage) <= 1
                      )
                      .map((page, idx, arr) => {
                        const showEllipsis = idx > 0 && page - arr[idx - 1] > 1;
                        return (
                          <span key={page} className="flex items-center">
                            {showEllipsis && (
                              <span className="px-2 text-brand-500">...</span>
                            )}
                            <a
                              href={page === 1 ? blogBase : `${blogBase}?page=${page}`}
                              className={`px-3.5 py-2 rounded-lg text-sm font-medium transition-colors border ${
                                page === currentPage
                                  ? 'bg-neon/20 text-neon border-neon/40'
                                  : 'bg-brand-800/50 text-brand-300 border-brand-700/30 hover:bg-brand-700/50'
                              }`}
                              aria-current={page === currentPage ? 'page' : undefined}
                            >
                              {page}
                            </a>
                          </span>
                        );
                      })}
                  </div>

                  {currentPage < totalPages ? (
                    <a
                      href={`${blogBase}?page=${currentPage + 1}`}
                      className="p-2 bg-brand-800/50 text-brand-300 rounded-lg hover:bg-brand-700/50 transition-colors border border-brand-700/30"
                      aria-label="Next page"
                    >
                      <ChevronRightIcon className="w-5 h-5" />
                    </a>
                  ) : (
                    <span className="p-2 text-brand-600 rounded-lg border border-brand-800/30">
                      <ChevronRightIcon className="w-5 h-5" />
                    </span>
                  )}
                </nav>
              )}
            </>
          )}
        </div>
      </Section>
    </>
  );
}
