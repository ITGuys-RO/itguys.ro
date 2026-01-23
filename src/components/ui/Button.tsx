import Link from "next/link";
import { clsx } from "clsx";

type ButtonProps = {
  children: React.ReactNode;
  href?: string;
  variant?: "primary" | "secondary";
  type?: "button" | "submit";
  disabled?: boolean;
  className?: string;
  onClick?: () => void;
};

export function Button({
  children,
  href,
  variant = "primary",
  type = "button",
  disabled = false,
  className,
  onClick,
}: ButtonProps) {
  const baseStyles =
    "inline-flex items-center justify-center px-6 py-3 text-base font-medium rounded-lg transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-offset-2 hover:-translate-y-0.5 hover:shadow-lg active:translate-y-0 active:shadow-md";

  const variants = {
    primary:
      "bg-brand-500 text-white hover:bg-brand-600 focus:ring-brand-500 dark:bg-brand-400 dark:text-brand-950 dark:hover:bg-brand-300",
    secondary:
      "bg-transparent text-zinc-900 border border-brand-300 hover:bg-brand-50 focus:ring-brand-500 dark:text-white dark:border-brand-600 dark:hover:bg-brand-900",
  };

  const disabledStyles = "opacity-50 cursor-not-allowed";

  const styles = clsx(
    baseStyles,
    variants[variant],
    disabled && disabledStyles,
    className
  );

  if (href) {
    return (
      <Link href={href} className={styles}>
        {children}
      </Link>
    );
  }

  return (
    <button
      type={type}
      disabled={disabled}
      onClick={onClick}
      className={styles}
    >
      {children}
    </button>
  );
}
