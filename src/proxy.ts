import { NextRequest, NextResponse } from "next/server";
import { locales, defaultLocale } from "./i18n/config";

export function proxy(request: NextRequest) {
  const { pathname } = request.nextUrl;

  // Check if the pathname already has a locale prefix
  const pathnameHasLocale = locales.some(
    (locale) => pathname.startsWith(`/${locale}/`) || pathname === `/${locale}`
  );

  if (pathnameHasLocale) {
    // If it's the default locale with explicit prefix, redirect to remove it
    // e.g., /en/about -> /about
    if (pathname.startsWith(`/${defaultLocale}/`) || pathname === `/${defaultLocale}`) {
      const newPathname = pathname.replace(`/${defaultLocale}`, "") || "/";
      return NextResponse.redirect(new URL(newPathname, request.url));
    }
    // Other locales keep their prefix
    return NextResponse.next();
  }

  // No locale in pathname - rewrite to default locale internally
  // e.g., /about -> /en/about (internal rewrite, URL stays as /about)
  const newUrl = new URL(`/${defaultLocale}${pathname}`, request.url);
  return NextResponse.rewrite(newUrl);
}

export const config = {
  matcher: [
    // Match all paths except:
    // - API routes
    // - Next.js internals
    // - Static files
    "/((?!api|_next|_vercel|.*\\..*).*)",
  ],
};
