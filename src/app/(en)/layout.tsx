import { Header } from "@/components/layout/Header";
import { Footer } from "@/components/layout/Footer";

export default function EnglishLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <>
      <Header locale="en" />
      <main className="min-h-screen pt-20">{children}</main>
      <Footer locale="en" />
    </>
  );
}
