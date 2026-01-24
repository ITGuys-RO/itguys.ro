import { getCombinedYearsText } from "@/lib/utils";

export const developmentContent = {
  hero: {
    headline: "Lo Que Construimos",
    subheadline:
      `Desarrollo de software personalizado respaldado por ${getCombinedYearsText()} anos combinados en EA, TUI y Nagarro. Soluciones web, movil, cloud e IA.`,
  },

  services: [
    {
      id: "ai-ml",
      title: "IA & Machine Learning",
      description:
        "Desde procesamiento de lenguaje natural hasta vision por computadora, construimos sistemas inteligentes que aprenden y se adaptan. Convierte datos en insights accionables.",
      details:
        "Desarrollamos soluciones de IA personalizadas usando TensorFlow, PyTorch y Scikit-learn. Ya sea construyendo modelos predictivos, implementando NLP para chatbots o creando sistemas de vision por computadora para reconocimiento de imagenes, nos enfocamos en IA practica que resuelve problemas empresariales reales.",
      technologies: ["Python", "TensorFlow", "PyTorch", "Scikit-learn", "OpenAI"],
      subservices: [
        {
          title: "Procesamiento de Lenguaje Natural",
          description:
            "Chatbots, analisis de sentimiento, clasificacion de texto y traduccion automatica. Haz que tus aplicaciones entiendan y respondan al lenguaje humano.",
        },
        {
          title: "Vision por Computadora",
          description:
            "Reconocimiento de imagenes, deteccion de objetos y analisis de video. Desde control de calidad hasta monitoreo de seguridad.",
        },
        {
          title: "Deep Learning",
          description:
            "Redes neuronales para reconocimiento de patrones complejos. Cuando los algoritmos tradicionales no son suficientes.",
        },
        {
          title: "Analisis Predictivo",
          description:
            "Modelos de machine learning que pronostican tendencias, detectan anomalias y optimizan decisiones basadas en datos historicos.",
        },
      ],
    },
    {
      id: "development",
      title: "Aplicaciones Web",
      description:
        "Desde dashboards internos hasta plataformas para clientes. SPAs, PWAs, paneles de admin, productos SaaS. Lo que tus usuarios necesiten.",
      details:
        "Trabajamos con Laravel, Symfony, Drupal, WordPress, CraftCMS y frameworks JavaScript modernos. Elegimos basandonos en tus requisitos, no en nuestras preferencias. Necesitas SEO? Renderizado del lado del servidor. Alta interactividad? Una SPA moderna. Necesidades simples? Quizas ningun framework.",
      technologies: ["PHP 8", "Laravel", "Drupal", "WordPress", "React", "Next.js"],
    },
    {
      id: "mobile",
      title: "Aplicaciones Moviles",
      description:
        "Apps nativas iOS y Android construidas por ingenieros con mas de 10 anos en Nagarro y Enea AB. Sin compromisos cross-platform, rendimiento nativo real.",
      details:
        "Nos especializamos en desarrollo nativo porque algunas apps lo demandan. Integraciones IoT, wearables, sistemas de pago, apps de salud. Cuando el rendimiento y la integracion con la plataforma importan, construimos nativo. Tambien manejamos publicacion en tiendas, pipelines CI/CD y mantenimiento continuo.",
      technologies: ["Swift", "Kotlin", "iOS SDK", "Android SDK", "Fitbit SDK"],
      subservices: [
        {
          title: "iOS & Android Nativo",
          description:
            "Apps verdaderamente nativas con integracion completa de plataforma. No React Native o Flutter. Cuando tu app necesita sentirse parte del dispositivo.",
        },
        {
          title: "IoT & Wearables",
          description:
            "Apps para dispositivos conectados, integraciones Fitbit y SDKs de hardware. Experiencia enviando productos IoT en Enea AB.",
        },
        {
          title: "Pagos & E-commerce",
          description:
            "Integraciones de Stripe, Shopify y pagos personalizados. Transacciones seguras que cumplen requisitos de conformidad.",
        },
        {
          title: "Salud & Pharma",
          description:
            "Apps para industrias veterinarias, nutricionales y farmaceuticas. Entendimiento de requisitos regulatorios y sensibilidad de datos.",
        },
      ],
    },
    {
      id: "cloud",
      title: "DevOps & Infraestructura Cloud",
      description:
        "Despliegues containerizados, pipelines CI/CD y arquitectura cloud en AWS. Construimos infraestructura que escala y se mantiene segura.",
      details:
        "Docker, Kubernetes, Terraform, CircleCI, GitHub Actions. Configuramos despliegues automatizados, monitoreo e infraestructura como codigo para que tu equipo pueda lanzar con confianza.",
      technologies: ["AWS", "Docker", "Kubernetes", "Terraform", "CircleCI"],
    },
    {
      id: "backend",
      title: "Backend, APIs & Integraciones",
      description:
        "El motor detras de tu aplicacion. APIs RESTful, microservicios, optimizacion de bases de datos e integraciones de terceros.",
      details:
        "MySQL, PostgreSQL, Elastic Search para consultas complejas. Manejamos modernizacion de sistemas legacy, integraciones de sistemas y modulos independientes para productos mas grandes. Si tienes un desafio tecnico especifico, estamos felices de profundizar.",
      technologies: ["Node.js", "Python", "PHP", "GraphQL", "REST APIs"],
    },
    {
      id: "database",
      title: "Diseno & Gestion de Bases de Datos",
      description:
        "SQL, NoSQL, modelado de datos y administracion. Disenamos bases de datos que escalan y se mantienen rapidas.",
      details:
        "Desde diseno de esquemas hasta optimizacion de rendimiento, manejamos la capa de datos. MySQL, PostgreSQL, MongoDB, Redis. Elegimos basandonos en tus patrones de acceso, no en nuestras preferencias. Administracion de bases de datos, migraciones y recuperacion ante desastres incluidos.",
      technologies: ["MySQL", "PostgreSQL", "MongoDB", "Redis", "Elasticsearch"],
      subservices: [
        {
          title: "Bases de Datos SQL",
          description:
            "Diseno, optimizacion y gestion de bases de datos relacionales. MySQL, PostgreSQL y soluciones enterprise.",
        },
        {
          title: "Soluciones NoSQL",
          description:
            "Document stores, bases de datos key-value y graph databases para datos de alta velocidad y no estructurados.",
        },
        {
          title: "Modelado de Datos",
          description:
            "Diseno de esquemas que soporta tus consultas y escala con tu crecimiento. Construir los cimientos correctos.",
        },
        {
          title: "Administracion de Bases de Datos",
          description:
            "Estrategias de respaldo, ajuste de rendimiento, hardening de seguridad y planificacion de recuperacion ante desastres.",
        },
      ],
    },
  ],

  cta: {
    headline: "Tienes un Proyecto en Mente?",
    body: "Hablemos sobre lo que estas construyendo. Sin jerga, sin compromiso. Solo una conversacion.",
    buttonText: "Inicia una Conversacion",
    buttonHref: "/contact",
  },
};
