"use client";

import { useTheme } from "@/components/providers/ThemeProvider";
import { SunIcon, MoonIcon } from "@heroicons/react/24/outline";
import { type Locale } from "@/i18n/config";

const tooltips = {
  en: {
    light: "Switch to light mode",
    dark: "Switch to dark mode",
  },
  ro: {
    light: "Comută la modul luminos",
    dark: "Comută la modul întunecat",
  },
  fr: {
    light: "Passer au mode clair",
    dark: "Passer au mode sombre",
  },
  de: {
    light: "Zum hellen Modus wechseln",
    dark: "Zum dunklen Modus wechseln",
  },
  it: {
    light: "Passa alla modalita chiara",
    dark: "Passa alla modalita scura",
  },
  es: {
    light: "Cambiar a modo claro",
    dark: "Cambiar a modo oscuro",
  },
};

type Props = {
  locale?: Locale;
};

export function ThemeSwitcher({ locale = "en" }: Props) {
  const { theme, toggleTheme } = useTheme();
  const tooltip = theme === "dark" ? tooltips[locale].light : tooltips[locale].dark;

  return (
    <button
      onClick={toggleTheme}
      className="relative p-2 rounded-lg text-brand-200 hover:text-neon transition-all duration-300 hover:bg-brand-800/50 dark:hover:bg-brand-800/50 cursor-pointer"
      aria-label={tooltip}
      title={tooltip}
    >
      <div className="relative w-5 h-5">
        {/* Sun icon for dark mode (click to go light) */}
        <SunIcon
          className={`absolute inset-0 w-5 h-5 transition-all duration-300 ${
            theme === "dark"
              ? "opacity-100 rotate-0 scale-100"
              : "opacity-0 rotate-90 scale-0"
          }`}
        />
        {/* Moon icon for light mode (click to go dark) */}
        <MoonIcon
          className={`absolute inset-0 w-5 h-5 transition-all duration-300 ${
            theme === "light"
              ? "opacity-100 rotate-0 scale-100"
              : "opacity-0 -rotate-90 scale-0"
          }`}
        />
      </div>
    </button>
  );
}
