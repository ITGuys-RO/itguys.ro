import Image from "next/image";
import { Link } from "@/i18n/navigation";
import { type Locale } from "@/i18n/config";

const navigation = [
  { name: { en: "Development", ro: "Dezvoltare", fr: "Développement", de: "Entwicklung" }, href: "/services" },
  { name: { en: "Services", ro: "Servicii", fr: "Services", de: "Dienstleistungen" }, href: "/professional-services" },
  { name: { en: "Portfolio", ro: "Portofoliu", fr: "Portfolio", de: "Portfolio" }, href: "/portfolio" },
  { name: { en: "About", ro: "Despre", fr: "À propos", de: "Über uns" }, href: "/about" },
  { name: { en: "Contact", ro: "Contact", fr: "Contact", de: "Kontakt" }, href: "/contact" },
];

const footerText = {
  tagline: {
    en: "Custom software development and security services.",
    ro: "Dezvoltare software personalizată și servicii de securitate.",
    fr: "Développement logiciel sur mesure et services de sécurité.",
    de: "Maßgeschneiderte Softwareentwicklung und Sicherheitsdienste.",
  },
  rights: {
    en: "All rights reserved.",
    ro: "Toate drepturile rezervate.",
    fr: "Tous droits réservés.",
    de: "Alle Rechte vorbehalten.",
  },
};

type Props = {
  locale: Locale;
};

export function Footer({ locale }: Props) {
  return (
    <footer className="relative border-t border-brand-700/30 bg-background">
      {/* Grid pattern overlay */}
      <div className="absolute inset-0 overflow-hidden pointer-events-none">
        <svg className="absolute w-full h-full opacity-[0.02]" xmlns="http://www.w3.org/2000/svg">
          <defs>
            <pattern id="footer-grid" width="40" height="40" patternUnits="userSpaceOnUse">
              <path d="M 40 0 L 0 0 0 40" fill="none" stroke="currentColor" strokeWidth="0.5" className="text-brand-400" />
            </pattern>
          </defs>
          <rect width="100%" height="100%" fill="url(#footer-grid)" />
        </svg>
      </div>

      {/* Top accent line */}
      <div className="absolute top-0 left-0 right-0 h-px bg-gradient-to-r from-transparent via-brand-400/30 to-transparent" />

      <div className="relative max-w-4xl mx-auto px-6 md:px-8 py-12">
        <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-8">
          <div>
            <Link
              href="/"
              className="flex items-center gap-2 text-xl font-bold text-white group"
            >
              <div className="relative">
                <Image
                  src="/itguys_logo.png"
                  alt="ITGuys"
                  width={32}
                  height={32}
                  className="rounded-full transition-all duration-300 group-hover:shadow-[0_0_15px_rgba(0,212,255,0.4)]"
                />
              </div>
              <span className="transition-colors group-hover:text-brand-300">ITGuys</span>
            </Link>
            <p className="mt-2 text-sm text-brand-300">
              {footerText.tagline[locale]}
            </p>
          </div>

          <nav className="flex flex-wrap gap-6">
            {navigation.map((item) => (
              <Link
                key={item.name.en}
                href={item.href}
                className="text-sm text-brand-300 hover:text-neon transition-all duration-300 hover:drop-shadow-[0_0_8px_rgba(0,212,255,0.4)]"
              >
                {item.name[locale]}
              </Link>
            ))}
          </nav>
        </div>

        <div className="mt-8 pt-8 border-t border-brand-700/30 flex flex-col md:flex-row md:items-center md:justify-between gap-4">
          <p className="text-sm text-brand-400">
            &copy; {new Date().getFullYear()} ITGuys. {footerText.rights[locale]}
          </p>
          <div className="flex flex-wrap gap-4 md:gap-6">
            <a
              href="mailto:contact@itguys.ro"
              className="text-sm text-brand-300 hover:text-neon transition-all duration-300 hover:drop-shadow-[0_0_8px_rgba(0,212,255,0.4)]"
            >
              contact@itguys.ro
            </a>
            <a
              href="tel:+40726205856"
              className="text-sm text-brand-300 hover:text-neon transition-all duration-300 hover:drop-shadow-[0_0_8px_rgba(0,212,255,0.4)]"
            >
              +40 726 205 856
            </a>
          </div>
        </div>
      </div>

      {/* Decorative corner accents */}
      <div className="absolute bottom-0 left-0 w-24 h-24 pointer-events-none">
        <div className="absolute bottom-4 left-4 w-12 h-px bg-gradient-to-r from-brand-400/30 to-transparent" />
        <div className="absolute bottom-4 left-4 h-12 w-px bg-gradient-to-t from-brand-400/30 to-transparent" />
      </div>
      <div className="absolute bottom-0 right-0 w-24 h-24 pointer-events-none">
        <div className="absolute bottom-4 right-4 w-12 h-px bg-gradient-to-l from-brand-400/30 to-transparent" />
        <div className="absolute bottom-4 right-4 h-12 w-px bg-gradient-to-t from-brand-400/30 to-transparent" />
      </div>
    </footer>
  );
}
