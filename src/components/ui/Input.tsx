import { clsx } from "clsx";

type InputProps = {
  label: string;
  name: string;
  type?: "text" | "email" | "tel";
  placeholder?: string;
  required?: boolean;
  className?: string;
};

export function Input({
  label,
  name,
  type = "text",
  placeholder,
  required = false,
  className,
}: InputProps) {
  return (
    <div className={clsx("flex flex-col gap-2", className)}>
      <label
        htmlFor={name}
        className="text-sm font-medium text-zinc-700 dark:text-zinc-300"
      >
        {label}
        {required && <span className="text-red-500 ml-1">*</span>}
      </label>
      <input
        type={type}
        id={name}
        name={name}
        placeholder={placeholder}
        required={required}
        className="px-4 py-3 rounded-lg border border-brand-300 dark:border-brand-700 bg-white dark:bg-brand-800 text-zinc-900 dark:text-white placeholder:text-zinc-400 focus:outline-none focus:ring-2 focus:ring-brand-500 dark:focus:ring-brand-400 focus:border-brand-500 dark:focus:border-brand-400 transition-colors"
      />
    </div>
  );
}

type TextareaProps = {
  label: string;
  name: string;
  placeholder?: string;
  required?: boolean;
  rows?: number;
  className?: string;
};

export function Textarea({
  label,
  name,
  placeholder,
  required = false,
  rows = 4,
  className,
}: TextareaProps) {
  return (
    <div className={clsx("flex flex-col gap-2", className)}>
      <label
        htmlFor={name}
        className="text-sm font-medium text-zinc-700 dark:text-zinc-300"
      >
        {label}
        {required && <span className="text-red-500 ml-1">*</span>}
      </label>
      <textarea
        id={name}
        name={name}
        placeholder={placeholder}
        required={required}
        rows={rows}
        className="px-4 py-3 rounded-lg border border-brand-300 dark:border-brand-700 bg-white dark:bg-brand-800 text-zinc-900 dark:text-white placeholder:text-zinc-400 focus:outline-none focus:ring-2 focus:ring-brand-500 dark:focus:ring-brand-400 focus:border-brand-500 dark:focus:border-brand-400 transition-colors resize-none"
      />
    </div>
  );
}

type SelectProps = {
  label: string;
  name: string;
  options: { value: string; label: string }[];
  required?: boolean;
  className?: string;
};

export function Select({
  label,
  name,
  options,
  required = false,
  className,
}: SelectProps) {
  return (
    <div className={clsx("flex flex-col gap-2", className)}>
      <label
        htmlFor={name}
        className="text-sm font-medium text-zinc-700 dark:text-zinc-300"
      >
        {label}
        {required && <span className="text-red-500 ml-1">*</span>}
      </label>
      <select
        id={name}
        name={name}
        required={required}
        className="px-4 py-3 rounded-lg border border-brand-300 dark:border-brand-700 bg-white dark:bg-brand-800 text-zinc-900 dark:text-white focus:outline-none focus:ring-2 focus:ring-brand-500 dark:focus:ring-brand-400 focus:border-brand-500 dark:focus:border-brand-400 transition-colors"
      >
        <option value="">Select an option</option>
        {options.map((option) => (
          <option key={option.value} value={option.value}>
            {option.label}
          </option>
        ))}
      </select>
    </div>
  );
}
