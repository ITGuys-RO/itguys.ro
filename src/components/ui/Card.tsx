import { clsx } from "clsx";

type CardProps = {
  children: React.ReactNode;
  className?: string;
  glowOnHover?: boolean;
  cornerAccents?: boolean;
};

export function Card({ children, className, glowOnHover = true, cornerAccents = false }: CardProps) {
  return (
    <div
      className={clsx(
        "relative p-6 rounded-xl",
        // Glass morphism base
        "bg-brand-900/60 dark:bg-brand-900/60 backdrop-blur-xl",
        "border border-brand-700/30 dark:border-brand-700/30",
        // Transition
        "transition-all duration-300",
        // Hover effects
        glowOnHover && [
          "hover:border-brand-400/40 dark:hover:border-brand-400/40",
          "hover:shadow-[0_0_30px_rgba(81,116,161,0.15),0_0_60px_rgba(81,116,161,0.05)]",
          "hover:-translate-y-1",
        ],
        className
      )}
    >
      {/* Corner accents for HUD style */}
      {cornerAccents && (
        <>
          <div className="absolute top-0 left-0 w-4 h-4 border-t border-l border-neon/40 rounded-tl-lg" />
          <div className="absolute top-0 right-0 w-4 h-4 border-t border-r border-neon/40 rounded-tr-lg" />
          <div className="absolute bottom-0 left-0 w-4 h-4 border-b border-l border-neon/40 rounded-bl-lg" />
          <div className="absolute bottom-0 right-0 w-4 h-4 border-b border-r border-neon/40 rounded-br-lg" />
        </>
      )}
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
        "text-lg font-semibold text-white mb-2",
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
    <p className={clsx("text-brand-200 dark:text-brand-200", className)}>
      {children}
    </p>
  );
}
