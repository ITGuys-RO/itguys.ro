export function BlogIllustration({ className = "" }: { className?: string }) {
  return (
    <svg
      viewBox="0 0 400 400"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      className={className}
    >
      {/* Main article/document */}
      <g transform="translate(100, 50)">
        {/* Paper background */}
        <rect
          width="200"
          height="260"
          rx="8"
          className="fill-[var(--illust-paper)]"
          stroke="var(--illust-paper-stroke)"
          strokeWidth="2"
        />
        {/* Header image placeholder */}
        <rect x="16" y="16" width="168" height="80" rx="6" className="fill-[var(--illust-primary)]" style={{ opacity: 0.3 }} />
        {/* Title */}
        <rect x="16" y="110" width="140" height="12" rx="3" className="fill-[var(--illust-medium)]" />
        <rect x="16" y="128" width="100" height="10" rx="3" className="fill-[var(--illust-primary)]" style={{ opacity: 0.6 }} />
        {/* Article text lines */}
        <rect x="16" y="152" width="168" height="6" rx="2" className="fill-[var(--illust-secondary)]" style={{ opacity: 0.5 }} />
        <rect x="16" y="164" width="160" height="6" rx="2" className="fill-[var(--illust-secondary)]" style={{ opacity: 0.5 }} />
        <rect x="16" y="176" width="168" height="6" rx="2" className="fill-[var(--illust-secondary)]" style={{ opacity: 0.5 }} />
        <rect x="16" y="188" width="140" height="6" rx="2" className="fill-[var(--illust-secondary)]" style={{ opacity: 0.5 }} />
        <rect x="16" y="200" width="155" height="6" rx="2" className="fill-[var(--illust-secondary)]" style={{ opacity: 0.5 }} />
        {/* Tags */}
        <rect x="16" y="224" width="40" height="16" rx="8" className="fill-[var(--illust-primary)]" style={{ opacity: 0.4 }} />
        <rect x="62" y="224" width="50" height="16" rx="8" className="fill-[var(--illust-medium)]" style={{ opacity: 0.4 }} />
        <rect x="118" y="224" width="35" height="16" rx="8" className="fill-[var(--illust-primary)]" style={{ opacity: 0.4 }} />
      </g>

      {/* Floating blog card - top left */}
      <g transform="translate(20, 80)">
        <rect width="90" height="110" rx="8" className="fill-[var(--illust-light-80)]" />
        {/* Mini thumbnail */}
        <rect x="10" y="10" width="70" height="45" rx="4" className="fill-[var(--illust-primary-50)]" />
        {/* Mini text */}
        <rect x="10" y="62" width="55" height="6" rx="2" className="fill-[var(--illust-medium)]" />
        <rect x="10" y="74" width="65" height="5" rx="2" className="fill-[var(--illust-primary)]" style={{ opacity: 0.6 }} />
        <rect x="10" y="86" width="45" height="5" rx="2" className="fill-[var(--illust-primary)]" style={{ opacity: 0.6 }} />
      </g>

      {/* Floating blog card - bottom right */}
      <g transform="translate(310, 220)">
        <rect width="80" height="100" rx="8" className="fill-[var(--illust-light-80)]" />
        {/* Mini thumbnail */}
        <rect x="8" y="8" width="64" height="40" rx="4" className="fill-[var(--illust-medium-50)]" />
        {/* Mini text */}
        <rect x="8" y="54" width="50" height="6" rx="2" className="fill-[var(--illust-medium)]" />
        <rect x="8" y="66" width="58" height="5" rx="2" className="fill-[var(--illust-primary)]" style={{ opacity: 0.6 }} />
        <rect x="8" y="78" width="40" height="5" rx="2" className="fill-[var(--illust-primary)]" style={{ opacity: 0.6 }} />
      </g>

      {/* Pencil/Edit icon - top right */}
      <g transform="translate(320, 60)">
        <circle cx="30" cy="30" r="28" className="fill-[var(--illust-light-60)]" />
        <g transform="translate(16, 16)">
          <path
            d="M20 6 L26 12 L12 26 L4 28 L6 20 Z"
            className="fill-[var(--illust-primary)]"
          />
          <path
            d="M20 6 L26 12"
            stroke="var(--illust-medium)"
            strokeWidth="2"
            strokeLinecap="round"
          />
        </g>
      </g>

      {/* Comment bubbles - bottom left */}
      <g transform="translate(30, 280)">
        <rect width="70" height="50" rx="8" className="fill-[var(--illust-light-60)]" />
        <rect x="10" y="12" width="50" height="5" rx="2" className="fill-[var(--illust-medium)]" />
        <rect x="10" y="22" width="40" height="5" rx="2" className="fill-[var(--illust-primary)]" style={{ opacity: 0.6 }} />
        <rect x="10" y="32" width="45" height="5" rx="2" className="fill-[var(--illust-primary)]" style={{ opacity: 0.6 }} />
        {/* Tail */}
        <path d="M15 50 L5 60 L20 50" className="fill-[var(--illust-light-60)]" />
      </g>

      {/* Reading glasses - decorative */}
      <g transform="translate(330, 340)">
        <ellipse cx="18" cy="20" rx="16" ry="14" className="stroke-[var(--illust-medium)]" strokeWidth="3" fill="none" />
        <ellipse cx="52" cy="20" rx="16" ry="14" className="stroke-[var(--illust-medium)]" strokeWidth="3" fill="none" />
        <path d="M34 20 Q35 16 38 20" className="stroke-[var(--illust-medium)]" strokeWidth="3" fill="none" />
        <path d="M2 20 L-5 15" className="stroke-[var(--illust-medium)]" strokeWidth="3" strokeLinecap="round" />
        <path d="M68 20 L75 15" className="stroke-[var(--illust-medium)]" strokeWidth="3" strokeLinecap="round" />
      </g>

      {/* Decorative dots */}
      <circle cx="60" cy="45" r="8" className="fill-[var(--illust-primary-50)]" />
      <circle cx="380" cy="150" r="10" className="fill-[var(--illust-secondary-50)]" style={{ opacity: 0.8 }} />
      <circle cx="25" cy="370" r="6" className="fill-[var(--illust-primary-50)]" style={{ opacity: 0.8 }} />

      {/* Connection dashes */}
      <path
        d="M110 130 Q80 120 75 100"
        stroke="currentColor"
        strokeWidth="2"
        strokeDasharray="6 4"
        className="text-[var(--illust-secondary)]"
        fill="none"
      />
      <path
        d="M300 270 Q320 260 330 250"
        stroke="currentColor"
        strokeWidth="2"
        strokeDasharray="6 4"
        className="text-[var(--illust-secondary)]"
        fill="none"
      />
      <path
        d="M100 310 Q80 300 75 290"
        stroke="currentColor"
        strokeWidth="2"
        strokeDasharray="6 4"
        className="text-[var(--illust-secondary)]"
        fill="none"
      />
    </svg>
  );
}
