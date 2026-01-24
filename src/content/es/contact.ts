export const contactContent = {
  hero: {
    headline: "Hablemos",
    subheadline: "Tienes un proyecto en mente? Cuentanos sobre el.",
  },

  form: {
    fields: {
      name: { label: "Nombre", required: true },
      email: { label: "Email", required: true },
      company: { label: "Empresa", required: false },
      projectType: { label: "Tipo de Proyecto", required: false },
      description: {
        label: "Descripcion del Proyecto",
        placeholder: "Que estas construyendo? Que problema resuelve?",
        required: true,
      },
    },
    submitButton: "Enviar Mensaje",
  },

  directEmail: "contact@itguys.ro",
  phone: "+40 726 205 856",

  whatHappensNext: {
    title: "Que pasa despues",
    body: [
      "Revisaremos tu mensaje y responderemos en 1-2 dias habiles. Si hay encaje, programaremos una breve llamada para discutir tus objetivos y preparar una propuesta.",
      "Sin obligaciones. Si no somos el equipo adecuado para tu proyecto, te lo diremos.",
    ],
  },

  cta: {
    headline: "Listos cuando tu lo estes",
    body: "Sin pitch de ventas. Solo una conversacion sobre lo que estas construyendo.",
    buttonText: "Enviar Mensaje",
    buttonHref: "#contact-form",
  },
};
