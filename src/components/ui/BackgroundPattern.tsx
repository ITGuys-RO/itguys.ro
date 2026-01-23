export function GridPattern({ className = "" }: { className?: string }) {
  return (
    <div className={`absolute inset-0 overflow-hidden pointer-events-none ${className}`}>
      <svg className="absolute w-full h-full" xmlns="http://www.w3.org/2000/svg">
        <defs>
          <pattern
            id="grid-pattern"
            width="40"
            height="40"
            patternUnits="userSpaceOnUse"
          >
            <path
              d="M 40 0 L 0 0 0 40"
              fill="none"
              stroke="currentColor"
              strokeWidth="0.5"
              className="text-brand-400/10 dark:text-brand-400/10"
            />
          </pattern>
        </defs>
        <rect width="100%" height="100%" fill="url(#grid-pattern)" />
      </svg>
      {/* Fade edges */}
      <div className="absolute inset-0 bg-gradient-to-b from-brand-50 via-transparent to-brand-50 dark:from-brand-950 dark:via-transparent dark:to-brand-950" />
    </div>
  );
}

export function CyberGrid({ className = "" }: { className?: string }) {
  return (
    <div className={`absolute inset-0 overflow-hidden pointer-events-none ${className}`}>
      {/* Perspective grid floor effect */}
      <div className="absolute inset-x-0 bottom-0 h-[60%] overflow-hidden">
        <div
          className="absolute inset-0 animate-grid-pulse"
          style={{
            backgroundImage: `
              linear-gradient(rgba(81, 116, 161, 0.15) 1px, transparent 1px),
              linear-gradient(90deg, rgba(81, 116, 161, 0.15) 1px, transparent 1px)
            `,
            backgroundSize: '60px 60px',
            transform: 'perspective(500px) rotateX(60deg)',
            transformOrigin: 'center top',
          }}
        />
      </div>
      {/* Horizon glow line */}
      <div className="absolute inset-x-0 top-[40%] h-px bg-gradient-to-r from-transparent via-neon/30 to-transparent" />
      {/* Vertical accent lines */}
      <div className="absolute left-1/4 top-0 bottom-0 w-px bg-gradient-to-b from-transparent via-brand-400/10 to-transparent" />
      <div className="absolute right-1/4 top-0 bottom-0 w-px bg-gradient-to-b from-transparent via-brand-400/10 to-transparent" />
    </div>
  );
}

export function ScanlineOverlay({ className = "" }: { className?: string }) {
  return (
    <div className={`absolute inset-0 overflow-hidden pointer-events-none ${className}`}>
      {/* Subtle CRT scanlines */}
      <div
        className="absolute inset-0 opacity-[0.02]"
        style={{
          backgroundImage: 'repeating-linear-gradient(0deg, transparent, transparent 2px, rgba(0, 0, 0, 0.3) 2px, rgba(0, 0, 0, 0.3) 4px)',
        }}
      />
      {/* Moving scan line */}
      <div
        className="absolute inset-x-0 h-24 bg-gradient-to-b from-transparent via-neon/5 to-transparent animate-scan-line"
        style={{ top: '-6rem' }}
      />
    </div>
  );
}

export function DotPattern({ className = "" }: { className?: string }) {
  return (
    <div className={`absolute inset-0 overflow-hidden pointer-events-none ${className}`}>
      <svg className="absolute w-full h-full" xmlns="http://www.w3.org/2000/svg">
        <defs>
          <pattern
            id="dot-pattern"
            width="24"
            height="24"
            patternUnits="userSpaceOnUse"
          >
            <circle
              cx="2"
              cy="2"
              r="1"
              className="fill-brand-400/20 dark:fill-brand-400/15"
            />
          </pattern>
        </defs>
        <rect width="100%" height="100%" fill="url(#dot-pattern)" />
      </svg>
    </div>
  );
}

export function GradientBlob({ className = "" }: { className?: string }) {
  return (
    <div className={`absolute pointer-events-none ${className}`}>
      {/* Neon-accented blobs */}
      <div className="absolute top-0 -left-4 w-72 h-72 bg-brand-400/20 dark:bg-brand-400/15 rounded-full mix-blend-screen filter blur-3xl animate-blob" />
      <div className="absolute top-0 -right-4 w-72 h-72 bg-neon/15 dark:bg-neon/10 rounded-full mix-blend-screen filter blur-3xl animate-blob animation-delay-2000" />
      <div className="absolute -bottom-8 left-20 w-72 h-72 bg-brand-300/20 dark:bg-brand-500/15 rounded-full mix-blend-screen filter blur-3xl animate-blob animation-delay-4000" />
    </div>
  );
}

export function HexPattern({ className = "" }: { className?: string }) {
  return (
    <div className={`absolute inset-0 overflow-hidden pointer-events-none ${className}`}>
      <svg className="absolute w-full h-full opacity-[0.03]" xmlns="http://www.w3.org/2000/svg">
        <defs>
          <pattern
            id="hex-pattern"
            width="56"
            height="100"
            patternUnits="userSpaceOnUse"
            patternTransform="scale(1)"
          >
            <path
              d="M28 66L0 50L0 16L28 0L56 16L56 50L28 66L28 100"
              fill="none"
              stroke="currentColor"
              strokeWidth="0.5"
              className="text-brand-400"
            />
            <path
              d="M28 0L28 34L0 50L0 84L28 100L56 84L56 50L28 34"
              fill="none"
              stroke="currentColor"
              strokeWidth="0.5"
              className="text-brand-400"
            />
          </pattern>
        </defs>
        <rect width="100%" height="100%" fill="url(#hex-pattern)" />
      </svg>
    </div>
  );
}

export function CornerAccents({ className = "" }: { className?: string }) {
  return (
    <div className={`absolute inset-0 pointer-events-none ${className}`}>
      {/* Top-left corner */}
      <div className="absolute top-0 left-0 w-16 h-16">
        <div className="absolute top-0 left-0 w-full h-px bg-gradient-to-r from-neon/50 to-transparent" />
        <div className="absolute top-0 left-0 h-full w-px bg-gradient-to-b from-neon/50 to-transparent" />
      </div>
      {/* Top-right corner */}
      <div className="absolute top-0 right-0 w-16 h-16">
        <div className="absolute top-0 right-0 w-full h-px bg-gradient-to-l from-neon/50 to-transparent" />
        <div className="absolute top-0 right-0 h-full w-px bg-gradient-to-b from-neon/50 to-transparent" />
      </div>
      {/* Bottom-left corner */}
      <div className="absolute bottom-0 left-0 w-16 h-16">
        <div className="absolute bottom-0 left-0 w-full h-px bg-gradient-to-r from-neon/50 to-transparent" />
        <div className="absolute bottom-0 left-0 h-full w-px bg-gradient-to-t from-neon/50 to-transparent" />
      </div>
      {/* Bottom-right corner */}
      <div className="absolute bottom-0 right-0 w-16 h-16">
        <div className="absolute bottom-0 right-0 w-full h-px bg-gradient-to-l from-neon/50 to-transparent" />
        <div className="absolute bottom-0 right-0 h-full w-px bg-gradient-to-t from-neon/50 to-transparent" />
      </div>
    </div>
  );
}
