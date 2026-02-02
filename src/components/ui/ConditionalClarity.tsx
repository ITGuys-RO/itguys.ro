"use client";

import { useEffect } from "react";
import { usePathname } from "next/navigation";
import Clarity from "@microsoft/clarity";
import { useCookieConsent } from "@/components/providers/CookieConsentProvider";

const CLARITY_ID = process.env.NEXT_PUBLIC_CLARITY_ID;

export function ConditionalClarity() {
  const { hasConsent, consentGiven } = useCookieConsent();
  const pathname = usePathname();

  const isAdmin = pathname?.startsWith("/admin");
  const enabled = !!(CLARITY_ID && consentGiven && hasConsent("analytics") && !isAdmin);

  useEffect(() => {
    if (!enabled) return;
    if (Clarity.hasStarted()) return;

    Clarity.init(CLARITY_ID!);
  }, [enabled]);

  return null;
}
