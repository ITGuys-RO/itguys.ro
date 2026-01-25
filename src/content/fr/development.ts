import { getCombinedYears } from "@/lib/utils";

export const developmentContent = {
  hero: {
    headline: "Ce que nous construisons",
    subheadline:
      `Développement logiciel sur mesure soutenu par plus de ${getCombinedYears()} ans d'expérience combinée chez EA, TUI et Nagarro. Solutions web, mobile, cloud et IA.`,
  },

  cta: {
    headline: "Vous avez un projet en tête ?",
    body: "Parlons de ce que vous construisez. Sans jargon, sans engagement. Juste une conversation.",
    buttonText: "Démarrer une conversation",
    buttonHref: "/contact",
  },
};
