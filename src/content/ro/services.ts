export const servicesContent = {
  hero: {
    headline: "Servicii Profesionale",
    subheadline:
      "Asigurarea calității, expertiză în securitate și data analytics. Serviciile care mențin software-ul tău fiabil, sigur și optimizat.",
  },

  services: [
    {
      id: "consulting",
      title: "Consultanță tehnică",
      description:
        "Asistență de specialitate pentru decizii de arhitectură, alegeri de tehnologie și strategii de dezvoltare.",
      details:
        "Uneori ai nevoie de o a doua opinie sau asistență de specialitate înainte de a te angaja într-o direcție. Oferim servicii de consultanță pentru a te ajuta să iei decizii informate despre stack-ul tău de tehnologie, arhitectură și abordarea dezvoltării.",
      technologies: [],
      subservices: [
        {
          title: "Revizuire arhitectură",
          description:
            "Evaluarea arhitecturii tale curente cu recomandări pentru scalabilitate, securitate și mentenabilitate.",
        },
        {
          title: "Selecție tehnologie",
          description:
            "Îndrumare imparțială pentru alegerea tehnologiilor potrivite pentru cerințele și limitările tale specifice.",
        },
        {
          title: "Revizuire cod",
          description:
            "Revizuire de specialitate a codului tău concentrată pe cele mai bune practici, vulnerabilități de securitate și probleme de performanță.",
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
      title: "Servicii de securitate",
      description:
        "Cu experiență la Electronic Arts și TUI, nu doar construim software. Știm cum să-l spargem. Această perspectivă modelează tot ce creăm.",
      details:
        "Dacă utilizatorii nu au încredere în securitatea ta, nu vor rămâne. Protejarea sistemelor și datelor tale este fundația pe care se construiește tot restul.",
      subservices: [
        {
          title: "Testare de penetrare",
          description:
            "Testare manuală și automatizată a vulnerabilităților împotriva aplicațiilor web, API-urilor și infrastructurii. Aceleași tehnici pe care le-am folosit la EA, disponibile acum și pentru aplicațiile tale.",
        },
        {
          title: "Audituri de securitate",
          description:
            "Revizuiri de cod și evaluări ale arhitecturii pentru a găsi vulnerabilități înainte ca atacatorii să o facă. Am revizuit binare de jocuri și platforme enterprise.",
        },
        {
          title: "Securitate cloud",
          description:
            "Revizuiri configurație AWS, politici IAM, segmentare rețea, management secrete. Lucrurile plictisitoare care previn breșele.",
        },
        {
          title: "Protecție DDoS & boți",
          description:
            "Implementare și tuning a apărării Akamai și Cloudflare. Prevenire credential stuffing, scraping, DDoS, preluare cont. Certificat Akamai.",
        },
        {
          title: "Răspuns la incidente",
          description:
            "Evaluare rapidă, containment și recuperare când apar breșe. Analiză post-incident și întărirea securității.",
        },
        {
          title: "Implementare Zero Trust",
          description:
            "Autentificare multi-factor, controale acces și monitorizare continuă. Fiecare utilizator și dispozitiv verificat înainte de acordarea accesului.",
        },
      ],
      note: "Putem lucra ca echipă de securitate independentă sau alături de echipa ta de dezvoltare. Colaborează cu noi!",
      technologies: ["Akamai", "Cloudflare", "Kali Linux", "AWS Security", "Burp Suite"],
    },
    {
      id: "data-analytics",
      title: "Big Data & Analytics",
      description:
        "Transformă datele brute în ceva util. Dashboard-uri personalizate, metrici și analitice care te ajută să iei decizii.",
      details:
        "Nu poți îmbunătăți ce nu măsori. Configurăm analitice care îți arată ce se întâmplă cu utilizatorii, sistemul și afacerea ta.",
      technologies: ["Google Analytics", "Mixpanel", "Grafana", "Elasticsearch", "Python"],
      subservices: [
        {
          title: "Design dashboard-uri",
          description:
            "Date prezentate în grafice și vizualizări pe care oricine le poate înțelege. Numere care spun o poveste.",
        },
        {
          title: "Tracking de performanță",
          description:
            "Tracking precis cu metricile potrivite pentru situația ta. Fără date de proastă calitate.",
        },
        {
          title: "Analiză competitivă",
          description:
            "Vezi cum se comportă utilizatorii, ce preferă și cum te compari cu concurența.",
        },
        {
          title: "Monitorizare în timp real",
          description:
            "Date live când ai nevoie de ele, chiar și la volum mare.",
        },
      ],
    },
    {
      id: "qa-testing",
      title: "Servicii QA & testare",
      description:
        "Ne asigurăm că software-ul tău chiar funcționează. Testare manuală și automatizată care prinde problemele înainte să le găsească utilizatorii.",
      details:
        "Abordarea noastră de testare acoperă funcționalitatea, performanța, securitatea și experiența utilizatorului. Folosim instrumente standard din industrie precum Selenium, Appium și JMeter pentru a detecta problemele înainte să ajungă la utilizatori.",
      technologies: ["Selenium", "Appium", "JMeter", "Postman", "Cypress"],
      subservices: [
        {
          title: "Testare manuală",
          description:
            "Testare hands-on care surprinde probleme UX, cazuri limită și scenarii din lumea reală pe care testele automate le ratează.",
        },
        {
          title: "Testare automatizată",
          description:
            "Selenium, Appium și suite de teste personalizate pentru testare de regresie rapidă și repetabilă pe toate build-urile.",
        },
        {
          title: "Testare performanță",
          description:
            "Testare de încărcare, testare de stres și identificare blocaje. Cunoaște-ți limitele înainte ca utilizatorii să le găsească.",
        },
        {
          title: "Testare securitate",
          description:
            "Scanare vulnerabilități, testare de penetrare și evaluare risc integrate în ciclul tău de dezvoltare.",
        },
      ],
    },
  ],

  cta: {
    headline: "Ai nevoie de asistență de specialitate?",
    body: "Fie că e vorba de asigurarea calității, consolidarea securității sau înțelegerea datelor, suntem aici să ajutăm.",
    buttonText: "Contactează-ne",
    buttonHref: "/contact",
  },
};
