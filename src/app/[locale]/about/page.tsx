import type { Metadata } from "next";
import { locales, type Locale } from "@/i18n/config";

type Props = {
  params: Promise<{ locale: string }>;
};

export function generateStaticParams() {
  return locales.map((locale) => ({ locale }));
}

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { locale } = await params;
  return {
    title: locale === "ro" ? "Despre Noi" : "About Us",
  };
}

export default async function AboutPage({ params }: Props) {
  const { locale } = await params;

  return (
    <div className="pt-24 px-4">
      <h1 className="text-3xl font-bold">
        {locale === "ro" ? "Despre Noi" : "About Us"}
      </h1>
      <p>Test page</p>
    </div>
  );
}
