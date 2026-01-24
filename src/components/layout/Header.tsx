"use client";

import Link from "next/link";
import Image from "next/image";
import { useState } from "react";
import { Button } from "@/components/ui";
import {
  WrenchScrewdriverIcon,
  BriefcaseIcon,
  UserGroupIcon,
  ChatBubbleLeftRightIcon,
  ShieldCheckIcon,
} from "@heroicons/react/24/outline";

const navigation = [
  { name: "Development", href: "/services", icon: WrenchScrewdriverIcon },
  { name: "Services", href: "/professional-services", icon: ShieldCheckIcon },
  { name: "Portfolio", href: "/portfolio", icon: BriefcaseIcon },
  { name: "About", href: "/about", icon: UserGroupIcon },
];

export function Header() {
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);

  return (
    <header className="fixed top-0 left-0 right-0 z-50 bg-brand-950/80 backdrop-blur-xl border-b border-brand-700/30">
      {/* Neon accent line at bottom */}
      <div className="absolute bottom-0 left-0 right-0 h-px bg-gradient-to-r from-transparent via-brand-400/50 to-transparent" />

      <nav className="max-w-4xl mx-auto px-6 md:px-8">
        <div className="flex items-center justify-between h-16">
          <Link
            href="/"
            className="flex items-center gap-2 text-xl font-bold text-white group"
          >
            {/* Tech frame around logo */}
            <div className="relative">
              <Image
                src="/itguys_logo.png"
                alt="ITGuys"
                width={32}
                height={32}
                className="rounded-full relative z-10 transition-all duration-300 group-hover:shadow-[0_0_15px_rgba(0,212,255,0.4)]"
              />
              <div className="absolute -inset-1 border border-brand-400/20 rounded-full opacity-0 group-hover:opacity-100 transition-opacity" />
            </div>
            <span className="transition-all duration-300 group-hover:text-brand-300">ITGuys</span>
          </Link>

          {/* Desktop navigation */}
          <div className="hidden md:flex items-center gap-6">
            {navigation.map((item) => (
              <Link
                key={item.name}
                href={item.href}
                className="flex items-center gap-1.5 text-sm font-medium text-brand-200 hover:text-neon transition-all duration-300 hover:drop-shadow-[0_0_8px_rgba(0,212,255,0.5)]"
              >
                <item.icon className="w-4 h-4" />
                {item.name}
              </Link>
            ))}
            <Button href="/contact" variant="primary" className="flex items-center gap-1.5">
              <ChatBubbleLeftRightIcon className="w-4 h-4" />
              Contact
            </Button>
          </div>

          {/* Mobile menu button */}
          <button
            type="button"
            className="md:hidden p-2 text-brand-200 hover:text-neon transition-colors"
            onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
            aria-label="Toggle menu"
          >
            {mobileMenuOpen ? (
              <svg
                className="w-6 h-6"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth={2}
                  d="M6 18L18 6M6 6l12 12"
                />
              </svg>
            ) : (
              <svg
                className="w-6 h-6"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth={2}
                  d="M4 6h16M4 12h16M4 18h16"
                />
              </svg>
            )}
          </button>
        </div>

        {/* Mobile navigation */}
        {mobileMenuOpen && (
          <div className="md:hidden py-4 border-t border-brand-700/30">
            <div className="flex flex-col gap-4">
              {navigation.map((item) => (
                <Link
                  key={item.name}
                  href={item.href}
                  className="flex items-center gap-2 text-base font-medium text-brand-200 hover:text-neon transition-all duration-300"
                  onClick={() => setMobileMenuOpen(false)}
                >
                  <item.icon className="w-5 h-5" />
                  {item.name}
                </Link>
              ))}
              <Button href="/contact" variant="primary" className="mt-2 flex items-center gap-2">
                <ChatBubbleLeftRightIcon className="w-5 h-5" />
                Contact
              </Button>
            </div>
          </div>
        )}
      </nav>
    </header>
  );
}
