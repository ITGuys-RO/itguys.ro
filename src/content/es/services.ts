export const servicesContent = {
  hero: {
    headline: "Servicios Profesionales",
    subheadline:
      "Aseguramiento de calidad, experiencia en seguridad y analisis de datos. Los servicios que mantienen tu software confiable, seguro y optimizado.",
  },

  services: [
    {
      id: "consulting",
      title: "Consultoria Tecnica",
      description:
        "Guia experta sobre decisiones de arquitectura, elecciones tecnologicas y estrategias de desarrollo.",
      details:
        "A veces necesitas una segunda opinion o guia experta antes de comprometerte con una direccion. Ofrecemos servicios de consultoria para ayudarte a tomar decisiones informadas sobre tu stack tecnologico, arquitectura y enfoque de desarrollo.",
      technologies: [],
      subservices: [
        {
          title: "Revision de Arquitectura",
          description:
            "Evaluacion de tu arquitectura actual con recomendaciones para escalabilidad, seguridad y mantenibilidad.",
        },
        {
          title: "Seleccion de Tecnologia",
          description:
            "Guia imparcial para elegir las tecnologias correctas para tus requisitos y restricciones especificos.",
        },
        {
          title: "Revision de Codigo",
          description:
            "Revision experta de tu codigo enfocada en mejores practicas, vulnerabilidades de seguridad y problemas de rendimiento.",
        },
        {
          title: "Estrategia DevSecOps",
          description:
            "Integrar seguridad en tu proceso de desarrollo. Shift left sin ralentizar.",
        },
      ],
    },
    {
      id: "security",
      title: "Servicios de Seguridad",
      description:
        "Con experiencia en Electronic Arts y TUI, no solo construimos software. Sabemos como romperlo. Esa perspectiva moldea todo lo que creamos.",
      details:
        "Si tus usuarios no confían en tu seguridad, no se quedarán. Proteger tus sistemas y datos es la base sobre la que se construye todo lo demás.",
      subservices: [
        {
          title: "Pruebas de Penetracion",
          description:
            "Pruebas de vulnerabilidad manuales y automatizadas contra web apps, APIs e infraestructura. Las mismas tecnicas que usamos en EA, ahora para tus aplicaciones.",
        },
        {
          title: "Auditorias de Seguridad",
          description:
            "Revisiones de codigo y evaluaciones de arquitectura para encontrar vulnerabilidades antes que los atacantes. Hemos revisado binarios de juegos y plataformas enterprise.",
        },
        {
          title: "Seguridad Cloud",
          description:
            "Revisiones de configuracion AWS, politicas IAM, segmentacion de red, gestion de secretos. Las cosas aburridas que previenen las brechas.",
        },
        {
          title: "Proteccion DDoS & Bots",
          description:
            "Implementacion y ajuste de defensas Akamai y Cloudflare. Credential stuffing, scraping, DDoS, prevencion de account takeover. Certificados en Akamai.",
        },
        {
          title: "Respuesta a Incidentes",
          description:
            "Evaluacion rapida, contencion y recuperacion cuando ocurren brechas. Analisis post-incidente y hardening de seguridad.",
        },
        {
          title: "Implementacion Zero Trust",
          description:
            "Autenticacion multifactor, controles de acceso y monitoreo continuo. Cada usuario y dispositivo verificado antes de otorgar acceso.",
        },
      ],
      note: "Podemos trabajar como equipo de seguridad independiente o junto a tu desarrollo, trabaja con nosotros!",
      technologies: ["Akamai", "Cloudflare", "Kali Linux", "AWS Security", "Burp Suite"],
    },
    {
      id: "data-analytics",
      title: "Big Data & Analytics",
      description:
        "Transforma datos crudos en algo útil. Dashboards personalizados, métricas y analytics que te ayudan a tomar decisiones.",
      details:
        "No puedes mejorar lo que no mides. Configuramos analytics que te muestran qué está pasando con tus usuarios, tu sistema y tu negocio.",
      technologies: ["Google Analytics", "Mixpanel", "Grafana", "Elasticsearch", "Python"],
      subservices: [
        {
          title: "Diseño de Dashboards",
          description:
            "Datos presentados en gráficos y visualizaciones que cualquiera puede entender. Números que cuentan una historia.",
        },
        {
          title: "Rastreo de Rendimiento",
          description:
            "Tracking preciso con las métricas correctas para tu situación. Sin datos de mala calidad.",
        },
        {
          title: "Análisis Competitivo",
          description:
            "Mira cómo se comportan los usuarios, qué prefieren y cómo te comparas con la competencia.",
        },
        {
          title: "Monitoreo en Tiempo Real",
          description:
            "Datos en vivo cuando los necesitas, incluso a alto volumen.",
        },
      ],
    },
    {
      id: "qa-testing",
      title: "Servicios de QA & Testing",
      description:
        "Nos aseguramos de que tu software realmente funcione. Pruebas manuales y automatizadas que detectan problemas antes que tus usuarios.",
      details:
        "Nuestro enfoque de testing cubre funcionalidad, rendimiento, seguridad y experiencia de usuario. Usamos herramientas estandar de la industria como Selenium, Appium y JMeter para detectar problemas antes de que lleguen a tus usuarios.",
      technologies: ["Selenium", "Appium", "JMeter", "Postman", "Cypress"],
      subservices: [
        {
          title: "Testing Manual",
          description:
            "Testing practico que captura problemas de UX, casos extremos y escenarios del mundo real que las pruebas automatizadas no encuentran.",
        },
        {
          title: "Testing Automatizado",
          description:
            "Selenium, Appium y suites de pruebas personalizadas para testing de regresion rapido y repetible entre builds.",
        },
        {
          title: "Testing de Rendimiento",
          description:
            "Pruebas de carga, pruebas de estres e identificacion de cuellos de botella. Conoce tus limites antes de que tus usuarios los encuentren.",
        },
        {
          title: "Testing de Seguridad",
          description:
            "Escaneo de vulnerabilidades, pruebas de penetracion y evaluacion de riesgos integrados en tu ciclo de desarrollo.",
        },
      ],
    },
  ],

  cta: {
    headline: "¿Necesitas Guía Experta?",
    body: "Ya sea asegurar calidad, fortalecer la seguridad o dar sentido a tus datos, estamos aqui para ayudar.",
    buttonText: "Contactanos",
    buttonHref: "/contact",
  },
};
