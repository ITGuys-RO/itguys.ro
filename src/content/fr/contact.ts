export const contactContent = {
  hero: {
    headline: "Parlons-en",
    subheadline: "Vous avez un projet en tête ? Parlez-nous en.",
  },

  form: {
    fields: {
      name: { label: "Nom", required: true },
      email: { label: "Email", required: true },
      company: { label: "Entreprise", required: false },
      projectType: { label: "Type de projet", required: false },
      description: {
        label: "Description du projet",
        placeholder: "Que construisez-vous ? Quel problème résolvez-vous ?",
        required: true,
      },
    },
    submitButton: "Envoyer le Message",
  },

  directEmail: "contact@itguys.ro",
  phone: "+40 726 205 856",

  whatHappensNext: {
    title: "La suite",
    body: [
      "Nous examinerons votre message et répondrons sous 1-2 jours ouvrables. Si nous sommes compatibles, nous programmerons un court appel pour discuter de vos objectifs et préparer une proposition.",
      "Sans engagement. Si nous ne sommes pas la bonne équipe pour votre projet, nous vous le dirons.",
    ],
  },

  cta: {
    headline: "Prêts quand vous l'êtes",
    body: "Pas de discours commercial. Juste une conversation sur ce que vous construisez.",
    buttonText: "Envoyer le Message",
    buttonHref: "#contact-form",
  },
};
