import { Link } from "@/i18n/navigation";
import { ChevronRightIcon, HomeIcon } from "@heroicons/react/24/outline";
import type { Locale } from "@/i18n/config";

type BreadcrumbItem = {
  label: string;
  href?: string;
};

const homeLabel: Record<Locale, string> = {
  en: "Home",
  ro: "Acasă",
  fr: "Accueil",
  de: "Startseite",
  it: "Home",
  es: "Inicio",
};

export function Breadcrumb({
  items,
  locale = "en",
}: {
  items: BreadcrumbItem[];
  locale?: Locale;
}) {
  return (
    <nav aria-label="Breadcrumb" className="mb-8">
      <ol className="flex items-center gap-1.5 text-sm text-brand-400 flex-wrap">
        <li className="flex items-center gap-1.5">
          <Link
            href="/"
            className="inline-flex items-center gap-1 hover:text-neon transition-colors"
          >
            <HomeIcon className="w-4 h-4" />
            <span className="sr-only sm:not-sr-only">{homeLabel[locale]}</span>
          </Link>
        </li>
        {items.map((item, i) => (
          <li key={i} className="flex items-center gap-1.5">
            <ChevronRightIcon className="w-3.5 h-3.5 text-brand-600" />
            {item.href ? (
              <Link
                href={item.href}
                className="hover:text-neon transition-colors"
              >
                {item.label}
              </Link>
            ) : (
              <span className="text-brand-300">{item.label}</span>
            )}
          </li>
        ))}
      </ol>
    </nav>
  );
}
