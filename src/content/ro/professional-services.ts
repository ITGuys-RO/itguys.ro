export const professionalServicesContent = {
  hero: {
    headline: "Servicii Profesionale",
    subheadline:
      "Asigurarea calității, expertiză în securitate și analiză date. Serviciile care mențin software-ul tău fiabil, sigur și optimizat.",
  },

  services: [
    {
      id: "consulting",
      title: "Consultanță Tehnică",
      description:
        "Ghidare expertă pentru decizii de arhitectură, alegeri de tehnologie și strategii de dezvoltare.",
      details:
        "Uneori ai nevoie de o a doua opinie sau ghidare expertă înainte de a te angaja într-o direcție. Oferim servicii de consultanță pentru a te ajuta să iei decizii informate despre stack-ul tău de tehnologie, arhitectură și abordarea dezvoltării.",
      technologies: [],
      subservices: [
        {
          title: "Revizuire Arhitectură",
          description:
            "Evaluarea arhitecturii tale curente cu recomandări pentru scalabilitate, securitate și mentenabilitate.",
        },
        {
          title: "Selecție Tehnologie",
          description:
            "Ghidare imparțială pentru alegerea tehnologiilor potrivite pentru cerințele și constrângerile tale specifice.",
        },
        {
          title: "Revizuire Cod",
          description:
            "Revizuire expertă a codului tău concentrată pe best practices, vulnerabilități de securitate și probleme de performanță.",
        },
        {
          title: "Strategie DevSecOps",
          description:
            "Integrarea securității în procesul tău de dezvoltare. Shift left fără încetinire.",
        },
      ],
    },
    {
      id: "security",
      title: "Servicii de Securitate",
      description:
        "Cu experiență la Electronic Arts și TUI, nu doar construim software. Știm cum să-l spargem. Această perspectivă modelează tot ce creăm.",
      details:
        "Securitatea este atributul fundamental al oricărui serviciu recomandabil. Încrederea este ceea ce stabilește loialitatea utilizatorilor. Înțelegem gravitatea protejării sistemelor și datelor tale.",
      subservices: [
        {
          title: "Testare de Penetrare",
          description:
            "Testare manuală și automatizată a vulnerabilităților împotriva aplicațiilor web, API-urilor și infrastructurii. Aceleași tehnici pe care le-am folosit la EA, acum pentru aplicațiile tale.",
        },
        {
          title: "Audituri de Securitate",
          description:
            "Revizuiri de cod și evaluări ale arhitecturii pentru a găsi vulnerabilități înainte ca atacatorii să o facă. Am revizuit binare de jocuri și platforme enterprise.",
        },
        {
          title: "Securitate Cloud",
          description:
            "Revizuiri configurație AWS, politici IAM, segmentare rețea, management secrete. Lucrurile plictisitoare care previn breșele.",
        },
        {
          title: "Protecție DDoS & Boți",
          description:
            "Implementare și tuning a apărării Akamai și Cloudflare. Prevenire credential stuffing, scraping, DDoS, preluare cont. Certificat Akamai.",
        },
        {
          title: "Răspuns la Incidente",
          description:
            "Evaluare rapidă, containment și recuperare când apar breșe. Analiză post-incident și securizare.",
        },
        {
          title: "Implementare Zero Trust",
          description:
            "Autentificare multi-factor, controale acces și monitorizare continuă. Fiecare utilizator și dispozitiv verificat înainte de acordarea accesului.",
        },
      ],
      note: "Putem lucra ca echipă de securitate independentă sau alături de munca de dezvoltare cu noi.",
      technologies: ["Akamai", "Cloudflare", "Kali Linux", "AWS Security", "Burp Suite"],
    },
    {
      id: "data-analytics",
      title: "Big Data & Analytics",
      description:
        "Transformă datele brute în inteligență de business. Dashboard-uri personalizate, metrici și analitice care conduc deciziile.",
      details:
        "Performanța este despre tracking. Îmbunătățirea nu se poate face fără măsurători. Implementăm soluții de analytics inteligente care îți oferă insight în comportamentul utilizatorilor, performanța sistemului și metrici de business.",
      technologies: ["Google Analytics", "Mixpanel", "Grafana", "Elasticsearch", "Python"],
      subservices: [
        {
          title: "Design Dashboard-uri",
          description:
            "Date randate în forme și infografice accesibile oricărui cititor. Transformă datele în ceva organic și acționabil.",
        },
        {
          title: "Tracking Performanță",
          description:
            "Toleranță zero pentru colectare eronată. Instrumente precise, timing perfect și metrici relevante pentru cazul tău specific.",
        },
        {
          title: "Analiză Competitivă",
          description:
            "Insight în comportamentul utilizatorilor, preferințe, obiceiuri și cum te compari cu competiția imediată.",
        },
        {
          title: "Monitorizare Real-time",
          description:
            "Viteză și gestionare volum pentru citiri live, mai ales critic când cantitățile de date devin enorme.",
        },
      ],
    },
    {
      id: "qa-testing",
      title: "Servicii QA & Testare",
      description:
        "Calitatea nu este opțională. Ne asigurăm că software-ul tău funcționează impecabil prin testare manuală și automatizată cuprinzătoare.",
      details:
        "Abordarea noastră de testare acoperă funcționalitatea, performanța, securitatea și experiența utilizatorului. Folosim instrumente standard din industrie precum Selenium, Appium și JMeter pentru a detecta problemele înainte să ajungă la utilizatori.",
      technologies: ["Selenium", "Appium", "JMeter", "Postman", "Cypress"],
      subservices: [
        {
          title: "Testare Manuală",
          description:
            "Testare hands-on care surprinde probleme UX, cazuri limită și scenarii din lumea reală pe care testele automate le ratează.",
        },
        {
          title: "Testare Automatizată",
          description:
            "Selenium, Appium și suite de teste personalizate pentru testare de regresie rapidă și repetabilă pe toate build-urile.",
        },
        {
          title: "Testare Performanță",
          description:
            "Testare de încărcare, testare de stres și identificare blocaje. Cunoaște-ți limitele înainte ca utilizatorii să le găsească.",
        },
        {
          title: "Testare Securitate",
          description:
            "Scanare vulnerabilități, testare de penetrare și evaluare risc integrate în ciclul tău de dezvoltare.",
        },
      ],
    },
  ],

  cta: {
    headline: "Ai Nevoie de Ghidare Expertă?",
    body: "Fie că e vorba de asigurarea calității, consolidarea securității sau înțelegerea datelor, suntem aici să ajutăm.",
    buttonText: "Contactează-ne",
    buttonHref: "/contact",
  },
};
