import { getCombinedYearsText } from "@/lib/utils";

type TeamMember = {
  name: string;
  role: string;
  bio: string;
  email?: string;
  linkedIn?: string;
};

export const aboutContent = {
  hero: {
    headline: "Somos ITGuys",
    subheadline:
      `${getCombinedYearsText()} anos de experiencia combinada de Electronic Arts, TUI, Nagarro y empresas suizas. Web, movil y seguridad. Con sede en Rumania, trabajamos en todo el mundo.`,
  },

  vision: {
    title: "Nuestra Vision",
    body: [
      "No nos basta con entregar un servicio. Nos esforzamos por forjar vinculos reales con nuestros clientes, entender su concepto, ver su vision y luego hacerla nuestra.",
      "Como miembros del equipo, superamos nuestros limites y nunca nos echamos atras de aprender algo nuevo. Para nosotros, cada cliente es una nueva oportunidad para mejorar nuestras habilidades y una nueva chance para probar nuestra creatividad y determinacion.",
      "Estamos listos para prestarte nuestra fuerza y dar vida a algo unico, adaptado a tu proposito y necesidades, increiblemente simple, altamente confiable y sobre todo, extremadamente adaptable.",
    ],
    highlight: "Nuestra vision es tu exito.",
  },

  ourStory: {
    title: "Nuestra Historia",
    body: [
      "ITGuys fue fundada por Catalin Teodorescu, un Senior Web Security Engineer con mas de 15 anos de experiencia en ciberseguridad, desarrollo full-stack y DevOps. Despues de trabajar en empresas como Electronic Arts y TUI, y pasar casi 7 anos construyendo software para clientes suizos, una cosa quedo clara: la mayoria de las agencias eligen su stack favorito y adaptan cada proyecto para que encaje.",
      "Nosotros hacemos lo opuesto. Tu producto merece los cimientos correctos, no los convenientes. Si eso significa PHP, Node, Python o algo completamente diferente depende de lo que estes construyendo y quien lo usara.",
      "Nuestra experiencia en seguridad no esta separada de nuestro trabajo de desarrollo. Esta integrada en como pensamos sobre arquitectura, escribimos codigo y desplegamos sistemas. Cuando has pasado anos encontrando vulnerabilidades en el software de otros, aprendes a construir el tuyo de manera diferente.",
    ],
  },

  mission: {
    title: "Nuestra Mision",
    body: [
      "En ITGuys todo se trata de estructura convincente y funcionalidad profunda. Nuestro objetivo es crear una experiencia unica y rica en funcionalidades que sea confiable para el proveedor y simple para el cliente.",
      "Nuestro trabajo debe reunir a las personas, proporcionarles un ambiente seguro, permitiendoles beneficiarse del producto, servicio o concepto. Nos aseguramos de que nuestro trabajo sea recomendable y constantemente atractivo.",
      "Entendemos la importancia de nuestro trabajo, su gravedad. Estamos completamente preparados para ello. Tomamos cada proyecto muy en serio.",
    ],
  },

  experience: {
    title: "Socios con los que Hemos Trabajado",
    companies: [
      { name: "TUI", description: "Seguridad web para una de las mayores companias de viajes del mundo", logo: "/logos/tui.svg" },
      { name: "Electronic Arts", description: "Pruebas de seguridad para aplicaciones web y plataformas de juegos", logo: "/logos/ea.svg" },
      { name: "Nagarro", description: "Mas de 5 anos de arquitectura movil y desarrollo de apps nativas", logo: "/logos/nagarro.svg" },
      { name: "Enea AB", description: "Desarrollo de IoT y SDK nativos para dispositivos conectados", logo: "/logos/enea.svg" },
    ],
  },

  whatWeBelieve: {
    title: "Nuestros Principios",
    intro:
      "Tratamos con codigo, si, pero con un significado mas profundo. Encontramos orgullo en nuestro trabajo, entusiasmo y confianza. Para abordar esto, empleamos un codigo de etica que moldea cada proyecto.",
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
          "Adecuado para proyectos en curso o tareas especificas que requieren un profesional competente. Ya sea un desarrollador, un departamento o todo el equipo, proporcionamos personal calificado y experimentado entrenado para respetar tus objetivos e integrarse con tu equipo existente.",
        ideal: "Ideal para: Equipos existentes que necesitan capacidad extra o habilidades especializadas.",
      },
      {
        title: "Proyectos a Precio Fijo",
        description:
          "La opcion para el compromiso completo del equipo ITGuys. Lleva tu concepto a la realidad con implementacion profesional, diseno completo, estructura confiable y rendimiento adaptable. No solo hacemos tangible tu idea sino que la protegemos, haciendola segura tanto para el proveedor como para el usuario.",
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
    members: [
      {
        name: "Catalin Teodorescu",
        role: "Fundador & Lead Engineer",
        bio: "Mas de 15 anos en desarrollo de software y ciberseguridad. Anteriormente en TUI, Electronic Arts y Team Extension AG. Especializado en arquitectura segura, DevOps y seguridad de aplicaciones web.",
        linkedIn: "https://www.linkedin.com/in/dustfeather/",
        email: "dustfeather@gmail.com",
      },
      {
        name: "Cristian-Marian Mincu",
        role: "Senior Mobile Developer",
        bio: "Mas de 10 anos construyendo apps nativas iOS y Android. Anteriormente en Nagarro y Enea AB. Experto en arquitectura movil, integraciones IoT y pipelines CI/CD. Master en Seguridad de la Informacion del Politecnico de Bucarest.",
        linkedIn: "https://www.linkedin.com/in/cristian-marian-mincu-44849690/",
      },
    ] as TeamMember[],
  },

  cta: {
    headline: "Quieres Trabajar Juntos?",
    body: "Siempre estamos felices de conocer fundadores y equipos trabajando en productos interesantes.",
    buttonText: "Contactanos",
    buttonHref: "/contact",
  },
};
