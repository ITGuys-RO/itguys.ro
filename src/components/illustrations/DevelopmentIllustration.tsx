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
        className="fill-[var(--illust-secondary-30)]"
        style={{ fontSize: "120px", fontFamily: "monospace", fontWeight: "bold" }}
      >
        {"<"}
      </text>
      <text
        x="280"
        y="340"
        className="fill-[var(--illust-secondary-30)]"
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
          className="fill-[var(--terminal-frame)]"
        />
        {/* Title bar */}
        <rect
          x="0"
          y="0"
          width="240"
          height="30"
          rx="12"
          className="fill-[var(--terminal-titlebar)]"
        />
        <rect
          x="0"
          y="15"
          width="240"
          height="15"
          className="fill-[var(--terminal-titlebar)]"
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
          className="fill-[var(--terminal-content)]"
        />

        {/* Code lines */}
        <text x="20" y="62" className="fill-purple-400" style={{ fontSize: "11px", fontFamily: "monospace" }}>const</text>
        <text x="52" y="62" className="fill-blue-400" style={{ fontSize: "11px", fontFamily: "monospace" }}>app</text>
        <text x="72" y="62" className="fill-[var(--terminal-text)]" style={{ fontSize: "11px", fontFamily: "monospace" }}>=</text>
        <text x="82" y="62" className="fill-yellow-400" style={{ fontSize: "11px", fontFamily: "monospace" }}>create()</text>

        <text x="20" y="82" className="fill-purple-400" style={{ fontSize: "11px", fontFamily: "monospace" }}>async</text>
        <text x="55" y="82" className="fill-blue-400" style={{ fontSize: "11px", fontFamily: "monospace" }}>function</text>
        <text x="105" y="82" className="fill-yellow-400" style={{ fontSize: "11px", fontFamily: "monospace" }}>build()</text>
        <text x="155" y="82" className="fill-[var(--terminal-text)]" style={{ fontSize: "11px", fontFamily: "monospace" }}>{"{"}</text>

        <text x="30" y="102" className="fill-purple-400" style={{ fontSize: "11px", fontFamily: "monospace" }}>await</text>
        <text x="65" y="102" className="fill-blue-400" style={{ fontSize: "11px", fontFamily: "monospace" }}>deploy()</text>

        <text x="30" y="122" className="fill-purple-400" style={{ fontSize: "11px", fontFamily: "monospace" }}>return</text>
        <text x="72" y="122" className="fill-green-400" style={{ fontSize: "11px", fontFamily: "monospace" }}>"success"</text>

        <text x="20" y="142" className="fill-[var(--terminal-text)]" style={{ fontSize: "11px", fontFamily: "monospace" }}>{"}"}</text>

        {/* Cursor */}
        <rect x="20" y="150" width="8" height="14" className="fill-[var(--illust-primary)]" />
      </g>

      {/* Floating gear */}
      <g transform="translate(300, 60)">
        <circle cx="30" cy="30" r="28" className="stroke-[var(--illust-primary)]" strokeWidth="4" fill="none" />
        <circle cx="30" cy="30" r="12" className="fill-[var(--illust-primary)]" />
        {[0, 45, 90, 135, 180, 225, 270, 315].map((angle) => (
          <rect
            key={angle}
            x="26"
            y="-4"
            width="8"
            height="14"
            rx="3"
            className="fill-[var(--illust-primary)]"
            transform={`rotate(${angle} 30 30)`}
          />
        ))}
      </g>

      {/* Floating component block */}
      <g transform="translate(20, 220)">
        <rect width="70" height="70" rx="12" className="fill-[var(--illust-light-80)]" />
        <rect x="12" y="15" width="46" height="8" rx="2" className="fill-[var(--illust-medium)]" />
        <rect x="12" y="30" width="30" height="6" rx="2" className="fill-[var(--illust-primary)]" />
        <rect x="12" y="42" width="40" height="6" rx="2" className="fill-[var(--illust-primary)]" />
        <rect x="12" y="54" width="25" height="6" rx="2" className="fill-[var(--illust-medium)]" />
      </g>

      {/* Git branch icon */}
      <g transform="translate(330, 280)">
        <circle cx="20" cy="15" r="8" className="stroke-[var(--illust-secondary)]" strokeWidth="3" fill="none" />
        <circle cx="20" cy="55" r="8" className="stroke-[var(--illust-secondary)]" strokeWidth="3" fill="none" />
        <circle cx="45" cy="35" r="8" className="stroke-[var(--illust-secondary)]" strokeWidth="3" fill="none" />
        <path d="M20 23 L20 47" className="stroke-[var(--illust-secondary)]" strokeWidth="3" />
        <path d="M27 20 Q35 20 40 28" className="stroke-[var(--illust-secondary)]" strokeWidth="3" fill="none" />
      </g>

      {/* Decorative dots */}
      <circle cx="60" cy="80" r="8" className="fill-[var(--illust-primary-50)]" />
      <circle cx="370" cy="200" r="10" className="fill-[var(--illust-secondary-50)]" style={{ opacity: 0.8 }} />
      <circle cx="40" cy="350" r="6" className="fill-[var(--illust-primary-50)]" style={{ opacity: 0.8 }} />

      {/* Connection dashes */}
      <path
        d="M90 220 Q60 180 70 140"
        stroke="currentColor"
        strokeWidth="2"
        strokeDasharray="6 4"
        className="text-[var(--illust-secondary)]"
        fill="none"
      />
      <path
        d="M320 110 Q340 140 340 180"
        stroke="currentColor"
        strokeWidth="2"
        strokeDasharray="6 4"
        className="text-[var(--illust-secondary)]"
        fill="none"
      />
    </svg>
  );
}
