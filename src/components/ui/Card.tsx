import { clsx } from "clsx";

type CardProps = {
  children: React.ReactNode;
  className?: string;
};

export function Card({ children, className }: CardProps) {
  return (
    <div
      className={clsx(
        "p-6 rounded-xl bg-white dark:bg-brand-800 border border-brand-200 dark:border-brand-700",
        "shadow-sm shadow-brand-200/50 dark:shadow-brand-950/50",
        "transition-all duration-300 hover:shadow-lg hover:shadow-brand-500/20 hover:border-brand-300 dark:hover:border-brand-600",
        "hover:-translate-y-1",
        className
      )}
    >
      {children}
    </div>
  );
}

type CardTitleProps = {
  children: React.ReactNode;
  className?: string;
};

export function CardTitle({ children, className }: CardTitleProps) {
  return (
    <h3
      className={clsx(
        "text-lg font-semibold text-zinc-900 dark:text-white mb-2",
        className
      )}
    >
      {children}
    </h3>
  );
}

type CardDescriptionProps = {
  children: React.ReactNode;
  className?: string;
};

export function CardDescription({ children, className }: CardDescriptionProps) {
  return (
    <p className={clsx("text-zinc-600 dark:text-zinc-400", className)}>
      {children}
    </p>
  );
}
