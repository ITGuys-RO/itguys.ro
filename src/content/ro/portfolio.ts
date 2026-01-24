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
    headline: "Munca noastră",
    subheadline:
      "Proiecte pe care le-am construit pentru startup-uri și companii. Provocări diferite, soluții diferite.",
  },

  projects: [
    {
      name: "XtendLive",
      clientType: "Enterprise",
      industry: "Evenimente & Media",
      challenge:
        "Construirea unei platforme de evenimente virtuale suficient de puternică pentru conferințe enterprise, dar suficient de simplă pentru oricine să o folosească. Platforma trebuia să gestioneze transmisiuni în direct la scară mare, interacțiune în timp real cu participanții și analytics detaliate.",
      solution:
        "Am dezvoltat un sistem extensibil de management al evenimentelor cu instrumente intuitive de creare evenimente, funcții interactive de implicare a participanților și un dashboard cuprinzător de analytics. Ne-am concentrat pe fiabilitate și ușurință în utilizare fără a compromite capabilitățile.",
      tech: ["React", "Node.js", "WebRTC", "AWS", "PostgreSQL"],
      result: "În prezent, platforma susține evenimente virtuale pentru organizații din întreaga lume.",
      url: "https://xtendlive.com/",
    },
    {
      name: "Insight6",
      clientType: "Enterprise",
      industry: "Experiența Clienților",
      challenge:
        "O agenție de mystery shopping de top din UK trebuia să își modernizeze platforma pentru a gestiona mii de evaluări lunare în comerț, HoReCa, sănătate și sectorul legal. Sistemul trebuia să coordoneze 800+ mystery shopperi și să livreze feedback în 48 de ore.",
      solution:
        "Am construit un sistem cuprinzător de management al evaluărilor ce conțin colectare de date prietenoasă pentru mobile, rutare automată a workflow-ului și un portal pentru clienți pentru acces în timp real la rezultate. Am integrat capabilități de evaluare video, telefon și chat.",
      tech: ["PHP", "Laravel", "MySQL", "Vue.js", "AWS"],
      result: "Sistemul procesează peste 23.000 de mystery shops anual pentru 500+ branduri din UK.",
      url: "https://www.insight6.com/",
    },
    {
      name: "AudioMovers ListenTo",
      clientType: "Companie Produs",
      industry: "Audio & Muzică",
      challenge:
        "Crearea unui plugin de redare audio de calitate profesională care permite producătorilor de muzică și inginerilor audio să redea audio de înaltă calitate din DAW-ul lor către clienți oriunde în lume. Era necesară suportarea a până la 128 canale de audio lossless cu latență minimă.",
      solution:
        "Am dezvoltat un plugin cross-platform (VST, AU, AAX) cu transmisie adaptivă, suportând totul de la AAC comprimat la PCM 32-bit lossless la 192kHz. Am construit aplicații receptor pentru web, iOS și Android astfel încât clienții să poată asculta fără a instala aplicații.",
      tech: ["C++", "JUCE", "WebRTC", "React", "iOS", "Android"],
      result: "Instrument standard în industrie folosit de profesioniști audio și studiouri global.",
      url: "https://audiomovers.com/products/listento",
    },
    {
      name: "FSC (Forest Stewardship Council)",
      clientType: "Non-Profit",
      industry: "Mediu",
      challenge:
        "Organizația lider mondială de certificare a pădurilor avea nevoie de instrumente digitale pentru a susține misiunea de protejare a pădurilor la nivel global. Erau necesare sisteme pentru managementul certificării, trasabilitatea lanțului de aprovizionare și coordonarea acționarilor în mai multe țări.",
      solution:
        "Am contribuit la dezvoltarea sistemelor de certificare și trasabilitate care ajută la verificarea practicilor de silvicultură durabilă în lanțurile de aprovizionare globale. Am implementat gestionare sigură a datelor pentru informații sensibile de conformitate.",
      tech: ["PHP", "Drupal", "PostgreSQL", "Docker", "REST APIs"],
      result: "Susținerea misiunii FSC de a proteja pădurile prin certificare de încredere.",
      url: "https://fsc.org/en",
    },
    {
      name: "RakeTheRake",
      clientType: "Enterprise",
      industry: "iGaming",
      challenge:
        "O platformă de afiliere poker activă încă din 2004, cu peste 250.000 de membri, avea nevoie de extinderea sistemelor de tracking rakeback și plăți, integrându-se totodată cu zeci de camere de poker și site-uri de jocuri. Securitatea și tracking-ul financiar precis erau critice.",
      solution:
        "Am construit sisteme robuste de tracking și plată capabile să gestioneze volume mari de tranzacții. Am implementat integrări sigure cu mai multe platforme de jocuri și calcule automate de plăți. Am adăugat funcții de comunitate incluzând turnee freeroll și clasamente.",
      tech: ["CraftCMS", "PHP", "MySQL", "Redis", "JavaScript"],
      result: "Platforma a distribuit peste 190 milioane USD în rakeback membrilor din 2004.",
      url: "https://www.raketherake.com/",
    },
    {
      name: "KeyVision PRO",
      clientType: "Companie Produs",
      industry: "Legal Tech",
      challenge:
        "Firmele de avocatură aveau nevoie de o soluție cuprinzătoare de management al practicii bazată pe cloud, acoperind time tracking, facturare, managementul cazurilor și raportare financiară. Sistemul trebuia să gestioneze date sensibile ale clienților cu cerințe stricte de securitate.",
      solution:
        "Am dezvoltat o platformă completă de management al practicii legale cu pontaj integrat, facturare automatizată, tracking audiențe în instanță și dashboard-uri de performanță. Am implementat criptare SSL și controale de acces bazate pe roluri pentru protecția datelor.",
      tech: ["PHP", "Laravel", "Angular", "MySQL", "AWS"],
      result: "Servind firme de avocatură de la practicieni individuali la practici mari cu mai multe echipe în Europa.",
      url: "https://www.keyvision.eu/",
    },
  ] as Project[],

  cta: {
    headline: "Proiectul tău ar putea fi următorul",
    body: "Ai ceva ce vrei să construiești? Hai să vorbim.",
    buttonText: "Începe o conversație",
    buttonHref: "/contact",
  },
};
