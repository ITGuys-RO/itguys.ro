import type { Metadata } from "next";
import { Inter } from "next/font/google";
import { Header, Footer } from "@/components/layout";
import "./globals.css";

const inter = Inter({
  subsets: ["latin"],
  variable: "--font-inter",
});

export const metadata: Metadata = {
  title: {
    default: "ITGuys - Custom Software Development & Security",
    template: "%s | ITGuys",
  },
  description:
    "Custom web and mobile apps, plus security services. We build software with the right technology for your problem.",
  keywords: [
    "software development",
    "web development",
    "mobile development",
    "security audits",
    "penetration testing",
    "Romania",
  ],
  authors: [{ name: "ITGuys" }],
  openGraph: {
    type: "website",
    locale: "en_US",
    siteName: "ITGuys",
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en" className={inter.variable}>
      <body className="font-sans antialiased bg-white dark:bg-zinc-950 text-zinc-900 dark:text-white">
        <Header />
        <main className="min-h-screen">{children}</main>
        <Footer />
      </body>
    </html>
  );
}
