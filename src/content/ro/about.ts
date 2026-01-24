type TeamMember = {
  name: string;
  role: string;
  bio: string;
  email?: string;
  linkedIn?: string;
};

export const aboutContent = {
  hero: {
    headline: "Suntem ITGuys",
    subheadline:
      "Peste 25 de ani de experiență combinată de la Electronic Arts, TUI, Nagarro și companii elvețiene. Web, mobile și securitate. Bazați în România, lucrăm mondial.",
  },

  vision: {
    title: "Viziunea Noastră",
    body: [
      "Nu ne este suficient să livrăm un serviciu. Ne străduim să construim legături reale cu clienții noștri, să le înțelegem conceptul, să le vedem viziunea și apoi să o facem a noastră.",
      "Ca membri ai echipei, ne depășim limitele și nu ne ferim niciodată să învățăm ceva nou. Pentru noi, fiecare client este o nouă oportunitate de a ne îmbunătăți abilitățile și o nouă șansă de a ne testa creativitatea și determinarea.",
      "Suntem gata să îți împrumutăm forța noastră și să dăm naștere la ceva unic, adaptat scopului și nevoilor tale, incredibil de simplu, foarte fiabil și mai presus de toate, extrem de adaptabil.",
    ],
    highlight: "Viziunea noastră este succesul tău.",
  },

  ourStory: {
    title: "Povestea Noastră",
    body: [
      "ITGuys a fost fondat de Cătălin Teodorescu, un Senior Web Security Engineer cu peste 15 ani de experiență în cybersecurity, full-stack development și DevOps. După ce a lucrat la companii precum Electronic Arts și TUI, și a petrecut aproape 7 ani construind software pentru clienți elvețieni, un lucru a devenit clar: majoritatea agențiilor își aleg stack-ul favorit și adaptează fiecare proiect să se potrivească.",
      "Noi facem opusul. Produsul tău merită fundația potrivită, nu una convenabilă. Dacă asta înseamnă PHP, Node, Python sau altceva complet depinde de ce construiești și cine îl folosește.",
      "Experiența noastră în securitate nu este separată de munca noastră de dezvoltare. Este integrată în modul în care gândim arhitectura, scriem cod și implementăm sisteme. Când ai petrecut ani găsind vulnerabilități în software-ul altora, înveți să îl construiești diferit pe al tău.",
    ],
  },

  mission: {
    title: "Misiunea Noastră",
    body: [
      "La ITGuys totul este despre structură convingătoare și funcționalitate profundă. Scopul nostru este să creăm o experiență unică și bogată în funcționalități care este fiabilă pentru furnizor și simplă pentru client.",
      "Munca noastră trebuie să adune oamenii împreună, să le ofere un mediu sigur, permițându-le să beneficieze de produs, serviciu sau concept. Ne asigurăm că munca noastră este recomandabilă și constant captivantă.",
      "Înțelegem importanța muncii noastre, gravitatea ei. Suntem pe deplin pregătiți pentru asta. Luăm fiecare proiect foarte în serios.",
    ],
  },

  experience: {
    title: "Parteneri cu care am Lucrat",
    companies: [
      { name: "TUI", description: "Securitate web pentru una dintre cele mai mari companii de turism din lume", logo: "/logos/tui.svg" },
      { name: "Electronic Arts", description: "Testare securitate pentru aplicații web și platforme de jocuri", logo: "/logos/ea.svg" },
      { name: "Nagarro", description: "Peste 5 ani de arhitectură mobile și dezvoltare aplicații native", logo: "/logos/nagarro.svg" },
      { name: "Enea AB", description: "Dezvoltare IoT și SDK nativ pentru dispozitive conectate", logo: "/logos/enea.svg" },
    ],
  },

  whatWeBelieve: {
    title: "Principiile Noastre",
    intro:
      "Lucrăm cu cod, da, dar cu un sens mai profund. Găsim mândrie în munca noastră, entuziasm și încredere. Pentru a aborda acest lucru, folosim un cod de etică care modelează fiecare proiect.",
    values: [
      {
        title: "Simplitate",
        description:
          "Cod curat, cuprinzător, ușor de preluat de orice programator. Livrăm soluții intuitive, prietenoase cu utilizatorul, fără complexitate inutilă.",
      },
      {
        title: "Fiabilitate",
        description:
          "Îmbunătățiri și actualizări constante, adaptare disponibilă pentru trafic imens. Sisteme care rezistă testului timpului și stresului.",
      },
      {
        title: "Adaptabilitate",
        description:
          "Ușor adaptabil la cerințele bogate ale publicului și la lumea în continuă schimbare a internetului. Construim pentru azi și mâine.",
      },
      {
        title: "Securitate",
        description:
          "Cu atacurile cibernetice în creștere, ne asigurăm că produsele sunt livrate în siguranță fără a compromite integritatea utilizatorului. Securitatea este cerința de bază pentru orice interacțiune ulterioară.",
      },
      {
        title: "Unealta potrivită pentru job",
        description:
          "Nu avem un limbaj favorit. Avem un rezultat favorit: software care funcționează. Dacă asta înseamnă să învățăm un framework nou, îl învățăm.",
      },
      {
        title: "Comunicare clară",
        description:
          "Vei ști întotdeauna unde se află proiectul tău, ce decizii luăm și de ce. Fără cutii negre.",
      },
    ],
  },

  deliveryModels: {
    title: "Cum Lucrăm",
    models: [
      {
        title: "Augmentare Echipă",
        description:
          "Potrivit pentru proiecte în desfășurare sau sarcini specifice care necesită un profesionist competent. Fie că e un dezvoltator, un departament sau întreaga echipă, oferim forță de muncă calificată, experimentată, antrenată să respecte obiectivele tale și să se integreze cu echipa ta existentă.",
        ideal: "Ideal pentru: Echipe existente care au nevoie de capacitate suplimentară sau abilități specializate.",
      },
      {
        title: "Proiecte Preț Fix",
        description:
          "Opțiunea pentru angajamentul complet al echipei ITGuys. Adu-ți conceptul la realitate cu implementare profesională, design complet, structură fiabilă și performanță adaptabilă. Nu doar că facem ideea ta tangibilă, ci o protejăm, făcând-o sigură atât pentru furnizor cât și pentru utilizator.",
        ideal: "Ideal pentru: Produse noi, MVP-uri sau construcții complete de sistem.",
      },
    ],
  },

  certifications: {
    title: "Certificări",
    items: [
      "Akamai Web Performance Foundations",
      "Professional Scrum Master I",
      "Professional Scrum Product Owner I",
    ],
  },

  team: {
    title: "Echipa",
    members: [
      {
        name: "Cătălin Teodorescu",
        role: "Fondator & Lead Engineer",
        bio: "Peste 15 ani în dezvoltare software și cybersecurity. Anterior la TUI, Electronic Arts și Team Extension AG. Specializat în arhitectură sigură, DevOps și securitatea aplicațiilor web.",
        linkedIn: "https://www.linkedin.com/in/dustfeather/",
        email: "dustfeather@gmail.com",
      },
      {
        name: "Cristian-Marian Mincu",
        role: "Senior Mobile Developer",
        bio: "Peste 10 ani construind aplicații native iOS și Android. Anterior la Nagarro și Enea AB. Expert în arhitectură mobile, integrări IoT și pipeline-uri CI/CD. Master în Securitatea Informației de la Politehnica București.",
        linkedIn: "https://www.linkedin.com/in/cristian-marian-mincu-44849690/",
      },
    ] as TeamMember[],
  },

  cta: {
    headline: "Vrei să Lucrăm Împreună?",
    body: "Suntem întotdeauna bucuroși să cunoaștem fondatori și echipe care lucrează la produse interesante.",
    buttonText: "Contactează-ne",
    buttonHref: "/contact",
  },
};
