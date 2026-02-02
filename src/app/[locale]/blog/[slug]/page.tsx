import { Metadata } from 'next';
import { notFound, permanentRedirect } from 'next/navigation';
import { Section, Card, AnimateOnScroll, Breadcrumb } from '@/components/ui';
import { BreadcrumbSchema, OrganizationSchema, BlogPostingSchema } from '@/components/structured-data';
import { getPostLocalized, getPostLocaleSlugs } from '@/lib/db';
import { CalendarIcon, UserIcon } from '@heroicons/react/24/outline';
import type { Locale } from '@/i18n/config';

export const dynamic = 'force-dynamic';

type Props = {
  params: Promise<{ slug: string; locale: Locale }>;
};

const blogLabel: Record<Locale, string> = {
  en: 'Blog',
  ro: 'Blog',
  fr: 'Blog',
  de: 'Blog',
  it: 'Blog',
  es: 'Blog',
};

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { slug, locale } = await params;

  try {
    const post = await getPostLocalized(slug, locale);
    if (!post) return { title: 'Post Not Found | ITGuys' };

    const baseUrl = locale === 'en' ? '' : `/${locale}`;
    const title = post.metaTitle || post.title;

    // Get locale-specific slugs for hreflang alternates
    const slugs = await getPostLocaleSlugs(post.id);

    return {
      title: `${title} | ITGuys Blog`,
      description: post.metaDescription || post.excerpt || undefined,
      openGraph: {
        title,
        description: post.metaDescription || post.excerpt || undefined,
        url: `https://itguys.ro${baseUrl}/blog/${post.slug}`,
        type: 'article',
        ...(post.imagePath && { images: [{ url: post.imagePath }] }),
      },
      alternates: {
        canonical: `${baseUrl}/blog/${post.slug}`,
        languages: {
          en: `/blog/${slugs.en || slug}`,
          ro: `/ro/blog/${slugs.ro || slug}`,
          fr: `/fr/blog/${slugs.fr || slug}`,
          de: `/de/blog/${slugs.de || slug}`,
          it: `/it/blog/${slugs.it || slug}`,
          es: `/es/blog/${slugs.es || slug}`,
        },
      },
    };
  } catch {
    return { title: 'Blog | ITGuys' };
  }
}

export default async function BlogPostPage({ params }: Props) {
  const { slug, locale } = await params;

  let post: Awaited<ReturnType<typeof getPostLocalized>> = null;

  try {
    post = await getPostLocalized(slug, locale);
  } catch {
    // Database not available
  }

  if (!post) {
    notFound();
  }

  // Redirect if the slug doesn't match the locale-specific slug (e.g., English slug used under French locale)
  if (post.slug !== slug) {
    permanentRedirect(`/${locale}/blog/${post.slug}`);
  }

  const baseUrl = locale === 'en' ? '' : `/${locale}`;

  return (
    <>
      <OrganizationSchema />
      <BreadcrumbSchema
        items={[
          { name: 'Blog', url: `https://itguys.ro${baseUrl}/blog` },
          { name: post.title, url: `https://itguys.ro${baseUrl}/blog/${slug}` },
        ]}
      />
      <BlogPostingSchema
        title={post.title}
        description={post.excerpt}
        datePublished={post.publishedAt || post.updatedAt}
        dateModified={post.updatedAt}
        authorName={post.author?.name}
        image={post.imagePath}
        url={`https://itguys.ro${baseUrl}/blog/${slug}`}
      />

      <Section className="pt-24 pb-16">
        <article className="max-w-6xl mx-auto">
          <AnimateOnScroll animation="fade-in-up">
            <Breadcrumb locale={locale} items={[
              { label: blogLabel[locale], href: '/blog' },
              { label: post.title },
            ]} />
          </AnimateOnScroll>

          <AnimateOnScroll animation="fade-in-up" delay={100}>
            <header className="mb-8">
              <h1 className="text-3xl md:text-4xl lg:text-5xl font-bold text-white mb-6 leading-tight">
                {post.title}
              </h1>

              <div className="flex flex-wrap items-center gap-4 text-sm text-brand-400">
                {post.publishedAt && (
                  <div className="flex items-center gap-2">
                    <CalendarIcon className="w-4 h-4" />
                    <time dateTime={post.publishedAt}>
                      {new Date(post.publishedAt).toLocaleDateString(locale, {
                        year: 'numeric',
                        month: 'long',
                        day: 'numeric',
                      })}
                    </time>
                  </div>
                )}
                {post.author && (
                  <div className="flex items-center gap-2">
                    <UserIcon className="w-4 h-4" />
                    <span className="text-brand-300">{post.author.name}</span>
                  </div>
                )}
              </div>
            </header>
          </AnimateOnScroll>

          {post.imagePath && (
            <AnimateOnScroll animation="fade-in-up" delay={200}>
              <div className="mb-10 rounded-xl overflow-hidden border border-brand-700/30">
                <img
                  src={post.imagePath}
                  alt={post.title}
                  className="w-full"
                />
              </div>
            </AnimateOnScroll>
          )}

          <AnimateOnScroll animation="fade-in-up" delay={300}>
            <Card className="prose-container">
              <div className="prose prose-lg prose-invert max-w-none">
                <MarkdownContent content={post.content} />
              </div>
            </Card>
          </AnimateOnScroll>

          {post.tags.length > 0 && (
            <AnimateOnScroll animation="fade-in-up" delay={400}>
              <div className="flex flex-wrap gap-2 mt-8">
                {post.tags.map((tag) => (
                  <span
                    key={tag}
                    className="px-3 py-1 bg-brand-800/50 text-brand-300 text-sm font-medium rounded-full border border-brand-700/30"
                  >
                    {tag}
                  </span>
                ))}
              </div>
            </AnimateOnScroll>
          )}
        </article>
      </Section>
    </>
  );
}

// Simple markdown renderer for admin-authored content (trusted source)
function MarkdownContent({ content }: { content: string }) {
  const html = content
    .replace(/^### (.*$)/gim, '<h3 class="text-xl font-semibold text-white mt-8 mb-4">$1</h3>')
    .replace(/^## (.*$)/gim, '<h2 class="text-2xl font-semibold text-white mt-10 mb-4">$1</h2>')
    .replace(/^# (.*$)/gim, '<h1 class="text-3xl font-bold text-white mt-10 mb-4">$1</h1>')
    .replace(/\*\*(.+?)\*\*/g, '<strong class="font-semibold text-white">$1</strong>')
    .replace(/\*(.+?)\*/g, '<em>$1</em>')
    .replace(/\[([^\]]+)\]\(([^)]+)\)/g, (_match: string, text: string, url: string) => {
      const isExternal = url.startsWith('http') && !url.includes('itguys.ro');
      const rel = isExternal ? ' rel="nofollow noopener" target="_blank"' : '';
      return `<a href="${url}" class="text-neon hover:underline"${rel}>${text}</a>`;
    })
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
