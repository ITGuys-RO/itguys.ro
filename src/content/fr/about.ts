import { getCombinedYears } from "@/lib/utils";

type TeamMember = {
  name: string;
  role: string;
  bio: string;
  email?: string;
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
      "Il ne nous suffit pas de livrer un service. Nous nous efforçons de créer de vrais liens avec nos clients, de comprendre leur concept, de voir leur vision, puis de la faire nôtre.",
      "En tant que membres d'équipe, nous repoussons nos limites et n'hésitons jamais à apprendre quelque chose de nouveau. Pour nous, chaque client est une nouvelle opportunité d'améliorer nos compétences et une nouvelle chance de tester notre créativité et détermination.",
      "Nous sommes prêts à vous prêter notre force et à donner naissance à quelque chose d'unique, adapté à votre objectif et vos besoins, incroyablement simple, très fiable et surtout, extrêmement adaptable.",
    ],
    highlight: "Notre vision est votre succès.",
  },

  ourStory: {
    title: "Notre histoire",
    body: [
      "ITGuys a été fondé par Catalin Teodorescu, un Senior Web Security Engineer avec plus de 15 ans d'expérience en cybersécurité, développement full-stack et DevOps. Après avoir travaillé chez Electronic Arts et TUI, et passé près de 7 ans à développer des logiciels pour des clients suisses, un constat s'est imposé : la plupart des agences choisissent leur stack favori et forcent chaque projet à s'y conformer.",
      "Nous faisons l'inverse. Votre produit mérite les bonnes fondations, pas des fondations convenables. Si cela signifie PHP, Node, Python ou autre chose dépend entièrement de ce que vous construisez et qui l'utilise.",
      "Notre expérience en sécurité n'est pas séparée de notre travail de développement. Elle est intégrée dans notre façon de penser l'architecture, d'écrire du code et de déployer des systèmes. Quand vous avez passé des années à trouver des vulnérabilités dans les logiciels des autres, vous apprenez à construire les vôtres différemment.",
    ],
  },

  mission: {
    title: "Notre mission",
    body: [
      "Chez ITGuys, tout est question de structure convaincante et de fonctionnalité profonde. Notre objectif est de créer une expérience unique et riche en fonctionnalités qui est fiable pour le fournisseur et simple pour le client.",
      "Notre travail doit rassembler les gens, leur fournir un environnement sûr, leur permettant de bénéficier du produit, service ou concept. Nous assurons que notre travail est recommandable et constamment engageant.",
      "Nous comprenons l'importance de notre travail, sa gravité. Nous y sommes pleinement préparés. Nous prenons chaque projet très au sérieux.",
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
      "Nous travaillons avec du code, oui, mais avec un sens plus profond. Nous trouvons de la fierté dans notre travail, de l'enthousiasme et de la confiance. Pour aborder cela, nous employons un code d'éthique qui façonne chaque projet.",
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
          "Adapté aux projets en cours ou aux tâches spécifiques nécessitant un professionnel compétent. Qu'il s'agisse d'un développeur, d'un département ou de toute l'équipe, nous fournissons une main-d'œuvre qualifiée, expérimentée, formée pour respecter vos objectifs et s'intégrer à votre équipe existante.",
        ideal: "Idéal pour : Équipes existantes ayant besoin de capacité supplémentaire ou de compétences spécialisées.",
      },
      {
        title: "Projets à prix fixe",
        description:
          "L'option pour l'engagement complet de l'équipe ITGuys. Concrétisez votre concept avec une implémentation professionnelle, un design complet, une structure fiable et une performance adaptable. Non seulement nous rendons votre idée tangible, mais nous la protégeons, la rendant sûre pour le fournisseur et l'utilisateur.",
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
