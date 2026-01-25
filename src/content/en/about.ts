import { getCombinedYearsText } from "@/lib/utils";

export const aboutContent = {
  hero: {
    headline: "We're ITGuys",
    subheadline:
      `Combined ${getCombinedYearsText()} years of experience from Electronic Arts, TUI, Nagarro, and Swiss enterprises. Web, mobile, and security. Based in Romania, working worldwide.`,
  },

  vision: {
    title: "Our Vision",
    body: [
      "We don't just deliver a service. We build real relationships with our clients, understand what they're trying to do, and make their goals our own.",
      "We're always learning. Each project teaches us something new and lets us test what we can do.",
      "We build software that fits your specific problem. Simple where it can be, robust where it needs to be.",
    ],
    highlight: "We succeed when you succeed.",
  },

  ourStory: {
    title: "Our Story",
    body: [
      "ITGuys was founded by Catalin Teodorescu, a Senior Web Security Engineer with over 15 years of experience spanning cybersecurity, full-stack development, and DevOps. After working at companies like Electronic Arts and TUI, and spending nearly 7 years building software for Swiss clients, one thing became clear: most agencies pick their favorite stack and bend every project to fit it.",
      "We do the opposite. Your product deserves the right foundation, not a convenient one. Whether that means PHP, Node, Python, or something else entirely depends on what you're building and who's using it.",
      "Our background in security isn't separate from our development work. It's built into how we think about architecture, write code, and deploy systems. When you've spent years finding vulnerabilities in other people's software, you learn to build yours differently.",
    ],
  },

  mission: {
    title: "Our Mission",
    body: [
      "At ITGuys, we care about two things: code that's organized and features that are actually useful. Reliable for you, simple for your users.",
      "We build things that bring people together and keep them safe. Things people actually want to use and recommend.",
      "We take the work seriously. Every project gets our full attention.",
    ],
  },

  experience: {
    title: "Partners We've Worked With",
  },

  whatWeBelieve: {
    title: "Our Principles",
    intro:
      "We write code, but that's not all we care about. We take pride in what we build. These principles shape how we work.",
    values: [
      {
        title: "Simplicity",
        description:
          "Clean, comprehensive code that's easy to pick up by any developer. We deliver intuitive, user-friendly solutions free from unnecessary complexity.",
      },
      {
        title: "Reliability",
        description:
          "Constant improvements and updates, readily available adaptation to immense traffic. Systems that stand up to the test of time and stress.",
      },
      {
        title: "Adaptability",
        description:
          "Easily adaptable to the rich demands of the public and the ever-changing world of the internet. We build for today and tomorrow.",
      },
      {
        title: "Security",
        description:
          "With cyber attacks on the rise, we ensure products are delivered safely without compromising user integrity. Security is the basic requirement for any further interaction.",
      },
      {
        title: "Right tool for the job",
        description:
          "We don't have a favorite language. We have a favorite outcome: software that works. If that means learning a new framework, we learn it.",
      },
      {
        title: "Clear communication",
        description:
          "You'll always know where your project stands, what decisions we're making, and why. No black boxes.",
      },
    ],
  },

  deliveryModels: {
    title: "How We Work",
    models: [
      {
        title: "Team Augmentation",
        description:
          "For ongoing projects or specific tasks. One developer or a whole team. Experienced people who work on your terms and fit in with your existing setup.",
        ideal: "Ideal for: Existing teams needing extra capacity or specialized skills.",
      },
      {
        title: "Fixed Price Projects",
        description:
          "Full commitment from the ITGuys team. We take your concept from idea to working product, handle the design and architecture, and make sure it's secure from day one.",
        ideal: "Ideal for: New products, MVPs, or complete system builds.",
      },
    ],
  },

  certifications: {
    title: "Certifications",
    items: [
      "Akamai Web Performance Foundations",
      "Professional Scrum Master I",
      "Professional Scrum Product Owner I",
    ],
  },

  team: {
    title: "The team",
  },

  cta: {
    headline: "Want to Work Together?",
    body: "We're always happy to meet founders and teams working on interesting products.",
    buttonText: "Get in Touch",
    buttonHref: "/contact",
  },
};
