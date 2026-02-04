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
  // Use placeholder replacement to prevent pattern reconstruction
  // e.g., "<scr<script>ipt>" won't become "<script>" because inner match
  // is replaced with a marker that breaks the outer pattern
  const PLACEHOLDER = '\u0000';
  let result = html;
  let previous: string;

  do {
    previous = result;
    // Replace dangerous tags with null character (breaks reconstruction)
    result = result.replace(DANGEROUS_TAGS, PLACEHOLDER);
    // Remove event handler attributes
    result = result.replace(EVENT_HANDLER_ATTRS, PLACEHOLDER);
  } while (result !== previous);

  // Remove all placeholders
  result = result.split(PLACEHOLDER).join('');

  // Sanitize href URLs in anchor tags
  return result.replace(DANGEROUS_HREF, (_match, before: string, url: string, after: string) => {
    return `<a ${before}href="${sanitizeUrl(url)}"${after}>`;
  });
}
