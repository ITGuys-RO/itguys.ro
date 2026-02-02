'use client';

import { useState } from 'react';
import { clsx } from 'clsx';
import { sanitizeHtml } from '@/lib/sanitize-html';

interface MarkdownEditorProps {
  label: string;
  name: string;
  value: string;
  onChange: (value: string) => void;
  placeholder?: string;
  required?: boolean;
  rows?: number;
  className?: string;
}

export function MarkdownEditor({
  label,
  name,
  value,
  onChange,
  placeholder,
  required = false,
  rows = 12,
  className,
}: MarkdownEditorProps) {
  const [mode, setMode] = useState<'write' | 'preview'>('write');

  const insertMarkdown = (before: string, after: string = '') => {
    const textarea = document.getElementById(name) as HTMLTextAreaElement | null;
    if (!textarea) return;

    const start = textarea.selectionStart;
    const end = textarea.selectionEnd;
    const selectedText = value.substring(start, end);
    const newText = value.substring(0, start) + before + selectedText + after + value.substring(end);

    onChange(newText);

    // Set cursor position after insertion
    setTimeout(() => {
      textarea.focus();
      const newPosition = start + before.length + selectedText.length + after.length;
      textarea.setSelectionRange(newPosition, newPosition);
    }, 0);
  };

  const toolbarButtons = [
    { label: 'B', title: 'Bold', action: () => insertMarkdown('**', '**') },
    { label: 'I', title: 'Italic', action: () => insertMarkdown('*', '*') },
    { label: 'H1', title: 'Heading 1', action: () => insertMarkdown('# ') },
    { label: 'H2', title: 'Heading 2', action: () => insertMarkdown('## ') },
    { label: 'H3', title: 'Heading 3', action: () => insertMarkdown('### ') },
    { label: 'Link', title: 'Link', action: () => insertMarkdown('[', '](url)') },
    { label: 'List', title: 'Bullet List', action: () => insertMarkdown('- ') },
    { label: '1.', title: 'Numbered List', action: () => insertMarkdown('1. ') },
    { label: 'Code', title: 'Code Block', action: () => insertMarkdown('```\n', '\n```') },
    { label: 'Quote', title: 'Quote', action: () => insertMarkdown('> ') },
  ];

  return (
    <div className={clsx('flex flex-col gap-1.5', className)}>
      <label htmlFor={name} className="text-sm font-medium text-brand-200">
        {label}
        {required && <span className="text-neon-pink ml-1">*</span>}
      </label>

      <div className="rounded-lg border border-brand-700/50 bg-brand-900/60 overflow-hidden">
        {/* Toolbar */}
        <div className="flex items-center gap-1 p-2 border-b border-brand-700/50 bg-brand-800/30">
          <div className="flex items-center gap-1 mr-4">
            {toolbarButtons.map((btn) => (
              <button
                key={btn.label}
                type="button"
                title={btn.title}
                onClick={btn.action}
                className="px-2 py-1 text-xs font-medium text-brand-300 hover:text-white hover:bg-brand-700/50 rounded transition-colors"
              >
                {btn.label}
              </button>
            ))}
          </div>

          <div className="flex-1" />

          {/* Mode toggle */}
          <div className="flex items-center border border-brand-700/50 rounded">
            <button
              type="button"
              onClick={() => setMode('write')}
              className={clsx(
                'px-3 py-1 text-xs font-medium transition-colors',
                mode === 'write'
                  ? 'bg-brand-700/50 text-white'
                  : 'text-brand-400 hover:text-white'
              )}
            >
              Write
            </button>
            <button
              type="button"
              onClick={() => setMode('preview')}
              className={clsx(
                'px-3 py-1 text-xs font-medium transition-colors',
                mode === 'preview'
                  ? 'bg-brand-700/50 text-white'
                  : 'text-brand-400 hover:text-white'
              )}
            >
              Preview
            </button>
          </div>
        </div>

        {/* Editor / Preview */}
        {mode === 'write' ? (
          <textarea
            id={name}
            name={name}
            value={value}
            onChange={(e) => onChange(e.target.value)}
            placeholder={placeholder}
            required={required}
            rows={rows}
            className="w-full px-4 py-3 bg-transparent text-white placeholder:text-brand-500 focus:outline-none resize-none font-mono text-sm"
          />
        ) : (
          <div className="px-4 py-3 min-h-[200px] prose prose-invert prose-sm max-w-none">
            <MarkdownPreview content={value} />
          </div>
        )}
      </div>

      <p className="text-xs text-brand-400">
        Supports Markdown formatting. Use the toolbar or write directly.
      </p>
    </div>
  );
}

// Simple markdown preview (basic rendering)
function MarkdownPreview({ content }: { content: string }) {
  if (!content) {
    return <p className="text-brand-500 italic">Nothing to preview</p>;
  }

  // Very basic markdown to HTML conversion
  const html = content
    // Headers
    .replace(/^### (.*$)/gim, '<h3 class="text-lg font-semibold text-white mt-4 mb-2">$1</h3>')
    .replace(/^## (.*$)/gim, '<h2 class="text-xl font-semibold text-white mt-4 mb-2">$1</h2>')
    .replace(/^# (.*$)/gim, '<h1 class="text-2xl font-bold text-white mt-4 mb-2">$1</h1>')
    // Bold and Italic
    .replace(/\*\*(.+?)\*\*/g, '<strong class="font-semibold">$1</strong>')
    .replace(/\*(.+?)\*/g, '<em>$1</em>')
    // Links
    .replace(/\[([^\]]+)\]\(([^)]+)\)/g, '<a href="$2" class="text-brand-400 hover:text-brand-300 underline">$1</a>')
    // Code blocks
    .replace(/```([^`]+)```/g, '<pre class="bg-brand-800/50 p-3 rounded text-sm overflow-x-auto"><code>$1</code></pre>')
    // Inline code
    .replace(/`([^`]+)`/g, '<code class="bg-brand-800/50 px-1 rounded text-sm">$1</code>')
    // Blockquotes
    .replace(/^> (.*$)/gim, '<blockquote class="border-l-4 border-brand-400 pl-4 text-brand-300 italic">$1</blockquote>')
    // Lists
    .replace(/^- (.*$)/gim, '<li class="ml-4">$1</li>')
    .replace(/^(\d+)\. (.*$)/gim, '<li class="ml-4 list-decimal">$2</li>')
    // Paragraphs
    .replace(/\n\n/g, '</p><p class="mb-4">')
    .replace(/\n/g, '<br />');

  return (
    <div
      className="text-brand-200"
      dangerouslySetInnerHTML={{ __html: `<p class="mb-4">${sanitizeHtml(html)}</p>` }}
    />
  );
}
