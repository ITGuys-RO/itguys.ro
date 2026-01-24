import type { Metadata } from "next";
import { Inter } from "next/font/google";
import { ThemeProvider } from "@/components/providers/ThemeProvider";
import "./globals.css";

const inter = Inter({
  subsets: ["latin"],
  variable: "--font-inter",
});

export const metadata: Metadata = {
  metadataBase: new URL('https://itguys.ro'),
  title: {
    default: "ITGuys - Custom Software Development & Security Services",
    template: "%s | ITGuys"
  },
  description: "Custom web and mobile apps, plus security services. We build software with the right technology for your problem. Expert team with 25+ years combined experience from EA, TUI, and Nagarro.",
  keywords: ["software development", "web development", "mobile apps", "security services", "penetration testing", "custom software", "React", "Next.js", "Node.js", "cloud infrastructure", "Romania software company"],
  authors: [{ name: "ITGuys Team" }],
  creator: "ITGuys",
  publisher: "ITGuys",
  formatDetection: {
    email: false,
    address: false,
    telephone: false,
  },
  openGraph: {
    type: "website",
    locale: "en_US",
    url: "https://itguys.ro",
    siteName: "ITGuys",
    title: "ITGuys - Custom Software Development & Security Services",
    description: "Custom web and mobile apps, plus security services. We build software with the right technology for your problem.",
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
    description: "Custom web and mobile apps, plus security services. Expert team from EA, TUI, and Nagarro.",
    images: ["/og-image.png"],
  },
  robots: {
    index: true,
    follow: true,
    googleBot: {
      index: true,
      follow: true,
      'max-video-preview': -1,
      'max-image-preview': 'large',
      'max-snippet': -1,
    },
  },
  verification: {
    // Add when you have them:
    // google: 'your-google-verification-code',
    // yandex: 'your-yandex-verification-code',
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en" className={`${inter.variable} dark`} suppressHydrationWarning>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="theme-color" content="#6b8db9" />
        <link rel="apple-touch-icon" href="/apple-icon.png" />
        <script
          dangerouslySetInnerHTML={{
            __html: `
              (function() {
                try {
                  var theme = localStorage.getItem('itguys-theme');
                  if (theme === 'light') {
                    document.documentElement.classList.remove('dark');
                    document.documentElement.classList.add('light');
                  }
                } catch (e) {}
              })();
            `,
          }}
        />
      </head>
      <body className="font-sans antialiased bg-background text-foreground">
        <ThemeProvider>
          {children}
        </ThemeProvider>
      </body>
    </html>
  );
}
