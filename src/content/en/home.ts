import { getCombinedYearsText } from "@/lib/utils";

export const homeContent = {
  hero: {
    headline: "Web, Mobile & Security. Done Right.",
    subheadline:
      `${getCombinedYearsText()} combined years from Electronic Arts, TUI, and Nagarro. We build custom applications and keep them protected.`,
    cta: {
      text: "Let's Talk",
      href: "/contact",
    },
    secondaryCta: {
      text: "View Our Work",
      href: "/portfolio",
    },
    badgeText: "Available for new projects",
  },

  stats: [
    { value: getCombinedYearsText(), label: "Combined Years" },
    { value: "Swiss Clients", label: "Web Development" },
    { value: "Nagarro", label: "Mobile Expertise" },
    { value: "EA & TUI", label: "Security Background" },
  ],

  whatSetsUsApart: {
    title: "What sets us apart",
    body: [
      "We're not just developers who read about security. We've done penetration testing at Electronic Arts and built DDoS protection systems at TUI. When we write code, we think about how it could be attacked.",
      "Need a mobile app? Our native iOS/Android engineer spent 5+ years at Nagarro building apps for IoT, healthcare, and e-commerce. Not React Native compromises. Real native development when it matters.",
    ],
  },

  whoWeWorkWith: {
    title: "Who we work with",
    items: [
      {
        title: "Startups",
        description:
          "From MVP to market. Web apps, mobile apps, or both. We help founders turn ideas into working products, fast and ready to scale.",
      },
      {
        title: "Enterprise Teams",
        description:
          "Experience at Nagarro, TUI, and Swiss enterprise clients. Standalone modules, secure integrations, and systems that meet compliance requirements.",
      },
    ],
  },

  whatWeBuild: {
    title: "What we build",
    categories: ["Web Apps", "Mobile Apps", "APIs & Backends", "Security"],
    body: [
      "Web apps, native mobile apps, APIs, cloud infrastructure. PHP, Swift, Kotlin, Docker, AWS. We choose the approach that fits your users and budget, not our preferences.",
      "Security is built in, not bolted on. Penetration testing, Akamai and Cloudflare configuration, cloud security reviews. The same standards we applied at EA and TUI.",
    ],
    link: {
      text: "See Services",
      href: "/development",
    },
  },

  cta: {
    headline: "Ready to Build Something?",
    body: "Tell us about your project. We'll tell you honestly how we can help.",
    buttonText: "Get in Touch",
    buttonHref: "/contact",
  },
};
