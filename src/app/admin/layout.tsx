import { AdminShell } from '@/components/admin';

export const metadata = {
  title: 'Admin | ITGuys',
  robots: 'noindex, nofollow',
};

export default function AdminLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return <AdminShell>{children}</AdminShell>;
}
