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
      className={clsx("py-16 md:py-24 px-6 md:px-8", className)}
    >
      <div className={clsx("mx-auto", wide ? "w-full" : "max-w-4xl")}>{children}</div>
    </section>
  );
}
