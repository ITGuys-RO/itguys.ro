import { Link } from "@/i18n/navigation";
import { clsx } from "clsx";

type ButtonProps = {
  children: React.ReactNode;
  href?: string;
  variant?: "primary" | "secondary" | "neon";
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
    "inline-flex items-center justify-center px-6 py-3 text-base font-medium rounded-lg transition-all duration-300 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-brand-950 hover:-translate-y-0.5 active:translate-y-0";

  const variants = {
    primary: clsx(
      "bg-brand-400 text-white border border-brand-400/50 btn-primary",
      "hover:bg-brand-300 hover:border-brand-300/50",
      "hover:shadow-[0_0_20px_rgba(81,116,161,0.4),0_0_40px_rgba(81,116,161,0.2)]",
      "focus:ring-brand-400",
      "dark:bg-brand-400 dark:text-white dark:hover:bg-brand-300"
    ),
    secondary: clsx(
      "bg-transparent text-brand-200 border border-brand-400/30",
      "hover:border-brand-400/60 hover:text-white",
      "hover:shadow-[0_0_15px_rgba(81,116,161,0.3),inset_0_0_10px_rgba(81,116,161,0.1)]",
      "focus:ring-brand-400",
      "dark:text-brand-200 dark:border-brand-400/30 dark:hover:border-brand-400/60"
    ),
    neon: clsx(
      "bg-transparent text-neon border border-neon/50 btn-neon",
      "hover:border-neon hover:bg-neon/10",
      "hover:shadow-[0_0_20px_rgba(0,212,255,0.4),0_0_40px_rgba(0,212,255,0.2),inset_0_0_10px_rgba(0,212,255,0.1)]",
      "focus:ring-neon",
      "animate-pulse-glow"
    ),
  };

  const disabledStyles = "opacity-50 cursor-not-allowed hover:translate-y-0 hover:shadow-none";

  const styles = clsx(
    baseStyles,
    variants[variant],
    disabled && disabledStyles,
    className
  );

  if (href) {
    return (
      <Link href={href} className={styles} onClick={onClick}>
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
