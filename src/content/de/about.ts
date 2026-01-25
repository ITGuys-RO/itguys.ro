import { getCombinedYears } from "@/lib/utils";

export const aboutContent = {
  hero: {
    headline: "Wir sind ITGuys",
    subheadline:
      `Über ${getCombinedYears()} Jahre kombinierte Erfahrung bei Electronic Arts, TUI, Nagarro und Schweizer Unternehmen. Web, Mobile und Sicherheit. In Rumänien ansässig, weltweit tätig.`,
  },

  vision: {
    title: "Unsere Vision",
    body: [
      "Wir liefern nicht nur einen Service. Wir bauen echte Beziehungen zu unseren Kunden auf, verstehen was sie erreichen wollen und machen ihre Ziele zu unseren.",
      "Wir lernen ständig dazu. Jedes Projekt lehrt uns etwas Neues und lässt uns testen, was wir können.",
      "Wir bauen Software, die zu Ihrem spezifischen Problem passt. Einfach wo möglich, robust wo nötig.",
    ],
    highlight: "Wir sind erfolgreich, wenn Sie erfolgreich sind.",
  },

  ourStory: {
    title: "Unsere Geschichte",
    body: [
      "ITGuys wurde von Catalin Teodorescu gegründet, einem Senior Web Security Engineer mit über 15 Jahren Erfahrung in Cybersecurity, Full-Stack-Entwicklung und DevOps. Nach der Arbeit bei Unternehmen wie Electronic Arts und TUI und fast 7 Jahren Software-Entwicklung für Schweizer Kunden wurde eines klar: Die meisten Agenturen wählen ihren Lieblings-Stack und passen jedes Projekt daran an.",
      "Wir machen das Gegenteil. Ihr Produkt verdient das richtige Fundament, kein bequemes. Ob das PHP, Node, Python oder etwas ganz anderes bedeutet, hängt davon ab, was Sie bauen und wer es nutzt.",
      "Unsere Sicherheitserfahrung ist nicht getrennt von unserer Entwicklungsarbeit. Sie ist integriert in unsere Art, Architektur zu denken, Code zu schreiben und Systeme zu deployen. Wenn man Jahre damit verbracht hat, Schwachstellen in der Software anderer zu finden, lernt man, seine eigene anders zu bauen.",
    ],
  },

  mission: {
    title: "Unsere Mission",
    body: [
      "Bei ITGuys kümmern wir uns um zwei Dinge: organisierten Code und Funktionen, die wirklich funktionieren. Zuverlässig für Sie, einfach für Ihre Nutzer.",
      "Wir bauen Dinge, die Menschen zusammenbringen und sicher halten. Dinge, die Menschen wirklich nutzen und weiterempfehlen wollen.",
      "Wir nehmen die Arbeit ernst. Jedes Projekt bekommt unsere volle Aufmerksamkeit.",
    ],
  },

  experience: {
    title: "Partner, mit denen wir gearbeitet haben",
  },

  whatWeBelieve: {
    title: "Unsere Prinzipien",
    intro:
      "Wir schreiben Code, aber das ist nicht alles, was uns wichtig ist. Wir sind stolz auf das, was wir bauen. Diese Prinzipien prägen unsere Arbeitsweise.",
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
          "Für laufende Projekte oder spezifische Aufgaben. Ein Entwickler oder ein ganzes Team. Erfahrene Leute, die zu Ihren Bedingungen arbeiten und sich in Ihr bestehendes Setup einfügen.",
        ideal: "Ideal für: Bestehende Teams, die zusätzliche Kapazität oder spezialisierte Fähigkeiten benötigen.",
      },
      {
        title: "Festpreisprojekte",
        description:
          "Volles Engagement vom ITGuys-Team. Wir bringen Ihr Konzept von der Idee zum funktionierenden Produkt, kümmern uns um Design und Architektur und stellen sicher, dass es vom ersten Tag an sicher ist.",
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
  },

  cta: {
    headline: "Möchten Sie zusammenarbeiten?",
    body: "Wir freuen uns immer, Gründer und Teams kennenzulernen, die an interessanten Produkten arbeiten.",
    buttonText: "Kontaktieren Sie uns",
    buttonHref: "/contact",
  },
};
