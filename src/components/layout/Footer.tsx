import Link from "next/link";
import Image from "next/image";

const navigation = [
  { name: "Services", href: "/services" },
  { name: "Portfolio", href: "/portfolio" },
  { name: "About", href: "/about" },
  { name: "Contact", href: "/contact" },
];

export function Footer() {
  return (
    <footer className="border-t border-brand-200 dark:border-brand-800 bg-brand-50 dark:bg-brand-950">
      <div className="max-w-4xl mx-auto px-6 md:px-8 py-12">
        <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-8">
          <div>
            <Link
              href="/"
              className="flex items-center gap-2 text-xl font-bold text-zinc-900 dark:text-white"
            >
              <Image
                src="/itguys_logo.png"
                alt="ITGuys"
                width={32}
                height={32}
                className="rounded-full"
              />
              ITGuys
            </Link>
            <p className="mt-2 text-sm text-zinc-600 dark:text-zinc-400">
              Custom software development and security services.
            </p>
          </div>

          <nav className="flex flex-wrap gap-6">
            {navigation.map((item) => (
              <Link
                key={item.name}
                href={item.href}
                className="text-sm text-zinc-600 hover:text-brand-600 dark:text-zinc-400 dark:hover:text-brand-400 transition-colors"
              >
                {item.name}
              </Link>
            ))}
          </nav>
        </div>

        <div className="mt-8 pt-8 border-t border-brand-200 dark:border-brand-800 flex flex-col md:flex-row md:items-center md:justify-between gap-4">
          <p className="text-sm text-zinc-500 dark:text-zinc-500">
            &copy; {new Date().getFullYear()} ITGuys. All rights reserved.
          </p>
          <div className="flex flex-wrap gap-4 md:gap-6">
            <a
              href="mailto:contact@itguys.ro"
              className="text-sm text-brand-600 hover:text-brand-700 dark:text-brand-400 dark:hover:text-brand-300 transition-colors"
            >
              contact@itguys.ro
            </a>
            <a
              href="tel:+40726205856"
              className="text-sm text-brand-600 hover:text-brand-700 dark:text-brand-400 dark:hover:text-brand-300 transition-colors"
            >
              +40 726 205 856
            </a>
          </div>
        </div>
      </div>
    </footer>
  );
}
