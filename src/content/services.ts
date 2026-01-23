export const servicesContent = {
  hero: {
    headline: "What We Build",
    subheadline:
      "Custom software and security services backed by 25+ combined years at EA, TUI, and Nagarro.",
  },

  services: [
    {
      id: "development",
      title: "Web applications",
      description:
        "From internal dashboards to customer-facing platforms. SPAs, PWAs, admin panels, SaaS products. Whatever your users need.",
      details:
        "We work with Laravel, Symfony, Drupal, WordPress, CraftCMS, and modern JavaScript frameworks. We choose based on your requirements, not our preferences. Need SEO? Server-side rendering. Heavy interactivity? A modern SPA. Simple needs? Maybe no framework at all.",
      technologies: ["PHP 8", "Laravel", "Drupal", "WordPress", "React", "Next.js"],
    },
    {
      id: "mobile",
      title: "Mobile Applications",
      description:
        "Native iOS and Android apps built by engineers with 10+ years at Nagarro and Enea AB. Not cross-platform compromises, real native performance.",
      details:
        "We specialize in native development because some apps demand it. IoT integrations, wearables, payment systems, healthcare apps. When performance and platform integration matter, we build native. We also handle app store publishing, CI/CD pipelines, and ongoing maintenance.",
      technologies: ["Swift", "Kotlin", "iOS SDK", "Android SDK", "Fitbit SDK"],
      subservices: [
        {
          title: "Native iOS & Android",
          description:
            "True native apps with full platform integration. Not React Native or Flutter. When your app needs to feel like it belongs on the device.",
        },
        {
          title: "IoT & Wearables",
          description:
            "Connected device apps, Fitbit integrations, and hardware SDKs. Experience shipping IoT products at Enea AB.",
        },
        {
          title: "Payment & E-commerce",
          description:
            "Stripe, Shopify, and custom payment integrations. Secure transactions that meet compliance requirements.",
        },
        {
          title: "Healthcare & Pharma",
          description:
            "Apps for veterinary, nutrition, and pharmaceutical industries. Understanding of regulatory requirements and data sensitivity.",
        },
      ],
    },
    {
      id: "cloud",
      title: "DevOps & Cloud Infrastructure",
      description:
        "Containerized deployments, CI/CD pipelines, and cloud architecture on AWS. We build infrastructure that scales and stays secure.",
      details:
        "Docker, Kubernetes, Terraform, CircleCI, GitHub Actions. We set up automated deployments, monitoring, and infrastructure as code so your team can ship with confidence.",
      technologies: ["AWS", "Docker", "Kubernetes", "Terraform", "CircleCI"],
    },
    {
      id: "consulting",
      title: "Backend, APIs & Integrations",
      description:
        "The engine behind your application. RESTful APIs, microservices, database optimization, and third-party integrations.",
      details:
        "MySQL, PostgreSQL, Elastic Search for complex queries. We handle legacy modernization, system integrations, and standalone modules for larger products. If you have a specific technical challenge, we're happy to dig in.",
      technologies: ["MySQL", "PostgreSQL", "Elastic Search", "Redis"],
    },
    {
      id: "security",
      title: "Security Services",
      description:
        "With backgrounds at Electronic Arts and TUI, we don't just build software. We know how to break it. That perspective shapes everything we create.",
      details: null,
      subservices: [
        {
          title: "Penetration testing",
          description:
            "Manual and automated vulnerability testing against web apps, APIs, and infrastructure. The same techniques we used at EA, now for your applications.",
        },
        {
          title: "Security audits",
          description:
            "Code reviews and architecture assessments to find vulnerabilities before attackers do. We've reviewed game binaries and enterprise platforms.",
        },
        {
          title: "Cloud security",
          description:
            "AWS configuration reviews, IAM policies, network segmentation, secrets management. The boring stuff that prevents breaches.",
        },
        {
          title: "DDoS & Bot protection",
          description:
            "Implementation and tuning of Akamai and Cloudflare defenses. Credential stuffing, scraping, DDoS, account takeover prevention. Akamai-certified.",
        },
      ],
      note: "We can work as a standalone security team or alongside your development work with us.",
      technologies: ["Akamai", "Cloudflare", "Kali Linux", "AWS Security"],
    },
  ],

  cta: {
    headline: "Have a Project in Mind?",
    body: "Let's talk about what you're building. No jargon, no commitment. Just a conversation.",
    buttonText: "Start a Conversation",
    buttonHref: "/contact",
  },
};
