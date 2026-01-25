export function TeamIllustration({ className = "" }: { className?: string }) {
  return (
    <svg
      viewBox="0 0 400 300"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      className={className}
    >
      {/* Central person */}
      <g transform="translate(170, 100)">
        <circle cx="30" cy="25" r="25" className="fill-[var(--illust-primary)]" />
        <path
          d="M0 90 C0 60 60 60 60 90 L60 110 L0 110 Z"
          className="fill-[var(--illust-medium)]"
        />
        {/* Face */}
        <circle cx="23" cy="22" r="3" className="fill-white/80" />
        <circle cx="37" cy="22" r="3" className="fill-white/80" />
        <path d="M25 32 Q30 38 35 32" stroke="white" strokeWidth="2" fill="none" strokeLinecap="round" />
      </g>

      {/* Left person */}
      <g transform="translate(50, 120)">
        <circle cx="25" cy="20" r="20" className="fill-[var(--illust-secondary)]" />
        <path
          d="M0 70 C0 45 50 45 50 70 L50 90 L0 90 Z"
          className="fill-[var(--illust-primary)]"
        />
        <circle cx="19" cy="18" r="2.5" className="fill-white/80" />
        <circle cx="31" cy="18" r="2.5" className="fill-white/80" />
      </g>

      {/* Right person */}
      <g transform="translate(300, 120)">
        <circle cx="25" cy="20" r="20" className="fill-[var(--illust-secondary)]" />
        <path
          d="M0 70 C0 45 50 45 50 70 L50 90 L0 90 Z"
          className="fill-[var(--illust-primary)]"
        />
        <circle cx="19" cy="18" r="2.5" className="fill-white/80" />
        <circle cx="31" cy="18" r="2.5" className="fill-white/80" />
      </g>

      {/* Connection lines */}
      <path
        d="M100 150 Q150 130 170 150"
        stroke="currentColor"
        strokeWidth="3"
        strokeDasharray="8 4"
        className="text-[var(--illust-secondary)]"
        fill="none"
      />
      <path
        d="M230 150 Q270 130 300 150"
        stroke="currentColor"
        strokeWidth="3"
        strokeDasharray="8 4"
        className="text-[var(--illust-secondary)]"
        fill="none"
      />

      {/* Floating elements - code/chat bubbles */}
      <g transform="translate(280, 50)">
        <rect width="70" height="45" rx="8" className="fill-[var(--illust-light)]" />
        <rect x="10" y="12" width="30" height="5" rx="2" className="fill-[var(--illust-primary)]" />
        <rect x="10" y="22" width="50" height="5" rx="2" className="fill-[var(--illust-secondary)]" />
        <rect x="10" y="32" width="25" height="5" rx="2" className="fill-[var(--illust-primary)]" />
        <polygon points="20,45 30,45 25,55" className="fill-[var(--illust-light)]" />
      </g>

      <g transform="translate(40, 40)">
        <rect width="60" height="40" rx="8" className="fill-[var(--illust-light)]" />
        <rect x="8" y="10" width="25" height="5" rx="2" className="fill-[var(--illust-medium)]" />
        <rect x="8" y="20" width="44" height="5" rx="2" className="fill-[var(--illust-primary)]" />
        <rect x="8" y="30" width="20" height="5" rx="2" className="fill-[var(--illust-medium)]" />
        <polygon points="40,40 50,40 45,50" className="fill-[var(--illust-light)]" />
      </g>

      {/* Decorative elements */}
      <circle cx="200" cy="50" r="8" className="fill-[var(--illust-secondary-50)]" />
      <circle cx="380" cy="200" r="12" className="fill-[var(--illust-light-60)]" />
      <circle cx="20" cy="250" r="10" className="fill-[var(--illust-secondary-50)]" style={{ opacity: 0.8 }} />

      {/* Gear icon */}
      <g transform="translate(340, 240)">
        <circle cx="20" cy="20" r="18" className="stroke-[var(--illust-secondary)]" strokeWidth="3" fill="none" />
        <circle cx="20" cy="20" r="8" className="fill-[var(--illust-secondary)]" />
        {[0, 45, 90, 135, 180, 225, 270, 315].map((angle) => (
          <rect
            key={angle}
            x="17"
            y="-2"
            width="6"
            height="10"
            rx="2"
            className="fill-[var(--illust-secondary)]"
            transform={`rotate(${angle} 20 20)`}
          />
        ))}
      </g>
    </svg>
  );
}
