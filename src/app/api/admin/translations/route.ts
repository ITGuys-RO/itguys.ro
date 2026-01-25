import { NextRequest, NextResponse } from 'next/server';
import { requireAdmin, handleApiError } from '@/lib/admin-auth';
import {
  getNamespaces,
  getTranslationsByNamespace,
  getAllTranslationKeys,
  setTranslation,
  setTranslations,
  deleteTranslation,
} from '@/lib/db';
import type { TranslationInput } from '@/lib/db';
import type { Locale } from '@/i18n/config';

export const runtime = 'edge';

export async function GET(request: NextRequest) {
  try {
    requireAdmin(request);

    const { searchParams } = new URL(request.url);
    const namespace = searchParams.get('namespace');

    if (namespace) {
      const translations = await getTranslationsByNamespace(namespace);
      return NextResponse.json(translations);
    }

    // Return all namespaces and keys
    const [namespaces, keys] = await Promise.all([
      getNamespaces(),
      getAllTranslationKeys(),
    ]);

    return NextResponse.json({ namespaces, keys });
  } catch (error) {
    return handleApiError(error);
  }
}

export async function POST(request: NextRequest) {
  try {
    requireAdmin(request);
    const body = await request.json();

    // Support both single and bulk updates
    if (Array.isArray(body)) {
      await setTranslations(body as TranslationInput[]);
    } else {
      const input = body as TranslationInput;
      if (!input.key || !input.namespace || !input.locale || !input.value) {
        return NextResponse.json({ error: 'Missing required fields' }, { status: 400 });
      }
      await setTranslation(input);
    }

    return NextResponse.json({ success: true });
  } catch (error) {
    return handleApiError(error);
  }
}

export async function DELETE(request: NextRequest) {
  try {
    requireAdmin(request);

    const { searchParams } = new URL(request.url);
    const namespace = searchParams.get('namespace');
    const key = searchParams.get('key');
    const locale = searchParams.get('locale') as Locale | null;

    if (!namespace || !key) {
      return NextResponse.json({ error: 'Missing namespace or key' }, { status: 400 });
    }

    await deleteTranslation(namespace, key, locale ?? undefined);
    return NextResponse.json({ success: true });
  } catch (error) {
    return handleApiError(error);
  }
}
