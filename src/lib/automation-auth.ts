import { NextRequest } from 'next/server';

// Cloudflare Workers extends SubtleCrypto with timingSafeEqual
type CfSubtleCrypto = SubtleCrypto & {
  timingSafeEqual(a: ArrayBuffer | ArrayBufferView, b: ArrayBuffer | ArrayBufferView): boolean;
};

/**
 * Validate automation API key using constant-time comparison
 * to prevent timing side-channel attacks.
 * Reads the expected key from Cloudflare env bindings.
 */
export async function validateAutomationKey(request: NextRequest): Promise<boolean> {
  const authHeader = request.headers.get('Authorization');
  if (!authHeader?.startsWith('Bearer ')) return false;

  const { getCloudflareContext } = await import('@opennextjs/cloudflare');
  const { env } = await getCloudflareContext({ async: true });
  const expectedKey = (env as Record<string, unknown>).AUTOMATION_API_KEY as string | undefined;
  if (!expectedKey) return false;

  const providedKey = authHeader.slice(7);

  const encoder = new TextEncoder();
  const a = encoder.encode(providedKey);
  const b = encoder.encode(expectedKey);
  const subtle = crypto.subtle as CfSubtleCrypto;

  if (a.byteLength !== b.byteLength) {
    // Compare against dummy to maintain constant time
    const dummy = encoder.encode('x'.repeat(a.byteLength));
    try { subtle.timingSafeEqual(a, dummy); } catch { /* ignore */ }
    return false;
  }

  return subtle.timingSafeEqual(a, b);
}
