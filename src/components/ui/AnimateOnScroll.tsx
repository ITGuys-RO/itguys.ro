"use client";

import { useEffect, useRef, ReactNode } from "react";
import { clsx } from "clsx";

type AnimationType =
  | "fade-in"
  | "fade-in-up"
  | "fade-in-down"
  | "slide-in-left"
  | "slide-in-right"
  | "scale-in";

type AnimateOnScrollProps = {
  children: ReactNode;
  animation?: AnimationType;
  delay?: number;
  className?: string;
  threshold?: number;
};

export function AnimateOnScroll({
  children,
  animation = "fade-in-up",
  delay = 0,
  className,
  threshold = 0.1,
}: AnimateOnScrollProps) {
  const ref = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const element = ref.current;
    if (!element) return;

    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            entry.target.classList.add(`animate-${animation}`);
            observer.unobserve(entry.target);
          }
        });
      },
      { threshold, rootMargin: "0px 0px -30px 0px" }
    );

    observer.observe(element);

    return () => observer.disconnect();
  }, [animation, threshold]);

  return (
    <div
      ref={ref}
      data-animate
      className={clsx(className)}
      style={{ animationDelay: `${delay}ms` }}
    >
      {children}
    </div>
  );
}

type StaggerChildrenProps = {
  children: ReactNode[];
  animation?: AnimationType;
  staggerDelay?: number;
  className?: string;
  childClassName?: string;
};

export function StaggerChildren({
  children,
  animation = "fade-in-up",
  staggerDelay = 100,
  className,
  childClassName,
}: StaggerChildrenProps) {
  return (
    <div className={className}>
      {children.map((child, index) => (
        <AnimateOnScroll
          key={index}
          animation={animation}
          delay={index * staggerDelay}
          className={childClassName}
        >
          {child}
        </AnimateOnScroll>
      ))}
    </div>
  );
}
