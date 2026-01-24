"use client";

import NextLink from "next/link";
import { usePathname as useNextPathname, useRouter as useNextRouter } from "next/navigation";
import { forwardRef } from "react";
import { defaultLocale, locales, type Locale } from "./config";

/**
 * Custom Link component that handles locale-aware routing.
 * For the default locale (en), links like /about stay as /about
 * For other locales, links become /ro/about
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
 * Hook to get the current pathname without the locale prefix
 */
export function usePathname(): string {
  const pathname = useNextPathname();
  return removeLocaleFromPathname(pathname);
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
 * - For other locales: /about becomes /ro/about
 */
function getLocalizedHref(href: string, locale: Locale): string {
  // Handle external URLs
  if (href.startsWith("http") || href.startsWith("mailto:") || href.startsWith("tel:")) {
    return href;
  }

  // Ensure href starts with /
  const normalizedHref = href.startsWith("/") ? href : `/${href}`;

  // For default locale, no prefix needed
  if (locale === defaultLocale) {
    return normalizedHref;
  }

  // For other locales, add prefix
  return `/${locale}${normalizedHref}`;
}
