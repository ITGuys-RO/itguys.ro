import { NextRequest, NextResponse } from 'next/server';

interface CloudflareAccessPayload {
  email?: string;
  sub?: string;
  aud?: string[];
  exp?: number;
  iat?: number;
  iss?: string;
  type?: string;
  identity_nonce?: string;
  custom?: Record<string, unknown>;
}

export function getAdminUser(request: NextRequest): CloudflareAccessPayload | null {
  // Cloudflare Access JWT is in the Cf-Access-Jwt-Assertion header
  const jwt = request.headers.get('Cf-Access-Jwt-Assertion');

  // For local development, allow access without authentication
  // You can set ADMIN_DEV_MODE=true in your environment
  if (!jwt) {
    // Check for dev mode - allows local testing without Cloudflare Access
    const isDev = process.env.NODE_ENV === 'development';
    if (isDev) {
      return { email: 'dev@localhost', sub: 'dev' };
    }
    return null;
  }

  try {
    // Decode the JWT payload (we trust Cloudflare Access has already validated it)
    // The JWT format is: header.payload.signature
    const parts = jwt.split('.');
    if (parts.length !== 3) {
      return null;
    }

    const payloadBase64 = parts[1];
    const payload = JSON.parse(
      Buffer.from(payloadBase64, 'base64').toString('utf-8')
    ) as CloudflareAccessPayload;

    // Check if the token has expired
    if (payload.exp && payload.exp * 1000 < Date.now()) {
      return null;
    }

    return payload;
  } catch {
    return null;
  }
}

export function requireAdmin(request: NextRequest): CloudflareAccessPayload {
  const user = getAdminUser(request);
  if (!user) {
    throw new AdminAuthError('Unauthorized');
  }
  return user;
}

export class AdminAuthError extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'AdminAuthError';
  }
}

export function handleApiError(error: unknown): NextResponse {
  if (error instanceof AdminAuthError) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  console.error('API Error:', error);
  const message = error instanceof Error ? error.message : 'Internal server error';
  return NextResponse.json({ error: message }, { status: 500 });
}

// Wrapper to handle authentication and errors for admin API routes
export function withAdmin<T>(
  handler: (request: NextRequest, user: CloudflareAccessPayload) => Promise<T>
): (request: NextRequest) => Promise<NextResponse> {
  return async (request: NextRequest): Promise<NextResponse> => {
    try {
      const user = requireAdmin(request);
      const result = await handler(request, user);
      return NextResponse.json(result);
    } catch (error) {
      return handleApiError(error);
    }
  };
}
