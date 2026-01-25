import Link from 'next/link';

export const runtime = 'edge';

const sections = [
  {
    title: 'Team Members',
    description: 'Manage team members and their profiles',
    href: '/admin/team',
    count: 'team',
  },
  {
    title: 'Projects',
    description: 'Portfolio projects and case studies',
    href: '/admin/projects',
    count: 'projects',
  },
  {
    title: 'Companies',
    description: 'Partner companies and clients',
    href: '/admin/companies',
    count: 'companies',
  },
  {
    title: 'Services',
    description: 'Service offerings and descriptions',
    href: '/admin/services',
    count: 'services',
  },
  {
    title: 'FAQ',
    description: 'Frequently asked questions',
    href: '/admin/faq',
    count: 'faq',
  },
  {
    title: 'Blog Posts',
    description: 'News and blog articles',
    href: '/admin/posts',
    count: 'posts',
  },
  {
    title: 'Translations',
    description: 'UI text and localization',
    href: '/admin/translations',
    count: null,
  },
];

export default function AdminDashboard() {
  return (
    <div>
      <div className="mb-8">
        <h1 className="text-3xl font-bold text-white">Dashboard</h1>
        <p className="text-brand-400 mt-2">
          Welcome to the ITGuys admin panel. Manage your content from here.
        </p>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        {sections.map((section) => (
          <Link
            key={section.href}
            href={section.href}
            className="group p-6 bg-brand-900/60 rounded-lg border border-brand-700/50 hover:border-brand-400/50 transition-all duration-200"
          >
            <h2 className="text-lg font-semibold text-white group-hover:text-brand-300 transition-colors">
              {section.title}
            </h2>
            <p className="text-brand-400 text-sm mt-2">{section.description}</p>
            <div className="mt-4 text-brand-400 text-sm flex items-center gap-2 group-hover:text-brand-300 transition-colors">
              Manage
              <svg className="w-4 h-4 group-hover:translate-x-1 transition-transform" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
              </svg>
            </div>
          </Link>
        ))}
      </div>

      <div className="mt-12 p-6 theme-card rounded-lg">
        <h2 className="text-lg font-semibold text-white mb-4">Quick Actions</h2>
        <div className="flex flex-wrap gap-3">
          <Link
            href="/admin/posts/new"
            className="px-4 py-2 text-sm font-medium text-white bg-brand-600 hover:bg-brand-500 rounded-lg transition-colors"
          >
            New Blog Post
          </Link>
          <Link
            href="/admin/team/new"
            className="px-4 py-2 text-sm font-medium text-brand-300 border border-brand-600/50 hover:border-brand-400/50 hover:text-white rounded-lg transition-colors"
          >
            Add Team Member
          </Link>
          <Link
            href="/admin/projects/new"
            className="px-4 py-2 text-sm font-medium text-brand-300 border border-brand-600/50 hover:border-brand-400/50 hover:text-white rounded-lg transition-colors"
          >
            Add Project
          </Link>
        </div>
      </div>
    </div>
  );
}
