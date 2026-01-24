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
    headline: "I Nostri Lavori",
    subheadline:
      "Progetti che abbiamo costruito per startup e aziende enterprise. Sfide diverse, soluzioni diverse.",
  },

  projects: [
    {
      name: "XtendLive",
      clientType: "Enterprise",
      industry: "Eventi & Media",
      challenge:
        "Costruire una piattaforma per eventi virtuali abbastanza potente per conferenze enterprise ma abbastanza semplice da usare per chiunque. La piattaforma doveva gestire streaming live su larga scala, coinvolgimento in tempo reale dei partecipanti e analytics dettagliati.",
      solution:
        "Sviluppato un sistema di gestione eventi scalabile con strumenti intuitivi per la creazione di eventi, funzionalita di coinvolgimento interattivo e una dashboard analytics completa. Focus su affidabilita e facilita d'uso senza sacrificare le capacita.",
      tech: ["React", "Node.js", "WebRTC", "AWS", "PostgreSQL"],
      result: "La piattaforma ora alimenta eventi virtuali per organizzazioni in tutto il mondo.",
      url: "https://xtendlive.com/",
    },
    {
      name: "Insight6",
      clientType: "Enterprise",
      industry: "Customer Experience",
      challenge:
        "Un'agenzia leader di mystery shopping del Regno Unito aveva bisogno di modernizzare la propria piattaforma per gestire migliaia di valutazioni mensili nei settori retail, hospitality, sanita e legale. Il sistema doveva coordinare oltre 800 mystery shopper e consegnare feedback entro 48 ore.",
      solution:
        "Costruito un sistema completo di gestione delle valutazioni con raccolta dati mobile-friendly, routing automatizzato del workflow e un portale clienti per l'accesso in tempo reale ai risultati. Integrate capacita di valutazione video, telefonica e chat.",
      tech: ["PHP", "Laravel", "MySQL", "Vue.js", "AWS"],
      result: "Il sistema elabora oltre 23.000 mystery shop all'anno per oltre 500 brand del Regno Unito.",
      url: "https://www.insight6.com/",
    },
    {
      name: "AudioMovers ListenTo",
      clientType: "Product Company",
      industry: "Audio & Musica",
      challenge:
        "Creare un plugin di streaming audio di livello professionale che permetta ai produttori musicali e agli ingegneri del suono di trasmettere audio di alta qualita dalla loro DAW a clienti ovunque nel mondo. Richiesto supporto fino a 128 canali di audio lossless con latenza minima.",
      solution:
        "Sviluppato un plugin cross-platform (VST, AU, AAX) con streaming a bitrate adattivo, che supporta tutto dall'AAC compresso al PCM lossless a 32-bit a 192kHz. Costruite app receiver per web, iOS e Android cosi i clienti possono ascoltare senza installare software.",
      tech: ["C++", "JUCE", "WebRTC", "React", "iOS", "Android"],
      result: "Strumento standard del settore usato da professionisti audio e studi in tutto il mondo.",
      url: "https://audiomovers.com/products/listento",
    },
    {
      name: "FSC (Forest Stewardship Council)",
      clientType: "Non-Profit",
      industry: "Ambientale",
      challenge:
        "L'organizzazione leader mondiale per la certificazione forestale aveva bisogno di strumenti digitali per supportare la propria missione di proteggere le foreste a livello globale. Richiesti sistemi per la gestione delle certificazioni, tracciabilita della supply chain e coordinamento degli stakeholder in piu paesi.",
      solution:
        "Contribuito allo sviluppo di sistemi di certificazione e tracciabilita che aiutano a verificare pratiche forestali sostenibili attraverso supply chain globali. Implementata gestione sicura dei dati per informazioni sensibili di conformita.",
      tech: ["PHP", "Drupal", "PostgreSQL", "Docker", "REST APIs"],
      result: "Supporto alla missione FSC di proteggere le foreste attraverso certificazioni affidabili.",
      url: "https://fsc.org/en",
    },
    {
      name: "RakeTheRake",
      clientType: "Enterprise",
      industry: "iGaming",
      challenge:
        "Una piattaforma affiliate di poker operativa dal 2004 con oltre 250.000 membri aveva bisogno di scalare i propri sistemi di tracking rakeback e payout integrando con dozzine di poker room e siti di gioco. Sicurezza e tracking finanziario accurato erano critici.",
      solution:
        "Costruiti sistemi robusti di tracking e pagamento capaci di gestire alti volumi di transazioni. Implementate integrazioni sicure con multiple piattaforme di gioco e calcoli automatizzati dei payout. Aggiunte funzionalita community inclusi tornei freeroll e classifiche.",
      tech: ["CraftCMS", "PHP", "MySQL", "Redis", "JavaScript"],
      result: "La piattaforma ha distribuito oltre 190 milioni di dollari in rakeback ai membri dal 2004.",
      url: "https://www.raketherake.com/",
    },
    {
      name: "KeyVision PRO",
      clientType: "Product Company",
      industry: "Legal Tech",
      challenge:
        "Gli studi legali avevano bisogno di una soluzione completa cloud-based per la gestione dello studio che coprisse time tracking, fatturazione, gestione dei casi e reportistica finanziaria. Il sistema doveva gestire dati sensibili dei clienti con requisiti di sicurezza rigorosi.",
      solution:
        "Sviluppata una piattaforma completa di gestione dello studio legale con timesheet integrati, fatturazione automatizzata, tracking delle udienze in tribunale e dashboard delle performance. Implementata crittografia SSL e controlli di accesso basati sui ruoli per la protezione dei dati.",
      tech: ["PHP", "Laravel", "Angular", "MySQL", "AWS"],
      result: "Al servizio di studi legali da professionisti singoli a grandi pratiche multi-team in tutta Europa.",
      url: "https://www.keyvision.eu/",
    },
  ] as Project[],

  cta: {
    headline: "Il tuo progetto potrebbe essere il prossimo",
    body: "Hai qualcosa che vuoi costruire? Parliamone.",
    buttonText: "Inizia una Conversazione",
    buttonHref: "/contact",
  },
};
