"use client";

import { createContext, useContext, useEffect, useState, useCallback } from "react";

export type ConsentCategories = {
  necessary: true;
  analytics: boolean;
  marketing: boolean;
  preferences: boolean;
};

type ConsentData = {
  categories: ConsentCategories;
  timestamp: number;
};

type CookieConsentContextType = {
  consent: ConsentCategories;
  consentGiven: boolean;
  showBanner: boolean;
  setShowBanner: (show: boolean) => void;
  hasConsent: (category: keyof ConsentCategories) => boolean;
  acceptAll: () => void;
  rejectAll: () => void;
  savePreferences: (categories: Omit<ConsentCategories, "necessary">) => void;
};

const STORAGE_KEY = "itguys-consent";

const defaultConsent: ConsentCategories = {
  necessary: true,
  analytics: false,
  marketing: false,
  preferences: false,
};

const CookieConsentContext = createContext<CookieConsentContextType | undefined>(undefined);

export function CookieConsentProvider({ children }: { children: React.ReactNode }) {
  const [state, setState] = useState<{
    consent: ConsentCategories;
    consentGiven: boolean;
    showBanner: boolean;
  }>({ consent: defaultConsent, consentGiven: false, showBanner: false });

  useEffect(() => {
    try {
      const stored = localStorage.getItem(STORAGE_KEY);
      if (stored) {
        const data: ConsentData = JSON.parse(stored);
        setState({ consent: data.categories, consentGiven: true, showBanner: false });
      } else {
        setState((s) => ({ ...s, showBanner: true }));
      }
    } catch {
      setState((s) => ({ ...s, showBanner: true }));
    }
  }, []);

  const setShowBanner = useCallback((show: boolean) => {
    setState((s) => ({ ...s, showBanner: show }));
  }, []);

  const persist = useCallback((categories: ConsentCategories) => {
    const data: ConsentData = { categories, timestamp: Date.now() };
    localStorage.setItem(STORAGE_KEY, JSON.stringify(data));
    setState({ consent: categories, consentGiven: true, showBanner: false });
  }, []);

  const hasConsent = useCallback(
    (category: keyof ConsentCategories) => state.consent[category],
    [state.consent]
  );

  const acceptAll = useCallback(() => {
    persist({ necessary: true, analytics: true, marketing: true, preferences: true });
  }, [persist]);

  const rejectAll = useCallback(() => {
    persist({ necessary: true, analytics: false, marketing: false, preferences: false });
  }, [persist]);

  const savePreferences = useCallback(
    (categories: Omit<ConsentCategories, "necessary">) => {
      persist({ necessary: true, ...categories });
    },
    [persist]
  );

  return (
    <CookieConsentContext.Provider
      value={{ consent: state.consent, consentGiven: state.consentGiven, showBanner: state.showBanner, setShowBanner, hasConsent, acceptAll, rejectAll, savePreferences }}
    >
      {children}
    </CookieConsentContext.Provider>
  );
}

export function useCookieConsent() {
  const context = useContext(CookieConsentContext);
  if (context === undefined) {
    throw new Error("useCookieConsent must be used within a CookieConsentProvider");
  }
  return context;
}
