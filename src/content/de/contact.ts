export const contactContent = {
  hero: {
    headline: "Lassen Sie uns reden",
    subheadline: "Haben Sie ein Projekt im Sinn? Erzählen Sie uns davon.",
  },

  form: {
    fields: {
      name: { label: "Name", required: true },
      email: { label: "E-Mail", required: true },
      company: { label: "Unternehmen", required: false },
      projectType: { label: "Projekttyp", required: false },
      description: {
        label: "Projektbeschreibung",
        placeholder: "Was bauen Sie? Welches Problem löst es?",
        required: true,
      },
    },
    submitButton: "Nachricht senden",
  },

  directEmail: "contact@itguys.ro",
  phone: "+40 726 205 856",

  whatHappensNext: {
    title: "Was als Nächstes passiert",
    body: [
      "Wir werden Ihre Nachricht prüfen und innerhalb von 1-2 Werktagen antworten. Wenn es passt, vereinbaren wir ein kurzes Gespräch, um Ihre Ziele zu besprechen und einen Vorschlag zu erstellen.",
      "Keine Verpflichtungen. Wenn wir nicht das richtige Team für Ihr Projekt sind, sagen wir es Ihnen.",
    ],
  },

  cta: {
    headline: "Bereit wenn Sie es sind",
    body: "Kein Verkaufsgespräch. Nur ein Gespräch darüber, was Sie bauen.",
    buttonText: "Nachricht senden",
    buttonHref: "#contact-form",
  },
};
