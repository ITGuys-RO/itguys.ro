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
        className="text-sm font-medium text-brand-200"
      >
        {label}
        {required && <span className="text-neon-pink ml-1">*</span>}
      </label>
      <input
        type={type}
        id={name}
        name={name}
        placeholder={placeholder}
        required={required}
        className="px-4 py-3 rounded-lg border border-brand-700/50 bg-brand-900/60 backdrop-blur-sm text-white placeholder:text-brand-400 focus:outline-none focus:ring-2 focus:ring-neon/30 focus:border-neon/50 focus:shadow-[0_0_15px_rgba(0,212,255,0.15)] transition-all duration-300"
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
        className="text-sm font-medium text-brand-200"
      >
        {label}
        {required && <span className="text-neon-pink ml-1">*</span>}
      </label>
      <textarea
        id={name}
        name={name}
        placeholder={placeholder}
        required={required}
        rows={rows}
        className="px-4 py-3 rounded-lg border border-brand-700/50 bg-brand-900/60 backdrop-blur-sm text-white placeholder:text-brand-400 focus:outline-none focus:ring-2 focus:ring-neon/30 focus:border-neon/50 focus:shadow-[0_0_15px_rgba(0,212,255,0.15)] transition-all duration-300 resize-none"
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
        className="text-sm font-medium text-brand-200"
      >
        {label}
        {required && <span className="text-neon-pink ml-1">*</span>}
      </label>
      <select
        id={name}
        name={name}
        required={required}
        className="px-4 py-3 rounded-lg border border-brand-700/50 bg-brand-900/60 backdrop-blur-sm text-white focus:outline-none focus:ring-2 focus:ring-neon/30 focus:border-neon/50 focus:shadow-[0_0_15px_rgba(0,212,255,0.15)] transition-all duration-300"
      >
        <option value="" className="bg-brand-900">Select an option</option>
        {options.map((option) => (
          <option key={option.value} value={option.value} className="bg-brand-900">
            {option.label}
          </option>
        ))}
      </select>
    </div>
  );
}
