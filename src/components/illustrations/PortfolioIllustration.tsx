export function PortfolioIllustration({ className = "" }: { className?: string }) {
  return (
    <svg
      viewBox="0 0 400 400"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      className={className}
    >
      {/* Main showcase display */}
      <g transform="translate(80, 60)">
        {/* Monitor frame */}
        <rect
          width="240"
          height="180"
          rx="12"
          className="fill-[var(--terminal-frame)]"
        />
        {/* Screen bezel */}
        <rect
          x="8"
          y="8"
          width="224"
          height="150"
          rx="6"
          className="fill-[var(--terminal-content)]"
        />
        {/* Browser chrome */}
        <rect
          x="8"
          y="8"
          width="224"
          height="24"
          rx="6"
          className="fill-[var(--terminal-titlebar)]"
        />
        <rect
          x="8"
          y="24"
          width="224"
          height="8"
          className="fill-[var(--terminal-titlebar)]"
        />
        {/* Browser dots */}
        <circle cx="22" cy="20" r="5" className="fill-red-400" />
        <circle cx="38" cy="20" r="5" className="fill-yellow-400" />
        <circle cx="54" cy="20" r="5" className="fill-green-400" />
        {/* URL bar */}
        <rect x="70" y="14" width="150" height="12" rx="6" className="fill-[var(--illust-medium-light)]" style={{ opacity: 0.5 }} />

        {/* Project preview content */}
        <rect x="20" y="44" width="200" height="100" rx="4" className="fill-[var(--illust-medium)]" style={{ opacity: 0.2 }} />
        {/* Image placeholder */}
        <rect x="28" y="52" width="80" height="60" rx="4" className="fill-[var(--illust-primary)]" style={{ opacity: 0.4 }} />
        {/* Text lines */}
        <rect x="118" y="56" width="90" height="8" rx="2" className="fill-[var(--illust-secondary)]" />
        <rect x="118" y="70" width="70" height="6" rx="2" className="fill-[var(--illust-primary)]" style={{ opacity: 0.6 }} />
        <rect x="118" y="82" width="80" height="6" rx="2" className="fill-[var(--illust-primary)]" style={{ opacity: 0.6 }} />
        <rect x="118" y="94" width="50" height="6" rx="2" className="fill-[var(--illust-primary)]" style={{ opacity: 0.6 }} />
        {/* Tags */}
        <rect x="28" y="120" width="35" height="14" rx="7" className="fill-[var(--illust-primary)]" />
        <rect x="68" y="120" width="40" height="14" rx="7" className="fill-[var(--illust-medium)]" />
        <rect x="113" y="120" width="30" height="14" rx="7" className="fill-[var(--illust-primary)]" />

        {/* Monitor stand */}
        <rect x="100" y="180" width="40" height="20" className="fill-[var(--terminal-frame)]" />
        <rect x="80" y="195" width="80" height="8" rx="4" className="fill-[var(--terminal-frame)]" />
      </g>

      {/* Floating project card - top left */}
      <g transform="translate(20, 90)">
        <rect width="70" height="90" rx="8" className="fill-[var(--illust-light-80)]" />
        {/* Mini thumbnail */}
        <rect x="8" y="10" width="54" height="35" rx="4" className="fill-[var(--illust-primary-50)]" />
        {/* Mini text */}
        <rect x="8" y="52" width="40" height="5" rx="2" className="fill-[var(--illust-medium)]" />
        <rect x="8" y="62" width="50" height="4" rx="2" className="fill-[var(--illust-primary)]" style={{ opacity: 0.6 }} />
        <rect x="8" y="72" width="35" height="4" rx="2" className="fill-[var(--illust-primary)]" style={{ opacity: 0.6 }} />
      </g>

      {/* Floating project card - right */}
      <g transform="translate(330, 120)">
        <rect width="60" height="80" rx="8" className="fill-[var(--illust-light-80)]" />
        {/* Mini thumbnail */}
        <rect x="6" y="8" width="48" height="30" rx="4" className="fill-[var(--illust-medium-50)]" />
        {/* Mini text */}
        <rect x="6" y="44" width="35" height="5" rx="2" className="fill-[var(--illust-medium)]" />
        <rect x="6" y="54" width="42" height="4" rx="2" className="fill-[var(--illust-primary)]" style={{ opacity: 0.6 }} />
        <rect x="6" y="64" width="30" height="4" rx="2" className="fill-[var(--illust-primary)]" style={{ opacity: 0.6 }} />
      </g>

      {/* Success chart - bottom left */}
      <g transform="translate(30, 280)">
        <rect width="80" height="70" rx="8" className="fill-[var(--illust-light-60)]" />
        {/* Chart bars */}
        <rect x="12" y="45" width="12" height="15" rx="2" className="fill-[var(--illust-primary)]" />
        <rect x="28" y="35" width="12" height="25" rx="2" className="fill-[var(--illust-medium)]" />
        <rect x="44" y="25" width="12" height="35" rx="2" className="fill-[var(--illust-primary)]" />
        <rect x="60" y="15" width="12" height="45" rx="2" className="fill-green-500" />
        {/* Label */}
        <rect x="12" y="8" width="40" height="5" rx="2" className="fill-[var(--illust-medium)]" />
      </g>

      {/* Star rating - bottom right */}
      <g transform="translate(300, 300)">
        {[0, 1, 2, 3, 4].map((i) => (
          <path
            key={i}
            d={`M${12 + i * 18} 10 L${14.5 + i * 18} 16 L${21 + i * 18} 17 L${16 + i * 18} 21 L${17.5 + i * 18} 27 L${12 + i * 18} 24 L${6.5 + i * 18} 27 L${8 + i * 18} 21 L${3 + i * 18} 17 L${9.5 + i * 18} 16 Z`}
            className={i < 4 ? "fill-yellow-400" : "fill-[var(--illust-medium-light)]"}
            style={i >= 4 ? { opacity: 0.5 } : undefined}
          />
        ))}
      </g>

      {/* Checkmark badge - top right */}
      <g transform="translate(340, 50)">
        <circle cx="25" cy="25" r="24" className="fill-green-500/20" />
        <circle cx="25" cy="25" r="18" className="fill-green-500" />
        <path
          d="M18 25 L23 30 L33 20"
          stroke="white"
          strokeWidth="3"
          fill="none"
          strokeLinecap="round"
          strokeLinejoin="round"
        />
      </g>

      {/* Decorative dots */}
      <circle cx="55" cy="55" r="8" className="fill-[var(--illust-primary-50)]" />
      <circle cx="380" cy="250" r="10" className="fill-[var(--illust-secondary-50)]" style={{ opacity: 0.8 }} />
      <circle cx="20" cy="380" r="6" className="fill-[var(--illust-primary-50)]" style={{ opacity: 0.8 }} />

      {/* Connection dashes */}
      <path
        d="M90 140 Q60 130 55 115"
        stroke="currentColor"
        strokeWidth="2"
        strokeDasharray="6 4"
        className="text-[var(--illust-secondary)]"
        fill="none"
      />
      <path
        d="M320 180 Q340 160 345 145"
        stroke="currentColor"
        strokeWidth="2"
        strokeDasharray="6 4"
        className="text-[var(--illust-secondary)]"
        fill="none"
      />
      <path
        d="M110 310 Q130 290 150 280"
        stroke="currentColor"
        strokeWidth="2"
        strokeDasharray="6 4"
        className="text-[var(--illust-secondary)]"
        fill="none"
      />
    </svg>
  );
}
