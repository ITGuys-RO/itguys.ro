export const locales = ['en', 'ro', 'fr', 'de', 'it', 'es'] as const;
export const defaultLocale = 'en' as const;

export type Locale = (typeof locales)[number];

export const localeNames: Record<Locale, string> = {
  en: 'English',
  ro: 'Română',
  fr: 'Français',
  de: 'Deutsch',
  it: 'Italiano',
  es: 'Español',
};

// Localized pathnames for each route
// Keys are the internal paths (used in code), values are the localized URLs
export const pathnames: Record<string, Record<Locale, string>> = {
  '/': {
    en: '/',
    ro: '/',
    fr: '/',
    de: '/',
    it: '/',
    es: '/',
  },
  '/about': {
    en: '/about',
    ro: '/despre-noi',
    fr: '/a-propos',
    de: '/ueber-uns',
    it: '/chi-siamo',
    es: '/sobre-nosotros',
  },
  '/contact': {
    en: '/contact',
    ro: '/contact',
    fr: '/contact',
    de: '/kontakt',
    it: '/contatti',
    es: '/contacto',
  },
  '/services': {
    en: '/services',
    ro: '/servicii',
    fr: '/services',
    de: '/dienstleistungen',
    it: '/servizi',
    es: '/servicios',
  },
  '/development': {
    en: '/development',
    ro: '/dezvoltare',
    fr: '/developpement',
    de: '/entwicklung',
    it: '/sviluppo',
    es: '/desarrollo',
  },
  '/portfolio': {
    en: '/portfolio',
    ro: '/portofoliu',
    fr: '/portfolio',
    de: '/portfolio',
    it: '/portfolio',
    es: '/portafolio',
  },
  '/blog': {
    en: '/blog',
    ro: '/blog',
    fr: '/blog',
    de: '/blog',
    it: '/blog',
    es: '/blog',
  },
};

// Get the localized path for a given internal path and locale
export function getLocalizedPath(internalPath: string, locale: Locale): string {
  // Check for exact match first
  if (pathnames[internalPath]) {
    return pathnames[internalPath][locale];
  }

  // Handle dynamic routes like /services/[slug] or /blog/[slug]
  // Check if path starts with a known prefix
  for (const [pattern, translations] of Object.entries(pathnames)) {
    if (pattern !== '/' && internalPath.startsWith(pattern + '/')) {
      const suffix = internalPath.slice(pattern.length);
      return translations[locale] + suffix;
    }
  }

  // No translation found, return as-is
  return internalPath;
}

// Get the internal path from a localized path and locale
export function getInternalPath(localizedPath: string, locale: Locale): string {
  // Check for exact match first
  for (const [internal, translations] of Object.entries(pathnames)) {
    if (translations[locale] === localizedPath) {
      return internal;
    }
  }

  // Handle dynamic routes - check if path starts with a localized prefix
  for (const [internal, translations] of Object.entries(pathnames)) {
    const localizedPrefix = translations[locale];
    if (localizedPrefix !== '/' && localizedPath.startsWith(localizedPrefix + '/')) {
      const suffix = localizedPath.slice(localizedPrefix.length);
      return internal + suffix;
    }
  }

  // No translation found, return as-is
  return localizedPath;
}

// Get all localized path variants for building reverse lookup
export function getAllLocalizedPaths(): Map<string, { locale: Locale; internalPath: string }> {
  const map = new Map<string, { locale: Locale; internalPath: string }>();

  for (const [internalPath, translations] of Object.entries(pathnames)) {
    for (const [locale, localizedPath] of Object.entries(translations)) {
      if (localizedPath !== internalPath || locale === defaultLocale) {
        map.set(`/${locale}${localizedPath}`, {
          locale: locale as Locale,
          internalPath
        });
      }
    }
  }

  return map;
}

// Generate hreflang alternates for metadata
// internalPath should be the internal path like '/services' or '/services/security'
export function generateAlternates(internalPath: string, currentLocale: Locale = defaultLocale): {
  canonical: string;
  languages: Record<string, string>;
} {
  const languages: Record<string, string> = {};
  for (const locale of locales) {
    const localizedPath = getLocalizedPath(internalPath, locale);
    if (locale === defaultLocale) {
      languages[locale] = localizedPath;
    } else {
      languages[locale] = `/${locale}${localizedPath}`;
    }
  }

  const canonical = currentLocale === defaultLocale
    ? getLocalizedPath(internalPath, defaultLocale)
    : `/${currentLocale}${getLocalizedPath(internalPath, currentLocale)}`;

  return {
    canonical,
    languages,
  };
}
