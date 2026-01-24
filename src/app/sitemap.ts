import { MetadataRoute } from 'next';
import { locales, defaultLocale } from '@/i18n/config';

export default function sitemap(): MetadataRoute.Sitemap {
  const baseUrl = 'https://itguys.ro';
  // Use a static date for lastModified to avoid constant changes
  // Update this date when you make significant content updates
  const lastModified = new Date('2026-01-24');

  const pages = [
    { path: '', priority: 1.0, changeFrequency: 'weekly' as const },
    { path: '/development', priority: 0.9, changeFrequency: 'monthly' as const },
    { path: '/services', priority: 0.9, changeFrequency: 'monthly' as const },
    { path: '/about', priority: 0.8, changeFrequency: 'monthly' as const },
    { path: '/portfolio', priority: 0.8, changeFrequency: 'weekly' as const },
    { path: '/contact', priority: 0.7, changeFrequency: 'monthly' as const },
  ];

  const entries: MetadataRoute.Sitemap = [];

  // Create language alternatives object dynamically
  const createLanguageAlternates = (path: string) => {
    const alternates: Record<string, string> = {};
    for (const locale of locales) {
      alternates[locale] = locale === defaultLocale
        ? `${baseUrl}${path}`
        : `${baseUrl}/${locale}${path}`;
    }
    return alternates;
  };

  for (const page of pages) {
    for (const locale of locales) {
      const url = locale === defaultLocale
        ? `${baseUrl}${page.path}`
        : `${baseUrl}/${locale}${page.path}`;

      entries.push({
        url,
        lastModified,
        changeFrequency: page.changeFrequency,
        priority: page.priority,
        alternates: {
          languages: createLanguageAlternates(page.path),
        },
      });
    }
  }

  return entries;
}
