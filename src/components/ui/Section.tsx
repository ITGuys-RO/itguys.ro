import { clsx } from "clsx";

type SectionProps = {
  children: React.ReactNode;
  className?: string;
  id?: string;
  wide?: boolean;
};

export function Section({ children, className, id, wide = false }: SectionProps) {
  return (
    <section
      id={id}
      className={clsx("py-10 md:py-14", className)}
    >
      <div className={clsx("mx-auto px-6 md:px-8", wide ? "w-full" : "max-w-6xl")}>{children}</div>
    </section>
  );
}
