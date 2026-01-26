// Validation utilities for admin forms

export type ValidationError = {
  field: string;
  message: string;
};

export type ValidationResult = {
  valid: boolean;
  errors: ValidationError[];
};

// Individual field validators
export const validators = {
  required: (value: unknown, fieldName: string): string | null => {
    if (value === undefined || value === null || value === '') {
      return `${fieldName} is required`;
    }
    if (Array.isArray(value) && value.length === 0) {
      return `${fieldName} is required`;
    }
    return null;
  },

  maxLength: (value: string | null | undefined, max: number, fieldName: string): string | null => {
    if (!value) return null;
    if (value.length > max) {
      return `${fieldName} exceeds ${max} characters (currently ${value.length})`;
    }
    return null;
  },

  minLength: (value: string | null | undefined, min: number, fieldName: string): string | null => {
    if (!value) return null;
    if (value.length < min) {
      return `${fieldName} must be at least ${min} characters`;
    }
    return null;
  },

  slug: (value: string | null | undefined, fieldName: string): string | null => {
    if (!value) return null;
    // Slug should be lowercase, alphanumeric with hyphens only
    const slugRegex = /^[a-z0-9]+(?:-[a-z0-9]+)*$/;
    if (!slugRegex.test(value)) {
      return `${fieldName} must be lowercase letters, numbers, and hyphens only (e.g., "my-post-title")`;
    }
    return null;
  },

  url: (value: string | null | undefined, fieldName: string): string | null => {
    if (!value) return null;
    // Allow relative paths starting with / or full URLs
    if (value.startsWith('/')) return null;
    try {
      new URL(value);
      return null;
    } catch {
      return `${fieldName} must be a valid URL or path starting with /`;
    }
  },

  email: (value: string | null | undefined, fieldName: string): string | null => {
    if (!value) return null;
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(value)) {
      return `${fieldName} must be a valid email address`;
    }
    return null;
  },

  imagePath: (value: string | null | undefined, fieldName: string): string | null => {
    if (!value) return null;
    // Should be a path starting with / or a full URL
    if (value.startsWith('/') || value.startsWith('http://') || value.startsWith('https://')) {
      return null;
    }
    return `${fieldName} must be a path starting with / or a full URL`;
  },
};

// Helper to run multiple validations and collect errors
export function validate(validations: Array<() => string | null>): ValidationResult {
  const errors: ValidationError[] = [];

  for (const validation of validations) {
    const error = validation();
    if (error) {
      // Extract field name from error message (first word before " is" or " must" or " exceeds")
      const match = error.match(/^(.+?)(?:\s+(?:is|must|exceeds|cannot))/);
      const field = match ? match[1].toLowerCase().replace(/\s+/g, '_') : 'unknown';
      errors.push({ field, message: error });
    }
  }

  return {
    valid: errors.length === 0,
    errors,
  };
}

// Helper to create a validation function for a field
export function createFieldValidator(
  fieldName: string,
  value: unknown,
  rules: {
    required?: boolean;
    maxLength?: number;
    minLength?: number;
    slug?: boolean;
    url?: boolean;
    email?: boolean;
    imagePath?: boolean;
  }
): Array<() => string | null> {
  const validations: Array<() => string | null> = [];

  if (rules.required) {
    validations.push(() => validators.required(value, fieldName));
  }

  if (rules.maxLength !== undefined) {
    validations.push(() => validators.maxLength(value as string, rules.maxLength!, fieldName));
  }

  if (rules.minLength !== undefined) {
    validations.push(() => validators.minLength(value as string, rules.minLength!, fieldName));
  }

  if (rules.slug) {
    validations.push(() => validators.slug(value as string, fieldName));
  }

  if (rules.url) {
    validations.push(() => validators.url(value as string, fieldName));
  }

  if (rules.email) {
    validations.push(() => validators.email(value as string, fieldName));
  }

  if (rules.imagePath) {
    validations.push(() => validators.imagePath(value as string, fieldName));
  }

  return validations;
}
