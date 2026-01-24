import type { Metadata } from "next";
import { notFound } from "next/navigation";
import { Inter } from "next/font/google";
import { locales, type Locale } from "@/i18n/config";
import { Header } from "@/components/layout/Header";
import { Footer } from "@/components/layout/Footer";
import "../globals.css";

const inter = Inter({
  subsets: ["latin"],
  variable: "--font-inter",
});

type Props = {
  children: React.ReactNode;
  params: Promise<{ locale: string }>;
};

export function generateStaticParams() {
  return locales.map((locale) => ({ locale }));
}

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { locale } = await params;
  return {
    title: "ITGuys",
    description:
      locale === "ro"
        ? "Dezvoltare software personalizat"
        : "Custom software development",
  };
}

export default async function LocaleLayout({ children, params }: Props) {
  const { locale } = await params;

  if (!locales.includes(locale as Locale)) {
    notFound();
  }

  return (
    <html lang={locale} className={`${inter.variable} dark`}>
      <body className="font-sans antialiased bg-brand-950 text-white">
        <Header locale={locale as Locale} />
        <main className="min-h-screen pt-20">{children}</main>
        <Footer locale={locale as Locale} />
      </body>
    </html>
  );
}
