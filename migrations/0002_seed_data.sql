-- Seed data from static content files
-- Generated from src/content/en/*.ts
-- Uses INSERT OR IGNORE to be idempotent (safe to run multiple times)

-- ============================================================
-- TEAM MEMBERS
-- ============================================================

INSERT OR IGNORE INTO team_members (slug, email, gravatar_email, linkedin_url, image_path, sort_order, is_active, created_at, updated_at) VALUES
  ('catalin-teodorescu', 'contact@itguys.ro', 'dustfeather@gmail.com', 'https://www.linkedin.com/in/dustfeather/', NULL, 0, 1, datetime('now'), datetime('now')),
  ('cristian-marian-mincu', NULL, NULL, 'https://www.linkedin.com/in/cristian-marian-mincu-44849690/', NULL, 1, 1, datetime('now'), datetime('now'));

INSERT OR IGNORE INTO team_member_translations (team_member_id, locale, name, role, bio) VALUES
  (1, 'en', 'Catalin Teodorescu', 'Founder & Lead Engineer', '15+ years in software development and cybersecurity. Previously at TUI, Electronic Arts, and Team Extension AG. Specializes in secure architecture, DevOps, and web application security.'),
  (2, 'en', 'Cristian-Marian Mincu', 'Senior Mobile Developer', '10+ years building native iOS and Android apps. Previously at Nagarro and Enea AB. Expert in mobile architecture, IoT integrations, and CI/CD pipelines. Master''s in Information Security from University Politehnica of Bucharest.');

-- ============================================================
-- COMPANIES (Partners)
-- ============================================================

INSERT OR IGNORE INTO companies (slug, logo_path, external_url, sort_order, is_active, created_at, updated_at) VALUES
  ('tui', '/logos/tui.svg', NULL, 0, 1, datetime('now'), datetime('now')),
  ('electronic-arts', '/logos/ea.svg', NULL, 1, 1, datetime('now'), datetime('now')),
  ('nagarro', '/logos/nagarro.svg', NULL, 2, 1, datetime('now'), datetime('now')),
  ('enea-ab', '/logos/enea.svg', NULL, 3, 1, datetime('now'), datetime('now'));

INSERT OR IGNORE INTO company_translations (company_id, locale, name, description) VALUES
  (1, 'en', 'TUI', 'Web security for one of the world''s largest travel companies'),
  (2, 'en', 'Electronic Arts', 'Security testing for web applications and game platforms'),
  (3, 'en', 'Nagarro', '5+ years of mobile architecture and native app development'),
  (4, 'en', 'Enea AB', 'IoT and native SDK development for connected devices');

-- ============================================================
-- PROJECTS
-- ============================================================

INSERT OR IGNORE INTO projects (slug, image_path, external_url, sort_order, is_active, created_at, updated_at) VALUES
  ('xtendlive', NULL, 'https://xtendlive.com/', 0, 1, datetime('now'), datetime('now')),
  ('insight6', NULL, 'https://www.insight6.com/', 1, 1, datetime('now'), datetime('now')),
  ('audiomovers-listento', NULL, 'https://audiomovers.com/products/listento', 2, 1, datetime('now'), datetime('now')),
  ('fsc', NULL, 'https://fsc.org/en', 3, 1, datetime('now'), datetime('now')),
  ('raketherake', NULL, 'https://www.raketherake.com/', 4, 1, datetime('now'), datetime('now')),
  ('keyvision-pro', NULL, 'https://www.keyvision.eu/', 5, 1, datetime('now'), datetime('now'));

INSERT OR IGNORE INTO project_translations (project_id, locale, name, client_type, industry, challenge, solution, result) VALUES
  (1, 'en', 'XtendLive', 'Enterprise', 'Events & Media',
    'Build a virtual events platform that''s powerful enough for enterprise conferences yet simple enough for anyone to use. The platform needed to handle large-scale live streaming, real-time attendee engagement, and detailed analytics.',
    'Developed a scalable event management system with intuitive event creation tools, interactive engagement features, and a comprehensive analytics dashboard. Focused on reliability and ease of use without sacrificing capabilities.',
    'Platform now powers virtual events for organizations worldwide.'),
  (2, 'en', 'Insight6', 'Enterprise', 'Customer Experience',
    'A leading UK mystery shopping agency needed to modernize their platform to handle thousands of monthly evaluations across retail, hospitality, healthcare, and legal sectors. The system had to coordinate 800+ mystery shoppers and deliver feedback within 48 hours.',
    'Built a comprehensive evaluation management system with mobile-friendly data collection, automated workflow routing, and a client portal for real-time access to results. Integrated video, phone, and chat evaluation capabilities.',
    'System processes over 23,000 mystery shops annually for 500+ UK brands.'),
  (3, 'en', 'AudioMovers ListenTo', 'Product Company', 'Audio & Music',
    'Create a professional-grade audio streaming plugin that lets music producers and audio engineers stream high-quality audio from their DAW to clients anywhere in the world. Required support for up to 128 channels of lossless audio with minimal latency.',
    'Developed a cross-platform plugin (VST, AU, AAX) with adaptive bitrate streaming, supporting everything from compressed AAC to lossless 32-bit PCM at 192kHz. Built receiver apps for web, iOS, and Android so clients can listen without installing software.',
    'Industry-standard tool used by audio professionals and studios globally.'),
  (4, 'en', 'FSC (Forest Stewardship Council)', 'Non-Profit', 'Environmental',
    'The world''s leading forest certification organization needed digital tools to support their mission of protecting forests globally. Required systems for certification management, supply chain traceability, and stakeholder coordination across multiple countries.',
    'Contributed to the development of certification and traceability systems that help verify sustainable forestry practices across global supply chains. Implemented secure data handling for sensitive compliance information.',
    'Supporting FSC''s mission to protect forests through trusted certification.'),
  (5, 'en', 'RakeTheRake', 'Enterprise', 'iGaming',
    'A poker affiliate platform operating since 2004 with over 250,000 members needed to scale their rakeback tracking and payout systems while integrating with dozens of poker rooms and gaming sites. Security and accurate financial tracking were critical.',
    'Built robust tracking and payment systems capable of handling high transaction volumes. Implemented secure integrations with multiple gaming platforms and automated payout calculations. Added community features including freeroll tournaments and leaderboards.',
    'Platform has distributed over $190 million in rakeback to members since 2004.'),
  (6, 'en', 'KeyVision PRO', 'Product Company', 'Legal Tech',
    'Law firms needed a comprehensive cloud-based practice management solution covering time tracking, billing, case management, and financial reporting. The system had to handle sensitive client data with strict security requirements.',
    'Developed a full-featured legal practice management platform with integrated timesheets, automated invoicing, court hearing tracking, and performance dashboards. Implemented SSL encryption and role-based access controls for data protection.',
    'Serving law firms from solo practitioners to large multi-team practices across Europe.');

-- Project Technologies
INSERT OR IGNORE INTO project_technologies (project_id, technology, sort_order) VALUES
  -- XtendLive
  (1, 'React', 0), (1, 'Node.js', 1), (1, 'WebRTC', 2), (1, 'AWS', 3), (1, 'PostgreSQL', 4),
  -- Insight6
  (2, 'PHP', 0), (2, 'Laravel', 1), (2, 'MySQL', 2), (2, 'Vue.js', 3), (2, 'AWS', 4),
  -- AudioMovers ListenTo
  (3, 'C++', 0), (3, 'JUCE', 1), (3, 'WebRTC', 2), (3, 'React', 3), (3, 'iOS', 4), (3, 'Android', 5),
  -- FSC
  (4, 'PHP', 0), (4, 'Drupal', 1), (4, 'PostgreSQL', 2), (4, 'Docker', 3), (4, 'REST APIs', 4),
  -- RakeTheRake
  (5, 'CraftCMS', 0), (5, 'PHP', 1), (5, 'MySQL', 2), (5, 'Redis', 3), (5, 'JavaScript', 4),
  -- KeyVision PRO
  (6, 'PHP', 0), (6, 'Laravel', 1), (6, 'Angular', 2), (6, 'MySQL', 3), (6, 'AWS', 4);

-- ============================================================
-- SERVICES (from services.ts - Professional Services)
-- ============================================================

INSERT OR IGNORE INTO services (slug, icon, category, sort_order, is_active, created_at, updated_at) VALUES
  ('consulting', NULL, 'professional-services', 0, 1, datetime('now'), datetime('now')),
  ('security', NULL, 'professional-services', 1, 1, datetime('now'), datetime('now')),
  ('data-analytics', NULL, 'professional-services', 2, 1, datetime('now'), datetime('now')),
  ('qa-testing', NULL, 'professional-services', 3, 1, datetime('now'), datetime('now'));

INSERT OR IGNORE INTO service_translations (service_id, locale, title, description, details, note) VALUES
  (1, 'en', 'Technical Consulting',
    'Expert guidance on architecture decisions, technology choices, and development strategies.',
    'Sometimes you need a second opinion or expert guidance before committing to a direction. We offer consulting services to help you make informed decisions about your technology stack, architecture, and development approach.',
    NULL),
  (2, 'en', 'Security Services',
    'With backgrounds at Electronic Arts and TUI, we don''t just build software. We know how to break it. That perspective shapes everything we create.',
    'If your users don''t trust your security, they won''t stick around. Protecting your systems and data is the foundation everything else is built on.',
    'We can work as a standalone security team or alongside your development, work with us!'),
  (3, 'en', 'Big Data & Analytics',
    'Turn raw data into something useful. Custom dashboards, metrics, and analytics that help you make decisions.',
    'You can''t improve what you don''t measure. We set up analytics that show you what''s happening with your users, your system, and your business.',
    NULL),
  (4, 'en', 'QA & Testing Services',
    'We make sure your software actually works. Manual and automated testing that catches problems before your users do.',
    'Our testing approach covers functionality, performance, security, and user experience. We use industry-standard tools like Selenium, Appium, and JMeter to detect issues before they reach your users.',
    NULL);

-- Service Technologies (Professional Services)
INSERT OR IGNORE INTO service_technologies (service_id, technology, sort_order) VALUES
  -- Security
  (2, 'Akamai', 0), (2, 'Cloudflare', 1), (2, 'Kali Linux', 2), (2, 'AWS Security', 3), (2, 'Burp Suite', 4),
  -- Data Analytics
  (3, 'Google Analytics', 0), (3, 'Mixpanel', 1), (3, 'Grafana', 2), (3, 'Elasticsearch', 3), (3, 'Python', 4),
  -- QA Testing
  (4, 'Selenium', 0), (4, 'Appium', 1), (4, 'JMeter', 2), (4, 'Postman', 3), (4, 'Cypress', 4);

-- Subservices for Professional Services
INSERT OR IGNORE INTO subservices (service_id, slug, sort_order) VALUES
  -- Consulting (service_id = 1)
  (1, 'architecture-review', 0),
  (1, 'technology-selection', 1),
  (1, 'code-review', 2),
  (1, 'devsecops-strategy', 3),
  -- Security (service_id = 2)
  (2, 'penetration-testing', 0),
  (2, 'security-audits', 1),
  (2, 'cloud-security', 2),
  (2, 'ddos-bot-protection', 3),
  (2, 'incident-response', 4),
  (2, 'zero-trust-implementation', 5),
  -- Data Analytics (service_id = 3)
  (3, 'dashboard-design', 0),
  (3, 'performance-tracking', 1),
  (3, 'competitive-analysis', 2),
  (3, 'real-time-monitoring', 3),
  -- QA Testing (service_id = 4)
  (4, 'manual-testing', 0),
  (4, 'automated-testing', 1),
  (4, 'performance-testing', 2),
  (4, 'security-testing', 3);

INSERT OR IGNORE INTO subservice_translations (subservice_id, locale, title, description) VALUES
  -- Consulting subservices (1-4)
  (1, 'en', 'Architecture Review', 'Assessment of your current architecture with recommendations for scalability, security, and maintainability.'),
  (2, 'en', 'Technology Selection', 'Unbiased guidance on choosing the right technologies for your specific requirements and constraints.'),
  (3, 'en', 'Code Review', 'Expert review of your codebase focusing on best practices, security vulnerabilities, and performance issues.'),
  (4, 'en', 'DevSecOps Strategy', 'Integrating security into your development process. Shifting left without slowing down.'),
  -- Security subservices (5-10)
  (5, 'en', 'Penetration Testing', 'Manual and automated vulnerability testing against web apps, APIs, and infrastructure. The same techniques we used at EA, now for your applications.'),
  (6, 'en', 'Security Audits', 'Code reviews and architecture assessments to find vulnerabilities before attackers do. We''ve reviewed game binaries and enterprise platforms.'),
  (7, 'en', 'Cloud Security', 'AWS configuration reviews, IAM policies, network segmentation, secrets management. The boring stuff that prevents breaches.'),
  (8, 'en', 'DDoS & Bot Protection', 'Implementation and tuning of Akamai and Cloudflare defenses. Credential stuffing, scraping, DDoS, account takeover prevention. Akamai-certified.'),
  (9, 'en', 'Incident Response', 'Swift assessment, containment, and recovery when breaches occur. Post-incident analysis and security hardening.'),
  (10, 'en', 'Zero Trust Implementation', 'Multi-factor authentication, access controls, and continuous monitoring. Every user and device verified before access is granted.'),
  -- Data Analytics subservices (11-14)
  (11, 'en', 'Dashboard Design', 'Data presented in charts and visualizations anyone can understand. Numbers that tell a story.'),
  (12, 'en', 'Performance Tracking', 'Accurate tracking with the right metrics for your situation. No garbage data.'),
  (13, 'en', 'Competitive Analysis', 'See how users behave, what they prefer, and how you compare to competitors.'),
  (14, 'en', 'Real-time Monitoring', 'Live data when you need it, even at high volume.'),
  -- QA Testing subservices (15-18)
  (15, 'en', 'Manual Testing', 'Hands-on testing that catches UX issues, edge cases, and real-world scenarios automated tests miss.'),
  (16, 'en', 'Automated Testing', 'Selenium, Appium, and custom test suites for fast, repeatable regression testing across builds.'),
  (17, 'en', 'Performance Testing', 'Load testing, stress testing, and bottleneck identification. Know your limits before your users find them.'),
  (18, 'en', 'Security Testing', 'Vulnerability scanning, penetration testing, and risk assessment integrated into your development cycle.');

-- ============================================================
-- SERVICES (from development.ts - Development Services)
-- ============================================================

INSERT OR IGNORE INTO services (slug, icon, category, sort_order, is_active, created_at, updated_at) VALUES
  ('ai-ml', NULL, 'development', 0, 1, datetime('now'), datetime('now')),
  ('web-applications', NULL, 'development', 1, 1, datetime('now'), datetime('now')),
  ('mobile', NULL, 'development', 2, 1, datetime('now'), datetime('now')),
  ('cloud', NULL, 'development', 3, 1, datetime('now'), datetime('now')),
  ('backend', NULL, 'development', 4, 1, datetime('now'), datetime('now')),
  ('database', NULL, 'development', 5, 1, datetime('now'), datetime('now'));

INSERT OR IGNORE INTO service_translations (service_id, locale, title, description, details, note) VALUES
  (5, 'en', 'AI & Machine Learning',
    'From natural language processing to computer vision, we build systems that learn and adapt. Turn data into something useful.',
    'We build custom AI solutions using TensorFlow, PyTorch, and Scikit-learn. Predictive models, chatbots with NLP, image recognition. We focus on AI that solves actual problems, not demos.',
    NULL),
  (6, 'en', 'Web Applications',
    'From internal dashboards to customer-facing platforms. SPAs, PWAs, admin panels, SaaS products. Whatever your users need.',
    'We work with Laravel, Symfony, Drupal, WordPress, CraftCMS, and modern JavaScript frameworks. We choose based on your requirements, not our preferences. Need SEO? Server-side rendering. Heavy interactivity? A modern SPA. Simple needs? Maybe no framework at all.',
    NULL),
  (7, 'en', 'Mobile Applications',
    'Native iOS and Android apps built by engineers with 10+ years at Nagarro and Enea AB. Not cross-platform compromises, real native performance.',
    'We specialize in native development because some apps demand it. IoT integrations, wearables, payment systems, healthcare apps. When performance and platform integration matter, we build native. We also handle app store publishing, CI/CD pipelines, and ongoing maintenance.',
    NULL),
  (8, 'en', 'DevOps & Cloud Infrastructure',
    'Containerized deployments, CI/CD pipelines, and cloud architecture on AWS. We build infrastructure that scales and stays secure.',
    'Docker, Kubernetes, Terraform, CircleCI, GitHub Actions. We set up automated deployments, monitoring, and infrastructure as code so your team can ship with confidence.',
    NULL),
  (9, 'en', 'Backend, APIs & Integrations',
    'The engine behind your application. RESTful APIs, microservices, database optimization, and third-party integrations.',
    'MySQL, PostgreSQL, Elastic Search for complex queries. We handle legacy modernization, system integrations, and standalone modules for larger products. If you have a specific technical challenge, we''re happy to dig in.',
    NULL),
  (10, 'en', 'Database Design & Management',
    'SQL, NoSQL, data modeling, and administration. We design databases that scale and stay fast.',
    'From schema design to performance optimization, we handle the data layer. MySQL, PostgreSQL, MongoDB, Redis. We choose based on your access patterns, not our preferences. Database administration, migrations, and disaster recovery included.',
    NULL);

-- Service Technologies (Development Services)
INSERT OR IGNORE INTO service_technologies (service_id, technology, sort_order) VALUES
  -- AI & ML
  (5, 'Python', 0), (5, 'TensorFlow', 1), (5, 'PyTorch', 2), (5, 'Scikit-learn', 3), (5, 'OpenAI', 4),
  -- Web Applications
  (6, 'PHP 8', 0), (6, 'Laravel', 1), (6, 'Drupal', 2), (6, 'WordPress', 3), (6, 'React', 4), (6, 'Next.js', 5),
  -- Mobile
  (7, 'Swift', 0), (7, 'Kotlin', 1), (7, 'iOS SDK', 2), (7, 'Android SDK', 3), (7, 'Fitbit SDK', 4),
  -- Cloud
  (8, 'AWS', 0), (8, 'Docker', 1), (8, 'Kubernetes', 2), (8, 'Terraform', 3), (8, 'CircleCI', 4),
  -- Backend
  (9, 'Node.js', 0), (9, 'Python', 1), (9, 'PHP', 2), (9, 'GraphQL', 3), (9, 'REST APIs', 4),
  -- Database
  (10, 'MySQL', 0), (10, 'PostgreSQL', 1), (10, 'MongoDB', 2), (10, 'Redis', 3), (10, 'Elasticsearch', 4);

-- Subservices for Development Services
INSERT OR IGNORE INTO subservices (service_id, slug, sort_order) VALUES
  -- AI & ML (service_id = 5)
  (5, 'natural-language-processing', 0),
  (5, 'computer-vision', 1),
  (5, 'deep-learning', 2),
  (5, 'predictive-analytics', 3),
  -- Mobile (service_id = 7)
  (7, 'native-ios-android', 0),
  (7, 'iot-wearables', 1),
  (7, 'payment-ecommerce', 2),
  (7, 'healthcare-pharma', 3),
  -- Database (service_id = 10)
  (10, 'sql-databases', 0),
  (10, 'nosql-solutions', 1),
  (10, 'data-modeling', 2),
  (10, 'database-administration', 3);

INSERT OR IGNORE INTO subservice_translations (subservice_id, locale, title, description) VALUES
  -- AI & ML subservices (19-22)
  (19, 'en', 'Natural Language Processing', 'Chatbots, sentiment analysis, text classification, and machine translation. Make your applications understand and respond to human language.'),
  (20, 'en', 'Computer Vision', 'Image recognition, object detection, and video analysis. From quality control to security monitoring.'),
  (21, 'en', 'Deep Learning', 'Neural networks for complex pattern recognition. When traditional algorithms aren''t enough.'),
  (22, 'en', 'Predictive Analytics', 'Machine learning models that forecast trends, detect anomalies, and optimize decisions based on historical data.'),
  -- Mobile subservices (23-26)
  (23, 'en', 'Native iOS & Android', 'True native apps with full platform integration. Not React Native or Flutter. When your app needs to feel like it belongs on the device.'),
  (24, 'en', 'IoT & Wearables', 'Connected device apps, Fitbit integrations, and hardware SDKs. Experience shipping IoT products at Enea AB.'),
  (25, 'en', 'Payment & E-commerce', 'Stripe, Shopify, and custom payment integrations. Secure transactions that meet compliance requirements.'),
  (26, 'en', 'Healthcare & Pharma', 'Apps for veterinary, nutrition, and pharmaceutical industries. Understanding of regulatory requirements and data sensitivity.'),
  -- Database subservices (27-30)
  (27, 'en', 'SQL Databases', 'Relational database design, optimization, and management. MySQL, PostgreSQL, and enterprise solutions.'),
  (28, 'en', 'NoSQL Solutions', 'Document stores, key-value databases, and graph databases for high-velocity and unstructured data.'),
  (29, 'en', 'Data Modeling', 'Schema design that supports your queries and scales with your growth. Getting the foundation right.'),
  (30, 'en', 'Database Administration', 'Backup strategies, performance tuning, security hardening, and disaster recovery planning.');
