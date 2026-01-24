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
    headline: "Wir sind ITGuys",
    subheadline:
      `Über ${getCombinedYears()} Jahre kombinierte Erfahrung bei Electronic Arts, TUI, Nagarro und Schweizer Unternehmen. Web, Mobile und Sicherheit. In Rumänien ansässig, weltweit tätig.`,
  },

  vision: {
    title: "Unsere Vision",
    body: [
      "Es reicht uns nicht, einen Service zu liefern. Wir streben danach, echte Verbindungen mit unseren Kunden aufzubauen, ihr Konzept zu verstehen, ihre Vision zu sehen und sie dann zu unserer eigenen zu machen.",
      "Als Teammitglieder überschreiten wir unsere Grenzen und scheuen nie davor zurück, etwas Neues zu lernen. Für uns ist jeder Kunde eine neue Gelegenheit, unsere Fähigkeiten zu verbessern und eine neue Chance, unsere Kreativität und Entschlossenheit zu testen.",
      "Wir sind bereit, Ihnen unsere Stärke zu leihen und etwas Einzigartiges zu erschaffen, angepasst an Ihren Zweck und Ihre Bedürfnisse, unglaublich einfach, sehr zuverlässig und vor allem extrem anpassungsfähig.",
    ],
    highlight: "Unsere Vision ist Ihr Erfolg.",
  },

  ourStory: {
    title: "Unsere Geschichte",
    body: [
      "ITGuys wurde von Catalin Teodorescu gegründet, einem Senior Web Security Engineer mit über 15 Jahren Erfahrung in Cybersecurity, Full-Stack-Entwicklung und DevOps. Nach der Arbeit bei Unternehmen wie Electronic Arts und TUI und fast 7 Jahren Software-Entwicklung für Schweizer Kunden wurde eines klar: Die meisten Agenturen wählen ihren Lieblings-Stack und passen jedes Projekt daran an.",
      "Wir machen das Gegenteil. Ihr Produkt verdient das richtige Fundament, kein bequemes. Ob das PHP, Node, Python oder etwas ganz anderes bedeutet, hängt davon ab, was Sie bauen und wer es nutzt.",
      "Unsere Sicherheitserfahrung ist nicht getrennt von unserer Entwicklungsarbeit. Sie ist eingebaut in wie wir Architektur denken, Code schreiben und Systeme deployen. Wenn man Jahre damit verbracht hat, Schwachstellen in der Software anderer zu finden, lernt man, seine eigene anders zu bauen.",
    ],
  },

  mission: {
    title: "Unsere Mission",
    body: [
      "Bei ITGuys geht es um überzeugende Struktur und tiefe Funktionalität. Unser Ziel ist es, eine einzigartige und funktionsreiche Erfahrung zu schaffen, die für den Anbieter zuverlässig und für den Kunden einfach ist.",
      "Unsere Arbeit muss Menschen zusammenbringen, ihnen eine sichere Umgebung bieten und es ihnen ermöglichen, vom Produkt, Service oder Konzept zu profitieren. Wir stellen sicher, dass unsere Arbeit empfehlenswert und konstant ansprechend ist.",
      "Wir verstehen die Bedeutung unserer Arbeit, ihre Tragweite. Wir sind voll darauf vorbereitet. Wir nehmen jedes Projekt sehr ernst.",
    ],
  },

  experience: {
    title: "Partner, mit denen wir gearbeitet haben",
    companies: [
      { name: "TUI", description: "Web-Sicherheit für eines der größten Reiseunternehmen der Welt", logo: "/logos/tui.svg" },
      { name: "Electronic Arts", description: "Sicherheitstests für Web-Anwendungen und Gaming-Plattformen", logo: "/logos/ea.svg" },
      { name: "Nagarro", description: "Über 5 Jahre Mobile-Architektur und native App-Entwicklung", logo: "/logos/nagarro.svg" },
      { name: "Enea AB", description: "IoT- und native SDK-Entwicklung für vernetzte Geräte", logo: "/logos/enea.svg" },
    ],
  },

  whatWeBelieve: {
    title: "Unsere Prinzipien",
    intro:
      "Wir arbeiten mit Code, ja, aber mit einer tieferen Bedeutung. Wir finden Stolz in unserer Arbeit, Begeisterung und Vertrauen. Um dies anzugehen, verwenden wir einen Ethikkodex, der jedes Projekt prägt.",
    values: [
      {
        title: "Einfachheit",
        description:
          "Sauberer, verständlicher Code, der von jedem Entwickler leicht übernommen werden kann. Wir liefern intuitive, benutzerfreundliche Lösungen ohne unnötige Komplexität.",
      },
      {
        title: "Zuverlässigkeit",
        description:
          "Ständige Verbesserungen und Updates, verfügbare Anpassung für enormen Traffic. Systeme, die dem Test der Zeit und des Stresses standhalten.",
      },
      {
        title: "Anpassungsfähigkeit",
        description:
          "Leicht anpassbar an die vielfältigen Anforderungen der Öffentlichkeit und die sich ständig verändernde Welt des Internets. Wir bauen für heute und morgen.",
      },
      {
        title: "Sicherheit",
        description:
          "Mit zunehmenden Cyberangriffen stellen wir sicher, dass Produkte sicher geliefert werden, ohne die Integrität der Nutzer zu gefährden. Sicherheit ist die Grundvoraussetzung für jede weitere Interaktion.",
      },
      {
        title: "Das richtige Werkzeug für den Job",
        description:
          "Wir haben keine Lieblingssprache. Wir haben ein Lieblingsergebnis: Software, die funktioniert. Wenn das bedeutet, ein neues Framework zu lernen, lernen wir es.",
      },
      {
        title: "Klare Kommunikation",
        description:
          "Sie werden immer wissen, wo Ihr Projekt steht, welche Entscheidungen wir treffen und warum. Keine Black Boxes.",
      },
    ],
  },

  deliveryModels: {
    title: "Wie wir arbeiten",
    models: [
      {
        title: "Team-Erweiterung",
        description:
          "Geeignet für laufende Projekte oder spezifische Aufgaben, die einen kompetenten Fachmann erfordern. Ob ein Entwickler, eine Abteilung oder das ganze Team - wir liefern qualifizierte, erfahrene Arbeitskräfte, trainiert um Ihre Ziele zu respektieren und sich in Ihr bestehendes Team zu integrieren.",
        ideal: "Ideal für: Bestehende Teams, die zusätzliche Kapazität oder spezialisierte Fähigkeiten benötigen.",
      },
      {
        title: "Festpreisprojekte",
        description:
          "Die Option für das vollständige Engagement des ITGuys-Teams. Bringen Sie Ihr Konzept mit professioneller Umsetzung, vollständigem Design, zuverlässiger Struktur und anpassungsfähiger Performance zur Realität. Wir machen Ihre Idee nicht nur greifbar, sondern schützen sie auch und machen sie sicher für Anbieter und Nutzer.",
        ideal: "Ideal für: Neue Produkte, MVPs oder komplette Systementwicklungen.",
      },
    ],
  },

  certifications: {
    title: "Zertifizierungen",
    items: [
      "Akamai Web Performance Foundations",
      "Professional Scrum Master I",
      "Professional Scrum Product Owner I",
    ],
  },

  team: {
    title: "Das Team",
    members: [
      {
        name: "Catalin Teodorescu",
        role: "Gründer & Lead Engineer",
        bio: "Über 15 Jahre in Softwareentwicklung und Cybersecurity. Zuvor bei TUI, Electronic Arts und Team Extension AG. Spezialisiert auf sichere Architektur, DevOps und Web-Anwendungssicherheit.",
        linkedIn: "https://www.linkedin.com/in/dustfeather/",
        email: "contact@itguys.ro",
        gravatarEmail: "dustfeather@gmail.com",
      },
      {
        name: "Cristian-Marian Mincu",
        role: "Senior Mobile Developer",
        bio: "Über 10 Jahre Entwicklung nativer iOS- und Android-Apps. Zuvor bei Nagarro und Enea AB. Experte für Mobile-Architektur, IoT-Integrationen und CI/CD-Pipelines. Master in Informationssicherheit von der Politehnica-Universität Bukarest.",
        linkedIn: "https://www.linkedin.com/in/cristian-marian-mincu-44849690/",
      },
    ] as TeamMember[],
  },

  cta: {
    headline: "Möchten Sie zusammenarbeiten?",
    body: "Wir freuen uns immer, Gründer und Teams kennenzulernen, die an interessanten Produkten arbeiten.",
    buttonText: "Kontaktieren Sie uns",
    buttonHref: "/contact",
  },
};
