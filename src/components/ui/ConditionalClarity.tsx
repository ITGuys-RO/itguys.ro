"use client";

import { useEffect, useRef } from "react";
import { usePathname } from "next/navigation";
import { useCookieConsent } from "@/components/providers/CookieConsentProvider";

const CLARITY_ID = process.env.NEXT_PUBLIC_CLARITY_ID;

export function ConditionalClarity() {
  const { hasConsent, consentGiven } = useCookieConsent();
  const pathname = usePathname();
  const initialized = useRef(false);

  const isAdmin = pathname?.startsWith("/admin");
  const enabled = !!(CLARITY_ID && consentGiven && hasConsent("analytics") && !isAdmin);

  useEffect(() => {
    if (!enabled || initialized.current) return;

    import("@microsoft/clarity").then((mod) => {
      mod.default.init(CLARITY_ID!);
      initialized.current = true;
    });
  }, [enabled]);

  return null;
}
