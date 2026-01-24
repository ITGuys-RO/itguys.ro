import { getCombinedYears } from "@/lib/utils";

type TeamMember = {
  name: string;
  role: string;
  bio: string;
  email?: string;
  gravatarEmail?: string;
  linkedIn?: string;
};

export const aboutContent = {
  hero: {
    headline: "Nous sommes ITGuys",
    subheadline:
      `Plus de ${getCombinedYears()} ans d'expérience combinée chez Electronic Arts, TUI, Nagarro et entreprises suisses. Web, mobile et sécurité. Basés en Roumanie, nous travaillons dans le monde entier.`,
  },

  vision: {
    title: "Notre vision",
    body: [
      "Nous ne faisons pas que livrer un service. Nous construisons de vraies relations avec nos clients, comprenons ce qu'ils veulent accomplir et faisons leurs objectifs les nôtres.",
      "Nous apprenons constamment. Chaque projet nous enseigne quelque chose de nouveau et nous permet de tester nos capacités.",
      "Nous construisons des logiciels adaptés à votre problème spécifique. Simple là où c'est possible, robuste là où c'est nécessaire.",
    ],
    highlight: "Nous réussissons quand vous réussissez.",
  },

  ourStory: {
    title: "Notre histoire",
    body: [
      "ITGuys a été fondé par Catalin Teodorescu, un Senior Web Security Engineer avec plus de 15 ans d'expérience en cybersécurité, développement full-stack et DevOps. Après avoir travaillé chez Electronic Arts et TUI, et passé près de 7 ans à développer des logiciels pour des clients suisses, un constat s'est imposé : la plupart des agences choisissent leur stack favori et forcent chaque projet à s'y conformer.",
      "Nous faisons l'inverse. Votre produit mérite les bonnes fondations, pas des fondations convenables. Si cela signifie PHP, Node, Python ou autre chose, cela dépend entièrement de ce que vous construisez et qui l'utilise.",
      "Notre expérience en sécurité n'est pas séparée de notre travail de développement. Elle est intégrée dans notre façon de penser l'architecture, d'écrire du code et de déployer des systèmes. Quand vous avez passé des années à trouver des vulnérabilités dans les logiciels des autres, vous apprenez à construire les vôtres différemment.",
    ],
  },

  mission: {
    title: "Notre mission",
    body: [
      "Chez ITGuys, nous nous soucions de deux choses : un code organisé et des fonctionnalités qui marchent vraiment. Fiable pour vous, simple pour vos utilisateurs.",
      "Nous construisons des choses qui rassemblent les gens et les gardent en sécurité. Des choses que les gens veulent vraiment utiliser et recommander.",
      "Nous prenons le travail au sérieux. Chaque projet reçoit toute notre attention.",
    ],
  },

  experience: {
    title: "Partenaires avec qui nous avons travaillé",
    companies: [
      { name: "TUI", description: "Sécurité web pour l'une des plus grandes entreprises de voyage au monde", logo: "/logos/tui.svg" },
      { name: "Electronic Arts", description: "Tests de sécurité pour applications web et plateformes de jeux", logo: "/logos/ea.svg" },
      { name: "Nagarro", description: "Plus de 5 ans d'architecture mobile et développement d'apps natives", logo: "/logos/nagarro.svg" },
      { name: "Enea AB", description: "Développement IoT et SDK natif pour appareils connectés", logo: "/logos/enea.svg" },
    ],
  },

  whatWeBelieve: {
    title: "Nos principes",
    intro:
      "Nous écrivons du code, mais ce n'est pas tout ce qui nous préoccupe. Nous sommes fiers de ce que nous construisons. Ces principes définissent notre façon de travailler.",
    values: [
      {
        title: "Simplicité",
        description:
          "Code propre, compréhensible, facile à reprendre par n'importe quel développeur. Nous livrons des solutions intuitives, conviviales, sans complexité inutile.",
      },
      {
        title: "Fiabilité",
        description:
          "Améliorations et mises à jour constantes, adaptation disponible pour un trafic immense. Des systèmes qui résistent à l'épreuve du temps et du stress.",
      },
      {
        title: "Adaptabilité",
        description:
          "Facilement adaptable aux besoins variés du public et au monde en constante évolution d'internet. Nous construisons pour aujourd'hui et demain.",
      },
      {
        title: "Sécurité",
        description:
          "Avec la montée des cyberattaques, nous assurons que les produits sont livrés en toute sécurité sans compromettre l'intégrité de l'utilisateur. La sécurité est l'exigence de base pour toute interaction ultérieure.",
      },
      {
        title: "Le bon outil pour le travail",
        description:
          "Nous n'avons pas de langage favori. Nous avons un résultat favori : un logiciel qui fonctionne. Si cela signifie apprendre un nouveau framework, nous l'apprenons.",
      },
      {
        title: "Communication claire",
        description:
          "Vous saurez toujours où en est votre projet, quelles décisions nous prenons et pourquoi. Pas de boîtes noires.",
      },
    ],
  },

  deliveryModels: {
    title: "Comment nous travaillons",
    models: [
      {
        title: "Augmentation d'équipe",
        description:
          "Pour les projets en cours ou tâches spécifiques. Un développeur ou une équipe entière. Des personnes expérimentées qui travaillent selon vos conditions et s'intègrent à votre configuration existante.",
        ideal: "Idéal pour : Équipes existantes ayant besoin de capacité supplémentaire ou de compétences spécialisées.",
      },
      {
        title: "Projets à prix fixe",
        description:
          "Engagement complet de l'équipe ITGuys. Nous prenons votre concept de l'idée au produit fonctionnel, gérons le design et l'architecture, et nous assurons que c'est sécurisé dès le premier jour.",
        ideal: "Idéal pour : Nouveaux produits, MVPs ou constructions complètes de systèmes.",
      },
    ],
  },

  certifications: {
    title: "Certifications",
    items: [
      "Akamai Web Performance Foundations",
      "Professional Scrum Master I",
      "Professional Scrum Product Owner I",
    ],
  },

  team: {
    title: "L'équipe",
    members: [
      {
        name: "Catalin Teodorescu",
        role: "Fondateur & Lead Engineer",
        bio: "Plus de 15 ans en développement logiciel et cybersécurité. Précédemment chez TUI, Electronic Arts et Team Extension AG. Spécialisé en architecture sécurisée, DevOps et sécurité des applications web.",
        linkedIn: "https://www.linkedin.com/in/dustfeather/",
        email: "contact@itguys.ro",
        gravatarEmail: "dustfeather@gmail.com",
      },
      {
        name: "Cristian-Marian Mincu",
        role: "Senior Mobile Developer",
        bio: "Plus de 10 ans à développer des apps natives iOS et Android. Précédemment chez Nagarro et Enea AB. Expert en architecture mobile, intégrations IoT et pipelines CI/CD. Master en Sécurité de l'Information de l'Université Politehnica de Bucarest.",
        linkedIn: "https://www.linkedin.com/in/cristian-marian-mincu-44849690/",
      },
    ] as TeamMember[],
  },

  cta: {
    headline: "Envie de travailler ensemble ?",
    body: "Nous sommes toujours heureux de rencontrer des fondateurs et des équipes travaillant sur des produits intéressants.",
    buttonText: "Contactez-nous",
    buttonHref: "/contact",
  },
};
