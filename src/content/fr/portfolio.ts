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
    headline: "Notre Travail",
    subheadline:
      "Projets que nous avons construits pour des startups et des entreprises. Différents défis, différentes solutions.",
  },

  projects: [
    {
      name: "XtendLive",
      clientType: "Enterprise",
      industry: "Événements & Médias",
      challenge:
        "Construire une plateforme d'événements virtuels assez puissante pour des conférences enterprise mais assez simple pour que n'importe qui puisse l'utiliser. La plateforme devait gérer du streaming live à grande échelle, de l'engagement en temps réel et des analytics détaillées.",
      solution:
        "Développement d'un système de gestion d'événements évolutif avec des outils de création d'événements intuitifs, des fonctionnalités d'engagement interactives et un tableau de bord analytics complet. Focus sur la fiabilité et la facilité d'utilisation sans sacrifier les capacités.",
      tech: ["React", "Node.js", "WebRTC", "AWS", "PostgreSQL"],
      result: "La plateforme alimente maintenant des événements virtuels pour des organisations dans le monde entier.",
      url: "https://xtendlive.com/",
    },
    {
      name: "Insight6",
      clientType: "Enterprise",
      industry: "Expérience Client",
      challenge:
        "Une agence de mystery shopping leader au UK devait moderniser sa plateforme pour gérer des milliers d'évaluations mensuelles dans le retail, l'hôtellerie, la santé et le secteur juridique. Le système devait coordonner plus de 800 mystery shoppers et livrer des retours en 48 heures.",
      solution:
        "Construction d'un système complet de gestion des évaluations avec collecte de données mobile-friendly, routage automatique des workflows et un portail client pour un accès en temps réel aux résultats. Intégration de capacités d'évaluation vidéo, téléphone et chat.",
      tech: ["PHP", "Laravel", "MySQL", "Vue.js", "AWS"],
      result: "Le système traite plus de 23 000 mystery shops annuellement pour plus de 500 marques UK.",
      url: "https://www.insight6.com/",
    },
    {
      name: "AudioMovers ListenTo",
      clientType: "Société Produit",
      industry: "Audio & Musique",
      challenge:
        "Créer un plugin de streaming audio de qualité professionnelle permettant aux producteurs de musique et ingénieurs audio de streamer de l'audio haute qualité depuis leur DAW vers des clients n'importe où dans le monde. Support requis jusqu'à 128 canaux d'audio lossless avec latence minimale.",
      solution:
        "Développement d'un plugin cross-platform (VST, AU, AAX) avec streaming à débit adaptatif, supportant tout de l'AAC compressé au PCM 32-bit lossless à 192kHz. Construction d'apps récepteur pour web, iOS et Android pour que les clients puissent écouter sans installer de logiciel.",
      tech: ["C++", "JUCE", "WebRTC", "React", "iOS", "Android"],
      result: "Outil standard de l'industrie utilisé par des professionnels audio et studios dans le monde entier.",
      url: "https://audiomovers.com/products/listento",
    },
    {
      name: "FSC (Forest Stewardship Council)",
      clientType: "Non-Profit",
      industry: "Environnement",
      challenge:
        "L'organisation mondiale leader de certification forestière avait besoin d'outils numériques pour soutenir sa mission de protection des forêts à l'échelle mondiale. Besoin de systèmes pour la gestion des certifications, la traçabilité de la chaîne d'approvisionnement et la coordination des parties prenantes dans plusieurs pays.",
      solution:
        "Contribution au développement de systèmes de certification et traçabilité qui aident à vérifier les pratiques de foresterie durable dans les chaînes d'approvisionnement mondiales. Implémentation d'une gestion sécurisée des données pour les informations sensibles de conformité.",
      tech: ["PHP", "Drupal", "PostgreSQL", "Docker", "REST APIs"],
      result: "Soutien de la mission FSC de protection des forêts à travers une certification de confiance.",
      url: "https://fsc.org/en",
    },
    {
      name: "RakeTheRake",
      clientType: "Enterprise",
      industry: "iGaming",
      challenge:
        "Une plateforme d'affiliation poker établie avec plus de 250 000 membres devait faire évoluer ses systèmes de tracking rakeback et paiements tout en s'intégrant avec des dizaines de salles de poker et sites de jeux. La sécurité et le tracking financier précis étaient critiques.",
      solution:
        "Construction de systèmes robustes de tracking et paiement capables de gérer de gros volumes de transactions. Implémentation d'intégrations sécurisées avec plusieurs plateformes de jeux et calculs automatisés de paiements. Ajout de fonctionnalités communautaires incluant tournois freeroll et classements.",
      tech: ["CraftCMS", "PHP", "MySQL", "Redis", "JavaScript"],
      result: "La plateforme a distribué plus de 190 millions USD en rakeback aux membres depuis 2004.",
      url: "https://www.raketherake.com/",
    },
    {
      name: "KeyVision PRO",
      clientType: "Société Produit",
      industry: "Legal Tech",
      challenge:
        "Les cabinets d'avocats avaient besoin d'une solution complète de gestion de cabinet basée sur le cloud couvrant le suivi du temps, la facturation, la gestion des dossiers et le reporting financier. Le système devait gérer des données client sensibles avec des exigences strictes de sécurité.",
      solution:
        "Développement d'une plateforme complète de gestion de cabinet juridique avec timesheets intégrées, facturation automatisée, suivi des audiences et tableaux de bord de performance. Implémentation du chiffrement SSL et des contrôles d'accès basés sur les rôles pour la protection des données.",
      tech: ["PHP", "Laravel", "Angular", "MySQL", "AWS"],
      result: "Servant des cabinets d'avocats des praticiens solo aux grandes pratiques multi-équipes à travers l'Europe.",
      url: "https://www.keyvision.eu/",
    },
  ] as Project[],

  cta: {
    headline: "Votre projet pourrait être le prochain",
    body: "Vous avez quelque chose que vous voulez construire ? Parlons-en.",
    buttonText: "Démarrer une Conversation",
    buttonHref: "/contact",
  },
};
