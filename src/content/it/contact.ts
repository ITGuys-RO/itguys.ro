export const contactContent = {
  hero: {
    headline: "Parliamone",
    subheadline: "Hai un progetto in mente? Raccontacelo.",
  },

  form: {
    fields: {
      name: { label: "Nome", required: true },
      email: { label: "Email", required: true },
      company: { label: "Azienda", required: false },
      projectType: { label: "Tipo di Progetto", required: false },
      description: {
        label: "Descrizione del Progetto",
        placeholder: "Cosa stai costruendo? Quale problema risolve?",
        required: true,
      },
    },
    submitButton: "Invia Messaggio",
  },

  directEmail: "contact@itguys.ro",
  phone: "+40 726 205 856",

  whatHappensNext: {
    title: "Cosa succede dopo",
    body: [
      "Esamineremo il tuo messaggio e risponderemo entro 1-2 giorni lavorativi. Se c'e un match, fisseremo una breve chiamata per discutere i tuoi obiettivi e preparare una proposta.",
      "Nessun obbligo. Se non siamo il team giusto per il tuo progetto, te lo diremo.",
    ],
  },

  cta: {
    headline: "Pronti quando lo sei tu",
    body: "Niente pitch di vendita. Solo una conversazione su cosa stai costruendo.",
    buttonText: "Invia Messaggio",
    buttonHref: "#contact-form",
  },
};
