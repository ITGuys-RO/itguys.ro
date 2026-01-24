type Project = {
  name: string;
  clientType: string;
  industry: string;
  challenge: string;
  solution: string;
  tech: string[];
  result?: string;
  image?: string;
  url?: string;
};

export const portfolioContent = {
  hero: {
    headline: "Our Work",
    subheadline:
      "Projects we've built for startups and enterprises. Different challenges, different solutions.",
  },

  projects: [
    {
      name: "XtendLive",
      clientType: "Enterprise",
      industry: "Events & Media",
      challenge:
        "Build a virtual events platform that's powerful enough for enterprise conferences yet simple enough for anyone to use. The platform needed to handle large-scale live streaming, real-time attendee engagement, and detailed analytics.",
      solution:
        "Developed a scalable event management system with intuitive event creation tools, interactive engagement features, and a comprehensive analytics dashboard. Focused on reliability and ease of use without sacrificing capabilities.",
      tech: ["React", "Node.js", "WebRTC", "AWS", "PostgreSQL"],
      result: "Platform now powers virtual events for organizations worldwide.",
      url: "https://xtendlive.com/",
    },
    {
      name: "Insight6",
      clientType: "Enterprise",
      industry: "Customer Experience",
      challenge:
        "A leading UK mystery shopping agency needed to modernize their platform to handle thousands of monthly evaluations across retail, hospitality, healthcare, and legal sectors. The system had to coordinate 800+ mystery shoppers and deliver feedback within 48 hours.",
      solution:
        "Built a comprehensive evaluation management system with mobile-friendly data collection, automated workflow routing, and a client portal for real-time access to results. Integrated video, phone, and chat evaluation capabilities.",
      tech: ["PHP", "Laravel", "MySQL", "Vue.js", "AWS"],
      result: "System processes over 23,000 mystery shops annually for 500+ UK brands.",
      url: "https://www.insight6.com/",
    },
    {
      name: "AudioMovers ListenTo",
      clientType: "Product Company",
      industry: "Audio & Music",
      challenge:
        "Create a professional-grade audio streaming plugin that lets music producers and audio engineers stream high-quality audio from their DAW to clients anywhere in the world. Required support for up to 128 channels of lossless audio with minimal latency.",
      solution:
        "Developed a cross-platform plugin (VST, AU, AAX) with adaptive bitrate streaming, supporting everything from compressed AAC to lossless 32-bit PCM at 192kHz. Built receiver apps for web, iOS, and Android so clients can listen without installing software.",
      tech: ["C++", "JUCE", "WebRTC", "React", "iOS", "Android"],
      result: "Industry-standard tool used by audio professionals and studios globally.",
      url: "https://audiomovers.com/products/listento",
    },
    {
      name: "FSC (Forest Stewardship Council)",
      clientType: "Non-Profit",
      industry: "Environmental",
      challenge:
        "The world's leading forest certification organization needed digital tools to support their mission of protecting forests globally. Required systems for certification management, supply chain traceability, and stakeholder coordination across multiple countries.",
      solution:
        "Contributed to the development of certification and traceability systems that help verify sustainable forestry practices across global supply chains. Implemented secure data handling for sensitive compliance information.",
      tech: ["PHP", "Drupal", "PostgreSQL", "Docker", "REST APIs"],
      result: "Supporting FSC's mission to protect forests through trusted certification.",
      url: "https://fsc.org/en",
    },
    {
      name: "RakeTheRake",
      clientType: "Enterprise",
      industry: "iGaming",
      challenge:
        "A poker affiliate platform operating since 2004 with over 250,000 members needed to scale their rakeback tracking and payout systems while integrating with dozens of poker rooms and gaming sites. Security and accurate financial tracking were critical.",
      solution:
        "Built robust tracking and payment systems capable of handling high transaction volumes. Implemented secure integrations with multiple gaming platforms and automated payout calculations. Added community features including freeroll tournaments and leaderboards.",
      tech: ["CraftCMS", "PHP", "MySQL", "Redis", "JavaScript"],
      result: "Platform has distributed over $190 million in rakeback to members since 2004.",
      url: "https://www.raketherake.com/",
    },
    {
      name: "KeyVision PRO",
      clientType: "Product Company",
      industry: "Legal Tech",
      challenge:
        "Law firms needed a comprehensive cloud-based practice management solution covering time tracking, billing, case management, and financial reporting. The system had to handle sensitive client data with strict security requirements.",
      solution:
        "Developed a full-featured legal practice management platform with integrated timesheets, automated invoicing, court hearing tracking, and performance dashboards. Implemented SSL encryption and role-based access controls for data protection.",
      tech: ["PHP", "Laravel", "Angular", "MySQL", "AWS"],
      result: "Serving law firms from solo practitioners to large multi-team practices across Europe.",
      url: "https://www.keyvision.eu/",
    },
  ] as Project[],

  cta: {
    headline: "Your project could be next",
    body: "Have something you want to build? Let's talk.",
    buttonText: "Start a Conversation",
    buttonHref: "/contact",
  },
};
