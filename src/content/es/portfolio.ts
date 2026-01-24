type Project = {
  name: string;
  clientType: string;
  industry: string;
  challenge: string;
  solution: string;
  tech: string[];
  result?: string;
  image?: string;
  url?: string;
};

export const portfolioContent = {
  hero: {
    headline: "Nuestro Trabajo",
    subheadline:
      "Proyectos que hemos construido para startups y empresas. Diferentes desafios, diferentes soluciones.",
  },

  projects: [
    {
      name: "XtendLive",
      clientType: "Enterprise",
      industry: "Eventos & Media",
      challenge:
        "Construir una plataforma de eventos virtuales lo suficientemente potente para conferencias enterprise pero lo suficientemente simple para que cualquiera la use. La plataforma necesitaba manejar streaming en vivo a gran escala, participacion de asistentes en tiempo real y analytics detallados.",
      solution:
        "Desarrollamos un sistema de gestion de eventos escalable con herramientas intuitivas de creacion de eventos, caracteristicas de participacion interactiva y un dashboard de analytics completo. Enfocados en confiabilidad y facilidad de uso sin sacrificar capacidades.",
      tech: ["React", "Node.js", "WebRTC", "AWS", "PostgreSQL"],
      result: "La plataforma ahora impulsa eventos virtuales para organizaciones en todo el mundo.",
      url: "https://xtendlive.com/",
    },
    {
      name: "Insight6",
      clientType: "Enterprise",
      industry: "Experiencia del Cliente",
      challenge:
        "Una agencia lider de mystery shopping del Reino Unido necesitaba modernizar su plataforma para manejar miles de evaluaciones mensuales en los sectores retail, hospitalidad, salud y legal. El sistema tenia que coordinar mas de 800 mystery shoppers y entregar feedback en 48 horas.",
      solution:
        "Construimos un sistema completo de gestion de evaluaciones con recoleccion de datos mobile-friendly, enrutamiento automatizado de flujos de trabajo y un portal de clientes para acceso en tiempo real a resultados. Integradas capacidades de evaluacion por video, telefono y chat.",
      tech: ["PHP", "Laravel", "MySQL", "Vue.js", "AWS"],
      result: "El sistema procesa mas de 23,000 mystery shops anualmente para mas de 500 marcas del Reino Unido.",
      url: "https://www.insight6.com/",
    },
    {
      name: "AudioMovers ListenTo",
      clientType: "Product Company",
      industry: "Audio & Musica",
      challenge:
        "Crear un plugin de streaming de audio de grado profesional que permita a productores musicales e ingenieros de audio transmitir audio de alta calidad desde su DAW a clientes en cualquier parte del mundo. Requeria soporte para hasta 128 canales de audio lossless con latencia minima.",
      solution:
        "Desarrollamos un plugin multiplataforma (VST, AU, AAX) con streaming de bitrate adaptativo, soportando todo desde AAC comprimido hasta PCM lossless de 32-bit a 192kHz. Construidas apps receptoras para web, iOS y Android para que los clientes puedan escuchar sin instalar software.",
      tech: ["C++", "JUCE", "WebRTC", "React", "iOS", "Android"],
      result: "Herramienta estandar de la industria usada por profesionales de audio y estudios globalmente.",
      url: "https://audiomovers.com/products/listento",
    },
    {
      name: "FSC (Forest Stewardship Council)",
      clientType: "Non-Profit",
      industry: "Ambiental",
      challenge:
        "La organizacion lider mundial de certificacion forestal necesitaba herramientas digitales para apoyar su mision de proteger los bosques globalmente. Requeria sistemas para gestion de certificaciones, trazabilidad de cadena de suministro y coordinacion de stakeholders en multiples paises.",
      solution:
        "Contribuimos al desarrollo de sistemas de certificacion y trazabilidad que ayudan a verificar practicas forestales sostenibles a traves de cadenas de suministro globales. Implementado manejo seguro de datos para informacion sensible de conformidad.",
      tech: ["PHP", "Drupal", "PostgreSQL", "Docker", "REST APIs"],
      result: "Apoyando la mision de FSC de proteger los bosques a traves de certificacion confiable.",
      url: "https://fsc.org/en",
    },
    {
      name: "RakeTheRake",
      clientType: "Enterprise",
      industry: "iGaming",
      challenge:
        "Una plataforma afiliada de poker operando desde 2004 con mas de 250,000 miembros necesitaba escalar sus sistemas de rastreo de rakeback y pagos mientras se integraba con docenas de salas de poker y sitios de juegos. La seguridad y el rastreo financiero preciso eran criticos.",
      solution:
        "Construimos sistemas robustos de rastreo y pago capaces de manejar altos volumenes de transacciones. Implementadas integraciones seguras con multiples plataformas de juegos y calculos automatizados de pagos. Anadidas caracteristicas de comunidad incluyendo torneos freeroll y tablas de clasificacion.",
      tech: ["CraftCMS", "PHP", "MySQL", "Redis", "JavaScript"],
      result: "La plataforma ha distribuido mas de $190 millones en rakeback a miembros desde 2004.",
      url: "https://www.raketherake.com/",
    },
    {
      name: "KeyVision PRO",
      clientType: "Product Company",
      industry: "Legal Tech",
      challenge:
        "Los despachos de abogados necesitaban una solucion completa de gestion de practicas basada en la nube que cubriera seguimiento de tiempo, facturacion, gestion de casos y reportes financieros. El sistema tenia que manejar datos sensibles de clientes con requisitos de seguridad estrictos.",
      solution:
        "Desarrollamos una plataforma completa de gestion de practicas legales con hojas de tiempo integradas, facturacion automatizada, seguimiento de audiencias judiciales y dashboards de rendimiento. Implementada encriptacion SSL y controles de acceso basados en roles para proteccion de datos.",
      tech: ["PHP", "Laravel", "Angular", "MySQL", "AWS"],
      result: "Sirviendo a despachos de abogados desde practicantes individuales hasta grandes practicas multi-equipo en toda Europa.",
      url: "https://www.keyvision.eu/",
    },
  ] as Project[],

  cta: {
    headline: "Tu proyecto podria ser el siguiente",
    body: "Tienes algo que quieres construir? Hablemos.",
    buttonText: "Inicia una Conversacion",
    buttonHref: "/contact",
  },
};
