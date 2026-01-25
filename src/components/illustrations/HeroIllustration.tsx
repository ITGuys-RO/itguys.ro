export function HeroIllustration({ className = "" }: { className?: string }) {
  return (
    <svg
      viewBox="0 0 600 500"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      className={className}
    >
      {/* Monitor */}
      <g>
        {/* Monitor stand */}
        <path
          d="M300 420 L300 380 L260 380 L260 420 L300 420Z"
          className="fill-[var(--illust-device-stand)]"
        />
        <ellipse
          cx="280"
          cy="420"
          rx="60"
          ry="15"
          className="fill-[var(--illust-device-base)]"
        />

        {/* Monitor body */}
        <rect
          x="120"
          y="180"
          width="320"
          height="200"
          rx="8"
          className="fill-[var(--illust-device-frame)]"
        />
        <rect
          x="130"
          y="190"
          width="300"
          height="170"
          rx="4"
          className="fill-[var(--illust-primary)]"
        />

        {/* Code lines on screen */}
        <rect x="150" y="210" width="80" height="8" rx="2" className="fill-[var(--illust-light)]" />
        <rect x="150" y="230" width="120" height="8" rx="2" className="fill-white/40" />
        <rect x="170" y="250" width="100" height="8" rx="2" className="fill-[var(--illust-medium-light)]" />
        <rect x="170" y="270" width="140" height="8" rx="2" className="fill-white/30" />
        <rect x="170" y="290" width="80" height="8" rx="2" className="fill-[var(--illust-light)]" />
        <rect x="150" y="310" width="60" height="8" rx="2" className="fill-white/40" />
        <rect x="150" y="330" width="100" height="8" rx="2" className="fill-[var(--illust-medium-light)]" />
      </g>

      {/* Floating phone */}
      <g transform="translate(420, 120) rotate(10)">
        <rect
          width="80"
          height="140"
          rx="12"
          className="fill-[var(--illust-device-frame)]"
        />
        <rect
          x="6"
          y="20"
          width="68"
          height="100"
          rx="4"
          className="fill-[var(--illust-medium)]"
        />
        {/* Phone UI elements */}
        <rect x="14" y="35" width="40" height="6" rx="2" className="fill-white/50" />
        <rect x="14" y="50" width="52" height="6" rx="2" className="fill-white/30" />
        <rect x="14" y="65" width="30" height="6" rx="2" className="fill-[var(--illust-light)]" />
        <circle cx="40" cy="95" r="12" className="fill-white/20" />
      </g>

      {/* Floating tablet */}
      <g transform="translate(60, 80) rotate(-8)">
        <rect
          width="120"
          height="160"
          rx="10"
          className="fill-[var(--illust-device-frame)]"
        />
        <rect
          x="8"
          y="15"
          width="104"
          height="130"
          rx="4"
          className="fill-[var(--illust-medium)]"
        />
        {/* Tablet UI elements */}
        <rect x="16" y="30" width="60" height="8" rx="2" className="fill-white/50" />
        <rect x="16" y="48" width="80" height="8" rx="2" className="fill-white/30" />
        <rect x="16" y="66" width="50" height="8" rx="2" className="fill-[var(--illust-light)]" />
        <rect x="16" y="90" width="88" height="40" rx="4" className="fill-white/20" />
      </g>

      {/* Floating elements */}
      <circle cx="500" cy="320" r="20" className="fill-[var(--illust-secondary-50)]" />
      <circle cx="80" cy="300" r="15" className="fill-[var(--illust-primary-40)]" />
      <rect x="480" y="200" width="30" height="30" rx="6" className="fill-[var(--illust-light-60)]" transform="rotate(15 495 215)" />

      {/* Connection lines */}
      <path
        d="M180 160 Q200 100 280 120"
        stroke="currentColor"
        strokeWidth="2"
        strokeDasharray="6 4"
        className="text-[var(--illust-secondary)]"
        fill="none"
      />
      <path
        d="M420 300 Q480 280 500 320"
        stroke="currentColor"
        strokeWidth="2"
        strokeDasharray="6 4"
        className="text-[var(--illust-secondary)]"
        fill="none"
      />
    </svg>
  );
}
