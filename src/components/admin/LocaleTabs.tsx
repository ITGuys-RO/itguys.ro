'use client';

import { useState } from 'react';
import { clsx } from 'clsx';
import { locales, localeNames, type Locale } from '@/i18n/config';

interface LocaleTabsProps {
  children: (locale: Locale) => React.ReactNode;
  defaultLocale?: Locale;
  className?: string;
}

export function LocaleTabs({ children, defaultLocale = 'en', className }: LocaleTabsProps) {
  const [activeLocale, setActiveLocale] = useState<Locale>(defaultLocale);

  return (
    <div className={className}>
      <div className="flex border-b border-brand-700/50 mb-4">
        {locales.map((locale) => (
          <button
            key={locale}
            type="button"
            onClick={() => setActiveLocale(locale)}
            className={clsx(
              'px-4 py-2 text-sm font-medium border-b-2 -mb-px transition-colors',
              activeLocale === locale
                ? 'border-brand-400 text-white'
                : 'border-transparent text-brand-400 hover:text-brand-200'
            )}
          >
            {localeNames[locale]}
          </button>
        ))}
      </div>
      <div className="mt-4">{children(activeLocale)}</div>
    </div>
  );
}

interface LocaleFieldsProps<T extends Record<string, unknown>> {
  translations: Partial<Record<Locale, T>>;
  onChange: (locale: Locale, data: T) => void;
  renderFields: (locale: Locale, data: T, onChange: (data: T) => void) => React.ReactNode;
  defaultData: T;
  className?: string;
}

export function LocaleFields<T extends Record<string, unknown>>({
  translations,
  onChange,
  renderFields,
  defaultData,
  className,
}: LocaleFieldsProps<T>) {
  return (
    <LocaleTabs className={className}>
      {(locale) => {
        const data = translations[locale] ?? defaultData;
        return renderFields(locale, data as T, (newData) => onChange(locale, newData));
      }}
    </LocaleTabs>
  );
}

// Helper component for showing completion status
interface LocaleCompletionProps {
  translations: Partial<Record<Locale, unknown>>;
  requiredFields: string[];
}

export function LocaleCompletion({ translations, requiredFields }: LocaleCompletionProps) {
  return (
    <div className="flex items-center gap-2 text-xs">
      {locales.map((locale) => {
        const data = (translations[locale] ?? {}) as Record<string, unknown>;
        const isComplete = requiredFields.every((field) => {
          const value = data[field];
          return value !== undefined && value !== null && value !== '';
        });

        return (
          <span
            key={locale}
            className={clsx(
              'px-2 py-0.5 rounded',
              isComplete
                ? 'bg-green-500/20 text-green-400'
                : 'bg-yellow-500/20 text-yellow-400'
            )}
            title={isComplete ? `${localeNames[locale]}: Complete` : `${localeNames[locale]}: Incomplete`}
          >
            {locale.toUpperCase()}
          </span>
        );
      })}
    </div>
  );
}
