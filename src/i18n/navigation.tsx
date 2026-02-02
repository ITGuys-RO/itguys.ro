"use client";

import NextLink from "next/link";
import { usePathname as useNextPathname, useRouter as useNextRouter } from "next/navigation";
import { forwardRef } from "react";
import { defaultLocale, locales, type Locale, getLocalizedPath, getInternalPath } from "./config";

/**
 * Custom Link component that handles locale-aware routing with localized URLs.
 * For the default locale (en): /about stays as /about
 * For other locales: /about becomes /ro/despre-noi (localized)
 */
export const Link = forwardRef<
  HTMLAnchorElement,
  React.ComponentProps<typeof NextLink> & { locale?: Locale }
>(function Link({ href, locale, ...props }, ref) {
  // Get current locale from pathname if not provided
  const pathname = useNextPathname();
  const currentLocale = getLocaleFromPathname(pathname);
  const targetLocale = locale ?? currentLocale;

  // Build the localized href
  const localizedHref = getLocalizedHref(String(href), targetLocale);

  return <NextLink ref={ref} href={localizedHref} {...props} />;
});

/**
 * Hook to get the current pathname without the locale prefix (returns internal path)
 */
export function usePathname(): string {
  const pathname = useNextPathname();
  const locale = getLocaleFromPathname(pathname);
  const pathWithoutLocale = removeLocaleFromPathname(pathname);
  // Convert localized path back to internal path
  return getInternalPath(pathWithoutLocale, locale);
}

/**
 * Hook to get a router with locale-aware navigation
 */
export function useRouter() {
  const router = useNextRouter();
  const pathname = useNextPathname();
  const currentLocale = getLocaleFromPathname(pathname);

  return {
    ...router,
    push: (href: string, options?: { locale?: Locale }) => {
      const targetLocale = options?.locale ?? currentLocale;
      router.push(getLocalizedHref(href, targetLocale));
    },
    replace: (href: string, options?: { locale?: Locale }) => {
      const targetLocale = options?.locale ?? currentLocale;
      router.replace(getLocalizedHref(href, targetLocale));
    },
  };
}

/**
 * Extract locale from pathname
 */
export function getLocaleFromPathname(pathname: string): Locale {
  const segments = pathname.split("/").filter(Boolean);
  const firstSegment = segments[0];

  if (firstSegment && locales.includes(firstSegment as Locale)) {
    return firstSegment as Locale;
  }

  return defaultLocale;
}

/**
 * Remove locale prefix from pathname
 */
function removeLocaleFromPathname(pathname: string): string {
  const segments = pathname.split("/").filter(Boolean);
  const firstSegment = segments[0];

  if (firstSegment && locales.includes(firstSegment as Locale)) {
    return "/" + segments.slice(1).join("/") || "/";
  }

  return pathname;
}

/**
 * Build a localized href
 * - For default locale (en): /about stays as /about
 * - For other locales: /about becomes /ro/despre-noi (localized path)
 */
function getLocalizedHref(href: string, locale: Locale): string {
  // Handle external URLs
  if (href.startsWith("http") || href.startsWith("mailto:") || href.startsWith("tel:")) {
    return href;
  }

  // Handle hash-only links
  if (href.startsWith("#")) {
    return href;
  }

  // Ensure href starts with /
  const normalizedHref = href.startsWith("/") ? href : `/${href}`;

  // Get the localized path
  const localizedPath = getLocalizedPath(normalizedHref, locale);

  // For default locale, no prefix needed
  if (locale === defaultLocale) {
    return localizedPath;
  }

  // For other locales, add prefix
  return `/${locale}${localizedPath === '/' ? '' : localizedPath}`;
}

/**
 * Get the URL for switching to a different locale (for language switcher)
 */
export function getLocaleUrl(pathname: string, currentLocale: Locale, targetLocale: Locale): string {
  // Get internal path from current localized path
  const pathWithoutLocale = removeLocaleFromPathname(pathname);
  const internalPath = getInternalPath(pathWithoutLocale, currentLocale);

  // Get localized path for target locale
  const localizedPath = getLocalizedPath(internalPath, targetLocale);

  if (targetLocale === defaultLocale) {
    return localizedPath;
  }

  return `/${targetLocale}${localizedPath === '/' ? '' : localizedPath}`;
}
