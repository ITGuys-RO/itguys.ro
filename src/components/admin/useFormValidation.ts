'use client';

import { useState, useCallback } from 'react';
import { validate, validators, type ValidationError, type ValidationResult } from './validation';

export type FieldRules = {
  required?: boolean;
  maxLength?: number;
  minLength?: number;
  slug?: boolean;
  url?: boolean;
  email?: boolean;
  imagePath?: boolean;
};

export type ValidationSchema<T> = {
  [K in keyof T]?: FieldRules | ((value: T[K], formData: T) => string | null);
};

export function useFormValidation<T extends Record<string, unknown>>(
  schema: ValidationSchema<T>
) {
  const [errors, setErrors] = useState<ValidationError[]>([]);
  const [fieldErrors, setFieldErrors] = useState<Record<string, string>>({});

  const validateForm = useCallback((formData: T): ValidationResult => {
    const validationFns: Array<() => string | null> = [];

    for (const [fieldName, rules] of Object.entries(schema)) {
      const value = formData[fieldName as keyof T];
      const displayName = fieldName
        .replace(/_/g, ' ')
        .replace(/([A-Z])/g, ' $1')
        .replace(/^./, (s) => s.toUpperCase())
        .trim();

      if (typeof rules === 'function') {
        // Custom validation function
        validationFns.push(() => rules(value as T[keyof T], formData));
      } else if (rules) {
        // Standard rules
        if (rules.required) {
          validationFns.push(() => validators.required(value, displayName));
        }
        if (rules.maxLength !== undefined && typeof value === 'string') {
          validationFns.push(() => validators.maxLength(value, rules.maxLength!, displayName));
        }
        if (rules.minLength !== undefined && typeof value === 'string') {
          validationFns.push(() => validators.minLength(value, rules.minLength!, displayName));
        }
        if (rules.slug && typeof value === 'string') {
          validationFns.push(() => validators.slug(value, displayName));
        }
        if (rules.url && typeof value === 'string') {
          validationFns.push(() => validators.url(value, displayName));
        }
        if (rules.email && typeof value === 'string') {
          validationFns.push(() => validators.email(value, displayName));
        }
        if (rules.imagePath && typeof value === 'string') {
          validationFns.push(() => validators.imagePath(value, displayName));
        }
      }
    }

    const result = validate(validationFns);
    setErrors(result.errors);

    // Build field-level error map
    const fieldErrs: Record<string, string> = {};
    for (const err of result.errors) {
      if (!fieldErrs[err.field]) {
        fieldErrs[err.field] = err.message;
      }
    }
    setFieldErrors(fieldErrs);

    return result;
  }, [schema]);

  const clearErrors = useCallback(() => {
    setErrors([]);
    setFieldErrors({});
  }, []);

  const getFieldError = useCallback((field: string): string | undefined => {
    return fieldErrors[field.toLowerCase().replace(/\s+/g, '_')];
  }, [fieldErrors]);

  return {
    errors,
    fieldErrors,
    validateForm,
    clearErrors,
    getFieldError,
    isValid: errors.length === 0,
  };
}

// Helper to validate translations
export function validateTranslations<T extends Record<string, unknown>>(
  translations: Partial<Record<string, T>>,
  requiredLocale: string,
  requiredFields: (keyof T)[],
  fieldLabels?: Partial<Record<keyof T, string>>
): string | null {
  const localeData = translations[requiredLocale];
  if (!localeData) {
    return `${requiredLocale.toUpperCase()} translation is required`;
  }

  for (const field of requiredFields) {
    const value = localeData[field];
    if (value === undefined || value === null || value === '') {
      const label = fieldLabels?.[field] || String(field).replace(/_/g, ' ');
      return `${label} (${requiredLocale.toUpperCase()}) is required`;
    }
  }

  return null;
}
