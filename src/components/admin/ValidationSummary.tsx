'use client';

import { XCircleIcon } from '@heroicons/react/20/solid';
import type { ValidationError } from './validation';

interface ValidationSummaryProps {
  errors: ValidationError[];
  title?: string;
}

export function ValidationSummary({ errors, title = 'Please fix the following errors:' }: ValidationSummaryProps) {
  if (errors.length === 0) return null;

  return (
    <div className="rounded-lg border border-red-500/50 bg-red-500/10 p-4 mb-6">
      <div className="flex items-start gap-3">
        <XCircleIcon className="w-5 h-5 text-red-400 flex-shrink-0 mt-0.5" />
        <div>
          <h3 className="text-sm font-medium text-red-400">{title}</h3>
          <ul className="mt-2 space-y-1 text-sm text-red-300">
            {errors.map((error, index) => (
              <li key={index}>• {error.message}</li>
            ))}
          </ul>
        </div>
      </div>
    </div>
  );
}
