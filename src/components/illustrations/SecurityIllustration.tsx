export function SecurityIllustration({ className = "" }: { className?: string }) {
  return (
    <svg
      viewBox="0 0 400 400"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      className={className}
    >
      {/* Shield base */}
      <path
        d="M200 50 L320 100 L320 220 C320 300 200 360 200 360 C200 360 80 300 80 220 L80 100 L200 50Z"
        className="fill-brand-500 dark:fill-brand-400"
      />
      <path
        d="M200 70 L300 112 L300 215 C300 280 200 330 200 330 C200 330 100 280 100 215 L100 112 L200 70Z"
        className="fill-brand-400 dark:fill-brand-500"
      />

      {/* Lock icon on shield */}
      <rect
        x="165"
        y="170"
        width="70"
        height="60"
        rx="8"
        className="fill-white dark:fill-zinc-900"
      />
      <path
        d="M180 170 L180 150 C180 130 220 130 220 150 L220 170"
        stroke="white"
        strokeWidth="12"
        fill="none"
        className="stroke-white dark:stroke-zinc-900"
      />
      <circle cx="200" cy="200" r="8" className="fill-brand-500 dark:fill-brand-400" />
      <rect x="197" y="200" width="6" height="15" rx="2" className="fill-brand-500 dark:fill-brand-400" />

      {/* Floating security elements */}
      <g transform="translate(300, 80)">
        <rect width="60" height="60" rx="12" className="fill-brand-200/80 dark:fill-brand-800/80" />
        <path d="M20 30 L25 35 L40 20" stroke="currentColor" strokeWidth="4" strokeLinecap="round" className="text-brand-600 dark:text-brand-300" fill="none" />
      </g>

      <g transform="translate(40, 260)">
        <rect width="50" height="50" rx="10" className="fill-brand-300/70 dark:fill-brand-700/70" />
        <circle cx="25" cy="25" r="12" className="stroke-brand-600 dark:stroke-brand-300" strokeWidth="3" fill="none" />
        <path d="M33 33 L42 42" className="stroke-brand-600 dark:stroke-brand-300" strokeWidth="3" strokeLinecap="round" />
      </g>

      {/* Binary/data particles */}
      <text x="330" y="200" className="fill-brand-300/60 dark:fill-brand-600/60 text-xs font-mono">01</text>
      <text x="50" y="150" className="fill-brand-300/60 dark:fill-brand-600/60 text-xs font-mono">10</text>
      <text x="340" y="300" className="fill-brand-300/60 dark:fill-brand-600/60 text-xs font-mono">11</text>
      <text x="30" y="100" className="fill-brand-300/60 dark:fill-brand-600/60 text-xs font-mono">00</text>

      {/* Connection dots */}
      <circle cx="350" cy="150" r="6" className="fill-brand-400/50 dark:fill-brand-500/50" />
      <circle cx="60" cy="200" r="8" className="fill-brand-300/50 dark:fill-brand-600/50" />
      <circle cx="320" cy="340" r="5" className="fill-brand-400/40 dark:fill-brand-500/40" />
    </svg>
  );
}
