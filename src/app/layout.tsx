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
    <html lang="en" className={inter.variable}>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="theme-color" content="#6b8db9" media="(prefers-color-scheme: light)" />
        <meta name="theme-color" content="#1f2735" media="(prefers-color-scheme: dark)" />
        <link rel="icon" href="/itguys_logo.png" />
      </head>
      <body className="font-sans antialiased bg-white dark:bg-zinc-950 text-zinc-900 dark:text-white">
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
