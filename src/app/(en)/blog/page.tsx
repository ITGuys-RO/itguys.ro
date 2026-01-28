import { Metadata } from 'next';
import { Hero } from '@/components/sections';
import { Section, Card, AnimateOnScroll } from '@/components/ui';
import { BlogIllustration } from '@/components/illustrations';
import { BreadcrumbSchema, OrganizationSchema } from '@/components/structured-data';
import { getPostsLocalized } from '@/lib/db';
import { Link } from '@/i18n/navigation';
import { generateAlternates } from '@/i18n';
import { CalendarIcon, UserIcon, TagIcon } from '@heroicons/react/24/outline';

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

export default async function BlogPage() {
  let posts: Awaited<ReturnType<typeof getPostsLocalized>> = [];

  try {
    posts = await getPostsLocalized('en');
  } catch {
    // Database not available
  }

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
          {posts.length === 0 ? (
            <AnimateOnScroll animation="fade-in-up">
              <Card className="text-center py-16">
                <div className="text-brand-400 mb-4">
                  <TagIcon className="w-12 h-12 mx-auto opacity-50" />
                </div>
                <p className="text-xl text-brand-300 mb-2">No posts yet</p>
                <p className="text-brand-400">Check back soon for articles on development and security.</p>
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
          )}
        </div>
      </Section>
    </>
  );
}
