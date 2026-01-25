import { getCombinedYearsText } from "@/lib/utils";

export const aboutContent = {
  hero: {
    headline: "Somos ITGuys",
    subheadline:
      `${getCombinedYearsText()} anos de experiencia combinada de Electronic Arts, TUI, Nagarro y empresas suizas. Web, movil y seguridad. Con sede en Rumania, trabajamos en todo el mundo.`,
  },

  vision: {
    title: "Nuestra Visión",
    body: [
      "No solo entregamos un servicio. Construimos relaciones reales con nuestros clientes, entendemos lo que quieren lograr y hacemos sus objetivos los nuestros.",
      "Siempre estamos aprendiendo. Cada proyecto nos enseña algo nuevo y nos permite probar lo que podemos hacer.",
      "Construimos software que se adapta a tu problema específico. Simple donde puede ser, robusto donde debe ser.",
    ],
    highlight: "Nosotros tenemos éxito cuando tú tienes éxito.",
  },

  ourStory: {
    title: "Nuestra Historia",
    body: [
      "ITGuys fue fundada por Catalin Teodorescu, un Senior Web Security Engineer con mas de 15 anos de experiencia en ciberseguridad, desarrollo full-stack y DevOps. Despues de trabajar en empresas como Electronic Arts y TUI, y pasar casi 7 anos construyendo software para clientes suizos, una cosa quedo clara: la mayoria de las agencias eligen su stack favorito y adaptan cada proyecto para que encaje.",
      "Nosotros hacemos lo opuesto. Tu producto merece los cimientos correctos, no los convenientes. Si eso significa PHP, Node, Python o algo completamente diferente, depende de lo que estes construyendo y quien lo usara.",
      "Nuestra experiencia en seguridad no esta separada de nuestro trabajo de desarrollo. Esta integrada en como pensamos sobre arquitectura, escribimos codigo y desplegamos sistemas. Cuando has pasado anos encontrando vulnerabilidades en el software de otros, aprendes a construir el tuyo de manera diferente.",
    ],
  },

  mission: {
    title: "Nuestra Misión",
    body: [
      "En ITGuys, nos importan dos cosas: código organizado y funcionalidades que realmente son útiles. Confiable para ti, simple para tus usuarios.",
      "Construimos cosas que unen a las personas y las mantienen seguras. Cosas que la gente realmente quiere usar y recomendar.",
      "Tomamos el trabajo en serio. Cada proyecto recibe toda nuestra atención.",
    ],
  },

  experience: {
    title: "Socios con los que Hemos Trabajado",
  },

  whatWeBelieve: {
    title: "Nuestros Principios",
    intro:
      "Escribimos código, pero eso no es todo lo que nos importa. Estamos orgullosos de lo que construimos. Estos principios definen cómo trabajamos.",
    values: [
      {
        title: "Simplicidad",
        description:
          "Codigo limpio y comprensible que es facil de retomar por cualquier desarrollador. Entregamos soluciones intuitivas y amigables libres de complejidad innecesaria.",
      },
      {
        title: "Confiabilidad",
        description:
          "Mejoras y actualizaciones constantes, adaptacion facilmente disponible a trafico inmenso. Sistemas que resisten la prueba del tiempo y el estres.",
      },
      {
        title: "Adaptabilidad",
        description:
          "Facilmente adaptable a las ricas demandas del publico y el mundo siempre cambiante de internet. Construimos para hoy y manana.",
      },
      {
        title: "Seguridad",
        description:
          "Con los ataques ciberneticos en aumento, nos aseguramos de que los productos se entreguen de forma segura sin comprometer la integridad del usuario. La seguridad es el requisito basico para cualquier interaccion posterior.",
      },
      {
        title: "La herramienta correcta para el trabajo",
        description:
          "No tenemos un lenguaje favorito. Tenemos un resultado favorito: software que funciona. Si eso significa aprender un nuevo framework, lo aprendemos.",
      },
      {
        title: "Comunicacion clara",
        description:
          "Siempre sabras donde esta tu proyecto, que decisiones estamos tomando y por que. Sin cajas negras.",
      },
    ],
  },

  deliveryModels: {
    title: "Como Trabajamos",
    models: [
      {
        title: "Aumento de Equipo",
        description:
          "Para proyectos en curso o tareas específicas. Un desarrollador o un equipo completo. Personas experimentadas que trabajan en tus términos y se integran con tu configuración existente.",
        ideal: "Ideal para: Equipos existentes que necesitan capacidad extra o habilidades especializadas.",
      },
      {
        title: "Proyectos a Precio Fijo",
        description:
          "Compromiso total del equipo ITGuys. Llevamos tu concepto desde la idea hasta el producto funcional, nos encargamos del diseño y arquitectura, y nos aseguramos de que esté seguro desde el primer día.",
        ideal: "Ideal para: Nuevos productos, MVPs o construcciones completas de sistemas.",
      },
    ],
  },

  certifications: {
    title: "Certificaciones",
    items: [
      "Akamai Web Performance Foundations",
      "Professional Scrum Master I",
      "Professional Scrum Product Owner I",
    ],
  },

  team: {
    title: "El equipo",
  },

  cta: {
    headline: "¿Quieres Trabajar Juntos?",
    body: "Siempre estamos felices de conocer fundadores y equipos trabajando en productos interesantes.",
    buttonText: "Contactanos",
    buttonHref: "/contact",
  },
};
