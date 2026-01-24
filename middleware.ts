import { NextRequest, NextResponse } from "next/server";
import { locales } from "./src/i18n/config";

// English pages that exist in the (en) route group - no rewrite needed
const englishRoutes = [
  "/",
  "/development",
  "/services",
  "/about",
  "/contact",
  "/portfolio",
];

export function middleware(request: NextRequest) {
  const { pathname } = request.nextUrl;

  // Check if the pathname already has a locale prefix
  const pathnameHasLocale = locales.some(
    (locale) => pathname.startsWith(`/${locale}/`) || pathname === `/${locale}`
  );

  // If pathname has a locale, let it through
  if (pathnameHasLocale) {
    return NextResponse.next();
  }

  // If pathname is an English route that exists in (en) group, let it through
  if (englishRoutes.includes(pathname)) {
    return NextResponse.next();
  }

  // For any other paths without locale, let Next.js handle the 404
  return NextResponse.next();
}

export const config = {
  matcher: [
    // All paths except root, API, Next.js internals, and static files
    "/((?!api|_next/static|_next/image|favicon.ico|.*\\.[\\w]+$).+)",
  ],
};

// Configure for Edge Runtime (required for Cloudflare)
export const runtime = 'edge';
