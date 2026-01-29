"use client";

import { useState } from "react";
import { useCookieConsent } from "@/components/providers/CookieConsentProvider";

type Locale = "en" | "ro" | "fr" | "de" | "it" | "es";

const t = {
  banner_title: {
    en: "Cookie Settings",
    ro: "Setări cookie-uri",
    fr: "Paramètres des cookies",
    de: "Cookie-Einstellungen",
    it: "Impostazioni cookie",
    es: "Configuración de cookies",
  },
  banner_message: {
    en: "We use cookies to improve your experience. You can choose which categories to allow.",
    ro: "Folosim cookie-uri pentru a îmbunătăți experiența. Poți alege categoriile permise.",
    fr: "Nous utilisons des cookies pour améliorer votre expérience. Vous pouvez choisir les catégories autorisées.",
    de: "Wir verwenden Cookies, um Ihre Erfahrung zu verbessern. Sie können wählen, welche Kategorien erlaubt sind.",
    it: "Utilizziamo i cookie per migliorare la tua esperienza. Puoi scegliere le categorie da consentire.",
    es: "Usamos cookies para mejorar tu experiencia. Puedes elegir qué categorías permitir.",
  },
  accept_all: {
    en: "Accept All", ro: "Acceptă tot", fr: "Tout accepter",
    de: "Alle akzeptieren", it: "Accetta tutto", es: "Aceptar todo",
  },
  reject_all: {
    en: "Reject All", ro: "Respinge tot", fr: "Tout refuser",
    de: "Alle ablehnen", it: "Rifiuta tutto", es: "Rechazar todo",
  },
  manage_preferences: {
    en: "Manage Preferences", ro: "Gestionează preferințe", fr: "Gérer les préférences",
    de: "Einstellungen verwalten", it: "Gestisci preferenze", es: "Gestionar preferencias",
  },
  save_preferences: {
    en: "Save Preferences", ro: "Salvează preferințe", fr: "Enregistrer les préférences",
    de: "Einstellungen speichern", it: "Salva preferenze", es: "Guardar preferencias",
  },
  necessary: {
    en: "Necessary", ro: "Necesare", fr: "Nécessaires",
    de: "Notwendig", it: "Necessari", es: "Necesarias",
  },
  necessary_desc: {
    en: "Required for the website to function (e.g. security).",
    ro: "Necesare pentru funcționarea site-ului (ex. securitate).",
    fr: "Requis pour le fonctionnement du site (ex. sécurité).",
    de: "Erforderlich für die Funktion der Website (z.B. Sicherheit).",
    it: "Necessari per il funzionamento del sito (es. sicurezza).",
    es: "Necesarias para el funcionamiento del sitio (ej. seguridad).",
  },
  analytics: {
    en: "Analytics", ro: "Analiză", fr: "Analytiques",
    de: "Analyse", it: "Analitici", es: "Analíticas",
  },
  analytics_desc: {
    en: "Help us understand how visitors use the website.",
    ro: "Ne ajută să înțelegem cum folosesc vizitatorii site-ul.",
    fr: "Nous aident à comprendre comment les visiteurs utilisent le site.",
    de: "Helfen uns zu verstehen, wie Besucher die Website nutzen.",
    it: "Ci aiutano a capire come i visitatori usano il sito.",
    es: "Nos ayudan a entender cómo los visitantes usan el sitio.",
  },
  marketing: {
    en: "Marketing", ro: "Marketing", fr: "Marketing",
    de: "Marketing", it: "Marketing", es: "Marketing",
  },
  marketing_desc: {
    en: "Used for targeted advertising and remarketing.",
    ro: "Folosite pentru publicitate direcționată și remarketing.",
    fr: "Utilisés pour la publicité ciblée et le remarketing.",
    de: "Verwendet für gezielte Werbung und Remarketing.",
    it: "Utilizzati per pubblicità mirata e remarketing.",
    es: "Usadas para publicidad dirigida y remarketing.",
  },
  preferences: {
    en: "Preferences", ro: "Preferințe", fr: "Préférences",
    de: "Präferenzen", it: "Preferenze", es: "Preferencias",
  },
  preferences_desc: {
    en: "Enable personalized features like external avatars.",
    ro: "Activează funcții personalizate precum avatarele externe.",
    fr: "Activent des fonctionnalités personnalisées comme les avatars externes.",
    de: "Aktivieren personalisierte Funktionen wie externe Avatare.",
    it: "Abilitano funzionalità personalizzate come avatar esterni.",
    es: "Habilitan funciones personalizadas como avatares externos.",
  },
} as const;

function getLocaleFromPath(): Locale {
  if (typeof window === "undefined") return "en";
  const seg = window.location.pathname.split("/")[1];
  const locales: Locale[] = ["ro", "fr", "de", "it", "es"];
  return locales.includes(seg as Locale) ? (seg as Locale) : "en";
}

type CategoryKey = "analytics" | "marketing" | "preferences";

const toggleCategories: { key: CategoryKey; label: keyof typeof t; desc: keyof typeof t }[] = [
  { key: "analytics", label: "analytics", desc: "analytics_desc" },
  { key: "marketing", label: "marketing", desc: "marketing_desc" },
  { key: "preferences", label: "preferences", desc: "preferences_desc" },
];

export function CookieConsentBanner() {
  const { showBanner, consent, acceptAll, rejectAll, savePreferences } = useCookieConsent();
  const [expanded, setExpanded] = useState(false);
  const [localToggles, setLocalToggles] = useState<Record<CategoryKey, boolean>>({
    analytics: consent.analytics,
    marketing: consent.marketing,
    preferences: consent.preferences,
  });

  const locale = getLocaleFromPath();

  if (!showBanner) return null;

  const handleToggle = (key: CategoryKey) => {
    setLocalToggles((prev) => ({ ...prev, [key]: !prev[key] }));
  };

  const handleSave = () => {
    savePreferences(localToggles);
  };

  return (
    <div className="fixed bottom-0 inset-x-0 z-50 p-4 md:p-6">
      <div className="max-w-2xl mx-auto rounded-xl border border-brand-700/40 bg-brand-950/80 backdrop-blur-xl shadow-2xl shadow-black/40">
        <div className="p-5 md:p-6">
          <h3 className="text-base font-semibold text-white mb-2">
            {t.banner_title[locale]}
          </h3>
          <p className="text-sm text-brand-300 mb-4">
            {t.banner_message[locale]}
          </p>

          {expanded && (
            <div className="space-y-3 mb-4">
              {/* Necessary - always on */}
              <div className="flex items-center justify-between rounded-lg bg-brand-900/50 px-4 py-3">
                <div>
                  <p className="text-sm font-medium text-white">{t.necessary[locale]}</p>
                  <p className="text-xs text-brand-400 mt-0.5">{t.necessary_desc[locale]}</p>
                </div>
                <div className="relative w-10 h-6 rounded-full bg-brand-400 cursor-not-allowed opacity-60">
                  <div className="absolute top-1 right-1 w-4 h-4 rounded-full bg-white" />
                </div>
              </div>

              {toggleCategories.map(({ key, label, desc }) => (
                <div key={key} className="flex items-center justify-between rounded-lg bg-brand-900/50 px-4 py-3">
                  <div>
                    <p className="text-sm font-medium text-white">{t[label][locale]}</p>
                    <p className="text-xs text-brand-400 mt-0.5">{t[desc][locale]}</p>
                  </div>
                  <button
                    type="button"
                    role="switch"
                    aria-checked={localToggles[key]}
                    onClick={() => handleToggle(key)}
                    className={`relative w-10 h-6 rounded-full transition-colors ${
                      localToggles[key] ? "bg-brand-400" : "bg-brand-700"
                    }`}
                  >
                    <span
                      className={`absolute top-1 w-4 h-4 rounded-full bg-white transition-transform ${
                        localToggles[key] ? "right-1" : "left-1"
                      }`}
                    />
                  </button>
                </div>
              ))}
            </div>
          )}

          <div className="flex flex-wrap gap-3">
            {expanded ? (
              <button
                onClick={handleSave}
                className="flex-1 min-w-[140px] px-5 py-2.5 text-sm font-medium rounded-lg bg-brand-400 text-white hover:bg-brand-300 transition-colors"
              >
                {t.save_preferences[locale]}
              </button>
            ) : (
              <>
                <button
                  onClick={acceptAll}
                  className="flex-1 min-w-[120px] px-5 py-2.5 text-sm font-medium rounded-lg bg-brand-400 text-white hover:bg-brand-300 transition-colors"
                >
                  {t.accept_all[locale]}
                </button>
                <button
                  onClick={() => setExpanded(true)}
                  className="flex-1 min-w-[120px] px-5 py-2.5 text-sm font-medium rounded-lg border border-brand-400/30 text-brand-200 hover:border-brand-400/60 hover:text-white transition-colors"
                >
                  {t.manage_preferences[locale]}
                </button>
                <button
                  onClick={rejectAll}
                  className="flex-1 min-w-[120px] px-5 py-2.5 text-sm font-medium rounded-lg border border-brand-700/50 text-brand-400 hover:text-brand-200 hover:border-brand-500/50 transition-colors"
                >
                  {t.reject_all[locale]}
                </button>
              </>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}
