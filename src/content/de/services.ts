export const servicesContent = {
  hero: {
    headline: "Was wir bauen",
    subheadline:
      "Maßgeschneiderte Softwareentwicklung, gestützt durch über 25 Jahre kombinierte Erfahrung bei EA, TUI und Nagarro. Web-, Mobile-, Cloud- und KI-Lösungen.",
  },

  services: [
    {
      id: "ai-ml",
      title: "KI & Machine Learning",
      description:
        "Von Natural Language Processing bis Computer Vision - wir bauen intelligente Systeme, die lernen und sich anpassen. Verwandeln Sie Daten in umsetzbare Erkenntnisse.",
      details:
        "Wir entwickeln maßgeschneiderte KI-Lösungen mit TensorFlow, PyTorch und Scikit-learn. Ob prädiktive Modelle, NLP für Chatbots oder Computer-Vision-Systeme zur Bilderkennung - wir konzentrieren uns auf praktische KI, die echte Geschäftsprobleme löst.",
      technologies: ["Python", "TensorFlow", "PyTorch", "Scikit-learn", "OpenAI"],
      subservices: [
        {
          title: "Natural Language Processing",
          description:
            "Chatbots, Sentiment-Analyse, Textklassifizierung und maschinelle Übersetzung. Lassen Sie Ihre Anwendungen menschliche Sprache verstehen und darauf reagieren.",
        },
        {
          title: "Computer Vision",
          description:
            "Bilderkennung, Objekterkennung und Videoanalyse. Von Qualitätskontrolle bis Sicherheitsüberwachung.",
        },
        {
          title: "Deep Learning",
          description:
            "Neuronale Netze für komplexe Mustererkennung. Wenn traditionelle Algorithmen nicht ausreichen.",
        },
        {
          title: "Predictive Analytics",
          description:
            "Machine-Learning-Modelle, die Trends vorhersagen, Anomalien erkennen und Entscheidungen basierend auf historischen Daten optimieren.",
        },
      ],
    },
    {
      id: "development",
      title: "Web-Anwendungen",
      description:
        "Von internen Dashboards bis zu kundenorientierten Plattformen. SPAs, PWAs, Admin-Panels, SaaS-Produkte. Was auch immer Ihre Nutzer brauchen.",
      details:
        "Wir arbeiten mit Laravel, Symfony, Drupal, WordPress, CraftCMS und modernen JavaScript-Frameworks. Wir wählen basierend auf Ihren Anforderungen, nicht unseren Vorlieben. SEO nötig? Server-side Rendering. Starke Interaktivität? Ein modernes SPA. Einfache Bedürfnisse? Vielleicht gar kein Framework.",
      technologies: ["PHP 8", "Laravel", "Drupal", "WordPress", "React", "Next.js"],
    },
    {
      id: "mobile",
      title: "Mobile Anwendungen",
      description:
        "Native iOS- und Android-Apps, entwickelt von Ingenieuren mit über 10 Jahren Erfahrung bei Nagarro und Enea AB. Keine Cross-Platform-Kompromisse, echte native Performance.",
      details:
        "Wir spezialisieren uns auf native Entwicklung, weil manche Apps es erfordern. IoT-Integrationen, Wearables, Zahlungssysteme, Gesundheits-Apps. Wenn Performance und Plattform-Integration wichtig sind, bauen wir nativ. Wir kümmern uns auch um App-Store-Veröffentlichung, CI/CD-Pipelines und laufende Wartung.",
      technologies: ["Swift", "Kotlin", "iOS SDK", "Android SDK", "Fitbit SDK"],
      subservices: [
        {
          title: "Natives iOS & Android",
          description:
            "Echte native Apps mit vollständiger Plattform-Integration. Nicht React Native oder Flutter. Wenn sich Ihre App auf dem Gerät wie zu Hause anfühlen soll.",
        },
        {
          title: "IoT & Wearables",
          description:
            "Apps für verbundene Geräte, Fitbit-Integrationen und Hardware-SDKs. Erfahrung in der Auslieferung von IoT-Produkten bei Enea AB.",
        },
        {
          title: "Zahlungen & E-Commerce",
          description:
            "Stripe-, Shopify- und benutzerdefinierte Zahlungsintegrationen. Sichere Transaktionen, die Compliance-Anforderungen erfüllen.",
        },
        {
          title: "Gesundheit & Pharma",
          description:
            "Apps für Veterinär-, Ernährungs- und Pharmaindustrie. Verständnis für regulatorische Anforderungen und Datensensibilität.",
        },
      ],
    },
    {
      id: "cloud",
      title: "DevOps & Cloud-Infrastruktur",
      description:
        "Containerisierte Deployments, CI/CD-Pipelines und Cloud-Architektur auf AWS. Wir bauen Infrastruktur, die skaliert und sicher bleibt.",
      details:
        "Docker, Kubernetes, Terraform, CircleCI, GitHub Actions. Wir richten automatisierte Deployments, Monitoring und Infrastructure as Code ein, damit Ihr Team mit Vertrauen liefern kann.",
      technologies: ["AWS", "Docker", "Kubernetes", "Terraform", "CircleCI"],
    },
    {
      id: "backend",
      title: "Backend, APIs & Integrationen",
      description:
        "Der Motor hinter Ihrer Anwendung. RESTful APIs, Microservices, Datenbankoptimierung und Drittanbieter-Integrationen.",
      details:
        "MySQL, PostgreSQL, Elastic Search für komplexe Abfragen. Wir kümmern uns um Legacy-Modernisierung, Systemintegrationen und eigenständige Module für größere Produkte. Wenn Sie eine spezifische technische Herausforderung haben, vertiefen wir uns gerne.",
      technologies: ["Node.js", "Python", "PHP", "GraphQL", "REST APIs"],
    },
    {
      id: "database",
      title: "Datenbank-Design & -Management",
      description:
        "SQL, NoSQL, Datenmodellierung und Administration. Wir entwerfen Datenbanken, die skalieren und schnell bleiben.",
      details:
        "Vom Schema-Design bis zur Performance-Optimierung kümmern wir uns um die Datenschicht. MySQL, PostgreSQL, MongoDB, Redis. Wir wählen basierend auf Ihren Zugriffsmustern, nicht unseren Vorlieben. Datenbankadministration, Migrationen und Disaster Recovery inklusive.",
      technologies: ["MySQL", "PostgreSQL", "MongoDB", "Redis", "Elasticsearch"],
      subservices: [
        {
          title: "SQL-Datenbanken",
          description:
            "Design, Optimierung und Management relationaler Datenbanken. MySQL, PostgreSQL und Enterprise-Lösungen.",
        },
        {
          title: "NoSQL-Lösungen",
          description:
            "Document Stores, Key-Value-Datenbanken und Graph-Datenbanken für Hochgeschwindigkeits- und unstrukturierte Daten.",
        },
        {
          title: "Datenmodellierung",
          description:
            "Schema-Design, das Ihre Abfragen unterstützt und mit Ihrem Wachstum skaliert. Das Fundament richtig legen.",
        },
        {
          title: "Datenbankadministration",
          description:
            "Backup-Strategien, Performance-Tuning, Sicherheitshärtung und Disaster-Recovery-Planung.",
        },
      ],
    },
  ],

  cta: {
    headline: "Haben Sie ein Projekt im Sinn?",
    body: "Lassen Sie uns über das sprechen, was Sie bauen. Kein Fachjargon, keine Verpflichtung. Nur ein Gespräch.",
    buttonText: "Gespräch starten",
    buttonHref: "/contact",
  },
};
