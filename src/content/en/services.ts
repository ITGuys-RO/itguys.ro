export const servicesContent = {
  hero: {
    headline: "What We Build",
    subheadline:
      "Custom software development backed by 25+ combined years at EA, TUI, and Nagarro. Web, mobile, cloud, and AI solutions.",
  },

  services: [
    {
      id: "ai-ml",
      title: "AI & Machine Learning",
      description:
        "From natural language processing to computer vision, we build intelligent systems that learn and adapt. Turn data into actionable insights.",
      details:
        "We develop custom AI solutions using TensorFlow, PyTorch, and Scikit-learn. Whether it's building predictive models, implementing NLP for chatbots, or creating computer vision systems for image recognition, we focus on practical AI that solves real business problems.",
      technologies: ["Python", "TensorFlow", "PyTorch", "Scikit-learn", "OpenAI"],
      subservices: [
        {
          title: "Natural Language Processing",
          description:
            "Chatbots, sentiment analysis, text classification, and machine translation. Make your applications understand and respond to human language.",
        },
        {
          title: "Computer Vision",
          description:
            "Image recognition, object detection, and video analysis. From quality control to security monitoring.",
        },
        {
          title: "Deep Learning",
          description:
            "Neural networks for complex pattern recognition. When traditional algorithms aren't enough.",
        },
        {
          title: "Predictive Analytics",
          description:
            "Machine learning models that forecast trends, detect anomalies, and optimize decisions based on historical data.",
        },
      ],
    },
    {
      id: "development",
      title: "Web Applications",
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
      id: "backend",
      title: "Backend, APIs & Integrations",
      description:
        "The engine behind your application. RESTful APIs, microservices, database optimization, and third-party integrations.",
      details:
        "MySQL, PostgreSQL, Elastic Search for complex queries. We handle legacy modernization, system integrations, and standalone modules for larger products. If you have a specific technical challenge, we're happy to dig in.",
      technologies: ["Node.js", "Python", "PHP", "GraphQL", "REST APIs"],
    },
    {
      id: "database",
      title: "Database Design & Management",
      description:
        "SQL, NoSQL, data modeling, and administration. We design databases that scale and stay fast.",
      details:
        "From schema design to performance optimization, we handle the data layer. MySQL, PostgreSQL, MongoDB, Redis. We choose based on your access patterns, not our preferences. Database administration, migrations, and disaster recovery included.",
      technologies: ["MySQL", "PostgreSQL", "MongoDB", "Redis", "Elasticsearch"],
      subservices: [
        {
          title: "SQL Databases",
          description:
            "Relational database design, optimization, and management. MySQL, PostgreSQL, and enterprise solutions.",
        },
        {
          title: "NoSQL Solutions",
          description:
            "Document stores, key-value databases, and graph databases for high-velocity and unstructured data.",
        },
        {
          title: "Data Modeling",
          description:
            "Schema design that supports your queries and scales with your growth. Getting the foundation right.",
        },
        {
          title: "Database Administration",
          description:
            "Backup strategies, performance tuning, security hardening, and disaster recovery planning.",
        },
      ],
    },
  ],

  cta: {
    headline: "Have a Project in Mind?",
    body: "Let's talk about what you're building. No jargon, no commitment. Just a conversation.",
    buttonText: "Start a Conversation",
    buttonHref: "/contact",
  },
};
