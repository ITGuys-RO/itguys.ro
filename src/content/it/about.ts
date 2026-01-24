import { getCombinedYearsText } from "@/lib/utils";

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
    headline: "Siamo ITGuys",
    subheadline:
      `${getCombinedYearsText()} anni di esperienza combinata da Electronic Arts, TUI, Nagarro e aziende svizzere. Web, mobile e sicurezza. Con sede in Romania, lavoriamo in tutto il mondo.`,
  },

  vision: {
    title: "La Nostra Visione",
    body: [
      "Non forniamo solo un servizio. Costruiamo relazioni reali con i nostri clienti, capiamo cosa stanno cercando di fare e facciamo nostri i loro obiettivi.",
      "Impariamo sempre. Ogni progetto ci insegna qualcosa di nuovo e ci permette di testare cosa sappiamo fare.",
      "Costruiamo software che si adatta al tuo problema specifico. Semplice dove puo esserlo, robusto dove deve esserlo.",
    ],
    highlight: "Abbiamo successo quando tu hai successo.",
  },

  ourStory: {
    title: "La Nostra Storia",
    body: [
      "ITGuys e stata fondata da Catalin Teodorescu, un Senior Web Security Engineer con oltre 15 anni di esperienza in cybersecurity, sviluppo full-stack e DevOps. Dopo aver lavorato in aziende come Electronic Arts e TUI, e aver trascorso quasi 7 anni a costruire software per clienti svizzeri, una cosa e diventata chiara: la maggior parte delle agenzie sceglie il proprio stack preferito e piega ogni progetto per adattarlo.",
      "Noi facciamo l'opposto. Il tuo prodotto merita le fondamenta giuste, non quelle convenienti. Che questo significhi PHP, Node, Python o qualcos'altro, dipende interamente da cosa stai costruendo e chi lo usera.",
      "Il nostro background nella sicurezza non e separato dal nostro lavoro di sviluppo. E integrato nel modo in cui pensiamo all'architettura, scriviamo codice e distribuiamo sistemi. Quando hai passato anni a trovare vulnerabilita nel software altrui, impari a costruire il tuo in modo diverso.",
    ],
  },

  mission: {
    title: "La Nostra Missione",
    body: [
      "In ITGuys ci interessano due cose: codice organizzato e funzionalita che funzionano davvero. Affidabile per te, semplice per i tuoi utenti.",
      "Costruiamo cose che uniscono le persone e le tengono al sicuro. Cose che la gente vuole davvero usare e raccomandare.",
      "Prendiamo il lavoro seriamente. Ogni progetto riceve la nostra piena attenzione.",
    ],
  },

  experience: {
    title: "Partner con cui Abbiamo Lavorato",
    companies: [
      { name: "TUI", description: "Sicurezza web per una delle piu grandi compagnie di viaggi al mondo", logo: "/logos/tui.svg" },
      { name: "Electronic Arts", description: "Test di sicurezza per applicazioni web e piattaforme di gioco", logo: "/logos/ea.svg" },
      { name: "Nagarro", description: "Oltre 5 anni di architettura mobile e sviluppo app native", logo: "/logos/nagarro.svg" },
      { name: "Enea AB", description: "Sviluppo IoT e SDK nativi per dispositivi connessi", logo: "/logos/enea.svg" },
    ],
  },

  whatWeBelieve: {
    title: "I Nostri Principi",
    intro:
      "Scriviamo codice, ma non e l'unica cosa che ci interessa. Siamo orgogliosi di quello che costruiamo. Questi principi definiscono come lavoriamo.",
    values: [
      {
        title: "Semplicita",
        description:
          "Codice pulito e comprensibile che e facile da riprendere per qualsiasi sviluppatore. Forniamo soluzioni intuitive e user-friendly libere da complessita inutile.",
      },
      {
        title: "Affidabilita",
        description:
          "Miglioramenti e aggiornamenti costanti, adattamento prontamente disponibile a traffico immenso. Sistemi che resistono alla prova del tempo e dello stress.",
      },
      {
        title: "Adattabilita",
        description:
          "Facilmente adattabile alle ricche richieste del pubblico e al mondo in continua evoluzione di internet. Costruiamo per oggi e domani.",
      },
      {
        title: "Sicurezza",
        description:
          "Con gli attacchi informatici in aumento, ci assicuriamo che i prodotti siano consegnati in sicurezza senza compromettere l'integrita degli utenti. La sicurezza e il requisito base per qualsiasi ulteriore interazione.",
      },
      {
        title: "Lo strumento giusto per il lavoro",
        description:
          "Non abbiamo un linguaggio preferito. Abbiamo un risultato preferito: software che funziona. Se questo significa imparare un nuovo framework, lo impariamo.",
      },
      {
        title: "Comunicazione chiara",
        description:
          "Saprai sempre a che punto e il tuo progetto, quali decisioni stiamo prendendo e perche. Niente scatole nere.",
      },
    ],
  },

  deliveryModels: {
    title: "Come Lavoriamo",
    models: [
      {
        title: "Team Augmentation",
        description:
          "Per progetti in corso o attivita specifiche. Uno sviluppatore o un team completo. Persone esperte che lavorano alle tue condizioni e si integrano con la tua configurazione esistente.",
        ideal: "Ideale per: Team esistenti che necessitano di capacita extra o competenze specializzate.",
      },
      {
        title: "Progetti a Prezzo Fisso",
        description:
          "Impegno completo del team ITGuys. Portiamo il tuo concetto dall'idea al prodotto funzionante, ci occupiamo di design e architettura, e ci assicuriamo che sia sicuro dal primo giorno.",
        ideal: "Ideale per: Nuovi prodotti, MVP o costruzioni complete di sistemi.",
      },
    ],
  },

  certifications: {
    title: "Certificazioni",
    items: [
      "Akamai Web Performance Foundations",
      "Professional Scrum Master I",
      "Professional Scrum Product Owner I",
    ],
  },

  team: {
    title: "Il team",
    members: [
      {
        name: "Catalin Teodorescu",
        role: "Fondatore & Lead Engineer",
        bio: "Oltre 15 anni nello sviluppo software e cybersecurity. Precedentemente in TUI, Electronic Arts e Team Extension AG. Specializzato in architettura sicura, DevOps e sicurezza delle applicazioni web.",
        linkedIn: "https://www.linkedin.com/in/dustfeather/",
        email: "contact@itguys.ro",
        gravatarEmail: "dustfeather@gmail.com",
      },
      {
        name: "Cristian-Marian Mincu",
        role: "Senior Mobile Developer",
        bio: "Oltre 10 anni nella costruzione di app native iOS e Android. Precedentemente in Nagarro e Enea AB. Esperto in architettura mobile, integrazioni IoT e pipeline CI/CD. Master in Information Security presso l'Università Politecnica di Bucarest.",
        linkedIn: "https://www.linkedin.com/in/cristian-marian-mincu-44849690/",
      },
    ] as TeamMember[],
  },

  cta: {
    headline: "Vuoi Lavorare Insieme?",
    body: "Siamo sempre felici di incontrare fondatori e team che lavorano su prodotti interessanti.",
    buttonText: "Contattaci",
    buttonHref: "/contact",
  },
};
