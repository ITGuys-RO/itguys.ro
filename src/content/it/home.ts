import { getCombinedYears, getCombinedYearsText } from "@/lib/utils";

export const homeContent = {
  hero: {
    headline: "Web, Mobile & Sicurezza. Fatti Bene.",
    subheadline:
      `${getCombinedYearsText()} anni di esperienza combinata da Electronic Arts, TUI e Nagarro. Costruiamo applicazioni personalizzate e le manteniamo protette.`,
    cta: {
      text: "Parliamone",
      href: "/contact",
    },
    secondaryCta: {
      text: "Vedi i Nostri Lavori",
      href: "/portfolio",
    },
    badgeText: "Disponibili per nuovi progetti",
  },

  stats: [
    { value: getCombinedYearsText(), label: "Anni Combinati" },
    { value: "EA & TUI", label: "Background Sicurezza" },
    { value: "Nagarro", label: "Esperienza Mobile" },
  ],

  whatSetsUsApart: {
    title: "Cosa ci distingue",
    body: [
      "Non siamo solo sviluppatori che leggono di sicurezza. Abbiamo fatto penetration testing per Electronic Arts e costruito sistemi di protezione DDoS per TUI. Quando scriviamo codice, pensiamo a come potrebbe essere attaccato.",
      "Hai bisogno di un'app mobile? Il nostro ingegnere iOS/Android nativo ha trascorso oltre 5 anni in Nagarro costruendo app per IoT, sanita e e-commerce. Niente compromessi React Native. Vero sviluppo nativo quando conta.",
    ],
  },

  whoWeWorkWith: {
    title: "Con chi lavoriamo",
    items: [
      {
        title: "Startup",
        description:
          "Dall'MVP al mercato. Web app, app mobile o entrambe. Aiutiamo i fondatori a trasformare idee in prodotti funzionanti, veloci e pronti a scalare.",
      },
      {
        title: "Team Enterprise",
        description:
          "Esperienza in Nagarro, TUI e clienti enterprise svizzeri. Moduli standalone, integrazioni sicure e sistemi che soddisfano i requisiti di conformita.",
      },
    ],
  },

  whatWeBuild: {
    title: "Cosa costruiamo",
    categories: ["Web App", "App Mobile", "API & Backend", "Sicurezza"],
    body: [
      "Web app, app mobile native, API, infrastruttura cloud. PHP, Swift, Kotlin, Docker, AWS. Scegliamo l'approccio che si adatta ai tuoi utenti e budget, non alle nostre preferenze.",
      "La sicurezza e integrata, non aggiunta dopo. Penetration testing, configurazione Akamai e Cloudflare, revisioni di sicurezza cloud. Gli stessi standard che abbiamo applicato in EA e TUI.",
    ],
    link: {
      text: "Vedi Servizi",
      href: "/development",
    },
  },

  cta: {
    headline: "Pronto a Costruire Qualcosa?",
    body: "Raccontaci del tuo progetto. Ti diremo onestamente come possiamo aiutarti.",
    buttonText: "Contattaci",
    buttonHref: "/contact",
  },
};
