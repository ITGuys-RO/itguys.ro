import { getCombinedYears, getCombinedYearsText } from "@/lib/utils";

export const homeContent = {
  hero: {
    headline: "Web, Mobile & Sicherheit. Richtig gemacht.",
    subheadline:
      `Über ${getCombinedYears()} Jahre kombinierte Erfahrung bei Electronic Arts, TUI und Nagarro. Wir entwickeln maßgeschneiderte Anwendungen und schützen sie.`,
    cta: {
      text: "Lassen Sie uns reden",
      href: "/contact",
    },
    secondaryCta: {
      text: "Unsere Arbeit ansehen",
      href: "/portfolio",
    },
    badgeText: "Verfügbar für neue Projekte",
  },

  stats: [
    { value: getCombinedYearsText(), label: "Jahre Erfahrung" },
    { value: "Schweiz", label: "Webentwicklung" },
    { value: "Nagarro", label: "Mobile Expertise" },
    { value: "EA & TUI", label: "Sicherheitserfahrung" },
  ],

  whatSetsUsApart: {
    title: "Was uns unterscheidet",
    body: [
      "Wir sind nicht nur Entwickler, die über Sicherheit lesen. Wir haben Penetrationstests bei Electronic Arts durchgeführt und DDoS-Schutzsysteme bei TUI aufgebaut. Wenn wir Code schreiben, denken wir darüber nach, wie er angegriffen werden könnte.",
      "Brauchen Sie eine mobile App? Unser nativer iOS/Android-Ingenieur hat über 5 Jahre bei Nagarro Apps für IoT, Gesundheitswesen und E-Commerce entwickelt. Keine React Native Kompromisse. Echte native Entwicklung, wenn es darauf ankommt.",
    ],
  },

  whoWeWorkWith: {
    title: "Mit wem wir arbeiten",
    items: [
      {
        title: "Startups",
        description:
          "Vom MVP zum Markt. Web-Apps, mobile Apps oder beides. Wir helfen Gründern, Ideen in funktionierende Produkte zu verwandeln - schnell und skalierbar.",
      },
      {
        title: "Enterprise-Teams",
        description:
          "Erfahrung bei Nagarro, TUI und Schweizer Enterprise-Kunden. Eigenständige Module, sichere Integrationen und Systeme, die Compliance-Anforderungen erfüllen.",
      },
    ],
  },

  whatWeBuild: {
    title: "Was wir bauen",
    categories: ["Web-Apps", "Mobile Apps", "APIs & Backends", "Sicherheit"],
    body: [
      "Web-Apps, native mobile Apps, APIs, Cloud-Infrastruktur. PHP, Swift, Kotlin, Docker, AWS. Wir wählen den Ansatz, der zu Ihren Nutzern und Ihrem Budget passt, nicht zu unseren Vorlieben.",
      "Sicherheit ist eingebaut, nicht nachträglich hinzugefügt. Penetrationstests, Akamai- und Cloudflare-Konfiguration, Cloud-Sicherheitsaudits. Die gleichen Standards, die wir bei EA und TUI angewandt haben.",
    ],
    link: {
      text: "Services ansehen",
      href: "/development",
    },
  },

  cta: {
    headline: "Bereit, etwas zu bauen?",
    body: "Erzählen Sie uns von Ihrem Projekt. Wir sagen Ihnen ehrlich, wie wir helfen können.",
    buttonText: "Kontaktieren Sie uns",
    buttonHref: "/contact",
  },
};
