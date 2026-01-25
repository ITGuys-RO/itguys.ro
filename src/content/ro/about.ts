import { getCombinedYears } from "@/lib/utils";

export const aboutContent = {
  hero: {
    headline: "Suntem ITGuys",
    subheadline:
      `Peste ${getCombinedYears()} de ani de experiență combinată de la Electronic Arts, TUI, Nagarro și companii elvețiene. Web, mobile și securitate. Cu sediul în România, avem clienți în toată lumea.`,
  },

  vision: {
    title: "Viziunea noastră",
    body: [
      "Nu doar livrăm un serviciu. Construim relații reale cu toți clienții noștri, înțelegem ce vor să obțină și facem ca obiectivele lor să devină și ale noastre.",
      "Învățăm mereu. Fiecare proiect ne învață ceva nou și ne permite să testăm ce putem face.",
      "Construim software care se potrivește problemei tale specifice. Simplu unde poate fi, solid unde trebuie să fie.",
    ],
    highlight: "Noi reușim când tu reușești.",
  },

  ourStory: {
    title: "Povestea noastră",
    body: [
      "ITGuys a fost fondat de Cătălin Teodorescu, un Senior Web Security Engineer cu peste 15 ani de experiență în cybersecurity, full-stack development și DevOps. După ce a lucrat la companii precum Electronic Arts și TUI, și a petrecut aproape 7 ani construind software pentru clienți elvețieni, un lucru a devenit clar: majoritatea agențiilor își aleg stack-ul favorit și adaptează fiecare proiect pentru a se potrivi acestuia.",
      "Noi facem opusul. Produsul tău merită fundația potrivită, nu una convenabilă. Dacă asta înseamnă PHP, Node, Python sau cu totul altceva, depinde de ce construiești și cine îl folosește.",
      "Experiența noastră în securitate nu este separată de munca noastră de dezvoltare. Este integrată în modul în care gândim arhitectura, scriem cod și implementăm sisteme. Când ai petrecut ani găsind vulnerabilități în software-ul altora, înveți să îl construiești diferit pe al tău.",
    ],
  },

  mission: {
    title: "Misiunea noastră",
    body: [
      "La ITGuys, ne pasă de două lucruri: cod organizat și funcționalități care chiar sunt utile. Fiabil pentru tine, simplu pentru utilizatorii tăi.",
      "Construim lucruri care aduc oamenii împreună și îi păstrează în siguranță. Lucruri pe care oamenii chiar vor să le folosească și să le recomande.",
      "Luăm munca în serios. Fiecare proiect primește toată atenția noastră.",
    ],
  },

  experience: {
    title: "Parteneri cu care am lucrat",
  },

  whatWeBelieve: {
    title: "Principiile noastre",
    intro:
      "Scriem cod, dar nu doar asta ne preocupă. Suntem mândri de ce construim. Aceste principii definesc modul în care lucrăm.",
    values: [
      {
        title: "Simplitate",
        description:
          "Cod curat, cuprinzător, ușor de preluat de orice programator. Livrăm soluții intuitive, prietenoase cu utilizatorul, fără complexitate inutilă.",
      },
      {
        title: "Fiabilitate",
        description:
          "Îmbunătățiri și actualizări constante, adaptare disponibilă pentru trafic imens. Sisteme ce rezistă testului timpului și stresului.",
      },
      {
        title: "Adaptabilitate",
        description:
          "Ușor adaptabil la cerințele bogate ale publicului și la lumea în continuă schimbare a internetului. Construim pentru azi și mâine.",
      },
      {
        title: "Securitate",
        description:
          "Cu atacurile cibernetice în creștere, ne asigurăm că produsele sunt livrate în siguranță, fără a compromite integritatea utilizatorului. Securitatea este cerința de bază pentru orice interacțiune ulterioară.",
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
    title: "Cum lucrăm",
    models: [
      {
        title: "Augmentare echipă",
        description:
          "Pentru proiecte în desfășurare sau sarcini specifice. Un dezvoltator sau o echipă întreagă. Oameni cu experiență care lucrează în condițiile tale și se integrează în setup-ul tău existent.",
        ideal: "Ideal pentru: Echipe existente care au nevoie de capacitate suplimentară sau abilități specializate.",
      },
      {
        title: "Proiecte cu preț fix",
        description:
          "Angajament complet din partea echipei ITGuys. Îți transformăm ideea în produs funcțional, ne ocupăm de design și arhitectură, și ne asigurăm că e securizat din prima zi.",
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
  },

  cta: {
    headline: "Vrei să lucrăm împreună?",
    body: "Suntem întotdeauna bucuroși să cunoaștem fondatori și echipe care lucrează la produse interesante.",
    buttonText: "Contactează-ne",
    buttonHref: "/contact",
  },
};
