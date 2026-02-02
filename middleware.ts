import { NextRequest, NextResponse } from "next/server";
import { locales, defaultLocale, pathnames, type Locale } from "./src/i18n/config";

// Build a reverse lookup map: localized path -> internal path
function buildReverseLookup(): Map<string, string> {
  const map = new Map<string, string>();

  for (const [internalPath, translations] of Object.entries(pathnames)) {
    for (const locale of locales) {
      if (locale === defaultLocale) continue; // Skip English, no rewrite needed

      const localizedPath = translations[locale as Locale];
      // Only add if the localized path is different from internal path
      if (localizedPath !== internalPath) {
        // Map: /ro/servicii -> /ro/services
        map.set(`/${locale}${localizedPath}`, `/${locale}${internalPath}`);
      }
    }
  }

  return map;
}

const reverseLookup = buildReverseLookup();

// English pages that exist in the (en) route group - no rewrite needed
const englishRoutes = [
  "/",
  "/development",
  "/services",
  "/about",
  "/contact",
  "/portfolio",
  "/blog",
  "/privacy",
  "/terms",
];

export function middleware(request: NextRequest) {
  const { pathname } = request.nextUrl;

  // Check if the pathname has a locale prefix
  const pathnameLocale = locales.find(
    (locale) => pathname.startsWith(`/${locale}/`) || pathname === `/${locale}`
  );

  if (pathnameLocale && pathnameLocale !== defaultLocale) {
    // Check for exact match in reverse lookup
    const exactMatch = reverseLookup.get(pathname);
    if (exactMatch) {
      const url = request.nextUrl.clone();
      url.pathname = exactMatch;
      return NextResponse.rewrite(url);
    }

    // Check for prefix match (for dynamic routes like /ro/servicii/web-development)
    for (const [localizedPrefix, internalPrefix] of reverseLookup.entries()) {
      if (pathname.startsWith(localizedPrefix + '/')) {
        const suffix = pathname.slice(localizedPrefix.length);
        const url = request.nextUrl.clone();
        url.pathname = internalPrefix + suffix;
        return NextResponse.rewrite(url);
      }
    }

    // No rewrite needed, let it through
    return NextResponse.next();
  }

  // If pathname is an English route that exists in (en) group, let it through
  if (englishRoutes.includes(pathname) || englishRoutes.some(route => pathname.startsWith(route + '/'))) {
    return NextResponse.next();
  }

  // For any other paths without locale, let Next.js handle the 404
  return NextResponse.next();
}

export const config = {
  matcher: [
    // All paths except admin, API, Next.js internals, and static files
    "/((?!admin|api|_next/static|_next/image|favicon.ico|.*\\.[\\w]+$).+)",
  ],
};

// Configure for Edge Runtime (required for Cloudflare)
export const runtime = 'edge';
