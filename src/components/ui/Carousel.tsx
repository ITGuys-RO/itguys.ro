"use client";

import { ReactNode, useCallback, useEffect, useState } from "react";
import useEmblaCarousel from "embla-carousel-react";
import { clsx } from "clsx";

type CarouselProps = {
  children: ReactNode[];
  className?: string;
};

export function Carousel({ children, className }: CarouselProps) {
  const [emblaRef, emblaApi] = useEmblaCarousel({
    align: "start",
    loop: false,
    dragFree: true,
  });

  const scrollPrev = useCallback(() => {
    emblaApi?.scrollPrev();
  }, [emblaApi]);

  const scrollNext = useCallback(() => {
    emblaApi?.scrollNext();
  }, [emblaApi]);

  const [selectedIndex, setSelectedIndex] = useState(0);
  const [scrollSnaps, setScrollSnaps] = useState<number[]>([]);

  useEffect(() => {
    if (!emblaApi) return;
    // Sync state from external embla carousel API
    const syncState = () => {
      setScrollSnaps(emblaApi.scrollSnapList());
      setSelectedIndex(emblaApi.selectedScrollSnap());
    };
    syncState();
    emblaApi.on("reInit", syncState);
    emblaApi.on("select", syncState);
    return () => {
      emblaApi.off("reInit", syncState);
      emblaApi.off("select", syncState);
    };
  }, [emblaApi]);

  return (
    <div className={clsx("relative group", className)}>
      <div
        className="overflow-hidden py-2 -my-2"
        ref={emblaRef}
      >
        <div className="flex ml-[-1.5rem]">
          {children.map((child, index) => (
            <div
              key={index}
              className="flex-[0_0_85%] min-w-0 md:flex-[0_0_calc(50%-12px)] pl-6"
            >
              {child}
            </div>
          ))}
        </div>
      </div>

      {/* Previous Arrow */}
      <button
        onClick={scrollPrev}
        className="carousel-nav-btn absolute left-2 top-1/2 -translate-y-1/2 z-10 w-10 h-10 rounded-full bg-brand-800/90 shadow-lg flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity hover:bg-brand-800 border border-brand-700/30"
        aria-label="Previous slide"
      >
        <svg
          className="w-5 h-5 text-brand-200"
          fill="none"
          stroke="currentColor"
          viewBox="0 0 24 24"
        >
          <path
            strokeLinecap="round"
            strokeLinejoin="round"
            strokeWidth={2}
            d="M15 19l-7-7 7-7"
          />
        </svg>
      </button>

      {/* Next Arrow */}
      <button
        onClick={scrollNext}
        className="carousel-nav-btn absolute right-2 top-1/2 -translate-y-1/2 z-10 w-10 h-10 rounded-full bg-brand-800/90 shadow-lg flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity hover:bg-brand-800 border border-brand-700/30"
        aria-label="Next slide"
      >
        <svg
          className="w-5 h-5 text-brand-200"
          fill="none"
          stroke="currentColor"
          viewBox="0 0 24 24"
        >
          <path
            strokeLinecap="round"
            strokeLinejoin="round"
            strokeWidth={2}
            d="M9 5l7 7-7 7"
          />
        </svg>
      </button>

      {/* Dot Indicators */}
      <div className="flex justify-center gap-2 mt-4">
        {scrollSnaps.map((_, index) => (
          <button
            key={index}
            onClick={() => emblaApi?.scrollTo(index)}
            className={clsx(
              "w-2.5 h-2.5 rounded-full transition-colors",
              index === selectedIndex
                ? "bg-brand-500"
                : "bg-brand-700/40 hover:bg-brand-700/70"
            )}
            aria-label={`Go to slide ${index + 1}`}
          />
        ))}
      </div>
    </div>
  );
}
