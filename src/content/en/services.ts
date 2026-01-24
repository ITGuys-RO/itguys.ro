export const servicesContent = {
  hero: {
    headline: "Professional Services",
    subheadline:
      "Quality assurance, security expertise, and data analytics. The services that keep your software reliable, secure, and optimized.",
  },

  services: [
    {
      id: "consulting",
      title: "Technical Consulting",
      description:
        "Expert guidance on architecture decisions, technology choices, and development strategies.",
      details:
        "Sometimes you need a second opinion or expert guidance before committing to a direction. We offer consulting services to help you make informed decisions about your technology stack, architecture, and development approach.",
      technologies: [],
      subservices: [
        {
          title: "Architecture Review",
          description:
            "Assessment of your current architecture with recommendations for scalability, security, and maintainability.",
        },
        {
          title: "Technology Selection",
          description:
            "Unbiased guidance on choosing the right technologies for your specific requirements and constraints.",
        },
        {
          title: "Code Review",
          description:
            "Expert review of your codebase focusing on best practices, security vulnerabilities, and performance issues.",
        },
        {
          title: "DevSecOps Strategy",
          description:
            "Integrating security into your development process. Shifting left without slowing down.",
        },
      ],
    },
    {
      id: "security",
      title: "Security Services",
      description:
        "With backgrounds at Electronic Arts and TUI, we don't just build software. We know how to break it. That perspective shapes everything we create.",
      details:
        "Security is the fundamental attribute of any recommendable service. Trust is what establishes user loyalty. We understand the gravity of protecting your systems and data.",
      subservices: [
        {
          title: "Penetration Testing",
          description:
            "Manual and automated vulnerability testing against web apps, APIs, and infrastructure. The same techniques we used at EA, now for your applications.",
        },
        {
          title: "Security Audits",
          description:
            "Code reviews and architecture assessments to find vulnerabilities before attackers do. We've reviewed game binaries and enterprise platforms.",
        },
        {
          title: "Cloud Security",
          description:
            "AWS configuration reviews, IAM policies, network segmentation, secrets management. The boring stuff that prevents breaches.",
        },
        {
          title: "DDoS & Bot Protection",
          description:
            "Implementation and tuning of Akamai and Cloudflare defenses. Credential stuffing, scraping, DDoS, account takeover prevention. Akamai-certified.",
        },
        {
          title: "Incident Response",
          description:
            "Swift assessment, containment, and recovery when breaches occur. Post-incident analysis and security hardening.",
        },
        {
          title: "Zero Trust Implementation",
          description:
            "Multi-factor authentication, access controls, and continuous monitoring. Every user and device verified before access is granted.",
        },
      ],
      note: "We can work as a standalone security team or alongside your development, work with us!",
      technologies: ["Akamai", "Cloudflare", "Kali Linux", "AWS Security", "Burp Suite"],
    },
    {
      id: "data-analytics",
      title: "Big Data & Analytics",
      description:
        "Transform raw data into business intelligence. Custom dashboards, metrics, and analytics that drive decisions.",
      details:
        "Performance is all about tracking. Improvement cannot be done without measurements. We implement smart analytics solutions that give you insight into user behavior, system performance, and business metrics.",
      technologies: ["Google Analytics", "Mixpanel", "Grafana", "Elasticsearch", "Python"],
      subservices: [
        {
          title: "Dashboard Design",
          description:
            "Data rendered into shapes, forms, and infographics that are accessible to any reader. Transform data into something organic and actionable.",
        },
        {
          title: "Performance Tracking",
          description:
            "Zero tolerance for erroneous collection. Precise tools, perfect timing, and metrics relevant to your specific case.",
        },
        {
          title: "Competitive Analysis",
          description:
            "Insight into user behavior, preferences, habits, and how you fare against immediate competition.",
        },
        {
          title: "Real-time Monitoring",
          description:
            "Speed and volume handling for live readings, especially critical when data amounts become enormous.",
        },
      ],
    },
    {
      id: "qa-testing",
      title: "QA & Testing Services",
      description:
        "Quality is not optional. We ensure your software works flawlessly through comprehensive manual and automated testing.",
      details:
        "Our testing approach covers functionality, performance, security, and user experience. We use industry-standard tools like Selenium, Appium, and JMeter to detect issues before they reach your users.",
      technologies: ["Selenium", "Appium", "JMeter", "Postman", "Cypress"],
      subservices: [
        {
          title: "Manual Testing",
          description:
            "Hands-on testing that catches UX issues, edge cases, and real-world scenarios automated tests miss.",
        },
        {
          title: "Automated Testing",
          description:
            "Selenium, Appium, and custom test suites for fast, repeatable regression testing across builds.",
        },
        {
          title: "Performance Testing",
          description:
            "Load testing, stress testing, and bottleneck identification. Know your limits before your users find them.",
        },
        {
          title: "Security Testing",
          description:
            "Vulnerability scanning, penetration testing, and risk assessment integrated into your development cycle.",
        },
      ],
    },
  ],

  cta: {
    headline: "Need Expert Guidance?",
    body: "Whether it's ensuring quality, strengthening security, or making sense of your data, we're here to help.",
    buttonText: "Get in Touch",
    buttonHref: "/contact",
  },
};
