type TeamMember = {
  name: string;
  role: string;
  bio: string;
  email?: string;
  linkedIn?: string;
};

export const aboutContent = {
  hero: {
    headline: "We're ITGuys",
    subheadline:
      "Combined 25+ years of experience from Electronic Arts, TUI, Nagarro, and Swiss enterprises. Web, mobile, and security. Based in Romania, working worldwide.",
  },

  ourStory: {
    title: "Our story",
    body: [
      "ITGuys was founded by Catalin Teodorescu, a Senior Web Security Engineer with over 15 years of experience spanning cybersecurity, full-stack development, and DevOps. After working at companies like Electronic Arts and TUI, and spending nearly 7 years building software for Swiss clients, one thing became clear: most agencies pick their favorite stack and bend every project to fit it.",
      "We do the opposite. Your product deserves the right foundation, not a convenient one. Whether that means PHP, Node, Python, or something else entirely depends on what you're building and who's using it.",
      "Our background in security isn't separate from our development work. It's built into how we think about architecture, write code, and deploy systems. When you've spent years finding vulnerabilities in other people's software, you learn to build yours differently.",
    ],
  },

  experience: {
    title: "Partners We've Worked With",
    companies: [
      { name: "TUI", description: "Web security for one of the world's largest travel companies", logo: "/logos/tui.svg" },
      { name: "Electronic Arts", description: "Security testing for web applications and game platforms", logo: "/logos/ea.svg" },
      { name: "Nagarro", description: "5+ years of mobile architecture and native app development", logo: "/logos/nagarro.svg" },
      { name: "Enea AB", description: "IoT and native SDK development for connected devices", logo: "/logos/enea.svg" },
    ],
  },

  whatWeBelieve: {
    title: "What we believe",
    values: [
      {
        title: "Right tool for the job",
        description:
          "We don't have a favorite language. We have a favorite outcome: software that works. If that means learning a new framework, we learn it.",
      },
      {
        title: "Security by default",
        description:
          "With backgrounds in penetration testing and security engineering, we build applications that are secure from the start, not patched after the fact.",
      },
      {
        title: "Clear communication",
        description:
          "You'll always know where your project stands, what decisions we're making, and why. No black boxes.",
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
    members: [
      {
        name: "Catalin Teodorescu",
        role: "Founder & Lead Engineer",
        bio: "15+ years in software development and cybersecurity. Previously at TUI, Electronic Arts, and Team Extension AG. Specializes in secure architecture, DevOps, and web application security.",
        linkedIn: "https://www.linkedin.com/in/dustfeather/",
        email: "dustfeather@gmail.com",
      },
      {
        name: "Cristian-Marian Mincu",
        role: "Senior Mobile Developer",
        bio: "10+ years building native iOS and Android apps. Previously at Nagarro and Enea AB. Expert in mobile architecture, IoT integrations, and CI/CD pipelines. Master's in Information Security from Politehnica Bucharest.",
        linkedIn: "https://www.linkedin.com/in/cristian-marian-mincu-44849690/",
      },
    ] as TeamMember[],
  },

  cta: {
    headline: "Want to Work Together?",
    body: "We're always happy to meet founders and teams working on interesting products.",
    buttonText: "Get in Touch",
    buttonHref: "/contact",
  },
};
