"use client";

import { useState, useRef, useEffect } from "react";
import { usePathname, useRouter } from "@/i18n/navigation";
import { locales, localeNames, type Locale } from "@/i18n/config";
import { GlobeAltIcon, ChevronDownIcon } from "@heroicons/react/24/outline";

type Props = {
  locale: Locale;
};

export function LanguageSwitcher({ locale }: Props) {
  const router = useRouter();
  const pathname = usePathname();
  const [isOpen, setIsOpen] = useState(false);
  const dropdownRef = useRef<HTMLDivElement>(null);

  const handleChange = (newLocale: Locale) => {
    // Check for hreflang alternate URL (for pages with locale-specific slugs like blog posts)
    const hreflangLink = document.querySelector(`link[rel="alternate"][hreflang="${newLocale}"]`);
    if (hreflangLink) {
      const href = hreflangLink.getAttribute('href');
      if (href) {
        // Extract pathname only - href may be absolute URL with production domain
        try {
          const url = new URL(href, window.location.origin);
          router.push(url.pathname);
        } catch {
          // If URL parsing fails, use href as-is (it's likely already a pathname)
          router.push(href);
        }
        setIsOpen(false);
        return;
      }
    }
    // Fall back to simple locale swap for pages without locale-specific slugs
    router.replace(pathname, { locale: newLocale });
    setIsOpen(false);
  };

  // Close dropdown when clicking outside
  useEffect(() => {
    function handleClickOutside(event: MouseEvent) {
      if (dropdownRef.current && !dropdownRef.current.contains(event.target as Node)) {
        setIsOpen(false);
      }
    }

    document.addEventListener("mousedown", handleClickOutside);
    return () => document.removeEventListener("mousedown", handleClickOutside);
  }, []);

  // Close dropdown on escape key
  useEffect(() => {
    function handleEscape(event: KeyboardEvent) {
      if (event.key === "Escape") {
        setIsOpen(false);
      }
    }

    document.addEventListener("keydown", handleEscape);
    return () => document.removeEventListener("keydown", handleEscape);
  }, []);

  return (
    <div className="relative" ref={dropdownRef}>
      <button
        onClick={() => setIsOpen(!isOpen)}
        className="flex items-center gap-1.5 px-2 py-1 text-sm font-medium text-brand-200 hover:text-neon transition-all duration-300 hover:drop-shadow-[0_0_8px_rgba(0,212,255,0.5)] rounded-md cursor-pointer"
        aria-expanded={isOpen}
        aria-haspopup="listbox"
      >
        <GlobeAltIcon className="w-4 h-4" />
        <span className="uppercase">{locale}</span>
        <ChevronDownIcon className={`w-3 h-3 transition-transform duration-200 ${isOpen ? "rotate-180" : ""}`} />
      </button>

      {isOpen && (
        <div className="absolute right-0 mt-2 w-36 rounded-lg bg-brand-900 border border-brand-700/50 shadow-lg shadow-black/20 overflow-hidden z-50">
          <ul role="listbox" className="py-1">
            {locales.map((loc) => (
              <li key={loc}>
                <button
                  onClick={() => handleChange(loc)}
                  className={`w-full px-4 py-2 text-left text-sm transition-colors ${
                    loc === locale
                      ? "bg-brand-800 text-neon"
                      : "text-brand-200 hover:bg-brand-800 hover:text-white"
                  }`}
                  role="option"
                  aria-selected={loc === locale}
                >
                  <span className="uppercase font-medium mr-2">{loc}</span>
                  <span className="text-brand-400">{localeNames[loc]}</span>
                </button>
              </li>
            ))}
          </ul>
        </div>
      )}
    </div>
  );
}
