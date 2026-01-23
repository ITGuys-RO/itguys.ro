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
    <Section className="relative bg-brand-900 text-white overflow-hidden">
      {/* Cyberpunk background decoration */}
      <div className="absolute inset-0 overflow-hidden">
        {/* Perspective grid */}
        <div className="absolute inset-x-0 bottom-0 h-[70%] overflow-hidden">
          <div
            className="absolute inset-0 opacity-20 animate-grid-pulse"
            style={{
              backgroundImage: `
                linear-gradient(rgba(0, 212, 255, 0.3) 1px, transparent 1px),
                linear-gradient(90deg, rgba(0, 212, 255, 0.3) 1px, transparent 1px)
              `,
              backgroundSize: '50px 50px',
              transform: 'perspective(400px) rotateX(55deg)',
              transformOrigin: 'center top',
            }}
          />
        </div>

        {/* Glowing orbs */}
        <div className="absolute -top-32 -right-32 w-96 h-96 bg-neon/20 rounded-full blur-[100px]" />
        <div className="absolute -bottom-32 -left-32 w-96 h-96 bg-brand-400/30 rounded-full blur-[100px]" />

        {/* Accent lines */}
        <div className="absolute top-0 left-0 right-0 h-px bg-gradient-to-r from-transparent via-neon/40 to-transparent" />
        <div className="absolute bottom-0 left-0 right-0 h-px bg-gradient-to-r from-transparent via-brand-400/30 to-transparent" />

        {/* Corner accents */}
        <div className="absolute top-0 left-0 w-32 h-32">
          <div className="absolute top-4 left-4 w-16 h-px bg-gradient-to-r from-neon/50 to-transparent" />
          <div className="absolute top-4 left-4 h-16 w-px bg-gradient-to-b from-neon/50 to-transparent" />
        </div>
        <div className="absolute top-0 right-0 w-32 h-32">
          <div className="absolute top-4 right-4 w-16 h-px bg-gradient-to-l from-neon/50 to-transparent" />
          <div className="absolute top-4 right-4 h-16 w-px bg-gradient-to-b from-neon/50 to-transparent" />
        </div>
        <div className="absolute bottom-0 left-0 w-32 h-32">
          <div className="absolute bottom-4 left-4 w-16 h-px bg-gradient-to-r from-neon/50 to-transparent" />
          <div className="absolute bottom-4 left-4 h-16 w-px bg-gradient-to-t from-neon/50 to-transparent" />
        </div>
        <div className="absolute bottom-0 right-0 w-32 h-32">
          <div className="absolute bottom-4 right-4 w-16 h-px bg-gradient-to-l from-neon/50 to-transparent" />
          <div className="absolute bottom-4 right-4 h-16 w-px bg-gradient-to-t from-neon/50 to-transparent" />
        </div>
      </div>

      <div className="relative text-center">
        <AnimateOnScroll animation="fade-in-up">
          <h2 className="text-2xl md:text-3xl font-bold text-white">{headline}</h2>
        </AnimateOnScroll>
        <AnimateOnScroll animation="fade-in-up" delay={100}>
          <p className="mt-4 text-brand-200 max-w-xl mx-auto">{body}</p>
        </AnimateOnScroll>
        <AnimateOnScroll animation="scale-in" delay={200}>
          <div className="mt-8">
            <Button
              href={buttonHref}
              variant="neon"
              className="inline-flex items-center gap-2"
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
