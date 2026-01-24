export const contactContent = {
  hero: {
    headline: "Hai să vorbim",
    subheadline: "Ai un proiect în minte? Spune-ne despre el.",
  },

  form: {
    fields: {
      name: { label: "Nume", required: true },
      email: { label: "Email", required: true },
      company: { label: "Companie", required: false },
      projectType: { label: "Tip proiect", required: false },
      description: {
        label: "Descriere proiect",
        placeholder: "Ce construiești? Ce problemă rezolvă?",
        required: true,
      },
    },
    submitButton: "Trimite mesaj",
  },

  directEmail: "contact@itguys.ro",
  phone: "+40 726 205 856",

  whatHappensNext: {
    title: "Ce urmează",
    body: [
      "Vom analiza mesajul tău și vom răspunde în 1-2 zile lucrătoare. Dacă există potrivire, vom programa un apel scurt pentru a discuta obiectivele tale și a pregăti o propunere.",
      "Fără obligații. Dacă nu suntem echipa potrivită pentru proiectul tău, îți vom spune.",
    ],
  },

  cta: {
    headline: "Pregătiți când ești tu",
    body: "Fără discurs de vânzări. Doar o conversație despre ce construiești.",
    buttonText: "Trimite mesaj",
    buttonHref: "#contact-form",
  },
};
