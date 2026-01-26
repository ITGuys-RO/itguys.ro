'use client';

import { useState } from 'react';
import { clsx } from 'clsx';
import { locales, localeNames, type Locale } from '@/i18n/config';
import { ExclamationTriangleIcon, CheckCircleIcon } from '@heroicons/react/16/solid';

interface LocaleTabsProps {
  children: (locale: Locale) => React.ReactNode;
  defaultLocale?: Locale;
  className?: string;
  /** Translation status per locale - if provided, shows warning/success indicators */
  translationStatus?: Partial<Record<Locale, boolean>>;
}

export function LocaleTabs({ children, defaultLocale = 'en', className, translationStatus }: LocaleTabsProps) {
  const [activeLocale, setActiveLocale] = useState<Locale>(defaultLocale);

  return (
    <div className={className}>
      <div className="flex border-b border-brand-700/50 mb-4">
        {locales.map((locale) => {
          const isComplete = translationStatus?.[locale];
          const showStatus = translationStatus !== undefined;

          return (
            <button
              key={locale}
              type="button"
              onClick={() => setActiveLocale(locale)}
              className={clsx(
                'px-4 py-2 text-sm font-medium border-b-2 -mb-px transition-colors flex items-center gap-1.5',
                activeLocale === locale
                  ? 'border-brand-400 text-white'
                  : 'border-transparent text-brand-400 hover:text-brand-200'
              )}
              title={showStatus ? (isComplete ? `${localeNames[locale]}: Complete` : `${localeNames[locale]}: Missing translation`) : undefined}
            >
              {localeNames[locale]}
              {showStatus && (
                isComplete ? (
                  <CheckCircleIcon className="w-4 h-4 text-green-400" />
                ) : (
                  <ExclamationTriangleIcon className="w-4 h-4 text-yellow-400" />
                )
              )}
            </button>
          );
        })}
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
  /** Fields that must have values for a translation to be considered complete */
  requiredFields?: string[];
}

export function LocaleFields<T extends Record<string, unknown>>({
  translations,
  onChange,
  renderFields,
  defaultData,
  className,
  requiredFields,
}: LocaleFieldsProps<T>) {
  // Calculate translation status for each locale
  const translationStatus = requiredFields
    ? (Object.fromEntries(
        locales.map((locale) => {
          const data = (translations[locale] ?? {}) as Record<string, unknown>;
          const isComplete = requiredFields.every((field) => {
            const value = data[field];
            return value !== undefined && value !== null && value !== '';
          });
          return [locale, isComplete];
        })
      ) as Record<Locale, boolean>)
    : undefined;

  return (
    <LocaleTabs className={className} translationStatus={translationStatus}>
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
  /** Show compact version with just count badge */
  compact?: boolean;
}

export function LocaleCompletion({ translations, requiredFields, compact }: LocaleCompletionProps) {
  const completionStatus = locales.map((locale) => {
    const data = (translations[locale] ?? {}) as Record<string, unknown>;
    const isComplete = requiredFields.every((field) => {
      const value = data[field];
      return value !== undefined && value !== null && value !== '';
    });
    return { locale, isComplete };
  });

  const completedCount = completionStatus.filter((s) => s.isComplete).length;
  const allComplete = completedCount === locales.length;

  if (compact) {
    return (
      <span
        className={clsx(
          'px-2 py-0.5 rounded text-xs font-medium inline-flex items-center gap-1',
          allComplete
            ? 'bg-green-500/20 text-green-400'
            : 'bg-yellow-500/20 text-yellow-400'
        )}
        title={completionStatus
          .filter((s) => !s.isComplete)
          .map((s) => `Missing: ${localeNames[s.locale]}`)
          .join(', ') || 'All translations complete'}
      >
        {!allComplete && <ExclamationTriangleIcon className="w-3 h-3" />}
        {completedCount}/{locales.length}
      </span>
    );
  }

  return (
    <div className="flex items-center gap-2 text-xs">
      {completionStatus.map(({ locale, isComplete }) => (
        <span
          key={locale}
          className={clsx(
            'px-2 py-0.5 rounded',
            isComplete
              ? 'bg-green-500/20 text-green-400'
              : 'bg-yellow-500/20 text-yellow-400'
          )}
          title={isComplete ? `${localeNames[locale]}: Complete` : `${localeNames[locale]}: Missing translation`}
        >
          {locale.toUpperCase()}
        </span>
      ))}
    </div>
  );
}
