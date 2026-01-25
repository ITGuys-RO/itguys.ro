export function ContactIllustration({ className = "" }: { className?: string }) {
  return (
    <svg
      viewBox="0 0 400 400"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      className={className}
    >
      {/* Main envelope */}
      <g transform="translate(80, 100)">
        {/* Envelope body */}
        <rect
          width="240"
          height="160"
          rx="12"
          className="fill-[var(--illust-primary)]"
        />
        {/* Envelope flap */}
        <path
          d="M0 12 L120 90 L240 12"
          className="fill-[var(--illust-medium)]"
        />
        <path
          d="M0 12 L120 90 L240 12"
          stroke="currentColor"
          strokeWidth="3"
          className="text-[var(--illust-secondary)]"
          fill="none"
        />
        {/* Inner fold lines */}
        <path
          d="M0 160 L100 100"
          stroke="currentColor"
          strokeWidth="2"
          className="text-[var(--illust-secondary)]"
          style={{ opacity: 0.5 }}
          fill="none"
        />
        <path
          d="M240 160 L140 100"
          stroke="currentColor"
          strokeWidth="2"
          className="text-[var(--illust-secondary)]"
          style={{ opacity: 0.5 }}
          fill="none"
        />
      </g>

      {/* Paper coming out */}
      <g transform="translate(110, 60)">
        <rect
          width="180"
          height="120"
          rx="8"
          className="fill-[var(--background)]"
        />
        {/* Text lines on paper */}
        <rect x="20" y="20" width="80" height="8" rx="2" className="fill-[var(--illust-primary)]" />
        <rect x="20" y="38" width="140" height="6" rx="2" className="fill-[var(--illust-light)]" />
        <rect x="20" y="52" width="120" height="6" rx="2" className="fill-[var(--illust-light)]" />
        <rect x="20" y="66" width="100" height="6" rx="2" className="fill-[var(--illust-light)]" />
        <rect x="20" y="90" width="60" height="8" rx="2" className="fill-[var(--illust-primary)]" />
      </g>

      {/* Chat bubble 1 */}
      <g transform="translate(280, 60)">
        <rect width="80" height="55" rx="10" className="fill-[var(--illust-light)]" style={{ opacity: 0.9 }} />
        <polygon points="15,55 25,55 20,68" className="fill-[var(--illust-light)]" style={{ opacity: 0.9 }} />
        <rect x="12" y="15" width="56" height="6" rx="2" className="fill-[var(--illust-medium)]" />
        <rect x="12" y="28" width="40" height="6" rx="2" className="fill-[var(--illust-primary)]" />
        <rect x="12" y="41" width="48" height="6" rx="2" className="fill-[var(--illust-primary)]" />
      </g>

      {/* Chat bubble 2 */}
      <g transform="translate(20, 200)">
        <rect width="70" height="50" rx="10" className="fill-[var(--illust-medium-light)]" style={{ opacity: 0.8 }} />
        <polygon points="55,50 65,50 60,62" className="fill-[var(--illust-medium-light)]" style={{ opacity: 0.8 }} />
        <rect x="10" y="12" width="50" height="6" rx="2" className="fill-[var(--illust-secondary)]" />
        <rect x="10" y="25" width="35" height="6" rx="2" className="fill-[var(--illust-medium)]" />
        <rect x="10" y="38" width="42" height="6" rx="2" className="fill-[var(--illust-medium)]" />
      </g>

      {/* @ symbol */}
      <g transform="translate(320, 280)">
        <circle cx="30" cy="30" r="28" className="stroke-[var(--illust-primary)]" strokeWidth="4" fill="none" />
        <path
          d="M30 18 C20 18 14 26 14 34 C14 42 20 48 30 48 C38 48 44 44 46 38"
          className="stroke-[var(--illust-primary)]"
          strokeWidth="4"
          fill="none"
        />
        <circle cx="30" cy="32" r="10" className="stroke-[var(--illust-primary)]" strokeWidth="4" fill="none" />
      </g>

      {/* Send icon / paper plane */}
      <g transform="translate(30, 80)">
        <path
          d="M10 40 L50 25 L40 55 L30 35 Z"
          className="fill-[var(--illust-secondary)]"
        />
        <path
          d="M30 35 L50 25"
          className="stroke-[var(--illust-primary)]"
          strokeWidth="2"
        />
      </g>

      {/* Notification bell */}
      <g transform="translate(340, 180)">
        <path
          d="M20 35 C20 20 10 15 10 15 L10 10 C10 5 30 5 30 10 L30 15 C30 15 20 20 20 35"
          className="fill-[var(--illust-secondary)]"
        />
        <ellipse cx="20" cy="35" rx="15" ry="5" className="fill-[var(--illust-secondary)]" />
        <circle cx="20" cy="45" r="5" className="fill-[var(--illust-primary)]" />
        {/* Notification dot */}
        <circle cx="32" cy="10" r="6" className="fill-red-400" />
      </g>

      {/* Decorative elements */}
      <circle cx="60" cy="320" r="10" className="fill-[var(--illust-primary-50)]" />
      <circle cx="350" cy="150" r="8" className="fill-[var(--illust-secondary-50)]" style={{ opacity: 0.8 }} />
      <circle cx="180" cy="340" r="12" className="fill-[var(--illust-light-60)]" />

      {/* Connection dashes */}
      <path
        d="M90 200 Q70 160 80 130"
        stroke="currentColor"
        strokeWidth="2"
        strokeDasharray="6 4"
        className="text-[var(--illust-secondary)]"
        fill="none"
      />
      <path
        d="M280 130 Q300 100 310 80"
        stroke="currentColor"
        strokeWidth="2"
        strokeDasharray="6 4"
        className="text-[var(--illust-secondary)]"
        fill="none"
      />
      <path
        d="M320 260 Q310 240 320 220"
        stroke="currentColor"
        strokeWidth="2"
        strokeDasharray="6 4"
        className="text-[var(--illust-secondary)]"
        fill="none"
      />
    </svg>
  );
}
