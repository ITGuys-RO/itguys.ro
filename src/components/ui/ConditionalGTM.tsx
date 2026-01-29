"use client";

import { GoogleTagManager } from "@next/third-parties/google";
import { useCookieConsent } from "@/components/providers/CookieConsentProvider";

const GTM_ID = process.env.NEXT_PUBLIC_GTM_ID;

export function ConditionalGTM() {
  const { hasConsent, consentGiven } = useCookieConsent();

  if (!GTM_ID || !consentGiven || !hasConsent("analytics")) {
    return null;
  }

  return <GoogleTagManager gtmId={GTM_ID} />;
}
