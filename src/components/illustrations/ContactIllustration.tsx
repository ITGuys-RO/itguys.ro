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
          className="fill-brand-400 dark:fill-brand-500"
        />
        {/* Envelope flap */}
        <path
          d="M0 12 L120 90 L240 12"
          className="fill-brand-500 dark:fill-brand-400"
        />
        <path
          d="M0 12 L120 90 L240 12"
          stroke="currentColor"
          strokeWidth="3"
          className="text-brand-300 dark:text-brand-600"
          fill="none"
        />
        {/* Inner fold lines */}
        <path
          d="M0 160 L100 100"
          stroke="currentColor"
          strokeWidth="2"
          className="text-brand-300/50 dark:text-brand-600/50"
          fill="none"
        />
        <path
          d="M240 160 L140 100"
          stroke="currentColor"
          strokeWidth="2"
          className="text-brand-300/50 dark:text-brand-600/50"
          fill="none"
        />
      </g>

      {/* Paper coming out */}
      <g transform="translate(110, 60)">
        <rect
          width="180"
          height="120"
          rx="8"
          className="fill-white dark:fill-zinc-100"
        />
        {/* Text lines on paper */}
        <rect x="20" y="20" width="80" height="8" rx="2" className="fill-brand-400 dark:fill-brand-500" />
        <rect x="20" y="38" width="140" height="6" rx="2" className="fill-brand-200 dark:fill-brand-700" />
        <rect x="20" y="52" width="120" height="6" rx="2" className="fill-brand-200 dark:fill-brand-700" />
        <rect x="20" y="66" width="100" height="6" rx="2" className="fill-brand-200 dark:fill-brand-700" />
        <rect x="20" y="90" width="60" height="8" rx="2" className="fill-brand-400 dark:fill-brand-500" />
      </g>

      {/* Chat bubble 1 */}
      <g transform="translate(280, 60)">
        <rect width="80" height="55" rx="10" className="fill-brand-200/90 dark:fill-brand-800/90" />
        <polygon points="15,55 25,55 20,68" className="fill-brand-200/90 dark:fill-brand-800/90" />
        <rect x="12" y="15" width="56" height="6" rx="2" className="fill-brand-500 dark:fill-brand-400" />
        <rect x="12" y="28" width="40" height="6" rx="2" className="fill-brand-400 dark:fill-brand-500" />
        <rect x="12" y="41" width="48" height="6" rx="2" className="fill-brand-400 dark:fill-brand-500" />
      </g>

      {/* Chat bubble 2 */}
      <g transform="translate(20, 200)">
        <rect width="70" height="50" rx="10" className="fill-brand-300/80 dark:fill-brand-700/80" />
        <polygon points="55,50 65,50 60,62" className="fill-brand-300/80 dark:fill-brand-700/80" />
        <rect x="10" y="12" width="50" height="6" rx="2" className="fill-brand-600 dark:fill-brand-300" />
        <rect x="10" y="25" width="35" height="6" rx="2" className="fill-brand-500 dark:fill-brand-400" />
        <rect x="10" y="38" width="42" height="6" rx="2" className="fill-brand-500 dark:fill-brand-400" />
      </g>

      {/* @ symbol */}
      <g transform="translate(320, 280)">
        <circle cx="30" cy="30" r="28" className="stroke-brand-400 dark:stroke-brand-500" strokeWidth="4" fill="none" />
        <path
          d="M30 18 C20 18 14 26 14 34 C14 42 20 48 30 48 C38 48 44 44 46 38"
          className="stroke-brand-400 dark:stroke-brand-500"
          strokeWidth="4"
          fill="none"
        />
        <circle cx="30" cy="32" r="10" className="stroke-brand-400 dark:stroke-brand-500" strokeWidth="4" fill="none" />
      </g>

      {/* Send icon / paper plane */}
      <g transform="translate(30, 80)">
        <path
          d="M10 40 L50 25 L40 55 L30 35 Z"
          className="fill-brand-300 dark:fill-brand-600"
        />
        <path
          d="M30 35 L50 25"
          className="stroke-brand-400 dark:stroke-brand-500"
          strokeWidth="2"
        />
      </g>

      {/* Notification bell */}
      <g transform="translate(340, 180)">
        <path
          d="M20 35 C20 20 10 15 10 15 L10 10 C10 5 30 5 30 10 L30 15 C30 15 20 20 20 35"
          className="fill-brand-300 dark:fill-brand-600"
        />
        <ellipse cx="20" cy="35" rx="15" ry="5" className="fill-brand-300 dark:fill-brand-600" />
        <circle cx="20" cy="45" r="5" className="fill-brand-400 dark:fill-brand-500" />
        {/* Notification dot */}
        <circle cx="32" cy="10" r="6" className="fill-red-400" />
      </g>

      {/* Decorative elements */}
      <circle cx="60" cy="320" r="10" className="fill-brand-400/50 dark:fill-brand-500/50" />
      <circle cx="350" cy="150" r="8" className="fill-brand-300/40 dark:fill-brand-600/40" />
      <circle cx="180" cy="340" r="12" className="fill-brand-200/60 dark:fill-brand-700/60" />

      {/* Connection dashes */}
      <path
        d="M90 200 Q70 160 80 130"
        stroke="currentColor"
        strokeWidth="2"
        strokeDasharray="6 4"
        className="text-brand-300 dark:text-brand-600"
        fill="none"
      />
      <path
        d="M280 130 Q300 100 310 80"
        stroke="currentColor"
        strokeWidth="2"
        strokeDasharray="6 4"
        className="text-brand-300 dark:text-brand-600"
        fill="none"
      />
      <path
        d="M320 260 Q310 240 320 220"
        stroke="currentColor"
        strokeWidth="2"
        strokeDasharray="6 4"
        className="text-brand-300 dark:text-brand-600"
        fill="none"
      />
    </svg>
  );
}
