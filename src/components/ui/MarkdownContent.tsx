import { sanitizeHtml } from '@/lib/sanitize-html';

function markdownToHtml(content: string): string {
  return content
    .replace(/^### (.*$)/gim, '<h3 class="text-xl font-semibold text-white mt-8 mb-4">$1</h3>')
    .replace(/^## (.*$)/gim, '<h2 class="text-2xl font-semibold text-white mt-10 mb-4">$1</h2>')
    .replace(/^# (.*$)/gim, '<h1 class="text-3xl font-bold text-white mt-10 mb-4">$1</h1>')
    .replace(/\*\*(.+?)\*\*/g, '<strong class="font-semibold text-white">$1</strong>')
    .replace(/\*(.+?)\*/g, '<em>$1</em>')
    .replace(/\[([^\]]+)\]\(([^)]+)\)/g, (_match: string, text: string, url: string) => {
      const isExternal = url.startsWith('http') && !url.includes('itguys.ro');
      const rel = isExternal ? ' rel="nofollow noopener" target="_blank"' : '';
      return `<a href="${url}" class="text-neon hover:underline"${rel}>${text}</a>`;
    })
    .replace(/```(\w+)?\n?([\s\S]*?)```/g, '<pre class="bg-brand-900/60 border border-brand-700/30 p-4 rounded-lg text-sm overflow-x-auto my-6"><code class="text-brand-200">$2</code></pre>')
    .replace(/`([^`]+)`/g, '<code class="bg-brand-800/50 px-1.5 py-0.5 rounded text-sm text-neon">$1</code>')
    .replace(/^> (.*$)/gim, '<blockquote class="border-l-4 border-neon/50 pl-4 text-brand-300 italic my-6">$1</blockquote>')
    .replace(/^- (.*$)/gim, '<li class="ml-6 text-brand-300 mb-2">$1</li>')
    .replace(/(<li.*<\/li>\n?)+/g, '<ul class="list-disc my-4">$&</ul>')
    .replace(/\n\n/g, '</p><p class="text-brand-300 mb-4 leading-relaxed">')
    .replace(/\n/g, '<br />');
}

export function MarkdownContent({ content }: { content: string }) {
  const html = sanitizeHtml(markdownToHtml(content));

  return (
    <div
      className="text-brand-300 leading-relaxed"
      dangerouslySetInnerHTML={{ __html: `<p class="text-brand-300 mb-4 leading-relaxed">${html}</p>` }}
    />
  );
}
