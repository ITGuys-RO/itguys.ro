import type { Metadata } from "next";
import { Inter } from "next/font/google";
import { Header, Footer } from "@/components/layout";
import { OrganizationSchema, LocalBusinessSchema, WebsiteSchema } from "@/components/structured-data";
import "./globals.css";

const inter = Inter({
  subsets: ["latin"],
  variable: "--font-inter",
});

export const metadata: Metadata = {
  metadataBase: new URL("https://itguys.ro"),
  title: {
    default: "ITGuys - Custom Software Development & Security Services Romania",
    template: "%s | ITGuys",
  },
  description:
    "Custom web and mobile apps, plus security services. We build software with the right technology for your problem. Based in Romania, working with clients worldwide.",
  keywords: [
    "software development",
    "web development",
    "mobile development",
    "security audits",
    "penetration testing",
    "custom software",
    "Romania",
    "web apps",
    "mobile apps",
    "API development",
    "cybersecurity",
  ],
  authors: [{ name: "ITGuys" }],
  creator: "ITGuys",
  publisher: "ITGuys",
  robots: {
    index: true,
    follow: true,
    googleBot: {
      index: true,
      follow: true,
      "max-video-preview": -1,
      "max-image-preview": "large",
      "max-snippet": -1,
    },
  },
  alternates: {
    canonical: "/",
  },
  openGraph: {
    type: "website",
    locale: "en_US",
    url: "https://itguys.ro",
    siteName: "ITGuys",
    title: "ITGuys - Custom Software Development & Security Services",
    description:
      "Custom web and mobile apps, plus security services. We build software with the right technology for your problem.",
    images: [
      {
        url: "/og-image.png",
        width: 1200,
        height: 630,
        alt: "ITGuys - Custom Software Development",
      },
    ],
  },
  twitter: {
    card: "summary_large_image",
    title: "ITGuys - Custom Software Development & Security Services",
    description:
      "Custom web and mobile apps, plus security services. We build software with the right technology for your problem.",
    images: ["/og-image.png"],
  },
  verification: {
    google: "google-site-verification-code",
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en" className={`${inter.variable} dark`}>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        {/* Dark-first: default to dark theme color */}
        <meta name="theme-color" content="#0a0f14" />
        <meta name="theme-color" content="#0a0f14" media="(prefers-color-scheme: dark)" />
        <meta name="theme-color" content="#5174a1" media="(prefers-color-scheme: light)" />
        <meta name="color-scheme" content="dark light" />
        <link rel="icon" href="/itguys_logo.png" />
      </head>
      <body className="font-sans antialiased bg-brand-950 text-white">
        <WebsiteSchema />
        <OrganizationSchema />
        <LocalBusinessSchema />
        <Header />
        <main className="min-h-screen">{children}</main>
        <Footer />
      </body>
    </html>
  );
}
