export const servicesContent = {
  hero: {
    headline: "Servizi Professionali",
    subheadline:
      "Quality assurance, competenza in sicurezza e analisi dei dati. I servizi che mantengono il tuo software affidabile, sicuro e ottimizzato.",
  },

  services: [
    {
      id: "consulting",
      title: "Consulenza Tecnica",
      description:
        "Guida esperta su decisioni architetturali, scelte tecnologiche e strategie di sviluppo.",
      details:
        "A volte hai bisogno di un secondo parere o di una guida esperta prima di impegnarti in una direzione. Offriamo servizi di consulenza per aiutarti a prendere decisioni informate sul tuo stack tecnologico, architettura e approccio di sviluppo.",
      technologies: [],
      subservices: [
        {
          title: "Revisione dell'Architettura",
          description:
            "Valutazione della tua architettura attuale con raccomandazioni per scalabilita, sicurezza e manutenibilita.",
        },
        {
          title: "Selezione Tecnologica",
          description:
            "Guida imparziale sulla scelta delle tecnologie giuste per i tuoi requisiti e vincoli specifici.",
        },
        {
          title: "Code Review",
          description:
            "Revisione esperta del tuo codebase focalizzata su best practice, vulnerabilita di sicurezza e problemi di performance.",
        },
        {
          title: "Strategia DevSecOps",
          description:
            "Integrare la sicurezza nel tuo processo di sviluppo. Shift left senza rallentare.",
        },
      ],
    },
    {
      id: "security",
      title: "Servizi di Sicurezza",
      description:
        "Con background in Electronic Arts e TUI, non costruiamo solo software. Sappiamo come romperlo. Questa prospettiva plasma tutto cio che creiamo.",
      details:
        "Se i tuoi utenti non si fidano della tua sicurezza, non resteranno. Proteggere i tuoi sistemi e dati e la base su cui si costruisce tutto il resto.",
      subservices: [
        {
          title: "Penetration Testing",
          description:
            "Test di vulnerabilita manuali e automatizzati su web app, API e infrastruttura. Le stesse tecniche che usavamo in EA, ora per le tue applicazioni.",
        },
        {
          title: "Audit di Sicurezza",
          description:
            "Code review e valutazioni architetturali per trovare vulnerabilita prima degli attaccanti. Abbiamo revisionato binari di giochi e piattaforme enterprise.",
        },
        {
          title: "Sicurezza Cloud",
          description:
            "Revisioni della configurazione AWS, policy IAM, segmentazione di rete, gestione dei segreti. Le cose noiose che prevengono le violazioni.",
        },
        {
          title: "Protezione DDoS & Bot",
          description:
            "Implementazione e tuning delle difese Akamai e Cloudflare. Credential stuffing, scraping, DDoS, prevenzione account takeover. Certificati Akamai.",
        },
        {
          title: "Risposta agli Incidenti",
          description:
            "Valutazione rapida, contenimento e recupero quando si verificano violazioni. Analisi post-incidente e hardening della sicurezza.",
        },
        {
          title: "Implementazione Zero Trust",
          description:
            "Autenticazione multi-fattore, controlli di accesso e monitoraggio continuo. Ogni utente e dispositivo verificato prima che l'accesso sia concesso.",
        },
      ],
      note: "Possiamo lavorare come team di sicurezza standalone o insieme al tuo sviluppo, lavora con noi!",
      technologies: ["Akamai", "Cloudflare", "Kali Linux", "AWS Security", "Burp Suite"],
    },
    {
      id: "data-analytics",
      title: "Big Data & Analytics",
      description:
        "Trasforma i dati grezzi in qualcosa di utile. Dashboard personalizzate, metriche e analytics che ti aiutano a prendere decisioni.",
      details:
        "Non puoi migliorare quello che non misuri. Configuriamo analytics che ti mostrano cosa succede con i tuoi utenti, il tuo sistema e il tuo business.",
      technologies: ["Google Analytics", "Mixpanel", "Grafana", "Elasticsearch", "Python"],
      subservices: [
        {
          title: "Design delle Dashboard",
          description:
            "Dati presentati in grafici e visualizzazioni che chiunque puo capire. Numeri che raccontano una storia.",
        },
        {
          title: "Tracking delle Performance",
          description:
            "Tracking preciso con le metriche giuste per la tua situazione. Niente dati spazzatura.",
        },
        {
          title: "Analisi Competitiva",
          description:
            "Guarda come si comportano gli utenti, cosa preferiscono e come ti confronti con la concorrenza.",
        },
        {
          title: "Monitoraggio Real-time",
          description:
            "Dati live quando ne hai bisogno, anche ad alto volume.",
        },
      ],
    },
    {
      id: "qa-testing",
      title: "Servizi QA & Testing",
      description:
        "Ci assicuriamo che il tuo software funzioni davvero. Test manuali e automatizzati che trovano problemi prima dei tuoi utenti.",
      details:
        "Il nostro approccio al testing copre funzionalita, performance, sicurezza e user experience. Usiamo strumenti standard del settore come Selenium, Appium e JMeter per rilevare problemi prima che raggiungano i tuoi utenti.",
      technologies: ["Selenium", "Appium", "JMeter", "Postman", "Cypress"],
      subservices: [
        {
          title: "Testing Manuale",
          description:
            "Testing pratico che cattura problemi UX, edge case e scenari reali che i test automatizzati non trovano.",
        },
        {
          title: "Testing Automatizzato",
          description:
            "Selenium, Appium e suite di test personalizzate per regression testing veloce e ripetibile tra le build.",
        },
        {
          title: "Testing delle Performance",
          description:
            "Load testing, stress testing e identificazione dei colli di bottiglia. Conosci i tuoi limiti prima che li trovino i tuoi utenti.",
        },
        {
          title: "Testing di Sicurezza",
          description:
            "Scansione delle vulnerabilita, penetration testing e valutazione del rischio integrati nel tuo ciclo di sviluppo.",
        },
      ],
    },
  ],

  cta: {
    headline: "Hai Bisogno di Guida Esperta?",
    body: "Che si tratti di garantire qualita, rafforzare la sicurezza o dare senso ai tuoi dati, siamo qui per aiutarti.",
    buttonText: "Contattaci",
    buttonHref: "/contact",
  },
};
