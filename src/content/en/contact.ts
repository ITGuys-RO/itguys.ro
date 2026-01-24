export const contactContent = {
  hero: {
    headline: "Let's Talk",
    subheadline: "Have a project in mind? Tell us about it.",
  },

  form: {
    fields: {
      name: { label: "Name", required: true },
      email: { label: "Email", required: true },
      company: { label: "Company", required: false },
      projectType: { label: "Project Type", required: false },
      description: {
        label: "Project Description",
        placeholder: "What are you building? What problem does it solve?",
        required: true,
      },
    },
    submitButton: "Send Message",
  },

  directEmail: "contact@itguys.ro",
  phone: "+40 726 205 856",

  whatHappensNext: {
    title: "What happens next",
    body: [
      "We'll review your message and respond within 1-2 business days. If there's a fit, we'll schedule a short call to discuss your goals and put together a proposal.",
      "No obligations. If we're not the right team for your project, we'll tell you.",
    ],
  },

  cta: {
    headline: "Ready when you are",
    body: "No sales pitch. Just a conversation about what you're building.",
    buttonText: "Send Message",
    buttonHref: "#contact-form",
  },
};
