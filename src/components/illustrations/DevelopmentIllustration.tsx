export function DevelopmentIllustration({ className = "" }: { className?: string }) {
  return (
    <svg
      viewBox="0 0 400 400"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      className={className}
    >
      {/* Code brackets background */}
      <text
        x="40"
        y="120"
        className="fill-brand-300/30 dark:fill-brand-600/30"
        style={{ fontSize: "120px", fontFamily: "monospace", fontWeight: "bold" }}
      >
        {"<"}
      </text>
      <text
        x="280"
        y="340"
        className="fill-brand-300/30 dark:fill-brand-600/30"
        style={{ fontSize: "120px", fontFamily: "monospace", fontWeight: "bold" }}
      >
        {"/>"}
      </text>

      {/* Terminal window */}
      <g transform="translate(80, 100)">
        <rect
          width="240"
          height="180"
          rx="12"
          className="fill-zinc-800 dark:fill-zinc-200"
        />
        {/* Title bar */}
        <rect
          x="0"
          y="0"
          width="240"
          height="30"
          rx="12"
          className="fill-zinc-700 dark:fill-zinc-300"
        />
        <rect
          x="0"
          y="15"
          width="240"
          height="15"
          className="fill-zinc-700 dark:fill-zinc-300"
        />
        {/* Window buttons */}
        <circle cx="20" cy="15" r="6" className="fill-red-400" />
        <circle cx="40" cy="15" r="6" className="fill-yellow-400" />
        <circle cx="60" cy="15" r="6" className="fill-green-400" />

        {/* Code content */}
        <rect
          x="12"
          y="40"
          width="216"
          height="130"
          rx="4"
          className="fill-zinc-900 dark:fill-zinc-100"
        />

        {/* Code lines */}
        <text x="20" y="62" className="fill-purple-400 dark:fill-purple-500" style={{ fontSize: "11px", fontFamily: "monospace" }}>const</text>
        <text x="52" y="62" className="fill-blue-300 dark:fill-blue-500" style={{ fontSize: "11px", fontFamily: "monospace" }}>app</text>
        <text x="72" y="62" className="fill-white dark:fill-zinc-800" style={{ fontSize: "11px", fontFamily: "monospace" }}>=</text>
        <text x="82" y="62" className="fill-yellow-300 dark:fill-yellow-500" style={{ fontSize: "11px", fontFamily: "monospace" }}>create()</text>

        <text x="20" y="82" className="fill-purple-400 dark:fill-purple-500" style={{ fontSize: "11px", fontFamily: "monospace" }}>async</text>
        <text x="55" y="82" className="fill-blue-300 dark:fill-blue-500" style={{ fontSize: "11px", fontFamily: "monospace" }}>function</text>
        <text x="105" y="82" className="fill-yellow-300 dark:fill-yellow-500" style={{ fontSize: "11px", fontFamily: "monospace" }}>build()</text>
        <text x="155" y="82" className="fill-white dark:fill-zinc-800" style={{ fontSize: "11px", fontFamily: "monospace" }}>{"{"}</text>

        <text x="30" y="102" className="fill-purple-400 dark:fill-purple-500" style={{ fontSize: "11px", fontFamily: "monospace" }}>await</text>
        <text x="65" y="102" className="fill-blue-300 dark:fill-blue-500" style={{ fontSize: "11px", fontFamily: "monospace" }}>deploy()</text>

        <text x="30" y="122" className="fill-purple-400 dark:fill-purple-500" style={{ fontSize: "11px", fontFamily: "monospace" }}>return</text>
        <text x="72" y="122" className="fill-green-300 dark:fill-green-500" style={{ fontSize: "11px", fontFamily: "monospace" }}>"success"</text>

        <text x="20" y="142" className="fill-white dark:fill-zinc-800" style={{ fontSize: "11px", fontFamily: "monospace" }}>{"}"}</text>

        {/* Cursor */}
        <rect x="20" y="150" width="8" height="14" className="fill-brand-400 dark:fill-brand-500" />
      </g>

      {/* Floating gear */}
      <g transform="translate(300, 60)">
        <circle cx="30" cy="30" r="28" className="stroke-brand-400 dark:stroke-brand-500" strokeWidth="4" fill="none" />
        <circle cx="30" cy="30" r="12" className="fill-brand-400 dark:fill-brand-500" />
        {[0, 45, 90, 135, 180, 225, 270, 315].map((angle) => (
          <rect
            key={angle}
            x="26"
            y="-4"
            width="8"
            height="14"
            rx="3"
            className="fill-brand-400 dark:fill-brand-500"
            transform={`rotate(${angle} 30 30)`}
          />
        ))}
      </g>

      {/* Floating component block */}
      <g transform="translate(20, 220)">
        <rect width="70" height="70" rx="12" className="fill-brand-200/80 dark:fill-brand-800/80" />
        <rect x="12" y="15" width="46" height="8" rx="2" className="fill-brand-500 dark:fill-brand-400" />
        <rect x="12" y="30" width="30" height="6" rx="2" className="fill-brand-400 dark:fill-brand-500" />
        <rect x="12" y="42" width="40" height="6" rx="2" className="fill-brand-400 dark:fill-brand-500" />
        <rect x="12" y="54" width="25" height="6" rx="2" className="fill-brand-500 dark:fill-brand-400" />
      </g>

      {/* Git branch icon */}
      <g transform="translate(330, 280)">
        <circle cx="20" cy="15" r="8" className="stroke-brand-300 dark:stroke-brand-600" strokeWidth="3" fill="none" />
        <circle cx="20" cy="55" r="8" className="stroke-brand-300 dark:stroke-brand-600" strokeWidth="3" fill="none" />
        <circle cx="45" cy="35" r="8" className="stroke-brand-300 dark:stroke-brand-600" strokeWidth="3" fill="none" />
        <path d="M20 23 L20 47" className="stroke-brand-300 dark:stroke-brand-600" strokeWidth="3" />
        <path d="M27 20 Q35 20 40 28" className="stroke-brand-300 dark:stroke-brand-600" strokeWidth="3" fill="none" />
      </g>

      {/* Decorative dots */}
      <circle cx="60" cy="80" r="8" className="fill-brand-400/50 dark:fill-brand-500/50" />
      <circle cx="370" cy="200" r="10" className="fill-brand-300/40 dark:fill-brand-600/40" />
      <circle cx="40" cy="350" r="6" className="fill-brand-400/60 dark:fill-brand-500/60" />

      {/* Connection dashes */}
      <path
        d="M90 220 Q60 180 70 140"
        stroke="currentColor"
        strokeWidth="2"
        strokeDasharray="6 4"
        className="text-brand-300 dark:text-brand-600"
        fill="none"
      />
      <path
        d="M320 110 Q340 140 340 180"
        stroke="currentColor"
        strokeWidth="2"
        strokeDasharray="6 4"
        className="text-brand-300 dark:text-brand-600"
        fill="none"
      />
    </svg>
  );
}
