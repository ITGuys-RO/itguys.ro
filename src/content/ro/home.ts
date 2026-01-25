import { getCombinedYears, getCombinedYearsText } from "@/lib/utils";

export const homeContent = {
  hero: {
    headline: "Web, mobile și securitate. Făcute cum trebuie.",
    subheadline:
      `Peste ${getCombinedYears()} de ani de experiență combinată de la Electronic Arts, TUI și Nagarro. Construim aplicații personalizate și le protejăm.`,
    cta: {
      text: "Hai să vorbim",
      href: "/contact",
    },
    secondaryCta: {
      text: "Vezi portofoliul",
      href: "/portfolio",
    },
    badgeText: "Disponibil pentru proiecte noi",
  },

  stats: [
    { value: getCombinedYearsText(), label: "Ani de experiență" },
    { value: "Elveția", label: "Dezvoltare Web" },
    { value: "Nagarro", label: "Expertiză mobile" },
    { value: "EA & TUI", label: "Experiență securitate" },
  ],

  whatSetsUsApart: {
    title: "Ce ne diferențiază",
    body: [
      "Nu suntem doar programatori care citesc despre securitate. Am făcut teste de penetrare la Electronic Arts și am construit sisteme de protecție DDoS la TUI. Când scriem cod, ne gândim și la cum ar putea fi atacat.",
      "Ai nevoie de o aplicație mobilă? Inginerul nostru nativ iOS/Android a petrecut peste 5 ani la Nagarro construind aplicații pentru IoT, sănătate și e-commerce. Fără compromisuri React Native. Dezvoltare nativă reală când contează.",
    ],
  },

  whoWeWorkWith: {
    title: "Cu cine lucrăm",
    items: [
      {
        title: "Startup-uri",
        description:
          "De la MVP la primii utilizatori. Aplicații web, mobile sau ambele. Ajutăm fondatorii să transforme ideile în produse funcționale, rapide și pregătite pentru creștere.",
      },
      {
        title: "Echipe Enterprise",
        description:
          "Experiență la Nagarro, TUI și clienți enterprise elvețieni. Module independente, integrări sigure și sisteme care îndeplinesc cerințele de conformitate.",
      },
    ],
  },

  whatWeBuild: {
    title: "Ce construim",
    categories: ["Aplicații web", "Aplicații mobile", "API-uri & Backend", "Securitate"],
    body: [
      "Aplicații web, aplicații mobile native, API-uri, infrastructură cloud. PHP, Swift, Kotlin, Docker, AWS. Alegem abordarea care se potrivește utilizatorilor și bugetului tău, nu preferințelor noastre.",
      "Securitatea este integrată, nu adăugată ulterior. Teste de penetrare, configurare Akamai și Cloudflare, audituri de securitate cloud. Aceleași standarde pe care le-am aplicat la EA și TUI.",
    ],
    link: {
      text: "Vezi serviciile",
      href: "/development",
    },
  },

  cta: {
    headline: "Pregătit să construiești ceva?",
    body: "Spune-ne despre proiectul tău. Îți vom spune sincer cum te putem ajuta.",
    buttonText: "Contactează-ne",
    buttonHref: "/contact",
  },
};
