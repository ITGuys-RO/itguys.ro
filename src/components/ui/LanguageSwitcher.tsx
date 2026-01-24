"use client";

import { usePathname, useRouter } from "@/i18n/navigation";
import { locales, localeNames, type Locale } from "@/i18n/config";
import { GlobeAltIcon } from "@heroicons/react/24/outline";

type Props = {
  locale: Locale;
};

export function LanguageSwitcher({ locale }: Props) {
  const router = useRouter();
  const pathname = usePathname();

  const handleChange = (newLocale: Locale) => {
    router.replace(pathname, { locale: newLocale });
  };

  const otherLocale = locale === "en" ? "ro" : "en";

  return (
    <button
      onClick={() => handleChange(otherLocale)}
      className="flex items-center gap-1.5 px-2 py-1 text-sm font-medium text-brand-200 hover:text-neon transition-all duration-300 hover:drop-shadow-[0_0_8px_rgba(0,212,255,0.5)] rounded-md"
      title={`Switch to ${localeNames[otherLocale]}`}
    >
      <GlobeAltIcon className="w-4 h-4" />
      <span className="uppercase">{otherLocale}</span>
    </button>
  );
}
