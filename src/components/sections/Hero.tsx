import { Button } from "@/components/ui";
import { ArrowRightIcon } from "@heroicons/react/24/outline";
import { ReactNode } from "react";

type HeroProps = {
  headline: string;
  subheadline: string;
  cta?: {
    text: string;
    href: string;
  };
  illustration?: ReactNode;
  showBadge?: boolean;
};

export function Hero({ headline, subheadline, cta, illustration, showBadge = true }: HeroProps) {
  return (
    <section className="relative pt-32 pb-16 md:pt-40 md:pb-24 px-6 md:px-8 overflow-hidden">
      {/* Background gradient accent */}
      <div className="absolute top-0 right-0 -translate-y-1/2 translate-x-1/4 w-96 h-96 bg-brand-400/20 dark:bg-brand-400/10 rounded-full blur-3xl" />
      <div className="absolute bottom-0 left-0 translate-y-1/2 -translate-x-1/4 w-64 h-64 bg-brand-300/20 dark:bg-brand-500/10 rounded-full blur-3xl" />

      <div className="relative max-w-6xl mx-auto">
        <div className={`grid ${illustration ? "lg:grid-cols-2 gap-12 items-center" : ""}`}>
          <div className="max-w-2xl">
            {showBadge && (
              <div className="inline-flex items-center gap-2 px-3 py-1 mb-6 text-sm font-medium text-brand-700 dark:text-brand-300 bg-brand-100 dark:bg-brand-900/50 rounded-full animate-fade-in-down">
                <span className="w-2 h-2 bg-brand-500 rounded-full animate-pulse" />
                Available for new projects
              </div>
            )}
            <h1 className="text-4xl md:text-5xl lg:text-6xl font-bold text-zinc-900 dark:text-white leading-tight animate-fade-in-up">
              {headline}
            </h1>
            <p className="mt-6 text-lg md:text-xl text-zinc-600 dark:text-zinc-400 animate-fade-in-up stagger-1">
              {subheadline}
            </p>
            {cta && (
              <div className="mt-8 flex flex-wrap gap-4 animate-fade-in-up stagger-2">
                <Button href={cta.href} variant="primary" className="flex items-center gap-2">
                  {cta.text}
                  <ArrowRightIcon className="w-4 h-4" />
                </Button>
                <Button href="/portfolio" variant="secondary">
                  View Our Work
                </Button>
              </div>
            )}
          </div>

          {illustration && (
            <div className="hidden lg:block animate-fade-in stagger-3">
              {illustration}
            </div>
          )}
        </div>
      </div>
    </section>
  );
}
