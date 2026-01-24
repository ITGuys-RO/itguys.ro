export const servicesContent = {
  hero: {
    headline: "Ce que nous construisons",
    subheadline:
      "Développement logiciel sur mesure soutenu par plus de 25 ans d'expérience combinée chez EA, TUI et Nagarro. Solutions web, mobile, cloud et IA.",
  },

  services: [
    {
      id: "ai-ml",
      title: "IA & Machine Learning",
      description:
        "Du traitement du langage naturel à la vision par ordinateur, nous construisons des systèmes intelligents qui apprennent et s'adaptent. Transformez vos données en informations exploitables.",
      details:
        "Nous développons des solutions IA personnalisées avec TensorFlow, PyTorch et Scikit-learn. Que ce soit pour des modèles prédictifs, du NLP pour chatbots ou des systèmes de vision par ordinateur pour la reconnaissance d'images, nous nous concentrons sur l'IA pratique qui résout de vrais problèmes business.",
      technologies: ["Python", "TensorFlow", "PyTorch", "Scikit-learn", "OpenAI"],
      subservices: [
        {
          title: "Traitement du langage naturel",
          description:
            "Chatbots, analyse de sentiment, classification de texte et traduction automatique. Faites comprendre et répondre vos applications au langage humain.",
        },
        {
          title: "Vision par ordinateur",
          description:
            "Reconnaissance d'images, détection d'objets et analyse vidéo. Du contrôle qualité à la surveillance de sécurité.",
        },
        {
          title: "Deep learning",
          description:
            "Réseaux neuronaux pour la reconnaissance de patterns complexes. Quand les algorithmes traditionnels ne suffisent pas.",
        },
        {
          title: "Analytics prédictive",
          description:
            "Modèles de machine learning qui prévoient les tendances, détectent les anomalies et optimisent les décisions basées sur les données historiques.",
        },
      ],
    },
    {
      id: "development",
      title: "Applications Web",
      description:
        "Des tableaux de bord internes aux plateformes client. SPA, PWA, panneaux d'administration, produits SaaS. Tout ce dont vos utilisateurs ont besoin.",
      details:
        "Nous travaillons avec Laravel, Symfony, Drupal, WordPress, CraftCMS et les frameworks JavaScript modernes. Nous choisissons en fonction de vos besoins, pas de nos préférences. Besoin de SEO ? Rendu côté serveur. Forte interactivité ? Un SPA moderne. Besoins simples ? Peut-être pas de framework du tout.",
      technologies: ["PHP 8", "Laravel", "Drupal", "WordPress", "React", "Next.js"],
    },
    {
      id: "mobile",
      title: "Applications mobiles",
      description:
        "Applications natives iOS et Android développées par des ingénieurs avec plus de 10 ans chez Nagarro et Enea AB. Pas de compromis cross-platform, vraie performance native.",
      details:
        "Nous nous spécialisons dans le développement natif parce que certaines applications l'exigent. Intégrations IoT, wearables, systèmes de paiement, applications santé. Quand la performance et l'intégration plateforme comptent, nous construisons natif. Nous gérons aussi la publication app store, les pipelines CI/CD et la maintenance continue.",
      technologies: ["Swift", "Kotlin", "iOS SDK", "Android SDK", "Fitbit SDK"],
      subservices: [
        {
          title: "iOS & Android Natif",
          description:
            "Applications vraiment natives avec intégration plateforme complète. Pas React Native ou Flutter. Quand votre app doit se sentir chez elle sur l'appareil.",
        },
        {
          title: "IoT & Wearables",
          description:
            "Applications pour appareils connectés, intégrations Fitbit et SDKs hardware. Expérience en livraison de produits IoT chez Enea AB.",
        },
        {
          title: "Paiements & e-commerce",
          description:
            "Intégrations Stripe, Shopify et paiements personnalisés. Transactions sécurisées conformes aux exigences réglementaires.",
        },
        {
          title: "Santé & pharma",
          description:
            "Applications pour les industries vétérinaire, nutrition et pharmaceutique. Compréhension des exigences réglementaires et de la sensibilité des données.",
        },
      ],
    },
    {
      id: "cloud",
      title: "DevOps & infrastructure cloud",
      description:
        "Déploiements conteneurisés, pipelines CI/CD et architecture cloud sur AWS. Nous construisons une infrastructure qui évolue et reste sécurisée.",
      details:
        "Docker, Kubernetes, Terraform, CircleCI, GitHub Actions. Nous configurons des déploiements automatisés, la surveillance et l'infrastructure as code pour que votre équipe puisse livrer en toute confiance.",
      technologies: ["AWS", "Docker", "Kubernetes", "Terraform", "CircleCI"],
    },
    {
      id: "backend",
      title: "Backend, APIs & intégrations",
      description:
        "Le moteur derrière votre application. APIs RESTful, microservices, optimisation de bases de données et intégrations tierces.",
      details:
        "MySQL, PostgreSQL, Elastic Search pour les requêtes complexes. Nous gérons la modernisation des systèmes legacy, les intégrations système et les modules autonomes pour les produits plus importants. Si vous avez un défi technique spécifique, nous sommes heureux de l'approfondir.",
      technologies: ["Node.js", "Python", "PHP", "GraphQL", "REST APIs"],
    },
    {
      id: "database",
      title: "Conception & gestion de bases de données",
      description:
        "SQL, NoSQL, modélisation de données et administration. Nous concevons des bases de données qui évoluent et restent rapides.",
      details:
        "De la conception de schéma à l'optimisation des performances, nous gérons la couche données. MySQL, PostgreSQL, MongoDB, Redis. Nous choisissons en fonction de vos modes d'accès, pas de nos préférences. Administration de bases de données, migrations et reprise après sinistre inclus.",
      technologies: ["MySQL", "PostgreSQL", "MongoDB", "Redis", "Elasticsearch"],
      subservices: [
        {
          title: "Bases de données SQL",
          description:
            "Conception, optimisation et gestion de bases de données relationnelles. MySQL, PostgreSQL et solutions enterprise.",
        },
        {
          title: "Solutions NoSQL",
          description:
            "Document stores, bases de données clé-valeur et bases de données graphes pour données à haut débit et non structurées.",
        },
        {
          title: "Modélisation de données",
          description:
            "Conception de schéma qui supporte vos requêtes et évolue avec votre croissance. Bien poser les fondations.",
        },
        {
          title: "Administration de bases de données",
          description:
            "Stratégies de backup, tuning de performance, sécurisation et planification de disaster recovery.",
        },
      ],
    },
  ],

  cta: {
    headline: "Vous avez un projet en tête ?",
    body: "Parlons de ce que vous construisez. Sans jargon, sans engagement. Juste une conversation.",
    buttonText: "Démarrer une conversation",
    buttonHref: "/contact",
  },
};
