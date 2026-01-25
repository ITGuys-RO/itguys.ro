import { Metadata } from 'next';
import Link from 'next/link';
import { getPostsLocalized } from '@/lib/db';
import { Section } from '@/components/ui';
import type { Locale } from '@/i18n/config';

export const runtime = 'edge';

type Props = {
  params: Promise<{ locale: Locale }>;
};

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { locale } = await params;
  const titles: Record<Locale, string> = {
    en: 'Blog | ITGuys',
    ro: 'Blog | ITGuys',
    fr: 'Blog | ITGuys',
    de: 'Blog | ITGuys',
    it: 'Blog | ITGuys',
    es: 'Blog | ITGuys',
  };

  return {
    title: titles[locale] || titles.en,
  };
}

export default async function BlogPage({ params }: Props) {
  const { locale } = await params;

  let posts: Awaited<ReturnType<typeof getPostsLocalized>> = [];

  try {
    posts = await getPostsLocalized(locale);
  } catch {
    // Database not available
  }

  return (
    <main>
      <Section className="pt-32 pb-16">
        <div className="max-w-4xl mx-auto">
          <h1 className="text-4xl md:text-5xl font-bold text-white mb-4">Blog</h1>
          <p className="text-xl text-brand-300 mb-12">
            Insights and articles on software development, security, and technology.
          </p>

          {posts.length === 0 ? (
            <div className="text-center py-16">
              <p className="text-brand-400">No posts yet. Check back soon!</p>
            </div>
          ) : (
            <div className="space-y-8">
              {posts.map((post) => (
                <article
                  key={post.id}
                  className="bg-brand-900/40 border border-brand-700/50 rounded-xl p-6 hover:border-brand-400/50 transition-colors"
                >
                  <Link href={`/${locale}/blog/${post.slug}`}>
                    <div className="flex flex-col md:flex-row gap-6">
                      {post.imagePath && (
                        <div className="md:w-48 flex-shrink-0">
                          <img
                            src={post.imagePath}
                            alt={post.title}
                            className="w-full h-32 md:h-full object-cover rounded-lg"
                          />
                        </div>
                      )}
                      <div className="flex-1">
                        <div className="flex flex-wrap gap-2 mb-2">
                          {post.tags.map((tag) => (
                            <span
                              key={tag}
                              className="px-2 py-0.5 bg-brand-700/50 text-brand-300 text-xs rounded"
                            >
                              {tag}
                            </span>
                          ))}
                        </div>
                        <h2 className="text-xl font-semibold text-white mb-2 hover:text-brand-300 transition-colors">
                          {post.title}
                        </h2>
                        {post.excerpt && (
                          <p className="text-brand-400 mb-3 line-clamp-2">{post.excerpt}</p>
                        )}
                        <div className="flex items-center gap-4 text-sm text-brand-500">
                          {post.publishedAt && (
                            <time dateTime={post.publishedAt}>
                              {new Date(post.publishedAt).toLocaleDateString(locale, {
                                year: 'numeric',
                                month: 'long',
                                day: 'numeric',
                              })}
                            </time>
                          )}
                          {post.author && <span>by {post.author.name}</span>}
                        </div>
                      </div>
                    </div>
                  </Link>
                </article>
              ))}
            </div>
          )}
        </div>
      </Section>
    </main>
  );
}
