"use client";

import { ReactNode, useCallback } from "react";
import useEmblaCarousel from "embla-carousel-react";
import AutoScroll from "embla-carousel-auto-scroll";
import { clsx } from "clsx";

type CarouselProps = {
  children: ReactNode[];
  className?: string;
};

export function Carousel({ children, className }: CarouselProps) {
  const [emblaRef, emblaApi] = useEmblaCarousel(
    {
      align: "start",
      loop: true,
      dragFree: true,
    },
    [
      AutoScroll({
        speed: 0.8,
        stopOnInteraction: false,
        stopOnMouseEnter: true,
      }),
    ]
  );

  const handleMouseEnter = useCallback(() => {
    const autoScroll = emblaApi?.plugins()?.autoScroll;
    if (autoScroll) autoScroll.stop();
  }, [emblaApi]);

  const handleMouseLeave = useCallback(() => {
    const autoScroll = emblaApi?.plugins()?.autoScroll;
    if (autoScroll) autoScroll.play();
  }, [emblaApi]);

  const scrollPrev = useCallback(() => {
    if (!emblaApi) return;
    const autoScroll = emblaApi.plugins()?.autoScroll;
    if (autoScroll) autoScroll.stop();
    emblaApi.scrollPrev();
  }, [emblaApi]);

  const scrollNext = useCallback(() => {
    if (!emblaApi) return;
    const autoScroll = emblaApi.plugins()?.autoScroll;
    if (autoScroll) autoScroll.stop();
    emblaApi.scrollNext();
  }, [emblaApi]);

  return (
    <div className={clsx("relative group", className)}>
      <div
        className="overflow-hidden py-2 -my-2"
        ref={emblaRef}
        onMouseEnter={handleMouseEnter}
        onMouseLeave={handleMouseLeave}
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
        className="absolute left-2 top-1/2 -translate-y-1/2 z-10 w-10 h-10 rounded-full bg-white/90 dark:bg-gray-800/90 shadow-lg flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity hover:bg-white dark:hover:bg-gray-800"
        aria-label="Previous slide"
      >
        <svg
          className="w-5 h-5 text-gray-700 dark:text-gray-200"
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
        className="absolute right-2 top-1/2 -translate-y-1/2 z-10 w-10 h-10 rounded-full bg-white/90 dark:bg-gray-800/90 shadow-lg flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity hover:bg-white dark:hover:bg-gray-800"
        aria-label="Next slide"
      >
        <svg
          className="w-5 h-5 text-gray-700 dark:text-gray-200"
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
    </div>
  );
}
