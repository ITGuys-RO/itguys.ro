import { Metadata } from 'next';
import NextLink from 'next/link';
import { Hero } from '@/components/sections';
import { Section, Card, AnimateOnScroll } from '@/components/ui';
import { BlogIllustration } from '@/components/illustrations';
import { BreadcrumbSchema, OrganizationSchema } from '@/components/structured-data';
import { getPostsLocalized, getPublishedPostCount, getPostsByTag, getPostCountByTag } from '@/lib/db';
import { Link } from '@/i18n/navigation';
import { generateAlternates } from '@/i18n';
import { CalendarIcon, UserIcon, TagIcon, ChevronLeftIcon, ChevronRightIcon, XMarkIcon } from '@heroicons/react/24/outline';

export const dynamic = 'force-dynamic';

export const metadata: Metadata = {
  title: 'Blog - Insights on Software Development & Security',
  description: 'Articles and insights on software development, security best practices, and technology trends from the ITGuys team.',
  openGraph: {
    title: 'Blog - ITGuys',
    description: 'Articles and insights on software development, security best practices, and technology trends.',
    url: 'https://itguys.ro/blog',
    type: 'website',
  },
  alternates: generateAlternates('/blog'),
  twitter: {
    card: 'summary_large_image',
    title: 'Blog - ITGuys',
    description: 'Articles and insights on software development, security best practices, and technology trends.',
    images: ['/og-image.png'],
  },
};

const POSTS_PER_PAGE = 12;

export default async function BlogPage({
  searchParams,
}: {
  searchParams: Promise<{ page?: string; tag?: string }>;
}) {
  const { page: pageParam, tag: activeTag } = await searchParams;
  const currentPage = Math.max(1, parseInt(pageParam || '1', 10) || 1);
  const offset = (currentPage - 1) * POSTS_PER_PAGE;

  let posts: Awaited<ReturnType<typeof getPostsLocalized>> = [];
  let totalPosts = 0;

  try {
    // Fetch posts (filtered by tag if selected)
    if (activeTag) {
      [posts, totalPosts] = await Promise.all([
        getPostsByTag(activeTag, 'en', { limit: POSTS_PER_PAGE, offset }),
        getPostCountByTag(activeTag),
      ]);
    } else {
      [posts, totalPosts] = await Promise.all([
        getPostsLocalized('en', { limit: POSTS_PER_PAGE, offset }),
        getPublishedPostCount(),
      ]);
    }
  } catch {
    // Database not available
  }

  const totalPages = Math.ceil(totalPosts / POSTS_PER_PAGE);

  // Build URL helper that preserves tag param
  const buildPageUrl = (page: number) => {
    const params = new URLSearchParams();
    if (page > 1) params.set('page', String(page));
    if (activeTag) params.set('tag', activeTag);
    const qs = params.toString();
    return `/blog${qs ? `?${qs}` : ''}`;
  };

  return (
    <>
      <OrganizationSchema />
      <BreadcrumbSchema items={[{ name: 'Blog', url: 'https://itguys.ro/blog' }]} />

      <Hero
        headline="Blog"
        subheadline="Insights on software development, security, and technology from our team."
        showBadge={false}
        illustration={<BlogIllustration className="w-full h-auto max-w-sm mx-auto" />}
      />

      <Section>
        <div className="max-w-6xl mx-auto">
          {/* Active Tag Filter */}
          {activeTag && (
            <AnimateOnScroll animation="fade-in-up" className="mb-6">
              <div className="flex items-center gap-2 text-brand-300">
                <span>Showing posts tagged</span>
                <span className="inline-flex items-center gap-1.5 px-3 py-1 bg-neon/20 text-neon rounded-full border border-neon/40">
                  <TagIcon className="w-4 h-4" />
                  {activeTag}
                  <NextLink
                    href="/blog"
                    className="ml-1 hover:text-white transition-colors"
                    aria-label="Clear filter"
                  >
                    <XMarkIcon className="w-4 h-4" />
                  </NextLink>
                </span>
              </div>
            </AnimateOnScroll>
          )}

          {posts.length === 0 ? (
            <AnimateOnScroll animation="fade-in-up">
              <Card className="text-center py-16">
                <div className="text-brand-400 mb-4">
                  <TagIcon className="w-12 h-12 mx-auto opacity-50" />
                </div>
                <p className="text-xl text-brand-300 mb-2">
                  {activeTag ? `No posts with tag "${activeTag}"` : 'No posts yet'}
                </p>
                <p className="text-brand-400">
                  {activeTag ? (
                    <NextLink href="/blog" className="text-neon hover:underline">View all posts</NextLink>
                  ) : (
                    'Check back soon for articles on development and security.'
                  )}
                </p>
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
                                  <NextLink
                                    key={tag}
                                    href={`/blog?tag=${encodeURIComponent(tag)}`}
                                    className={`relative z-10 px-2.5 py-1 text-xs font-medium rounded-full border transition-colors ${
                                      activeTag === tag
                                        ? 'bg-neon/20 text-neon border-neon/40'
                                        : 'bg-brand-800/50 text-brand-300 border-brand-700/30 hover:bg-brand-700/50 hover:text-white'
                                    }`}
                                  >
                                    {tag}
                                  </NextLink>
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
                                    {new Date(post.publishedAt).toLocaleDateString('en-US', {
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
                    <NextLink
                      href={buildPageUrl(currentPage - 1)}
                      className="p-2 bg-brand-800/50 text-brand-300 rounded-lg hover:bg-brand-700/50 transition-colors border border-brand-700/30"
                      aria-label="Previous page"
                    >
                      <ChevronLeftIcon className="w-5 h-5" />
                    </NextLink>
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
                            <NextLink
                              href={buildPageUrl(page)}
                              className={`px-3.5 py-2 rounded-lg text-sm font-medium transition-colors border ${
                                page === currentPage
                                  ? 'bg-neon/20 text-neon border-neon/40'
                                  : 'bg-brand-800/50 text-brand-300 border-brand-700/30 hover:bg-brand-700/50'
                              }`}
                              aria-current={page === currentPage ? 'page' : undefined}
                            >
                              {page}
                            </NextLink>
                          </span>
                        );
                      })}
                  </div>

                  {currentPage < totalPages ? (
                    <NextLink
                      href={buildPageUrl(currentPage + 1)}
                      className="p-2 bg-brand-800/50 text-brand-300 rounded-lg hover:bg-brand-700/50 transition-colors border border-brand-700/30"
                      aria-label="Next page"
                    >
                      <ChevronRightIcon className="w-5 h-5" />
                    </NextLink>
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
