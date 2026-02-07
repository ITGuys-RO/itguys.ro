import { GlobalSearch } from '@/components/admin';

const externalLinks = [
  {
    title: 'Google Search Console',
    description: 'Search performance, indexing & crawl stats',
    href: 'https://search.google.com/search-console?resource_id=sc-domain%3Aitguys.ro',
  },
  {
    title: 'Bing Webmaster Tools',
    description: 'Bing search insights & URL submissions',
    href: 'https://www.bing.com/webmasters/home?siteUrl=https://itguys.ro/',
  },
  {
    title: 'Microsoft Clarity',
    description: 'User behavior analytics & session recordings',
    href: 'https://clarity.microsoft.com/projects/view/vauayo86py/dashboard?date=Last%203%20days',
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

      <div className="mb-8">
        <GlobalSearch />
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        {externalLinks.map((link) => (
          <a
            key={link.href}
            href={link.href}
            target="_blank"
            rel="noopener noreferrer"
            className="group p-6 bg-brand-900/60 rounded-lg border border-brand-700/50 hover:border-brand-400/50 transition-all duration-200"
          >
            <h2 className="text-lg font-semibold text-white group-hover:text-brand-300 transition-colors">
              {link.title}
            </h2>
            <p className="text-brand-400 text-sm mt-2">{link.description}</p>
            <div className="mt-4 text-brand-400 text-sm flex items-center gap-2 group-hover:text-brand-300 transition-colors">
              Open
              <svg className="w-4 h-4 group-hover:translate-x-1 transition-transform" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
                <path strokeLinecap="round" strokeLinejoin="round" d="M13.5 6H5.25A2.25 2.25 0 003 8.25v10.5A2.25 2.25 0 005.25 21h10.5A2.25 2.25 0 0018 18.75V10.5m-10.5 6L21 3m0 0h-5.25M21 3v5.25" />
              </svg>
            </div>
          </a>
        ))}
      </div>
    </div>
  );
}
