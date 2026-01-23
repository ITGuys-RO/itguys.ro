import { Section, Button, AnimateOnScroll } from "@/components/ui";
import { ArrowRightIcon } from "@heroicons/react/24/outline";

type CTAProps = {
  headline: string;
  body: string;
  buttonText: string;
  buttonHref: string;
};

export function CTA({ headline, body, buttonText, buttonHref }: CTAProps) {
  return (
    <Section className="relative bg-brand-600 dark:bg-brand-800 text-white overflow-hidden">
      {/* Background decoration */}
      <div className="absolute inset-0 overflow-hidden">
        <div className="absolute -top-24 -right-24 w-96 h-96 bg-brand-500/30 dark:bg-brand-700/30 rounded-full blur-3xl" />
        <div className="absolute -bottom-24 -left-24 w-96 h-96 bg-brand-400/20 dark:bg-brand-900/30 rounded-full blur-3xl" />
        {/* Grid overlay */}
        <svg className="absolute inset-0 w-full h-full opacity-10" xmlns="http://www.w3.org/2000/svg">
          <defs>
            <pattern id="cta-grid" width="32" height="32" patternUnits="userSpaceOnUse">
              <path d="M 32 0 L 0 0 0 32" fill="none" stroke="white" strokeWidth="0.5" />
            </pattern>
          </defs>
          <rect width="100%" height="100%" fill="url(#cta-grid)" />
        </svg>
      </div>

      <div className="relative text-center">
        <AnimateOnScroll animation="fade-in-up">
          <h2 className="text-2xl md:text-3xl font-bold">{headline}</h2>
        </AnimateOnScroll>
        <AnimateOnScroll animation="fade-in-up" delay={100}>
          <p className="mt-4 text-brand-100 max-w-xl mx-auto">{body}</p>
        </AnimateOnScroll>
        <AnimateOnScroll animation="scale-in" delay={200}>
          <div className="mt-8">
            <Button
              href={buttonHref}
              variant="primary"
              className="bg-white text-brand-700 hover:bg-brand-50 dark:bg-white dark:text-brand-700 inline-flex items-center gap-2"
            >
              {buttonText}
              <ArrowRightIcon className="w-4 h-4" />
            </Button>
          </div>
        </AnimateOnScroll>
      </div>
    </Section>
  );
}
