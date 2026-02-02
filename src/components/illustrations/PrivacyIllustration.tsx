export function PrivacyIllustration({ className = "" }: { className?: string }) {
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
        y="60"
        width="180"
        height="240"
        rx="16"
        className="fill-[var(--illust-medium)]"
      />
      <rect
        x="120"
        y="70"
        width="160"
        height="220"
        rx="12"
        className="fill-[var(--illust-primary)]"
      />

      {/* Document lines */}
      <rect x="145" y="110" width="110" height="8" rx="4" className="fill-[var(--illust-light-80)]" />
      <rect x="145" y="130" width="90" height="8" rx="4" className="fill-[var(--illust-light-80)]" style={{ opacity: 0.6 }} />
      <rect x="145" y="150" width="100" height="8" rx="4" className="fill-[var(--illust-light-80)]" style={{ opacity: 0.6 }} />
      <rect x="145" y="180" width="110" height="8" rx="4" className="fill-[var(--illust-light-80)]" />
      <rect x="145" y="200" width="75" height="8" rx="4" className="fill-[var(--illust-light-80)]" style={{ opacity: 0.6 }} />
      <rect x="145" y="220" width="95" height="8" rx="4" className="fill-[var(--illust-light-80)]" style={{ opacity: 0.6 }} />
      <rect x="145" y="250" width="60" height="8" rx="4" className="fill-[var(--illust-light-80)]" style={{ opacity: 0.4 }} />

      {/* Shield overlay */}
      <path
        d="M200 180 L260 205 L260 260 C260 295 200 320 200 320 C200 320 140 295 140 260 L140 205 L200 180Z"
        className="fill-[var(--illust-medium-light)]"
        style={{ opacity: 0.9 }}
      />
      <path
        d="M200 195 L248 215 L248 255 C248 282 200 302 200 302 C200 302 152 282 152 255 L152 215 L200 195Z"
        className="fill-[var(--background)]"
      />

      {/* Checkmark on shield */}
      <path
        d="M180 250 L193 263 L220 236"
        strokeWidth="8"
        strokeLinecap="round"
        strokeLinejoin="round"
        fill="none"
        className="stroke-[var(--illust-secondary)]"
      />

      {/* Floating elements */}
      <g transform="translate(300, 100)">
        <rect width="55" height="55" rx="12" className="fill-[var(--illust-light-80)]" />
        <circle cx="27" cy="22" r="10" className="stroke-[var(--illust-secondary)]" strokeWidth="3" fill="none" />
        <circle cx="27" cy="22" r="4" className="fill-[var(--illust-secondary)]" />
        <path d="M12 40 C12 32 42 32 42 40" className="stroke-[var(--illust-secondary)]" strokeWidth="3" strokeLinecap="round" fill="none" />
      </g>

      <g transform="translate(40, 140)">
        <rect width="50" height="50" rx="10" className="fill-[var(--illust-medium-light)]" style={{ opacity: 0.7 }} />
        <rect x="13" y="13" width="24" height="18" rx="3" className="stroke-[var(--illust-secondary)]" strokeWidth="2.5" fill="none" />
        <path d="M13 18 L25 27 L37 18" className="stroke-[var(--illust-secondary)]" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round" fill="none" />
      </g>

      {/* Lock icon */}
      <g transform="translate(310, 260)">
        <rect x="5" y="20" width="30" height="24" rx="4" className="fill-[var(--illust-secondary-50)]" />
        <path d="M12 20 L12 14 C12 6 28 6 28 14 L28 20" strokeWidth="4" fill="none" className="stroke-[var(--illust-secondary-50)]" />
      </g>

      {/* Decorative dots */}
      <circle cx="60" cy="90" r="6" className="fill-[var(--illust-primary-50)]" />
      <circle cx="340" cy="200" r="8" className="fill-[var(--illust-secondary-50)]" />
      <circle cx="80" cy="320" r="5" className="fill-[var(--illust-primary-40)]" />
      <circle cx="330" cy="350" r="4" className="fill-[var(--illust-secondary-50)]" style={{ opacity: 0.5 }} />
    </svg>
  );
}
