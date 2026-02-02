export function TermsIllustration({ className = "" }: { className?: string }) {
  return (
    <svg
      viewBox="0 0 400 400"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      className={className}
    >
      {/* Document base */}
      <rect
        x="110"
        y="50"
        width="180"
        height="250"
        rx="16"
        className="fill-[var(--illust-medium)]"
      />
      <rect
        x="120"
        y="60"
        width="160"
        height="230"
        rx="12"
        className="fill-[var(--illust-primary)]"
      />

      {/* Document header line */}
      <rect x="145" y="90" width="80" height="10" rx="5" className="fill-[var(--illust-secondary)]" style={{ opacity: 0.8 }} />

      {/* Document lines */}
      <rect x="145" y="115" width="110" height="7" rx="3.5" className="fill-[var(--illust-light-80)]" />
      <rect x="145" y="132" width="95" height="7" rx="3.5" className="fill-[var(--illust-light-80)]" style={{ opacity: 0.6 }} />
      <rect x="145" y="149" width="105" height="7" rx="3.5" className="fill-[var(--illust-light-80)]" style={{ opacity: 0.6 }} />
      <rect x="145" y="172" width="110" height="7" rx="3.5" className="fill-[var(--illust-light-80)]" />
      <rect x="145" y="189" width="80" height="7" rx="3.5" className="fill-[var(--illust-light-80)]" style={{ opacity: 0.6 }} />
      <rect x="145" y="206" width="100" height="7" rx="3.5" className="fill-[var(--illust-light-80)]" style={{ opacity: 0.6 }} />

      {/* Signature line */}
      <rect x="145" y="245" width="70" height="2" className="fill-[var(--illust-secondary)]" style={{ opacity: 0.6 }} />
      {/* Signature scribble */}
      <path
        d="M150 240 C155 232 162 238 168 234 C174 230 178 237 185 235"
        strokeWidth="2.5"
        strokeLinecap="round"
        fill="none"
        className="stroke-[var(--illust-secondary)]"
      />

      {/* Handshake icon overlay */}
      <g transform="translate(175, 300)">
        <circle cx="25" cy="25" r="32" className="fill-[var(--illust-medium-light)]" style={{ opacity: 0.9 }} />
        <circle cx="25" cy="25" r="25" className="fill-[var(--background)]" />
        {/* Left hand */}
        <path
          d="M10 28 L18 22 L25 28"
          strokeWidth="3"
          strokeLinecap="round"
          strokeLinejoin="round"
          fill="none"
          className="stroke-[var(--illust-secondary)]"
        />
        {/* Right hand */}
        <path
          d="M25 28 L32 22 L40 28"
          strokeWidth="3"
          strokeLinecap="round"
          strokeLinejoin="round"
          fill="none"
          className="stroke-[var(--illust-primary-50)]"
        />
      </g>

      {/* Floating checkmark badge */}
      <g transform="translate(300, 80)">
        <rect width="55" height="55" rx="12" className="fill-[var(--illust-light-80)]" />
        <circle cx="27" cy="27" r="16" className="stroke-[var(--illust-secondary)]" strokeWidth="3" fill="none" />
        <path
          d="M19 27 L25 33 L36 22"
          strokeWidth="3"
          strokeLinecap="round"
          strokeLinejoin="round"
          fill="none"
          className="stroke-[var(--illust-secondary)]"
        />
      </g>

      {/* Floating pen icon */}
      <g transform="translate(40, 120)">
        <rect width="50" height="50" rx="10" className="fill-[var(--illust-medium-light)]" style={{ opacity: 0.7 }} />
        <path
          d="M18 36 L18 32 L32 18 L36 22 L22 36 Z"
          strokeWidth="2"
          strokeLinecap="round"
          strokeLinejoin="round"
          className="fill-[var(--illust-secondary-50)] stroke-[var(--illust-secondary)]"
        />
        <path d="M18 36 L16 38" strokeWidth="2" strokeLinecap="round" className="stroke-[var(--illust-secondary)]" />
      </g>

      {/* Floating scale/balance icon */}
      <g transform="translate(310, 240)">
        <rect width="50" height="50" rx="10" className="fill-[var(--illust-light-80)]" style={{ opacity: 0.5 }} />
        <path d="M25 12 L25 35" strokeWidth="2.5" strokeLinecap="round" className="stroke-[var(--illust-secondary-50)]" />
        <path d="M13 18 L37 18" strokeWidth="2.5" strokeLinecap="round" className="stroke-[var(--illust-secondary-50)]" />
        <path d="M13 18 L10 28 L16 28 Z" className="fill-[var(--illust-secondary-50)]" style={{ opacity: 0.6 }} />
        <path d="M37 18 L34 28 L40 28 Z" className="fill-[var(--illust-secondary-50)]" style={{ opacity: 0.6 }} />
        <rect x="20" y="35" width="10" height="3" rx="1.5" className="fill-[var(--illust-secondary-50)]" />
      </g>

      {/* Decorative dots */}
      <circle cx="65" cy="80" r="6" className="fill-[var(--illust-primary-50)]" />
      <circle cx="340" cy="180" r="8" className="fill-[var(--illust-secondary-50)]" />
      <circle cx="75" cy="300" r="5" className="fill-[var(--illust-primary-40)]" />
      <circle cx="330" cy="350" r="4" className="fill-[var(--illust-secondary-50)]" style={{ opacity: 0.5 }} />
    </svg>
  );
}
