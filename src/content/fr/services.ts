export const servicesContent = {
  hero: {
    headline: "Services professionnels",
    subheadline:
      "Assurance qualité, expertise sécurité et data analytics. Les services qui maintiennent votre logiciel fiable, sécurisé et optimisé.",
  },

  services: [
    {
      id: "consulting",
      title: "Conseil technique",
      description:
        "Conseils d'experts sur les décisions d'architecture, les choix technologiques et les stratégies de développement.",
      details:
        "Parfois vous avez besoin d'un second avis ou d'un accompagnement expert avant de vous engager dans une direction. Nous offrons des services de conseil pour vous aider à prendre des décisions éclairées sur votre stack technologique, votre architecture et votre approche de développement.",
      technologies: [],
      subservices: [
        {
          title: "Revue d'architecture",
          description:
            "Évaluation de votre architecture actuelle avec recommandations pour la scalabilité, la sécurité et la maintenabilité.",
        },
        {
          title: "Sélection technologique",
          description:
            "Guidance impartiale pour choisir les bonnes technologies pour vos besoins et contraintes spécifiques.",
        },
        {
          title: "Revue de code",
          description:
            "Revue experte de votre code axée sur les bonnes pratiques, les failles de sécurité et les problèmes de performance.",
        },
        {
          title: "Stratégie DevSecOps",
          description:
            "Intégration de la sécurité dans votre processus de développement. Shift left sans ralentir.",
        },
      ],
    },
    {
      id: "security",
      title: "Services de sécurité",
      description:
        "Avec notre expérience chez Electronic Arts et TUI, nous ne faisons pas que construire des logiciels. Nous savons comment les casser. Cette perspective façonne tout ce que nous créons.",
      details:
        "Si vos utilisateurs ne font pas confiance à votre sécurité, ils ne resteront pas. Protéger vos systèmes et données est la fondation sur laquelle tout le reste est construit.",
      subservices: [
        {
          title: "Tests d'intrusion",
          description:
            "Tests de vulnérabilités manuels et automatisés contre les applications web, APIs et infrastructure. Les mêmes techniques utilisées chez EA, maintenant pour vos applications.",
        },
        {
          title: "Audits de sécurité",
          description:
            "Revues de code et évaluations d'architecture pour trouver les vulnérabilités avant les attaquants. Nous avons audité des binaires de jeux et des plateformes enterprise.",
        },
        {
          title: "Sécurité cloud",
          description:
            "Revues de configuration AWS, politiques IAM, segmentation réseau, gestion des secrets. Les choses ennuyeuses qui préviennent les brèches.",
        },
        {
          title: "Protection DDoS & Bots",
          description:
            "Implémentation et tuning des défenses Akamai et Cloudflare. Prévention du credential stuffing, scraping, DDoS, prise de contrôle de compte. Certifié Akamai.",
        },
        {
          title: "Réponse aux incidents",
          description:
            "Évaluation rapide, confinement et récupération lors de brèches. Analyse post-incident et renforcement de la sécurité.",
        },
        {
          title: "Implémentation Zero Trust",
          description:
            "Authentification multi-facteur, contrôles d'accès et surveillance continue. Chaque utilisateur et appareil vérifié avant l'accès.",
        },
      ],
      note: "Nous pouvons travailler comme équipe de sécurité autonome ou aux côtés de votre équipe de développement. Collaborez avec nous !",
      technologies: ["Akamai", "Cloudflare", "Kali Linux", "AWS Security", "Burp Suite"],
    },
    {
      id: "data-analytics",
      title: "Big Data & Analytics",
      description:
        "Transformez les données brutes en quelque chose d'utile. Tableaux de bord personnalisés, métriques et analytics qui vous aident à prendre des décisions.",
      details:
        "On ne peut pas améliorer ce qu'on ne mesure pas. Nous configurons des analytics qui vous montrent ce qui se passe avec vos utilisateurs, votre système et votre business.",
      technologies: ["Google Analytics", "Mixpanel", "Grafana", "Elasticsearch", "Python"],
      subservices: [
        {
          title: "Conception de tableaux de bord",
          description:
            "Données présentées en graphiques et visualisations que tout le monde peut comprendre. Des chiffres qui racontent une histoire.",
        },
        {
          title: "Tracking de performance",
          description:
            "Tracking précis avec les bonnes métriques pour votre situation. Pas de données de mauvaise qualité.",
        },
        {
          title: "Analyse concurrentielle",
          description:
            "Voyez comment les utilisateurs se comportent, ce qu'ils préfèrent et comment vous vous comparez à la concurrence.",
        },
        {
          title: "Surveillance en temps réel",
          description:
            "Données en direct quand vous en avez besoin, même à haut volume.",
        },
      ],
    },
    {
      id: "qa-testing",
      title: "Services QA & tests",
      description:
        "Nous nous assurons que votre logiciel fonctionne vraiment. Tests manuels et automatisés qui détectent les problèmes avant vos utilisateurs.",
      details:
        "Notre approche de test couvre la fonctionnalité, la performance, la sécurité et l'expérience utilisateur. Nous utilisons des outils standard de l'industrie comme Selenium, Appium et JMeter pour détecter les problèmes avant qu'ils n'atteignent vos utilisateurs.",
      technologies: ["Selenium", "Appium", "JMeter", "Postman", "Cypress"],
      subservices: [
        {
          title: "Tests manuels",
          description:
            "Tests pratiques qui détectent les problèmes UX, les cas limites et les scénarios réels que les tests automatisés manquent.",
        },
        {
          title: "Tests automatisés",
          description:
            "Selenium, Appium et suites de tests personnalisées pour des tests de régression rapides et répétables sur tous les builds.",
        },
        {
          title: "Tests de performance",
          description:
            "Tests de charge, tests de stress et identification des goulots d'étranglement. Connaissez vos limites avant que vos utilisateurs ne les trouvent.",
        },
        {
          title: "Tests de sécurité",
          description:
            "Scan de vulnérabilités, tests d'intrusion et évaluation des risques intégrés à votre cycle de développement.",
        },
      ],
    },
  ],

  cta: {
    headline: "Besoin de conseils d'experts ?",
    body: "Que ce soit pour assurer la qualité, renforcer la sécurité ou comprendre vos données, nous sommes là pour aider.",
    buttonText: "Contactez-nous",
    buttonHref: "/contact",
  },
};
