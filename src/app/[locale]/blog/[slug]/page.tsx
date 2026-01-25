import { Metadata } from 'next';
import { notFound } from 'next/navigation';
import Link from 'next/link';
import { getPostLocalized, getPostsLocalized } from '@/lib/db';
import { Section } from '@/components/ui';
import { locales, type Locale } from '@/i18n/config';

export const runtime = 'edge';

type Props = {
  params: Promise<{ locale: Locale; slug: string }>;
};

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { locale, slug } = await params;

  try {
    const post = await getPostLocalized(slug, locale);
    if (!post) return { title: 'Post Not Found | ITGuys' };

    return {
      title: post.metaTitle || `${post.title} | ITGuys Blog`,
      description: post.metaDescription || post.excerpt || undefined,
    };
  } catch {
    return { title: 'Blog | ITGuys' };
  }
}

export async function generateStaticParams() {
  const params: Array<{ locale: Locale; slug: string }> = [];

  try {
    for (const locale of locales) {
      const posts = await getPostsLocalized(locale);
      for (const post of posts) {
        params.push({ locale, slug: post.slug });
      }
    }
  } catch {
    // Database not available
  }

  return params;
}

export default async function BlogPostPage({ params }: Props) {
  const { locale, slug } = await params;

  let post: Awaited<ReturnType<typeof getPostLocalized>> = null;

  try {
    post = await getPostLocalized(slug, locale);
  } catch {
    // Database not available
  }

  if (!post) {
    notFound();
  }

  return (
    <main>
      <Section className="pt-32 pb-16">
        <article className="max-w-3xl mx-auto">
          <Link
            href={`/${locale}/blog`}
            className="text-brand-400 hover:text-white text-sm mb-6 inline-flex items-center gap-2"
          >
            <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 19l-7-7 7-7" />
            </svg>
            Back to Blog
          </Link>

          <header className="mb-8">
            <div className="flex flex-wrap gap-2 mb-4">
              {post.tags.map((tag) => (
                <span
                  key={tag}
                  className="px-2 py-0.5 bg-brand-700/50 text-brand-300 text-xs rounded"
                >
                  {tag}
                </span>
              ))}
            </div>

            <h1 className="text-3xl md:text-4xl font-bold text-white mb-4">{post.title}</h1>

            <div className="flex items-center gap-4 text-sm text-brand-400">
              {post.publishedAt && (
                <time dateTime={post.publishedAt}>
                  {new Date(post.publishedAt).toLocaleDateString(locale, {
                    year: 'numeric',
                    month: 'long',
                    day: 'numeric',
                  })}
                </time>
              )}
              {post.author && (
                <div className="flex items-center gap-2">
                  <span>by</span>
                  <span className="text-brand-300">{post.author.name}</span>
                </div>
              )}
            </div>
          </header>

          {post.imagePath && (
            <div className="mb-8">
              <img
                src={post.imagePath}
                alt={post.title}
                className="w-full rounded-xl"
              />
            </div>
          )}

          <div className="prose prose-invert prose-brand max-w-none">
            <MarkdownContent content={post.content} />
          </div>
        </article>
      </Section>
    </main>
  );
}

function MarkdownContent({ content }: { content: string }) {
  const html = content
    .replace(/^### (.*$)/gim, '<h3 class="text-xl font-semibold text-white mt-8 mb-4">$1</h3>')
    .replace(/^## (.*$)/gim, '<h2 class="text-2xl font-semibold text-white mt-8 mb-4">$1</h2>')
    .replace(/^# (.*$)/gim, '<h1 class="text-3xl font-bold text-white mt-8 mb-4">$1</h1>')
    .replace(/\*\*(.+?)\*\*/g, '<strong class="font-semibold text-white">$1</strong>')
    .replace(/\*(.+?)\*/g, '<em>$1</em>')
    .replace(/\[([^\]]+)\]\(([^)]+)\)/g, '<a href="$2" class="text-brand-400 hover:text-brand-300 underline">$1</a>')
    .replace(/```([^`]+)```/g, '<pre class="bg-brand-800/50 p-4 rounded-lg text-sm overflow-x-auto my-4"><code>$1</code></pre>')
    .replace(/`([^`]+)`/g, '<code class="bg-brand-800/50 px-1.5 py-0.5 rounded text-sm">$1</code>')
    .replace(/^> (.*$)/gim, '<blockquote class="border-l-4 border-brand-400 pl-4 text-brand-300 italic my-4">$1</blockquote>')
    .replace(/^- (.*$)/gim, '<li class="ml-6 text-brand-300">$1</li>')
    .replace(/\n\n/g, '</p><p class="text-brand-300 mb-4">')
    .replace(/\n/g, '<br />');

  return (
    <div
      className="text-brand-300 leading-relaxed"
      dangerouslySetInnerHTML={{ __html: `<p class="text-brand-300 mb-4">${html}</p>` }}
    />
  );
}
