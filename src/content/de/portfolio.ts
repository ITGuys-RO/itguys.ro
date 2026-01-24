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
    headline: "Unsere Arbeit",
    subheadline:
      "Projekte, die wir für Startups und Unternehmen gebaut haben. Verschiedene Herausforderungen, verschiedene Lösungen.",
  },

  projects: [
    {
      name: "XtendLive",
      clientType: "Enterprise",
      industry: "Events & Medien",
      challenge:
        "Aufbau einer virtuellen Event-Plattform, die leistungsstark genug für Enterprise-Konferenzen, aber einfach genug für jeden Nutzer ist. Die Plattform musste großangelegtes Live-Streaming, Echtzeit-Engagement und detaillierte Analytics bewältigen.",
      solution:
        "Entwicklung eines skalierbaren Event-Management-Systems mit intuitiven Event-Erstellungstools, interaktiven Engagement-Funktionen und einem umfassenden Analytics-Dashboard. Fokus auf Zuverlässigkeit und Benutzerfreundlichkeit ohne Einbußen bei den Funktionen.",
      tech: ["React", "Node.js", "WebRTC", "AWS", "PostgreSQL"],
      result: "Die Plattform betreibt jetzt virtuelle Events für Organisationen weltweit.",
      url: "https://xtendlive.com/",
    },
    {
      name: "Insight6",
      clientType: "Enterprise",
      industry: "Kundenerfahrung",
      challenge:
        "Eine führende UK Mystery-Shopping-Agentur musste ihre Plattform modernisieren, um Tausende monatlicher Bewertungen in Retail, Hospitality, Gesundheitswesen und Rechtssektor zu verwalten. Das System musste über 800 Mystery Shopper koordinieren und Feedback innerhalb von 48 Stunden liefern.",
      solution:
        "Aufbau eines umfassenden Bewertungsmanagement-Systems mit mobilfreundlicher Datenerfassung, automatisiertem Workflow-Routing und einem Kundenportal für Echtzeit-Zugriff auf Ergebnisse. Integration von Video-, Telefon- und Chat-Bewertungsfunktionen.",
      tech: ["PHP", "Laravel", "MySQL", "Vue.js", "AWS"],
      result: "Das System verarbeitet über 23.000 Mystery Shops jährlich für über 500 UK-Marken.",
      url: "https://www.insight6.com/",
    },
    {
      name: "AudioMovers ListenTo",
      clientType: "Produktunternehmen",
      industry: "Audio & Musik",
      challenge:
        "Erstellung eines professionellen Audio-Streaming-Plugins, das Musikproduzenten und Audio-Ingenieuren ermöglicht, hochwertige Audiostreams aus ihrer DAW an Kunden überall auf der Welt zu senden. Unterstützung für bis zu 128 Kanäle verlustfreies Audio mit minimaler Latenz erforderlich.",
      solution:
        "Entwicklung eines Cross-Platform-Plugins (VST, AU, AAX) mit adaptivem Bitrate-Streaming, das alles von komprimiertem AAC bis zu verlustfreiem 32-Bit PCM bei 192kHz unterstützt. Aufbau von Empfänger-Apps für Web, iOS und Android, damit Kunden ohne Software-Installation zuhören können.",
      tech: ["C++", "JUCE", "WebRTC", "React", "iOS", "Android"],
      result: "Branchenstandard-Tool, das von Audio-Profis und Studios weltweit genutzt wird.",
      url: "https://audiomovers.com/products/listento",
    },
    {
      name: "FSC (Forest Stewardship Council)",
      clientType: "Non-Profit",
      industry: "Umwelt",
      challenge:
        "Die weltweit führende Waldzertifizierungsorganisation benötigte digitale Tools zur Unterstützung ihrer Mission, Wälder global zu schützen. Systeme für Zertifizierungsmanagement, Lieferketten-Rückverfolgbarkeit und Stakeholder-Koordination über mehrere Länder hinweg erforderlich.",
      solution:
        "Beitrag zur Entwicklung von Zertifizierungs- und Rückverfolgbarkeitssystemen, die helfen, nachhaltige Forstwirtschaftspraktiken über globale Lieferketten hinweg zu verifizieren. Implementierung sicherer Datenverarbeitung für sensible Compliance-Informationen.",
      tech: ["PHP", "Drupal", "PostgreSQL", "Docker", "REST APIs"],
      result: "Unterstützung der FSC-Mission zum Waldschutz durch vertrauenswürdige Zertifizierung.",
      url: "https://fsc.org/en",
    },
    {
      name: "RakeTheRake",
      clientType: "Enterprise",
      industry: "iGaming",
      challenge:
        "Eine etablierte Poker-Affiliate-Plattform mit über 250.000 Mitgliedern musste ihre Rakeback-Tracking- und Auszahlungssysteme skalieren und gleichzeitig mit Dutzenden von Pokerräumen und Gaming-Sites integrieren. Sicherheit und präzises Finanz-Tracking waren kritisch.",
      solution:
        "Aufbau robuster Tracking- und Zahlungssysteme, die hohe Transaktionsvolumen bewältigen können. Implementierung sicherer Integrationen mit mehreren Gaming-Plattformen und automatisierter Auszahlungsberechnungen. Hinzufügen von Community-Funktionen wie Freeroll-Turnieren und Ranglisten.",
      tech: ["CraftCMS", "PHP", "MySQL", "Redis", "JavaScript"],
      result: "Die Plattform hat seit 2004 über 190 Millionen USD in Rakeback an Mitglieder ausgeschüttet.",
      url: "https://www.raketherake.com/",
    },
    {
      name: "KeyVision PRO",
      clientType: "Produktunternehmen",
      industry: "Legal Tech",
      challenge:
        "Anwaltskanzleien benötigten eine umfassende cloudbasierte Kanzleimanagement-Lösung für Zeiterfassung, Abrechnung, Fallmanagement und Finanzberichterstattung. Das System musste sensible Mandantendaten mit strengen Sicherheitsanforderungen verarbeiten.",
      solution:
        "Entwicklung einer vollumfänglichen Kanzleimanagement-Plattform mit integrierten Timesheets, automatisierter Rechnungsstellung, Gerichtstermin-Tracking und Performance-Dashboards. Implementierung von SSL-Verschlüsselung und rollenbasierten Zugriffskontrollen zum Datenschutz.",
      tech: ["PHP", "Laravel", "Angular", "MySQL", "AWS"],
      result: "Bedient Anwaltskanzleien von Einzelanwälten bis zu großen Multi-Team-Praxen in ganz Europa.",
      url: "https://www.keyvision.eu/",
    },
  ] as Project[],

  cta: {
    headline: "Ihr Projekt könnte das nächste sein",
    body: "Haben Sie etwas, das Sie bauen möchten? Lassen Sie uns reden.",
    buttonText: "Gespräch starten",
    buttonHref: "/contact",
  },
};
