import { getCombinedYears, getCombinedYearsText } from "@/lib/utils";

export const homeContent = {
  hero: {
    headline: "Web, Movil y Seguridad. Bien Hecho.",
    subheadline:
      `${getCombinedYearsText()} anos de experiencia combinada de Electronic Arts, TUI y Nagarro. Construimos aplicaciones personalizadas y las mantenemos protegidas.`,
    cta: {
      text: "Hablemos",
      href: "/contact",
    },
    secondaryCta: {
      text: "Ver Nuestro Trabajo",
      href: "/portfolio",
    },
    badgeText: "Disponibles para nuevos proyectos",
  },

  stats: [
    { value: getCombinedYearsText(), label: "Anos Combinados" },
    { value: "EA & TUI", label: "Experiencia en Seguridad" },
    { value: "Nagarro", label: "Experiencia Movil" },
  ],

  whatSetsUsApart: {
    title: "Lo que nos diferencia",
    body: [
      "No somos solo desarrolladores que leen sobre seguridad. Hemos hecho pruebas de penetracion en Electronic Arts y construido sistemas de proteccion DDoS en TUI. Cuando escribimos codigo, pensamos en como podria ser atacado.",
      "¿Necesitas una app móvil? Nuestro ingeniero nativo iOS/Android paso mas de 5 anos en Nagarro construyendo apps para IoT, salud y e-commerce. Sin compromisos de React Native. Desarrollo nativo real cuando importa.",
    ],
  },

  whoWeWorkWith: {
    title: "Con quien trabajamos",
    items: [
      {
        title: "Startups",
        description:
          "Del MVP al mercado. Web apps, apps moviles o ambas. Ayudamos a los fundadores a convertir ideas en productos funcionales, rapidos y listos para escalar.",
      },
      {
        title: "Equipos Enterprise",
        description:
          "Experiencia en Nagarro, TUI y clientes enterprise suizos. Modulos independientes, integraciones seguras y sistemas que cumplen con los requisitos de conformidad.",
      },
    ],
  },

  whatWeBuild: {
    title: "Lo que construimos",
    categories: ["Web Apps", "Apps Moviles", "APIs & Backends", "Seguridad"],
    body: [
      "Web apps, apps moviles nativas, APIs, infraestructura cloud. PHP, Swift, Kotlin, Docker, AWS. Elegimos el enfoque que se adapta a tus usuarios y presupuesto, no a nuestras preferencias.",
      "La seguridad esta integrada, no anadida despues. Pruebas de penetracion, configuracion de Akamai y Cloudflare, revisiones de seguridad cloud. Los mismos estandares que aplicamos en EA y TUI.",
    ],
    link: {
      text: "Ver Servicios",
      href: "/development",
    },
  },

  cta: {
    headline: "¿Listo para Construir Algo?",
    body: "Cuentanos sobre tu proyecto. Te diremos honestamente como podemos ayudarte.",
    buttonText: "Contactanos",
    buttonHref: "/contact",
  },
};
