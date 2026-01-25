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
  secondaryCta?: {
    text: string;
    href: string;
  };
  badgeText?: string;
  illustration?: ReactNode;
  showBadge?: boolean;
};

export function Hero({ headline, subheadline, cta, secondaryCta, badgeText = "Available for new projects", illustration, showBadge = true }: HeroProps) {
  return (
    <section className="relative pt-24 pb-10 md:pt-32 md:pb-14 overflow-hidden">
      {/* Cyberpunk background elements */}
      <div className="absolute inset-0 overflow-hidden">
        {/* Perspective grid floor */}
        <div className="absolute inset-x-0 bottom-0 h-[50%] overflow-hidden opacity-30">
          <div
            className="absolute inset-0 animate-grid-pulse"
            style={{
              backgroundImage: `
                linear-gradient(rgba(81, 116, 161, 0.3) 1px, transparent 1px),
                linear-gradient(90deg, rgba(81, 116, 161, 0.3) 1px, transparent 1px)
              `,
              backgroundSize: '80px 80px',
              transform: 'perspective(500px) rotateX(60deg)',
              transformOrigin: 'center top',
            }}
          />
        </div>

        {/* Neon accent blobs */}
        <div className="absolute top-0 right-0 -translate-y-1/4 translate-x-1/4 w-[500px] h-[500px] bg-brand-400/20 rounded-full blur-[100px]" />
        <div className="absolute bottom-0 left-0 translate-y-1/4 -translate-x-1/4 w-[400px] h-[400px] bg-neon/10 rounded-full blur-[100px]" />
        <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[600px] h-[300px] bg-brand-500/10 rounded-full blur-[120px]" />

        {/* Horizontal accent lines */}
        <div className="absolute top-1/3 left-0 right-0 h-px bg-gradient-to-r from-transparent via-brand-400/20 to-transparent" />
        <div className="absolute top-2/3 left-0 right-0 h-px bg-gradient-to-r from-transparent via-neon/10 to-transparent" />
      </div>

      <div className="relative z-10 max-w-6xl mx-auto px-6 md:px-8">
        <div className={`grid ${illustration ? "lg:grid-cols-2 gap-8 items-center" : ""}`}>
          <div className="max-w-2xl">
            {showBadge && (
              <div className="inline-flex items-center gap-2 px-4 py-1.5 mb-6 text-sm font-medium text-neon bg-neon/10 border border-neon/30 rounded-full animate-fade-in-down animate-pulse-glow">
                <span className="w-2 h-2 bg-neon rounded-full animate-pulse" />
                {badgeText}
              </div>
            )}
            <h1 className="text-4xl md:text-5xl lg:text-6xl font-bold text-white leading-tight">
              {headline}
            </h1>
            <p className="mt-6 text-lg md:text-xl text-brand-200 animate-fade-in-up stagger-1">
              {subheadline}
            </p>
            {cta && (
              <div className="relative z-10 mt-8 flex flex-wrap gap-4 animate-fade-in-up stagger-2">
                <Button href={cta.href} variant="primary" className="flex items-center gap-2">
                  {cta.text}
                  <ArrowRightIcon className="w-4 h-4" />
                </Button>
                {secondaryCta && (
                  <Button href={secondaryCta.href} variant="secondary">
                    {secondaryCta.text}
                  </Button>
                )}
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

      {/* Bottom fade */}
      <div className="absolute bottom-0 left-0 right-0 h-32 bg-gradient-to-t from-brand-950 to-transparent pointer-events-none" />
    </section>
  );
}
