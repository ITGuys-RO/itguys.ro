export const servicesContent = {
  hero: {
    headline: "Professionelle Dienstleistungen",
    subheadline:
      "Qualitätssicherung, Sicherheitsexpertise und Data Analytics. Die Dienstleistungen, die Ihre Software zuverlässig, sicher und optimiert halten.",
  },

  services: [
    {
      id: "consulting",
      title: "Technische Beratung",
      description:
        "Expertenberatung zu Architekturentscheidungen, Technologiewahl und Entwicklungsstrategien.",
      details:
        "Manchmal brauchen Sie eine zweite Meinung oder Expertenberatung, bevor Sie sich auf eine Richtung festlegen. Wir bieten Beratungsdienste, um Ihnen bei informierten Entscheidungen über Ihren Technologie-Stack, Ihre Architektur und Ihren Entwicklungsansatz zu helfen.",
      technologies: [],
      subservices: [
        {
          title: "Architektur-Review",
          description:
            "Bewertung Ihrer aktuellen Architektur mit Empfehlungen für Skalierbarkeit, Sicherheit und Wartbarkeit.",
        },
        {
          title: "Technologieauswahl",
          description:
            "Unparteiische Beratung bei der Wahl der richtigen Technologien für Ihre spezifischen Anforderungen und Einschränkungen.",
        },
        {
          title: "Code-Review",
          description:
            "Experten-Review Ihres Codes mit Fokus auf bewährte Praktiken, Sicherheitslücken und Performance-Probleme.",
        },
        {
          title: "DevSecOps-Strategie",
          description:
            "Integration von Sicherheit in Ihren Entwicklungsprozess. Shift left ohne Verlangsamung.",
        },
      ],
    },
    {
      id: "security",
      title: "Sicherheitsdienste",
      description:
        "Mit unserer Erfahrung bei Electronic Arts und TUI bauen wir nicht nur Software. Wir wissen, wie man sie knackt. Diese Perspektive prägt alles, was wir erstellen.",
      details:
        "Wenn Ihre Nutzer Ihrer Sicherheit nicht vertrauen, bleiben sie nicht. Der Schutz Ihrer Systeme und Daten ist das Fundament, auf dem alles andere aufbaut.",
      subservices: [
        {
          title: "Penetrationstests",
          description:
            "Manuelle und automatisierte Schwachstellentests gegen Web-Apps, APIs und Infrastruktur. Die gleichen Techniken, die wir bei EA verwendet haben, jetzt für Ihre Anwendungen.",
        },
        {
          title: "Sicherheitsaudits",
          description:
            "Code-Reviews und Architektur-Bewertungen, um Schwachstellen zu finden, bevor Angreifer es tun. Wir haben Spiele-Binärdateien und Enterprise-Plattformen geprüft.",
        },
        {
          title: "Cloud-Sicherheit",
          description:
            "AWS-Konfigurationsprüfungen, IAM-Richtlinien, Netzwerk-Segmentierung, Secrets-Management. Die langweiligen Dinge, die Breaches verhindern.",
        },
        {
          title: "DDoS- & Bot-Schutz",
          description:
            "Implementierung und Tuning von Akamai- und Cloudflare-Schutzmaßnahmen. Credential Stuffing, Scraping, DDoS, Account-Übernahme-Prävention. Akamai-zertifiziert.",
        },
        {
          title: "Incident Response",
          description:
            "Schnelle Bewertung, Eindämmung und Wiederherstellung bei Sicherheitsvorfällen. Post-Incident-Analyse und Sicherheitshärtung.",
        },
        {
          title: "Zero-Trust-Implementierung",
          description:
            "Multi-Faktor-Authentifizierung, Zugriffskontrollen und kontinuierliches Monitoring. Jeder Nutzer und jedes Gerät wird vor dem Zugang verifiziert.",
        },
      ],
      note: "Wir können als eigenständiges Sicherheitsteam oder zusammen mit Ihrem Entwicklungsteam arbeiten. Arbeiten Sie mit uns!",
      technologies: ["Akamai", "Cloudflare", "Kali Linux", "AWS Security", "Burp Suite"],
    },
    {
      id: "data-analytics",
      title: "Big Data & Analytics",
      description:
        "Verwandeln Sie Rohdaten in etwas Nützliches. Individuelle Dashboards, Metriken und Analytics, die Ihnen bei Entscheidungen helfen.",
      details:
        "Man kann nicht verbessern, was man nicht misst. Wir richten Analytics ein, die Ihnen zeigen, was mit Ihren Nutzern, Ihrem System und Ihrem Business passiert.",
      technologies: ["Google Analytics", "Mixpanel", "Grafana", "Elasticsearch", "Python"],
      subservices: [
        {
          title: "Dashboard-Design",
          description:
            "Daten in Diagrammen und Visualisierungen, die jeder verstehen kann. Zahlen, die eine Geschichte erzählen.",
        },
        {
          title: "Performance-Tracking",
          description:
            "Genaues Tracking mit den richtigen Metriken für Ihre Situation. Keine schlechten Daten.",
        },
        {
          title: "Wettbewerbsanalyse",
          description:
            "Sehen Sie, wie sich Nutzer verhalten, was sie bevorzugen und wie Sie im Vergleich zur Konkurrenz abschneiden.",
        },
        {
          title: "Echtzeit-Monitoring",
          description:
            "Live-Daten wenn Sie sie brauchen, auch bei hohem Volumen.",
        },
      ],
    },
    {
      id: "qa-testing",
      title: "QA & Testing Services",
      description:
        "Wir stellen sicher, dass Ihre Software wirklich funktioniert. Manuelle und automatisierte Tests, die Probleme finden, bevor Ihre Nutzer es tun.",
      details:
        "Unser Testansatz umfasst Funktionalität, Performance, Sicherheit und User Experience. Wir nutzen branchenübliche Tools wie Selenium, Appium und JMeter, um Probleme zu erkennen, bevor sie Ihre Nutzer erreichen.",
      technologies: ["Selenium", "Appium", "JMeter", "Postman", "Cypress"],
      subservices: [
        {
          title: "Manuelle Tests",
          description:
            "Praktische Tests, die UX-Probleme, Edge Cases und reale Szenarien erfassen, die automatisierte Tests übersehen.",
        },
        {
          title: "Automatisierte Tests",
          description:
            "Selenium, Appium und individuelle Test-Suites für schnelle, wiederholbare Regressionstests über alle Builds hinweg.",
        },
        {
          title: "Performance-Tests",
          description:
            "Lasttests, Stresstests und Engpass-Identifizierung. Kennen Sie Ihre Grenzen, bevor Ihre Nutzer sie finden.",
        },
        {
          title: "Sicherheitstests",
          description:
            "Schwachstellen-Scans, Penetrationstests und Risikobewertung integriert in Ihren Entwicklungszyklus.",
        },
      ],
    },
  ],

  cta: {
    headline: "Brauchen Sie Expertenberatung?",
    body: "Ob Qualitätssicherung, Stärkung der Sicherheit oder Verständnis Ihrer Daten - wir sind hier, um zu helfen.",
    buttonText: "Kontaktieren Sie uns",
    buttonHref: "/contact",
  },
};
