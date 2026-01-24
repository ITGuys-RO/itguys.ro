import { getCombinedYearsText } from "@/lib/utils";

export const developmentContent = {
  hero: {
    headline: "Cosa Costruiamo",
    subheadline:
      `Sviluppo software personalizzato supportato da ${getCombinedYearsText()} anni combinati in EA, TUI e Nagarro. Soluzioni web, mobile, cloud e AI.`,
  },

  services: [
    {
      id: "ai-ml",
      title: "AI & Machine Learning",
      description:
        "Dall'elaborazione del linguaggio naturale alla computer vision, costruiamo sistemi che imparano e si adattano. Trasforma i dati in qualcosa di utile.",
      details:
        "Sviluppiamo soluzioni AI personalizzate usando TensorFlow, PyTorch e Scikit-learn. Modelli predittivi, chatbot con NLP, riconoscimento immagini. Ci concentriamo su AI che risolve problemi reali, non demo.",
      technologies: ["Python", "TensorFlow", "PyTorch", "Scikit-learn", "OpenAI"],
      subservices: [
        {
          title: "Elaborazione del Linguaggio Naturale",
          description:
            "Chatbot, analisi del sentiment, classificazione del testo e traduzione automatica. Fai capire e rispondere alle tue applicazioni il linguaggio umano.",
        },
        {
          title: "Computer Vision",
          description:
            "Riconoscimento immagini, rilevamento oggetti e analisi video. Dal controllo qualita al monitoraggio della sicurezza.",
        },
        {
          title: "Deep Learning",
          description:
            "Reti neurali per il riconoscimento di pattern complessi. Quando gli algoritmi tradizionali non bastano.",
        },
        {
          title: "Analisi Predittiva",
          description:
            "Modelli di machine learning che prevedono tendenze, rilevano anomalie e ottimizzano decisioni basate su dati storici.",
        },
      ],
    },
    {
      id: "development",
      title: "Applicazioni Web",
      description:
        "Dalle dashboard interne alle piattaforme per i clienti. SPA, PWA, pannelli admin, prodotti SaaS. Tutto cio di cui i tuoi utenti hanno bisogno.",
      details:
        "Lavoriamo con Laravel, Symfony, Drupal, WordPress, CraftCMS e framework JavaScript moderni. Scegliamo in base ai tuoi requisiti, non alle nostre preferenze. Serve SEO? Rendering lato server. Alta interattivita? Una SPA moderna. Esigenze semplici? Forse nessun framework.",
      technologies: ["PHP 8", "Laravel", "Drupal", "WordPress", "React", "Next.js"],
    },
    {
      id: "mobile",
      title: "Applicazioni Mobile",
      description:
        "App native iOS e Android costruite da ingegneri con oltre 10 anni in Nagarro e Enea AB. Niente compromessi cross-platform, vere performance native.",
      details:
        "Ci specializziamo nello sviluppo nativo perche alcune app lo richiedono. Integrazioni IoT, wearables, sistemi di pagamento, app sanitarie. Quando le performance e l'integrazione con la piattaforma contano, costruiamo nativo. Gestiamo anche la pubblicazione sugli store, pipeline CI/CD e manutenzione continua.",
      technologies: ["Swift", "Kotlin", "iOS SDK", "Android SDK", "Fitbit SDK"],
      subservices: [
        {
          title: "Native iOS & Android",
          description:
            "Vere app native con integrazione completa della piattaforma. Non React Native o Flutter. Quando la tua app deve sembrare di appartenere al dispositivo.",
        },
        {
          title: "IoT & Wearables",
          description:
            "App per dispositivi connessi, integrazioni Fitbit e SDK hardware. Esperienza nella consegna di prodotti IoT in Enea AB.",
        },
        {
          title: "Pagamenti & E-commerce",
          description:
            "Integrazioni Stripe, Shopify e pagamenti personalizzati. Transazioni sicure che soddisfano i requisiti di conformita.",
        },
        {
          title: "Sanita & Pharma",
          description:
            "App per industrie veterinarie, nutrizionali e farmaceutiche. Comprensione dei requisiti normativi e della sensibilita dei dati.",
        },
      ],
    },
    {
      id: "cloud",
      title: "DevOps & Infrastruttura Cloud",
      description:
        "Deployment containerizzati, pipeline CI/CD e architettura cloud su AWS. Costruiamo infrastrutture che scalano e rimangono sicure.",
      details:
        "Docker, Kubernetes, Terraform, CircleCI, GitHub Actions. Configuriamo deployment automatizzati, monitoraggio e infrastructure as code cosi il tuo team puo rilasciare con fiducia.",
      technologies: ["AWS", "Docker", "Kubernetes", "Terraform", "CircleCI"],
    },
    {
      id: "backend",
      title: "Backend, API & Integrazioni",
      description:
        "Il motore dietro la tua applicazione. API RESTful, microservizi, ottimizzazione database e integrazioni di terze parti.",
      details:
        "MySQL, PostgreSQL, Elastic Search per query complesse. Gestiamo modernizzazione legacy, integrazioni di sistema e moduli standalone per prodotti piu grandi. Se hai una sfida tecnica specifica, siamo felici di approfondire.",
      technologies: ["Node.js", "Python", "PHP", "GraphQL", "REST APIs"],
    },
    {
      id: "database",
      title: "Progettazione & Gestione Database",
      description:
        "SQL, NoSQL, modellazione dati e amministrazione. Progettiamo database che scalano e rimangono veloci.",
      details:
        "Dalla progettazione dello schema all'ottimizzazione delle performance, gestiamo il livello dati. MySQL, PostgreSQL, MongoDB, Redis. Scegliamo in base ai tuoi pattern di accesso, non alle nostre preferenze. Amministrazione database, migrazioni e disaster recovery inclusi.",
      technologies: ["MySQL", "PostgreSQL", "MongoDB", "Redis", "Elasticsearch"],
      subservices: [
        {
          title: "Database SQL",
          description:
            "Progettazione, ottimizzazione e gestione di database relazionali. MySQL, PostgreSQL e soluzioni enterprise.",
        },
        {
          title: "Soluzioni NoSQL",
          description:
            "Document store, database key-value e graph database per dati ad alta velocita e non strutturati.",
        },
        {
          title: "Modellazione Dati",
          description:
            "Progettazione dello schema che supporta le tue query e scala con la tua crescita. Costruire le fondamenta giuste.",
        },
        {
          title: "Amministrazione Database",
          description:
            "Strategie di backup, tuning delle performance, hardening della sicurezza e pianificazione del disaster recovery.",
        },
      ],
    },
  ],

  cta: {
    headline: "Hai un Progetto in Mente?",
    body: "Parliamo di cosa stai costruendo. Niente gergo, nessun impegno. Solo una conversazione.",
    buttonText: "Inizia una Conversazione",
    buttonHref: "/contact",
  },
};
