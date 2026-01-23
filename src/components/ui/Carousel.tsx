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

  return (
    <div className={clsx("relative", className)}>
      <div
        className="overflow-hidden"
        ref={emblaRef}
        onMouseEnter={handleMouseEnter}
        onMouseLeave={handleMouseLeave}
      >
        <div className="flex gap-6">
          {children.map((child, index) => (
            <div
              key={index}
              className="flex-[0_0_85%] min-w-0 md:flex-[0_0_calc(50%-12px)]"
            >
              {child}
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}
