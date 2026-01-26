'use client';

import { clsx } from 'clsx';

interface InputFieldProps {
  label: string;
  name: string;
  type?: 'text' | 'email' | 'url' | 'number';
  value: string | number;
  onChange: (value: string) => void;
  placeholder?: string;
  required?: boolean;
  disabled?: boolean;
  className?: string;
  helpText?: string;
  /** Maximum character limit - shows countdown when set */
  maxLength?: number;
  /** Validation error message */
  error?: string | null;
}

export function InputField({
  label,
  name,
  type = 'text',
  value,
  onChange,
  placeholder,
  required = false,
  disabled = false,
  className,
  helpText,
  maxLength,
  error,
}: InputFieldProps) {
  const stringValue = String(value);
  const charCount = stringValue.length;
  const isOverLimit = maxLength !== undefined && charCount > maxLength;
  const hasError = !!error || isOverLimit;

  return (
    <div className={clsx('flex flex-col gap-1.5', className)}>
      <div className="flex items-center justify-between">
        <label htmlFor={name} className="text-sm font-medium text-brand-200">
          {label}
          {required && <span className="text-neon-pink ml-1">*</span>}
        </label>
        {maxLength !== undefined && (
          <span className={clsx(
            'text-xs font-medium',
            isOverLimit ? 'text-red-400' : charCount > maxLength * 0.9 ? 'text-yellow-400' : 'text-brand-400'
          )}>
            {charCount}/{maxLength}
          </span>
        )}
      </div>
      <input
        type={type}
        id={name}
        name={name}
        value={value}
        onChange={(e) => onChange(e.target.value)}
        placeholder={placeholder}
        required={required}
        disabled={disabled}
        className={clsx(
          'px-4 py-2.5 rounded-lg border bg-brand-900/60 backdrop-blur-sm text-white placeholder:text-brand-500',
          'focus:outline-none focus:ring-2 transition-all duration-200',
          hasError
            ? 'border-red-500 focus:ring-red-500/30 focus:border-red-500'
            : 'focus:ring-brand-400/30 focus:border-brand-400/50',
          disabled ? 'opacity-50 cursor-not-allowed border-brand-700/30' : !hasError && 'border-brand-700/50'
        )}
      />
      {error && <p className="text-xs text-red-400">{error}</p>}
      {!error && helpText && <p className="text-xs text-brand-400">{helpText}</p>}
    </div>
  );
}

interface TextareaFieldProps {
  label: string;
  name: string;
  value: string;
  onChange: (value: string) => void;
  placeholder?: string;
  required?: boolean;
  disabled?: boolean;
  rows?: number;
  className?: string;
  helpText?: string;
  /** Maximum character limit - shows countdown when set */
  maxLength?: number;
  /** Validation error message */
  error?: string | null;
}

export function TextareaField({
  label,
  name,
  value,
  onChange,
  placeholder,
  required = false,
  disabled = false,
  rows = 4,
  className,
  helpText,
  maxLength,
  error,
}: TextareaFieldProps) {
  const charCount = value.length;
  const isOverLimit = maxLength !== undefined && charCount > maxLength;
  const hasError = !!error || isOverLimit;

  return (
    <div className={clsx('flex flex-col gap-1.5', className)}>
      <div className="flex items-center justify-between">
        <label htmlFor={name} className="text-sm font-medium text-brand-200">
          {label}
          {required && <span className="text-neon-pink ml-1">*</span>}
        </label>
        {maxLength !== undefined && (
          <span className={clsx(
            'text-xs font-medium',
            isOverLimit ? 'text-red-400' : charCount > maxLength * 0.9 ? 'text-yellow-400' : 'text-brand-400'
          )}>
            {charCount}/{maxLength}
          </span>
        )}
      </div>
      <textarea
        id={name}
        name={name}
        value={value}
        onChange={(e) => onChange(e.target.value)}
        placeholder={placeholder}
        required={required}
        disabled={disabled}
        rows={rows}
        className={clsx(
          'px-4 py-2.5 rounded-lg border bg-brand-900/60 backdrop-blur-sm text-white placeholder:text-brand-500',
          'focus:outline-none focus:ring-2 transition-all duration-200 resize-none',
          hasError
            ? 'border-red-500 focus:ring-red-500/30 focus:border-red-500'
            : 'focus:ring-brand-400/30 focus:border-brand-400/50',
          disabled ? 'opacity-50 cursor-not-allowed border-brand-700/30' : !hasError && 'border-brand-700/50'
        )}
      />
      {error && <p className="text-xs text-red-400">{error}</p>}
      {!error && helpText && <p className="text-xs text-brand-400">{helpText}</p>}
    </div>
  );
}

interface SelectFieldProps {
  label: string;
  name: string;
  value: string;
  onChange: (value: string) => void;
  options: Array<{ value: string; label: string }>;
  placeholder?: string;
  required?: boolean;
  disabled?: boolean;
  className?: string;
}

export function SelectField({
  label,
  name,
  value,
  onChange,
  options,
  placeholder = 'Select...',
  required = false,
  disabled = false,
  className,
}: SelectFieldProps) {
  return (
    <div className={clsx('flex flex-col gap-1.5', className)}>
      <label htmlFor={name} className="text-sm font-medium text-brand-200">
        {label}
        {required && <span className="text-neon-pink ml-1">*</span>}
      </label>
      <select
        id={name}
        name={name}
        value={value}
        onChange={(e) => onChange(e.target.value)}
        required={required}
        disabled={disabled}
        className={clsx(
          'px-4 py-2.5 rounded-lg border bg-brand-900/60 backdrop-blur-sm text-white',
          'focus:outline-none focus:ring-2 focus:ring-brand-400/30 focus:border-brand-400/50',
          'transition-all duration-200',
          disabled ? 'opacity-50 cursor-not-allowed border-brand-700/30' : 'border-brand-700/50'
        )}
      >
        <option value="" className="bg-brand-900">
          {placeholder}
        </option>
        {options.map((opt) => (
          <option key={opt.value} value={opt.value} className="bg-brand-900">
            {opt.label}
          </option>
        ))}
      </select>
    </div>
  );
}

interface CheckboxFieldProps {
  label: string;
  name: string;
  checked: boolean;
  onChange: (checked: boolean) => void;
  disabled?: boolean;
  className?: string;
  description?: string;
}

export function CheckboxField({
  label,
  name,
  checked,
  onChange,
  disabled = false,
  className,
  description,
}: CheckboxFieldProps) {
  return (
    <div className={clsx('flex items-start gap-3', className)}>
      <input
        type="checkbox"
        id={name}
        name={name}
        checked={checked}
        onChange={(e) => onChange(e.target.checked)}
        disabled={disabled}
        className={clsx(
          'mt-1 w-4 h-4 rounded border-brand-700/50 bg-brand-900/60 text-brand-400',
          'focus:ring-brand-400/30 focus:ring-2 focus:ring-offset-0',
          disabled && 'opacity-50 cursor-not-allowed'
        )}
      />
      <div>
        <label htmlFor={name} className="text-sm font-medium text-brand-200 cursor-pointer">
          {label}
        </label>
        {description && <p className="text-xs text-brand-400 mt-0.5">{description}</p>}
      </div>
    </div>
  );
}

interface DateTimeFieldProps {
  label: string;
  name: string;
  value: string | null;
  onChange: (value: string | null) => void;
  required?: boolean;
  disabled?: boolean;
  className?: string;
  helpText?: string;
}

export function DateTimeField({
  label,
  name,
  value,
  onChange,
  required = false,
  disabled = false,
  className,
  helpText,
}: DateTimeFieldProps) {
  // Convert ISO string to datetime-local format (YYYY-MM-DDTHH:MM)
  const toDateTimeLocal = (isoString: string | null): string => {
    if (!isoString) return '';
    // Handle both date-only (YYYY-MM-DD) and full ISO strings
    if (isoString.length === 10) {
      return `${isoString}T12:00`; // Default to noon if only date provided
    }
    const date = new Date(isoString);
    if (isNaN(date.getTime())) return '';
    // Format as YYYY-MM-DDTHH:MM in local timezone
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    const hours = String(date.getHours()).padStart(2, '0');
    const minutes = String(date.getMinutes()).padStart(2, '0');
    return `${year}-${month}-${day}T${hours}:${minutes}`;
  };

  // Convert datetime-local format back to ISO string
  const fromDateTimeLocal = (dateTimeLocal: string): string | null => {
    if (!dateTimeLocal) return null;
    const date = new Date(dateTimeLocal);
    if (isNaN(date.getTime())) return null;
    return date.toISOString();
  };

  return (
    <div className={clsx('flex flex-col gap-1.5', className)}>
      <label htmlFor={name} className="text-sm font-medium text-brand-200">
        {label}
        {required && <span className="text-neon-pink ml-1">*</span>}
      </label>
      <input
        type="datetime-local"
        id={name}
        name={name}
        value={toDateTimeLocal(value)}
        onChange={(e) => onChange(fromDateTimeLocal(e.target.value))}
        required={required}
        disabled={disabled}
        className={clsx(
          'px-4 py-2.5 rounded-lg border bg-brand-900/60 backdrop-blur-sm text-white',
          'focus:outline-none focus:ring-2 focus:ring-brand-400/30 focus:border-brand-400/50',
          'transition-all duration-200',
          '[color-scheme:dark]', // Ensures dark theme for the calendar picker
          disabled ? 'opacity-50 cursor-not-allowed border-brand-700/30' : 'border-brand-700/50'
        )}
      />
      {helpText && <p className="text-xs text-brand-400">{helpText}</p>}
    </div>
  );
}

interface TagInputProps {
  label: string;
  value: string[];
  onChange: (value: string[]) => void;
  placeholder?: string;
  className?: string;
}

export function TagInput({ label, value, onChange, placeholder = 'Add tag...', className }: TagInputProps) {
  const handleKeyDown = (e: React.KeyboardEvent<HTMLInputElement>) => {
    if (e.key === 'Enter' || e.key === ',') {
      e.preventDefault();
      const input = e.currentTarget;
      const tag = input.value.trim();
      if (tag && !value.includes(tag)) {
        onChange([...value, tag]);
        input.value = '';
      }
    }
  };

  const removeTag = (tagToRemove: string) => {
    onChange(value.filter((t) => t !== tagToRemove));
  };

  return (
    <div className={clsx('flex flex-col gap-1.5', className)}>
      <label className="text-sm font-medium text-brand-200">{label}</label>
      <div className="flex flex-wrap gap-2 p-3 rounded-lg border border-brand-700/50 bg-brand-900/60 min-h-[42px]">
        {value.map((tag) => (
          <span
            key={tag}
            className="inline-flex items-center gap-1 px-2 py-1 bg-brand-700/50 text-brand-200 text-xs rounded"
          >
            {tag}
            <button
              type="button"
              onClick={() => removeTag(tag)}
              className="text-brand-400 hover:text-white"
            >
              <svg className="w-3 h-3" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
              </svg>
            </button>
          </span>
        ))}
        <input
          type="text"
          placeholder={value.length === 0 ? placeholder : ''}
          onKeyDown={handleKeyDown}
          className="flex-1 min-w-[100px] bg-transparent text-white text-sm placeholder:text-brand-500 focus:outline-none"
        />
      </div>
      <p className="text-xs text-brand-400">Press Enter or comma to add</p>
    </div>
  );
}
