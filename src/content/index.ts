import type { Locale } from "@/i18n/config";

import * as enContent from "./en";
import * as roContent from "./ro";
import * as frContent from "./fr";
import * as deContent from "./de";
import * as itContent from "./it";
import * as esContent from "./es";

const contentByLocale = {
  en: enContent,
  ro: roContent,
  fr: frContent,
  de: deContent,
  it: itContent,
  es: esContent,
} as const;

export function getContent(locale: Locale) {
  return contentByLocale[locale] || contentByLocale.en;
}

// Re-export types and default (English) content for backwards compatibility
export { homeContent } from "./en/home";
export { developmentContent } from "./en/development";
export { servicesContent } from "./en/services";
export { aboutContent } from "./en/about";
export { portfolioContent } from "./en/portfolio";
export { contactContent } from "./en/contact";
export { privacyContent } from "./en/privacy";
