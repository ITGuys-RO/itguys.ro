// Lightweight HTML sanitizer for server-side use (no DOM dependency).
// Strips dangerous tags, event handlers, and unsafe URL protocols.

const DANGEROUS_TAGS = /(<\s*\/?\s*)(script|iframe|object|embed|style|form|input|textarea|select|button|svg|math|base|meta|link|applet)(\s[^>]*>|>)/gi;

const EVENT_HANDLER_ATTRS = /\s+on\w+\s*=\s*(?:"[^"]*"|'[^']*'|[^\s>]+)/gi;

const DANGEROUS_HREF = /<a\s([^>]*?)href\s*=\s*"([^"]*)"([^>]*?)>/gi;

const SAFE_URL_PATTERN = /^(?:https?:\/\/|mailto:|tel:|\/#|\/[^/]|#)/i;

function sanitizeUrl(url: string): string {
  const trimmed = url.trim();
  if (!trimmed || SAFE_URL_PATTERN.test(trimmed)) {
    return escapeAttr(trimmed);
  }
  // Block javascript:, data:, vbscript:, and any other unknown protocols
  return '#';
}

function escapeAttr(value: string): string {
  return value.replace(/"/g, '&quot;');
}

export function sanitizeHtml(html: string): string {
  let result = html;
  let previous: string;

  // Loop until no more changes occur to handle nested/reconstructed patterns
  // e.g., "<scrip<script>t>" becoming "<script>" after first pass
  do {
    previous = result;
    result = result
      // Remove dangerous tags and their content (script, iframe, etc.)
      .replace(DANGEROUS_TAGS, '')
      // Remove event handler attributes (onclick, onerror, etc.)
      .replace(EVENT_HANDLER_ATTRS, '');
  } while (result !== previous);

  // Sanitize href URLs in anchor tags (single pass is sufficient)
  return result.replace(DANGEROUS_HREF, (_match, before: string, url: string, after: string) => {
    return `<a ${before}href="${sanitizeUrl(url)}"${after}>`;
  });
}
