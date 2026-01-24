// Root layout - minimal wrapper for Next.js app router
// The actual layout with Header, Footer, and metadata is in [locale]/layout.tsx

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return children;
}
