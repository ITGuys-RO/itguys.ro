"use client";

import { useCookieConsent } from "@/components/providers/CookieConsentProvider";
import { type Locale } from "@/i18n/config";

const label: Record<Locale, string> = {
  en: "Cookie Settings",
  ro: "Setări cookie-uri",
  fr: "Paramètres cookies",
  de: "Cookie-Einstellungen",
  it: "Impostazioni cookie",
  es: "Configuración cookies",
};

export function CookieSettingsButton({ locale }: { locale: Locale }) {
  const { setShowBanner } = useCookieConsent();

  return (
    <button
      type="button"
      onClick={() => setShowBanner(true)}
      className="text-sm text-brand-300 hover:text-neon transition-all duration-300 hover:drop-shadow-[0_0_8px_rgba(0,212,255,0.4)]"
    >
      {label[locale]}
    </button>
  );
}
