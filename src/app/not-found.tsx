import { Header } from "@/components/layout/Header";
import { Footer } from "@/components/layout/Footer";
import { Section } from "@/components/ui";
import { Button } from "@/components/ui";
import { HomeIcon, WrenchScrewdriverIcon, EnvelopeIcon } from "@heroicons/react/24/outline";

export default function NotFound() {
  return (
    <>
      <Header locale="en" />
      <main className="min-h-screen pt-20">
        <Section className="flex items-center justify-center min-h-[60vh]">
          <div className="text-center max-w-lg mx-auto">
            <p className="text-8xl font-bold text-neon mb-4">404</p>
            <h1 className="text-3xl font-bold text-white mb-4">Page Not Found</h1>
            <p className="text-brand-300 mb-10 text-lg leading-relaxed">
              The page you&apos;re looking for doesn&apos;t exist or has been moved.
            </p>
            <div className="flex flex-col sm:flex-row gap-4 justify-center">
              <Button href="/" variant="primary">
                <HomeIcon className="w-5 h-5 mr-2" />
                Homepage
              </Button>
              <Button href="/services" variant="secondary">
                <WrenchScrewdriverIcon className="w-5 h-5 mr-2" />
                Services
              </Button>
              <Button href="/contact" variant="secondary">
                <EnvelopeIcon className="w-5 h-5 mr-2" />
                Contact Us
              </Button>
            </div>
          </div>
        </Section>
      </main>
      <Footer locale="en" />
    </>
  );
}
