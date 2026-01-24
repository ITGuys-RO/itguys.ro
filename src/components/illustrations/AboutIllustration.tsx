export function AboutIllustration({ className = "" }: { className?: string }) {
  return (
    <svg
      viewBox="0 0 400 400"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      className={className}
    >
      {/* Building / Company icon */}
      <g transform="translate(120, 80)">
        <rect
          width="160"
          height="220"
          rx="8"
          className="fill-brand-400 dark:fill-brand-500"
        />
        {/* Windows grid */}
        <rect x="20" y="30" width="35" height="30" rx="4" className="fill-brand-200 dark:fill-brand-700" />
        <rect x="70" y="30" width="35" height="30" rx="4" className="fill-brand-200 dark:fill-brand-700" />
        <rect x="105" y="30" width="35" height="30" rx="4" className="fill-white/30 dark:fill-zinc-100/30" />

        <rect x="20" y="75" width="35" height="30" rx="4" className="fill-white/30 dark:fill-zinc-100/30" />
        <rect x="70" y="75" width="35" height="30" rx="4" className="fill-brand-200 dark:fill-brand-700" />
        <rect x="105" y="75" width="35" height="30" rx="4" className="fill-brand-200 dark:fill-brand-700" />

        <rect x="20" y="120" width="35" height="30" rx="4" className="fill-brand-200 dark:fill-brand-700" />
        <rect x="70" y="120" width="35" height="30" rx="4" className="fill-white/30 dark:fill-zinc-100/30" />
        <rect x="105" y="120" width="35" height="30" rx="4" className="fill-brand-200 dark:fill-brand-700" />

        {/* Door */}
        <rect x="55" y="170" width="50" height="50" rx="4" className="fill-brand-600 dark:fill-brand-300" />
        <circle cx="95" cy="195" r="4" className="fill-brand-300 dark:fill-brand-600" />
      </g>

      {/* Person 1 - left */}
      <g transform="translate(30, 200)">
        <circle cx="30" cy="25" r="22" className="fill-brand-300 dark:fill-brand-600" />
        <path
          d="M5 85 C5 55 55 55 55 85 L55 110 L5 110 Z"
          className="fill-brand-400 dark:fill-brand-500"
        />
        <circle cx="23" cy="22" r="3" className="fill-white/80" />
        <circle cx="37" cy="22" r="3" className="fill-white/80" />
        <path d="M25 32 Q30 37 35 32" stroke="white" strokeWidth="2" fill="none" strokeLinecap="round" />
      </g>

      {/* Person 2 - right */}
      <g transform="translate(310, 200)">
        <circle cx="30" cy="25" r="22" className="fill-brand-300 dark:fill-brand-600" />
        <path
          d="M5 85 C5 55 55 55 55 85 L55 110 L5 110 Z"
          className="fill-brand-400 dark:fill-brand-500"
        />
        <circle cx="23" cy="22" r="3" className="fill-white/80" />
        <circle cx="37" cy="22" r="3" className="fill-white/80" />
        <path d="M25 32 Q30 37 35 32" stroke="white" strokeWidth="2" fill="none" strokeLinecap="round" />
      </g>

      {/* Lightbulb / idea */}
      <g transform="translate(40, 50)">
        <path
          d="M30 10 C15 10 5 22 5 35 C5 45 12 52 18 58 L18 70 L42 70 L42 58 C48 52 55 45 55 35 C55 22 45 10 30 10"
          className="fill-brand-200 dark:fill-brand-700"
        />
        <rect x="18" y="70" width="24" height="8" rx="2" className="fill-brand-300 dark:fill-brand-600" />
        <rect x="22" y="78" width="16" height="6" rx="2" className="fill-brand-300 dark:fill-brand-600" />
        {/* Light rays */}
        <path d="M30 0 L30 -10" className="stroke-brand-300 dark:stroke-brand-600" strokeWidth="3" strokeLinecap="round" />
        <path d="M55 20 L65 15" className="stroke-brand-300 dark:stroke-brand-600" strokeWidth="3" strokeLinecap="round" />
        <path d="M5 20 L-5 15" className="stroke-brand-300 dark:stroke-brand-600" strokeWidth="3" strokeLinecap="round" />
      </g>

      {/* Target / goal */}
      <g transform="translate(310, 60)">
        <circle cx="35" cy="35" r="32" className="stroke-brand-400 dark:stroke-brand-500" strokeWidth="4" fill="none" />
        <circle cx="35" cy="35" r="22" className="stroke-brand-300 dark:stroke-brand-600" strokeWidth="4" fill="none" />
        <circle cx="35" cy="35" r="12" className="stroke-brand-400 dark:stroke-brand-500" strokeWidth="4" fill="none" />
        <circle cx="35" cy="35" r="5" className="fill-brand-500 dark:fill-brand-400" />
      </g>

      {/* Handshake / partnership */}
      <g transform="translate(150, 320)">
        <path
          d="M20 30 L40 15 L60 25 L80 15 L100 30"
          className="stroke-brand-400 dark:stroke-brand-500"
          strokeWidth="6"
          strokeLinecap="round"
          fill="none"
        />
        <circle cx="40" cy="15" r="8" className="fill-brand-300 dark:fill-brand-600" />
        <circle cx="80" cy="15" r="8" className="fill-brand-300 dark:fill-brand-600" />
      </g>

      {/* Certificate / badge */}
      <g transform="translate(300, 330)">
        <rect width="60" height="45" rx="6" className="fill-brand-200 dark:fill-brand-800" />
        <rect x="10" y="10" width="40" height="5" rx="2" className="fill-brand-500 dark:fill-brand-400" />
        <rect x="10" y="20" width="30" height="4" rx="2" className="fill-brand-400 dark:fill-brand-500" />
        <rect x="10" y="28" width="35" height="4" rx="2" className="fill-brand-400 dark:fill-brand-500" />
        <circle cx="45" cy="35" r="8" className="fill-brand-500 dark:fill-brand-400" />
        <path d="M42 35 L44 37 L48 33" stroke="white" strokeWidth="2" fill="none" strokeLinecap="round" />
      </g>

      {/* Decorative elements */}
      <circle cx="380" cy="180" r="10" className="fill-brand-300/50 dark:fill-brand-600/50" />
      <circle cx="20" cy="150" r="8" className="fill-brand-400/40 dark:fill-brand-500/40" />
      <circle cx="100" cy="350" r="12" className="fill-brand-200/60 dark:fill-brand-700/60" />

      {/* Connection lines */}
      <path
        d="M85 250 Q110 220 125 240"
        stroke="currentColor"
        strokeWidth="2"
        strokeDasharray="6 4"
        className="text-brand-300 dark:text-brand-600"
        fill="none"
      />
      <path
        d="M315 250 Q290 220 280 240"
        stroke="currentColor"
        strokeWidth="2"
        strokeDasharray="6 4"
        className="text-brand-300 dark:text-brand-600"
        fill="none"
      />
      <path
        d="M200 300 L200 325"
        stroke="currentColor"
        strokeWidth="2"
        strokeDasharray="6 4"
        className="text-brand-300 dark:text-brand-600"
        fill="none"
      />
    </svg>
  );
}
