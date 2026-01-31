-- Comprehensive content seed for ITGuys website
-- Uses INSERT OR REPLACE to be idempotent (overwrites stale seed data)
-- Skips: posts, post_translations, post_tags (auto-generated)

-- Clear old seed data (children first to respect FK constraints)
DELETE FROM faq_translations;
DELETE FROM faq_items;
DELETE FROM project_technologies;
DELETE FROM project_translations;
DELETE FROM projects;
DELETE FROM team_member_translations;
DELETE FROM team_members;
DELETE FROM subservice_translations;
DELETE FROM subservices;
DELETE FROM service_technologies;
DELETE FROM service_translations;
DELETE FROM services;
DELETE FROM company_translations;
DELETE FROM companies;

-- === companies ===
INSERT OR IGNORE INTO companies (id, slug, logo_path, external_url, sort_order, is_active, created_at, updated_at) VALUES (1, 'tui', '/logos/tui.svg', NULL, 0, 1, '2026-01-25 04:34:56', '2026-01-25 04:34:56');
INSERT OR IGNORE INTO companies (id, slug, logo_path, external_url, sort_order, is_active, created_at, updated_at) VALUES (2, 'electronic-arts', '/logos/ea.svg', NULL, 1, 1, '2026-01-25 04:34:56', '2026-01-25 04:34:56');
INSERT OR IGNORE INTO companies (id, slug, logo_path, external_url, sort_order, is_active, created_at, updated_at) VALUES (3, 'nagarro', '/logos/nagarro.svg', NULL, 2, 1, '2026-01-25 04:34:56', '2026-01-25 04:34:56');
INSERT OR IGNORE INTO companies (id, slug, logo_path, external_url, sort_order, is_active, created_at, updated_at) VALUES (4, 'enea-ab', '/logos/enea.svg', NULL, 3, 1, '2026-01-25 04:34:56', '2026-01-25 04:34:56');

-- === company_translations ===
INSERT OR IGNORE INTO company_translations (id, company_id, locale, name, description) VALUES (1, 1, 'en', 'TUI', 'Web security for one of the world''s largest travel companies');
INSERT OR IGNORE INTO company_translations (id, company_id, locale, name, description) VALUES (2, 2, 'en', 'Electronic Arts', 'Security testing for web applications and game platforms');
INSERT OR IGNORE INTO company_translations (id, company_id, locale, name, description) VALUES (3, 3, 'en', 'Nagarro', '5+ years of mobile architecture and native app development');
INSERT OR IGNORE INTO company_translations (id, company_id, locale, name, description) VALUES (4, 4, 'en', 'Enea AB', 'IoT and native SDK development for connected devices');
INSERT OR IGNORE INTO company_translations (id, company_id, locale, name, description) VALUES (21, 1, 'ro', 'TUI', 'Securitate web pentru una dintre cele mai mari companii de turism din lume');
INSERT OR IGNORE INTO company_translations (id, company_id, locale, name, description) VALUES (22, 2, 'ro', 'Electronic Arts', 'Testare de securitate pentru aplicații web și platforme de gaming');
INSERT OR IGNORE INTO company_translations (id, company_id, locale, name, description) VALUES (23, 3, 'ro', 'Nagarro', 'Peste 5 ani de arhitectură mobilă și dezvoltare de aplicații native');
INSERT OR IGNORE INTO company_translations (id, company_id, locale, name, description) VALUES (24, 4, 'ro', 'Enea AB', 'Dezvoltare IoT și SDK nativ pentru dispozitive conectate');
INSERT OR IGNORE INTO company_translations (id, company_id, locale, name, description) VALUES (25, 1, 'fr', 'TUI', 'Sécurité web pour l''une des plus grandes entreprises de voyage au monde');
INSERT OR IGNORE INTO company_translations (id, company_id, locale, name, description) VALUES (26, 2, 'fr', 'Electronic Arts', 'Tests de sécurité pour applications web et plateformes de jeux');
INSERT OR IGNORE INTO company_translations (id, company_id, locale, name, description) VALUES (27, 3, 'fr', 'Nagarro', 'Plus de 5 ans d''architecture mobile et développement d''applications natives');
INSERT OR IGNORE INTO company_translations (id, company_id, locale, name, description) VALUES (28, 4, 'fr', 'Enea AB', 'Développement IoT et SDK natif pour appareils connectés');
INSERT OR IGNORE INTO company_translations (id, company_id, locale, name, description) VALUES (29, 1, 'de', 'TUI', 'Web-Sicherheit für eines der größten Reiseunternehmen der Welt');
INSERT OR IGNORE INTO company_translations (id, company_id, locale, name, description) VALUES (30, 2, 'de', 'Electronic Arts', 'Sicherheitstests für Webanwendungen und Gaming-Plattformen');
INSERT OR IGNORE INTO company_translations (id, company_id, locale, name, description) VALUES (31, 3, 'de', 'Nagarro', 'Über 5 Jahre mobile Architektur und native App-Entwicklung');
INSERT OR IGNORE INTO company_translations (id, company_id, locale, name, description) VALUES (32, 4, 'de', 'Enea AB', 'IoT- und native SDK-Entwicklung für vernetzte Geräte');
INSERT OR IGNORE INTO company_translations (id, company_id, locale, name, description) VALUES (33, 1, 'it', 'TUI', 'Sicurezza web per una delle più grandi aziende di viaggi al mondo');
INSERT OR IGNORE INTO company_translations (id, company_id, locale, name, description) VALUES (34, 2, 'it', 'Electronic Arts', 'Test di sicurezza per applicazioni web e piattaforme di gaming');
INSERT OR IGNORE INTO company_translations (id, company_id, locale, name, description) VALUES (35, 3, 'it', 'Nagarro', 'Oltre 5 anni di architettura mobile e sviluppo di app native');
INSERT OR IGNORE INTO company_translations (id, company_id, locale, name, description) VALUES (36, 4, 'it', 'Enea AB', 'Sviluppo IoT e SDK nativo per dispositivi connessi');
INSERT OR IGNORE INTO company_translations (id, company_id, locale, name, description) VALUES (37, 1, 'es', 'TUI', 'Seguridad web para una de las mayores empresas de viajes del mundo');
INSERT OR IGNORE INTO company_translations (id, company_id, locale, name, description) VALUES (38, 2, 'es', 'Electronic Arts', 'Pruebas de seguridad para aplicaciones web y plataformas de juegos');
INSERT OR IGNORE INTO company_translations (id, company_id, locale, name, description) VALUES (39, 3, 'es', 'Nagarro', 'Más de 5 años de arquitectura móvil y desarrollo de aplicaciones nativas');
INSERT OR IGNORE INTO company_translations (id, company_id, locale, name, description) VALUES (40, 4, 'es', 'Enea AB', 'Desarrollo IoT y SDK nativo para dispositivos conectados');

-- === services ===
INSERT OR IGNORE INTO services (id, slug, icon, category, sort_order, is_active, created_at, updated_at) VALUES (1, 'consulting', NULL, 'professional-services', 0, 1, '2026-01-25 04:34:56', '2026-01-25 04:34:56');
INSERT OR IGNORE INTO services (id, slug, icon, category, sort_order, is_active, created_at, updated_at) VALUES (2, 'security', NULL, 'professional-services', 1, 1, '2026-01-25 04:34:56', '2026-01-25 04:34:56');
INSERT OR IGNORE INTO services (id, slug, icon, category, sort_order, is_active, created_at, updated_at) VALUES (3, 'data-analytics', NULL, 'professional-services', 2, 1, '2026-01-25 04:34:56', '2026-01-25 04:34:56');
INSERT OR IGNORE INTO services (id, slug, icon, category, sort_order, is_active, created_at, updated_at) VALUES (4, 'qa-testing', NULL, 'professional-services', 3, 1, '2026-01-25 04:34:56', '2026-01-25 04:34:56');
INSERT OR IGNORE INTO services (id, slug, icon, category, sort_order, is_active, created_at, updated_at) VALUES (5, 'ai-ml', NULL, 'development', 0, 1, '2026-01-25 04:34:56', '2026-01-25 18:37:30');
INSERT OR IGNORE INTO services (id, slug, icon, category, sort_order, is_active, created_at, updated_at) VALUES (6, 'web-applications', NULL, 'development', 1, 1, '2026-01-25 04:34:56', '2026-01-25 18:40:23');
INSERT OR IGNORE INTO services (id, slug, icon, category, sort_order, is_active, created_at, updated_at) VALUES (7, 'mobile', NULL, 'development', 2, 1, '2026-01-25 04:34:56', '2026-01-25 18:42:02');
INSERT OR IGNORE INTO services (id, slug, icon, category, sort_order, is_active, created_at, updated_at) VALUES (8, 'cloud', NULL, 'development', 3, 1, '2026-01-25 04:34:56', '2026-01-25 18:49:46');
INSERT OR IGNORE INTO services (id, slug, icon, category, sort_order, is_active, created_at, updated_at) VALUES (9, 'backend', NULL, 'development', 4, 1, '2026-01-25 04:34:56', '2026-01-25 18:54:21');
INSERT OR IGNORE INTO services (id, slug, icon, category, sort_order, is_active, created_at, updated_at) VALUES (10, 'database', NULL, 'development', 5, 1, '2026-01-25 04:34:56', '2026-01-25 19:04:40');

-- === service_translations ===
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (1, 1, 'en', 'Technical Consulting', 'Expert guidance on architecture decisions, technology choices, and development strategies.', 'Sometimes you need a second opinion or expert guidance before committing to a direction. We offer consulting services to help you make informed decisions about your technology stack, architecture, and development approach.', NULL, '## How we actually work

Every recommendation we make comes from building and scaling systems at EA, TUI, and Nagarro. Not frameworks we read about - stuff we shipped.

### The process

We start by understanding your situation. What are you building? What constraints exist? What''s worked before, and what hasn''t? This shapes everything that follows.

Then we look at your systems. We identify bottlenecks, map dependencies, and give you a clear picture of where you are. No surprises.

From there, we create a prioritized plan. Not a 100-page document that sits on a shelf - actionable steps with clear outcomes.

### Problems we see repeatedly

Most of the companies we work with are stuck on one of these:

They have too many technology options and not enough clarity on trade-offs. They built something that worked at 1,000 users but is struggling at 100,000. Quick fixes became permanent problems and now the codebase is a mess. Their processes and tools slow down delivery instead of helping. Or they made architecture decisions years ago that now create security vulnerabilities.

### Who hires us

First-time CTOs who need experienced guidance. They''re making architecture decisions, building teams, and choosing technologies - often for the first time at this scale.

Companies modernizing legacy systems. They need someone to assess what they have, figure out what to keep vs. replace, and plan the transition without breaking everything.

Investors doing technical due diligence. They want an honest assessment of a codebase, infrastructure, and team before writing a check.

### What you walk away with

Clear recommendations you can act on. Documentation your team will actually use. Follow-up support as you implement changes. Direct access to engineers who''ve solved similar problems at scale.', 'consulting');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (2, 2, 'en', 'Security Services', 'With backgrounds at Electronic Arts and TUI, we don''t just build software. We know how to break it. That perspective shapes everything we create.', 'If your users don''t trust your security, they won''t stick around. Protecting your systems and data is the foundation everything else is built on.', 'We can work as a standalone security team or alongside your development, work with us!', '## Security from people who''ve been on both sides

Our security team did penetration testing at EA and DDoS protection at TUI. We''ve seen how attackers think because we''ve worked on offense and defense.

### What we do

We attempt to breach your systems the way real attackers would - web applications, APIs, mobile apps, infrastructure. You get a detailed report of what we found and exactly how to fix it.

For security audits, we examine code, configurations, processes, and architecture. Not checkbox compliance. We look for issues that automated scanners miss.

We audit AWS, Azure, and GCP configurations for misconfigurations, excessive permissions, and compliance gaps. Too many breaches start with a single S3 bucket set to public.

For DDoS protection, we configure and optimize Cloudflare, Akamai, or AWS Shield. Rate limiting, WAF rules, incident response planning. Based on protecting high-traffic sites at TUI during peak booking season.

### How a pentest works

We define scope together - what''s in, what methods we''ll use, what you need to prepare. Then we gather information the way an attacker would. Active testing happens within agreed boundaries. We verify findings and assess actual risk, not theoretical impact. You get clear documentation with reproduction steps. We stick around to help your team understand and fix what we found.

### What we typically find

Authentication bypasses and session management flaws. Injection vulnerabilities - SQL, NoSQL, command injection. Insecure direct object references where users can access other users'' data. API issues like broken authentication or excessive data exposure. Cloud misconfigurations - public buckets, overly permissive IAM roles. Unpatched systems and weak protocols.

### Industries we know well

Gaming - anti-cheat considerations, account security, in-game economy protection. Travel - PCI compliance, booking system security, API integrations. Healthcare - HIPAA compliance, PHI protection, audit logging. Finance - SOC 2 preparation, transaction security, fraud prevention.', 'security');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (3, 3, 'en', 'Big Data & Analytics', 'Turn raw data into something useful. Custom dashboards, metrics, and analytics that help you make decisions.', 'You can''t improve what you don''t measure. We set up analytics that show you what''s happening with your users, your system, and your business.', NULL, '## Turning data into decisions

Raw data sitting in a database is useless. We help you turn it into insights that change how you operate.

### What we build

Custom dashboards with real-time visibility into metrics that matter to your business. Not generic templates - dashboards designed around your specific KPIs and how your team actually works.

Data pipelines that collect, transform, and load data from multiple sources. We handle streaming data, batch processing, and hybrid approaches depending on what you need.

Predictive analytics when the business case is there. Machine learning models that help anticipate trends, identify risks, and optimize operations. We focus on models that are interpretable - not black boxes nobody trusts.

Self-service reporting so your team can answer their own questions. We set up the foundation so you''re not dependent on engineers for every report.

### How we approach it

We start with the decisions you''re trying to make. What would change if you had perfect information? We work backwards from business outcomes to data requirements.

We deliver working dashboards early. You start getting value immediately while we expand capabilities. No six-month projects that deliver everything at the end.

We spend time on data quality because analytics are only as good as the underlying data. Validation, governance, monitoring.

### Tools

Visualization: Grafana, Metabase, Apache Superset, custom D3.js dashboards when you need something specific.

Processing: Apache Spark, Apache Kafka, dbt, Airflow.

Storage: PostgreSQL, ClickHouse, BigQuery, Snowflake - depends on your volume and query patterns.

### Use cases we''ve built

E-commerce conversion funnels and customer lifetime value calculations. SaaS usage analytics and churn prediction. Operations monitoring and cost analysis. Marketing campaign attribution and A/B test analysis.

### Why us

We''re engineers first. We understand how data is generated, where quality issues come from, and how to build systems that scale. We don''t just make charts - we build reliable data infrastructure.', 'data-analytics');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (4, 4, 'en', 'QA & Testing Services', 'We make sure your software actually works. Manual and automated testing that catches problems before your users do.', 'Our testing approach covers functionality, performance, security, and user experience. We use industry-standard tools like Selenium, Appium, and JMeter to detect issues before they reach your users.', NULL, '## Finding bugs before your users do

Manual testing, automated testing, performance testing - whatever it takes to ship with confidence.

### What we do

Exploratory testing by experienced QA engineers who think like users. We find the edge cases automated tests miss.

Test automation with Selenium, Cypress, or Playwright for web. Appium for mobile. We build test suites that run reliably and provide fast feedback - not flaky tests that get ignored.

Load testing with JMeter, k6, or Gatling. We identify bottlenecks before they become outages. You''ll know exactly how your system behaves at 10x your current traffic.

API testing for REST and GraphQL. Contract testing, integration testing, security testing for backend services.

OWASP Top 10 coverage integrated into your testing process. We catch common vulnerabilities during development, not after you''re in production.

### How we work

We analyze your application to identify critical paths, high-risk areas, and testing priorities. Not everything needs the same level of coverage.

We create test cases that cover functional requirements, edge cases, and real user scenarios. Tests that provide actual value, not just coverage numbers.

Testing happens continuously, not just before releases. We integrate with your CI/CD pipeline.

Bug reports include reproduction steps, severity assessment, and suggested fixes. No vague descriptions that waste developer time.

### Tools

Web automation: Selenium, Cypress, Playwright, Puppeteer
Mobile: Appium, XCTest, Espresso
Performance: JMeter, k6, Gatling, Locust
APIs: Postman, REST Assured, Karate
CI/CD: GitHub Actions, GitLab CI, Jenkins

### When clients call us

Before product launches to ensure quality. During migration projects to verify nothing breaks. For ongoing QA support alongside their development team. To build automated testing from scratch. To fix a testing process that isn''t working.

### Deliverables

Test plans and test case documentation. Automated test suites with maintenance docs. Performance benchmarks and recommendations. Bug reports with severity ratings. Testing metrics dashboards.', 'qa-testing');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (5, 5, 'en', 'AI & Machine Learning', 'From natural language processing to computer vision, we build systems that learn and adapt. Turn data into something useful.', 'We build custom AI solutions using TensorFlow, PyTorch, and Scikit-learn. Predictive models, chatbots with NLP, image recognition. We focus on AI that solves actual problems, not demos.', NULL, '## AI that works in production

We build machine learning systems that deliver value - not impressive demos that fall apart when you try to deploy them.

### What we build

Text classification, sentiment analysis, entity extraction, document understanding. Processing unstructured text at scale.

Image classification, object detection, OCR, visual inspection systems. From quality control on manufacturing lines to document processing.

Recommendation engines that learn from user behavior. Product recommendations, content suggestions, dynamic pricing.

Forecasting, anomaly detection, risk scoring. Models that help you anticipate problems before they happen.

### Our approach

Not every problem needs AI. We start by understanding what you''re trying to achieve and whether machine learning is actually the right approach. Sometimes a rules engine is better.

ML models are only as good as their training data. We evaluate what data you have, what you need, and how to handle gaps before writing any code.

We build simple models first, validate they work, then increase complexity if needed. You see results early and can course-correct.

A model isn''t useful until it''s deployed. We handle the engineering to make ML work reliably in production - monitoring, retraining pipelines, drift detection.

### Technical stack

Frameworks: PyTorch, TensorFlow, scikit-learn, Hugging Face
MLOps: MLflow, Kubeflow, custom deployment pipelines
Infrastructure: GPU clusters, AWS SageMaker, Google Vertex AI
LLMs: Fine-tuning, RAG systems, prompt engineering

### Use cases we''ve shipped

Customer service chatbots and ticket classification. Invoice extraction and contract analysis. Visual inspection for manufacturing defects. Product recommendations for e-commerce. Demand forecasting and inventory optimization.

### What makes us different

We''re pragmatic about AI. We won''t recommend deep learning when logistic regression will do. We focus on solutions that are maintainable, explainable, and actually move your business metrics.', 'ai-ml');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (6, 6, 'en', 'Web Applications', 'From internal dashboards to customer-facing platforms. SPAs, PWAs, admin panels, SaaS products. Whatever your users need.', 'We work with Laravel, Symfony, Drupal, WordPress, CraftCMS, and modern JavaScript frameworks. We choose based on your requirements, not our preferences. Need SEO? Server-side rendering. Heavy interactivity? A modern SPA. Simple needs? Maybe no framework at all.', NULL, '## Web apps that work under pressure

From internal tools to customer-facing platforms, we build web applications that perform and scale.

### What we build

Single page applications with React and Next.js. Fast, responsive, optimized for modern browsers.

Progressive web apps that work offline, send push notifications, and feel native. The reach of the web with app-like capabilities.

Admin panels and internal tools that make your team more productive. We build interfaces that are fast to use, not just fast to build.

SaaS products with authentication, billing, and the infrastructure to scale. We''ve built products serving thousands of concurrent users.

Custom e-commerce with inventory management and checkout flows. Integrated with payment providers and shipping services.

### Technology stack

Frontend: React, Next.js, TypeScript, Tailwind CSS. State management with Zustand or React Query. Testing with Playwright and Jest.

Backend: Node.js, Python, PHP (Laravel). PostgreSQL, MySQL, MongoDB. Redis for caching and queues. GraphQL or REST APIs.

Infrastructure: Cloudflare Workers, AWS, Vercel. Docker and Kubernetes when needed. CI/CD with GitHub Actions.

### How we work

We start by understanding requirements, user needs, and constraints. Then wireframes, prototypes, and technical architecture.

Development happens in iterative sprints with regular demos. You see progress weekly, not monthly.

Automated testing, security review, and performance optimization before launch.

CI/CD setup, monitoring, and documentation. Then ongoing maintenance and feature development if you need it.

### What you get

Clean, maintainable code with documentation. Automated deployment pipelines. Monitoring and alerting setup. Performance optimization. Security best practices built in. Knowledge transfer so your team can maintain it.', 'web-applications');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (7, 7, 'en', 'Mobile Applications', 'Native iOS and Android apps built by engineers with 10+ years at Nagarro and Enea AB. Not cross-platform compromises, real native performance.', 'We specialize in native development because some apps demand it. IoT integrations, wearables, payment systems, healthcare apps. When performance and platform integration matter, we build native. We also handle app store publishing, CI/CD pipelines, and ongoing maintenance.', NULL, '## Native mobile apps

We build real native apps - Swift for iOS, Kotlin for Android. Our mobile team has 10+ years at Nagarro and Enea AB, building apps used by millions.

### Why native

Native apps are faster. No JavaScript bridge, no compromise. Your users feel the difference, especially on older devices.

Full access to iOS and Android capabilities. Camera, sensors, health data, payments - whatever the platform offers, we can use it.

Native apps follow platform conventions. iOS users get an iOS experience. Android users get an Android experience. This matters more than most people realize.

Platform updates don''t break your app. You''re not waiting on a framework team to support the latest OS features.

### What we build

Consumer apps that need to be fast and reliable. Social features, media playback, offline support.

Enterprise apps - internal tools, field service applications, B2B products. Security, MDM integration, corporate requirements.

IoT companion apps with Bluetooth connectivity and device management. We''ve built apps for healthcare devices, industrial sensors, and consumer electronics.

Native shopping experiences with smooth checkout, push notifications, and personalization.

### How we work

We define features, create wireframes, and plan the user journey. We consider both platforms from the start.

Parallel iOS and Android development with shared architecture patterns. Regular builds for testing and feedback.

Device testing across multiple screen sizes and OS versions. Performance profiling and memory optimization.

We handle App Store and Play Store submission, address review feedback, and get your app approved.

OS updates, bug fixes, feature additions. We maintain apps for years.

### Technical capabilities

iOS: Swift, SwiftUI, UIKit, Core Data, HealthKit, ARKit
Android: Kotlin, Jetpack Compose, Room, WorkManager
Backend: REST, GraphQL, WebSockets, gRPC
Push: Firebase, APNs, custom solutions
Analytics: Firebase Analytics, Mixpanel, custom tracking

### Industries

Healthcare apps (HIPAA-compliant). Industrial IoT (real-time sensor data). E-commerce (high-volume transactions). Travel (offline-first requirements). Finance (security-critical).', 'mobile');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (8, 8, 'en', 'DevOps & Cloud Infrastructure', 'Containerized deployments, CI/CD pipelines, and cloud architecture on AWS. We build infrastructure that scales and stays secure.', 'Docker, Kubernetes, Terraform, CircleCI, GitHub Actions. We set up automated deployments, monitoring, and infrastructure as code so your team can ship with confidence.', NULL, '## Infrastructure that scales

We build cloud infrastructure on AWS that handles growth, resists attacks, and doesn''t keep you up at night.

### What we do

AWS infrastructure design and implementation. VPCs, load balancers, auto-scaling groups, managed services. Configured for security and cost efficiency.

Docker and Kubernetes deployments when you need them. Containerization, orchestration, resource management.

Automated build, test, and deployment workflows. GitHub Actions, GitLab CI, or AWS CodePipeline - configured for fast, safe releases.

Terraform and CloudFormation for reproducible infrastructure. No more manual configuration or undocumented changes.

Monitoring with Prometheus, Grafana, and CloudWatch. Alerting that tells you about problems before users notice.

### How we think about it

Every infrastructure decision considers security. Least privilege access, encryption at rest and in transit, network segmentation.

We design for efficiency. Reserved instances, spot instances, right-sizing. We help you avoid cloud bill shock.

Multi-AZ deployments, automated failover, disaster recovery planning. We build for failure scenarios because they happen.

Every system comes with runbooks, architecture diagrams, and operational procedures. Your team can manage it without us.

### Common projects

Cloud migration from on-premises to AWS. Kubernetes adoption for applications that need it. CI/CD implementation. Security hardening for compliance requirements. Cost reduction in existing cloud deployments. Disaster recovery implementation.

### Technologies

Cloud: AWS (primary), GCP, Cloudflare
Containers: Docker, Kubernetes, ECS, EKS
IaC: Terraform, CloudFormation, Pulumi
CI/CD: GitHub Actions, GitLab CI, ArgoCD
Monitoring: Prometheus, Grafana, CloudWatch, Datadog
Security: AWS IAM, Vault, SOPS, security scanning

### Deliverables

Architecture documentation with diagrams. Infrastructure as Code repositories. Monitoring dashboards and alerting. Runbooks for common operations. Security review and recommendations. Cost analysis and optimization.', 'cloud');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (9, 9, 'en', 'Backend, APIs & Integrations', 'The engine behind your application. RESTful APIs, microservices, database optimization, and third-party integrations.', 'MySQL, PostgreSQL, Elastic Search for complex queries. We handle legacy modernization, system integrations, and standalone modules for larger products. If you have a specific technical challenge, we''re happy to dig in.', NULL, '## Backend systems that work

We build server-side systems that power applications. APIs, microservices, databases, integrations - engineered for reliability and performance.

### What we build

RESTful APIs that frontend and mobile teams love to work with. Proper authentication, rate limiting, error handling, documentation.

GraphQL services when clients need flexibility. Schema design, resolvers, performance optimization.

Microservices when monoliths need to be broken up. Service boundaries, inter-service communication, managing the complexity.

Third-party integrations. Payment processors, CRMs, ERPs, shipping providers - we connect your system to external services.

Background processing. Job queues, scheduled tasks, event-driven processing. Systems that handle work reliably without blocking user requests.

### How we work

We design APIs before implementing them. Clear contracts, consistent patterns, documentation from the start.

Authentication, authorization, input validation, rate limiting built in from day one. Not bolted on later.

Database query optimization, caching strategies, connection pooling. We measure and optimize before problems occur.

Logging, metrics, and tracing that help you understand what''s happening in production. Debugging shouldn''t require guesswork.

### Technologies

Languages: Node.js (Express, Fastify, NestJS), Python (FastAPI, Django), PHP (Laravel), Go for performance-critical services.

Databases: PostgreSQL, MySQL for relational. MongoDB, DynamoDB for documents. Redis for caching and queues. Elasticsearch for search.

Message queues: RabbitMQ, AWS SQS, Redis Streams, Kafka.

API tools: OpenAPI/Swagger documentation, GraphQL with Apollo, gRPC for internal services.

### Common integrations

Payment processing: Stripe, PayPal, Adyen, local payment methods.
Authentication: OAuth providers, SSO, identity management.
Communication: Email (SendGrid, SES), SMS (Twilio), push notifications.
Storage: S3, Cloudflare R2, CDN integration.
Analytics: Segment, Mixpanel, custom event tracking.

### Deliverables

Well-documented APIs with OpenAPI specs. Integration tests and test environments. Deployment configurations and CI/CD. Monitoring and alerting. Performance benchmarks. Security review documentation.', 'backend');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (10, 10, 'en', 'Database Design & Management', 'SQL, NoSQL, data modeling, and administration. We design databases that scale and stay fast.', 'From schema design to performance optimization, we handle the data layer. MySQL, PostgreSQL, MongoDB, Redis. We choose based on your access patterns, not our preferences. Database administration, migrations, and disaster recovery included.', NULL, '## Databases that stay fast

Data is the foundation of your application. We design schemas, optimize queries, and build data architectures that handle growth.

### What we do

Data modeling that reflects your business domain. Normalized structures for integrity, denormalized where performance demands it.

Slow queries identified and fixed. Index strategies, query rewrites, execution plan analysis. We make databases fast.

Moving between database systems or versions without data loss. Migrations that don''t require extended downtime.

When single-server databases aren''t enough - read replicas, master-master setups, horizontal sharding.

Automated backups, point-in-time recovery, disaster recovery testing. Your data survives hardware failures and human error.

### Database technologies

Relational: PostgreSQL (our default recommendation), MySQL/MariaDB, Amazon RDS and Aurora.

Document: MongoDB, Amazon DynamoDB, Couchbase.

Search and analytics: Elasticsearch, ClickHouse, TimescaleDB.

Caching: Redis, Memcached.

### How we think about it

We start with access patterns. How will your data be written? How will it be read? The answers determine schema design and technology choices.

We don''t guess at performance problems. We measure query times, analyze execution plans, and fix actual bottlenecks.

What works at 1,000 rows might fail at 1,000,000. We design with your growth trajectory in mind.

We don''t use complex features unless they''re needed. Simple schemas are easier to understand, maintain, and optimize.

### Common projects

Performance optimization - fixing slow queries and database bottlenecks. Schema redesign for databases that grew organically. Technology migration - MySQL to PostgreSQL, SQL to NoSQL. Scaling with read replicas, connection pooling, caching layers. Data modeling for new applications. Compliance - audit logging, encryption, access controls.

### Deliverables

Entity-relationship diagrams and schema documentation. Query analysis and optimization recommendations. Migration scripts and rollback procedures. Monitoring dashboards for database health. Backup and recovery runbooks. Performance benchmarks and baselines.', 'database');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (51, 1, 'ro', 'Consultanță Tehnică', 'Ghidare expertizată în decizii de arhitectură, alegeri tehnologice și strategii de dezvoltare.', 'Uneori ai nevoie de o a doua opinie sau de ghidare expertizată înainte de a te angaja într-o direcție. Oferim servicii de consultanță pentru a te ajuta să iei decizii informate despre stack-ul tehnologic, arhitectură și abordarea de dezvoltare.', NULL, '## Cum lucrăm de fapt

Fiecare recomandare pe care o facem vine din experiența construirii și scalării sistemelor la EA, TUI și Nagarro. Nu framework-uri despre care am citit - lucruri pe care le-am livrat.

### Procesul

Începem prin a înțelege situația ta. Ce construiești? Ce constrângeri există? Ce a funcționat înainte și ce nu? Asta modelează tot ce urmează.

Apoi ne uităm la sistemele tale. Identificăm blocajele, mapăm dependențele și îți oferim o imagine clară a locului în care te afli. Fără surprize.

De acolo, creăm un plan prioritizat. Nu un document de 100 de pagini care stă pe raft - pași concreți cu rezultate clare.

### Probleme pe care le vedem în mod repetat

Majoritatea companiilor cu care lucrăm sunt blocate pe una dintre acestea:

Au prea multe opțiuni tehnologice și nu suficientă claritate asupra compromisurilor. Au construit ceva care funcționa la 1.000 de utilizatori dar se chinuie la 100.000. Soluțiile rapide au devenit probleme permanente și acum codul e un haos. Procesele și uneltele lor încetinesc livrarea în loc să ajute. Sau au luat decizii de arhitectură acum ani care acum creează vulnerabilități de securitate.

### Cine ne angajează

CTO-uri la primul job care au nevoie de îndrumare experimentată. Iau decizii de arhitectură, construiesc echipe și aleg tehnologii - adesea pentru prima dată la această scară.

Companii care modernizează sisteme legacy. Au nevoie de cineva să evalueze ce au, să decidă ce păstrează vs. înlocuiesc și să planifice tranziția fără să strice totul.

Investitori care fac due diligence tehnic. Vor o evaluare onestă a codului, infrastructurii și echipei înainte să semneze cecul.

### Cu ce pleci

Recomandări clare pe care poți acționa. Documentație pe care echipa ta chiar o va folosi. Suport de follow-up pe măsură ce implementezi schimbările. Acces direct la ingineri care au rezolvat probleme similare la scară.', 'consultanta');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (52, 2, 'ro', 'Servicii de Securitate', 'Cu experiență la Electronic Arts și TUI, nu doar construim software. Știm cum să-l spargem. Această perspectivă modelează tot ce creăm.', 'Dacă utilizatorii nu au încredere în securitatea ta, nu vor rămâne. Protejarea sistemelor și datelor tale este fundația pe care se construiește totul.', 'Putem lucra ca echipă de securitate independentă sau alături de dezvoltarea ta, lucrează cu noi!', '## Securitate de la oameni care au fost de ambele părți

Echipa noastră de securitate a făcut teste de penetrare la EA și protecție DDoS la TUI. Am văzut cum gândesc atacatorii pentru că am lucrat și în ofensivă și în defensivă.

### Ce facem

Încercăm să penetrăm sistemele tale așa cum ar face atacatorii reali - aplicații web, API-uri, aplicații mobile, infrastructură. Primești un raport detaliat cu ce am găsit și exact cum să repari.

Pentru audituri de securitate, examinăm codul, configurațiile, procesele și arhitectura. Nu conformitate de bifat căsuțe. Căutăm probleme pe care scannerele automate le ratează.

Audităm configurații AWS, Azure și GCP pentru greșeli de configurare, permisiuni excesive și lacune de conformitate. Prea multe breșe încep cu un singur bucket S3 setat pe public.

Pentru protecție DDoS, configurăm și optimizăm Cloudflare, Akamai sau AWS Shield. Rate limiting, reguli WAF, planificare răspuns la incidente. Bazat pe protejarea site-urilor cu trafic mare la TUI în sezonul de vârf.

### Cum funcționează un pentest

Definim scopul împreună - ce e inclus, ce metode vom folosi, ce trebuie să pregătești. Apoi colectăm informații așa cum ar face un atacator. Testarea activă se întâmplă în limitele agreate. Verificăm descoperirile și evaluăm riscul real, nu impactul teoretic. Primești documentație clară cu pași de reproducere. Rămânem să ajutăm echipa să înțeleagă și să repare ce am găsit.

### Ce găsim de obicei

Bypass-uri de autentificare și probleme de gestionare a sesiunilor. Vulnerabilități de injecție - SQL, NoSQL, command injection. Referințe directe nesecurizate la obiecte unde utilizatorii pot accesa datele altora. Probleme de API precum autentificare defectă sau expunere excesivă de date. Greșeli de configurare cloud - bucket-uri publice, roluri IAM prea permisive. Sisteme nepatchuite și protocoale slabe.

### Industrii pe care le cunoaștem bine

Gaming - considerații anti-cheat, securitatea conturilor, protecția economiei in-game. Travel - conformitate PCI, securitatea sistemelor de rezervări, integrări API. Healthcare - conformitate HIPAA, protecție PHI, logging de audit. Finanțe - pregătire SOC 2, securitatea tranzacțiilor, prevenirea fraudei.', 'securitate');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (53, 3, 'ro', 'Big Data & Analytics', 'Transformă datele brute în ceva util. Dashboarduri personalizate, metrici și analize care te ajută să iei decizii.', 'Nu poți îmbunătăți ceea ce nu măsori. Configurăm analize care îți arată ce se întâmplă cu utilizatorii, sistemul și afacerea ta.', NULL, '## Transformăm datele în decizii

Datele brute care stau într-o bază de date sunt inutile. Te ajutăm să le transformi în insight-uri care schimbă modul în care operezi.

### Ce construim

Dashboard-uri custom cu vizibilitate în timp real asupra metricilor care contează pentru afacerea ta. Nu template-uri generice - dashboard-uri proiectate în jurul KPI-urilor tale specifice și a modului în care echipa ta lucrează de fapt.

Pipeline-uri de date care colectează, transformă și încarcă date din surse multiple. Gestionăm streaming, procesare batch și abordări hibride în funcție de ce ai nevoie.

Analiză predictivă când cazul de business există. Modele de machine learning care ajută la anticiparea tendințelor, identificarea riscurilor și optimizarea operațiunilor. Ne concentrăm pe modele interpretabile - nu cutii negre în care nimeni nu are încredere.

Raportare self-service ca echipa ta să-și poată răspunde singură la întrebări. Punem bazele ca să nu depinzi de ingineri pentru fiecare raport.

### Cum abordăm

Începem cu deciziile pe care încerci să le iei. Ce s-ar schimba dacă ai avea informații perfecte? Lucrăm înapoi de la rezultate de business la cerințe de date.

Livrăm dashboard-uri funcționale devreme. Începi să primești valoare imediat în timp ce noi extindem capabilitățile. Fără proiecte de șase luni care livrează totul la final.

Petrecem timp pe calitatea datelor pentru că analytics-ul e la fel de bun ca datele de bază. Validare, governance, monitorizare.

### Unelte

Vizualizare: Grafana, Metabase, Apache Superset, dashboard-uri custom D3.js când ai nevoie de ceva specific.

Procesare: Apache Spark, Apache Kafka, dbt, Airflow.

Stocare: PostgreSQL, ClickHouse, BigQuery, Snowflake - depinde de volumul și pattern-urile tale de query.

### Cazuri de utilizare construite

Funneluri de conversie e-commerce și calcule de customer lifetime value. Analytics de utilizare SaaS și predicție churn. Monitorizare operațiuni și analiză costuri. Atribuire campanii marketing și analiză teste A/B.

### De ce noi

Suntem ingineri în primul rând. Înțelegem cum se generează datele, de unde vin problemele de calitate și cum să construim sisteme care scalează. Nu facem doar grafice - construim infrastructură de date fiabilă.', 'analiza-date');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (54, 4, 'ro', 'Servicii QA & Testare', 'Ne asigurăm că software-ul tău funcționează cu adevărat. Testare manuală și automatizată care găsește probleme înainte ca utilizatorii tăi să le descopere.', 'Abordarea noastră de testare acoperă funcționalitate, performanță, securitate și experiența utilizatorului. Folosim instrumente standard din industrie precum Selenium, Appium și JMeter pentru a detecta probleme înainte să ajungă la utilizatori.', NULL, '## Găsim bug-uri înainte ca utilizatorii tăi să le găsească

Testare manuală, testare automată, testare de performanță - orice e nevoie să livrezi cu încredere.

### Ce facem

Testare exploratorie de către ingineri QA experimentați care gândesc ca utilizatorii. Găsim cazurile limită pe care testele automate le ratează.

Automatizare teste cu Selenium, Cypress sau Playwright pentru web. Appium pentru mobile. Construim suite de teste care rulează fiabil și oferă feedback rapid - nu teste instabile care sunt ignorate.

Load testing cu JMeter, k6 sau Gatling. Identificăm blocajele înainte să devină căderi. Vei ști exact cum se comportă sistemul tău la 10x traficul curent.

Testare API pentru REST și GraphQL. Testare de contract, testare de integrare, testare de securitate pentru servicii backend.

Acoperire OWASP Top 10 integrată în procesul tău de testare. Prindem vulnerabilități comune în timpul dezvoltării, nu după ce ești în producție.

### Cum lucrăm

Analizăm aplicația ta pentru a identifica căile critice, zonele cu risc ridicat și prioritățile de testare. Nu totul are nevoie de același nivel de acoperire.

Creăm cazuri de test care acoperă cerințe funcționale, cazuri limită și scenarii reale de utilizator. Teste care oferă valoare reală, nu doar numere de acoperire.

Testarea se întâmplă continuu, nu doar înainte de release-uri. Ne integrăm cu pipeline-ul tău CI/CD.

Rapoartele de bug includ pași de reproducere, evaluare severitate și sugestii de fix. Fără descrieri vagi care pierd timpul dezvoltatorilor.

### Unelte

Automatizare web: Selenium, Cypress, Playwright, Puppeteer
Mobile: Appium, XCTest, Espresso
Performanță: JMeter, k6, Gatling, Locust
API-uri: Postman, REST Assured, Karate
CI/CD: GitHub Actions, GitLab CI, Jenkins

### Când ne sună clienții

Înainte de lansări de produs pentru a asigura calitatea. În timpul proiectelor de migrare pentru a verifica că nimic nu se strică. Pentru suport QA continuu alături de echipa lor de dezvoltare. Pentru a construi testare automatizată de la zero. Pentru a repara un proces de testare care nu funcționează.

### Livrabile

Planuri de test și documentație cazuri de test. Suite de teste automatizate cu documentație de mentenanță. Benchmark-uri de performanță și recomandări. Rapoarte de bug cu rating-uri de severitate. Dashboard-uri de metrici testare.', 'testare-qa');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (55, 1, 'fr', 'Conseil Technique', 'Conseils d''experts sur les décisions d''architecture, les choix technologiques et les stratégies de développement.', 'Parfois, vous avez besoin d''un deuxième avis ou de conseils d''experts avant de vous engager dans une direction. Nous offrons des services de conseil pour vous aider à prendre des décisions éclairées sur votre stack technologique, votre architecture et votre approche de développement.', NULL, '## Comment nous travaillons vraiment

Chaque recommandation que nous faisons vient de notre expérience à construire et faire évoluer des systèmes chez EA, TUI et Nagarro. Pas des frameworks qu''on a lus - des choses qu''on a livrées.

### Le processus

On commence par comprendre votre situation. Que construisez-vous ? Quelles contraintes existent ? Qu''est-ce qui a marché avant, et qu''est-ce qui n''a pas marché ? Ça façonne tout ce qui suit.

Ensuite on regarde vos systèmes. On identifie les goulots d''étranglement, on cartographie les dépendances, et on vous donne une image claire de où vous en êtes. Pas de surprises.

À partir de là, on crée un plan priorisé. Pas un document de 100 pages qui reste sur une étagère - des étapes concrètes avec des résultats clairs.

### Problèmes qu''on voit régulièrement

La plupart des entreprises avec lesquelles on travaille sont bloquées sur un de ceux-ci :

Elles ont trop d''options technologiques et pas assez de clarté sur les compromis. Elles ont construit quelque chose qui marchait à 1 000 utilisateurs mais qui galère à 100 000. Les solutions rapides sont devenues des problèmes permanents et maintenant le code est un bazar. Leurs processus et outils ralentissent la livraison au lieu d''aider. Ou elles ont pris des décisions d''architecture il y a des années qui créent maintenant des vulnérabilités de sécurité.

### Qui nous engage

Des CTO à leur premier poste qui ont besoin de conseils expérimentés. Ils prennent des décisions d''architecture, construisent des équipes et choisissent des technologies - souvent pour la première fois à cette échelle.

Des entreprises qui modernisent des systèmes legacy. Elles ont besoin de quelqu''un pour évaluer ce qu''elles ont, décider quoi garder vs remplacer, et planifier la transition sans tout casser.

Des investisseurs qui font de la due diligence technique. Ils veulent une évaluation honnête du code, de l''infrastructure et de l''équipe avant de signer le chèque.

### Ce que vous obtenez

Des recommandations claires sur lesquelles vous pouvez agir. De la documentation que votre équipe utilisera vraiment. Un support de suivi pendant que vous implémentez les changements. Un accès direct à des ingénieurs qui ont résolu des problèmes similaires à grande échelle.', 'conseil');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (56, 2, 'fr', 'Services de Sécurité', 'Avec une expérience chez Electronic Arts et TUI, nous ne construisons pas seulement des logiciels. Nous savons comment les casser. Cette perspective façonne tout ce que nous créons.', 'Si vos utilisateurs ne font pas confiance à votre sécurité, ils ne resteront pas. Protéger vos systèmes et vos données est la base sur laquelle tout le reste est construit.', 'Nous pouvons travailler comme équipe de sécurité indépendante ou aux côtés de votre développement, travaillez avec nous!', '## La sécurité par des gens qui ont été des deux côtés

Notre équipe sécurité a fait des tests de pénétration chez EA et de la protection DDoS chez TUI. On a vu comment les attaquants pensent parce qu''on a travaillé en attaque et en défense.

### Ce qu''on fait

On essaie de pénétrer vos systèmes comme le feraient de vrais attaquants - applications web, APIs, apps mobiles, infrastructure. Vous recevez un rapport détaillé de ce qu''on a trouvé et exactement comment réparer.

Pour les audits de sécurité, on examine le code, les configurations, les processus et l''architecture. Pas de la conformité à cocher. On cherche les problèmes que les scanners automatiques ratent.

On audite les configurations AWS, Azure et GCP pour les erreurs de config, les permissions excessives et les lacunes de conformité. Trop de brèches commencent avec un seul bucket S3 mis en public.

Pour la protection DDoS, on configure et optimise Cloudflare, Akamai ou AWS Shield. Rate limiting, règles WAF, planification de réponse aux incidents. Basé sur la protection de sites à fort trafic chez TUI pendant la haute saison.

### Comment fonctionne un pentest

On définit le périmètre ensemble - ce qui est inclus, quelles méthodes on utilisera, ce que vous devez préparer. Ensuite on collecte des informations comme le ferait un attaquant. Les tests actifs se font dans les limites convenues. On vérifie les découvertes et on évalue le risque réel, pas l''impact théorique. Vous recevez une documentation claire avec les étapes de reproduction. On reste pour aider votre équipe à comprendre et réparer ce qu''on a trouvé.

### Ce qu''on trouve généralement

Des contournements d''authentification et des problèmes de gestion de session. Des vulnérabilités d''injection - SQL, NoSQL, injection de commandes. Des références directes non sécurisées où les utilisateurs peuvent accéder aux données des autres. Des problèmes d''API comme l''authentification cassée ou l''exposition excessive de données. Des erreurs de config cloud - buckets publics, rôles IAM trop permissifs. Des systèmes non patchés et des protocoles faibles.

### Industries qu''on connaît bien

Gaming - considérations anti-cheat, sécurité des comptes, protection de l''économie in-game. Voyage - conformité PCI, sécurité des systèmes de réservation, intégrations API. Santé - conformité HIPAA, protection PHI, logging d''audit. Finance - préparation SOC 2, sécurité des transactions, prévention de la fraude.', 'securite');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (57, 3, 'fr', 'Big Data & Analytique', 'Transformez les données brutes en quelque chose d''utile. Tableaux de bord personnalisés, métriques et analyses qui vous aident à prendre des décisions.', 'Vous ne pouvez pas améliorer ce que vous ne mesurez pas. Nous mettons en place des analyses qui vous montrent ce qui se passe avec vos utilisateurs, votre système et votre entreprise.', NULL, '## Transformer les données en décisions

Les données brutes qui dorment dans une base de données sont inutiles. On vous aide à les transformer en insights qui changent votre façon d''opérer.

### Ce qu''on construit

Des dashboards personnalisés avec une visibilité en temps réel sur les métriques qui comptent pour votre business. Pas des templates génériques - des dashboards conçus autour de vos KPIs spécifiques et de comment votre équipe travaille vraiment.

Des pipelines de données qui collectent, transforment et chargent des données de sources multiples. On gère le streaming, le traitement batch et les approches hybrides selon vos besoins.

De l''analyse prédictive quand le cas business existe. Des modèles de machine learning qui aident à anticiper les tendances, identifier les risques et optimiser les opérations. On se concentre sur des modèles interprétables - pas des boîtes noires auxquelles personne ne fait confiance.

Du reporting self-service pour que votre équipe puisse répondre à ses propres questions. On pose les fondations pour que vous ne dépendiez pas des ingénieurs pour chaque rapport.

### Notre approche

On commence par les décisions que vous essayez de prendre. Qu''est-ce qui changerait si vous aviez des informations parfaites ? On travaille à rebours des résultats business vers les besoins en données.

On livre des dashboards fonctionnels tôt. Vous commencez à recevoir de la valeur immédiatement pendant qu''on étend les capacités. Pas de projets de six mois qui livrent tout à la fin.

On passe du temps sur la qualité des données parce que l''analytics est aussi bon que les données sous-jacentes. Validation, gouvernance, monitoring.

### Outils

Visualisation : Grafana, Metabase, Apache Superset, dashboards D3.js personnalisés quand vous avez besoin de quelque chose de spécifique.

Traitement : Apache Spark, Apache Kafka, dbt, Airflow.

Stockage : PostgreSQL, ClickHouse, BigQuery, Snowflake - dépend de votre volume et de vos patterns de requêtes.

### Cas d''usage qu''on a construits

Funnels de conversion e-commerce et calculs de customer lifetime value. Analytics d''usage SaaS et prédiction de churn. Monitoring des opérations et analyse des coûts. Attribution des campagnes marketing et analyse de tests A/B.

### Pourquoi nous

On est ingénieurs d''abord. On comprend comment les données sont générées, d''où viennent les problèmes de qualité, et comment construire des systèmes qui scalent. On ne fait pas juste des graphiques - on construit une infrastructure de données fiable.', 'analyse-donnees');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (58, 4, 'fr', 'Services QA & Tests', 'Nous nous assurons que votre logiciel fonctionne vraiment. Tests manuels et automatisés qui détectent les problèmes avant vos utilisateurs.', 'Notre approche de test couvre la fonctionnalité, la performance, la sécurité et l''expérience utilisateur. Nous utilisons des outils standard de l''industrie comme Selenium, Appium et JMeter pour détecter les problèmes avant qu''ils n''atteignent vos utilisateurs.', NULL, '## Trouver les bugs avant vos utilisateurs

Tests manuels, tests automatisés, tests de performance - tout ce qu''il faut pour livrer avec confiance.

### Ce qu''on fait

Des tests exploratoires par des ingénieurs QA expérimentés qui pensent comme des utilisateurs. On trouve les cas limites que les tests automatiques ratent.

De l''automatisation de tests avec Selenium, Cypress ou Playwright pour le web. Appium pour le mobile. On construit des suites de tests qui tournent de façon fiable et donnent un feedback rapide - pas des tests instables qu''on ignore.

Du load testing avec JMeter, k6 ou Gatling. On identifie les goulots d''étranglement avant qu''ils deviennent des pannes. Vous saurez exactement comment votre système se comporte à 10x votre trafic actuel.

Des tests API pour REST et GraphQL. Tests de contrat, tests d''intégration, tests de sécurité pour les services backend.

Une couverture OWASP Top 10 intégrée dans votre processus de test. On attrape les vulnérabilités communes pendant le développement, pas après la mise en production.

### Comment on travaille

On analyse votre application pour identifier les chemins critiques, les zones à haut risque et les priorités de test. Tout n''a pas besoin du même niveau de couverture.

On crée des cas de test qui couvrent les exigences fonctionnelles, les cas limites et les scénarios utilisateur réels. Des tests qui apportent de la valeur réelle, pas juste des chiffres de couverture.

Les tests se font en continu, pas juste avant les releases. On s''intègre avec votre pipeline CI/CD.

Les rapports de bugs incluent les étapes de reproduction, l''évaluation de la sévérité et des suggestions de fix. Pas de descriptions vagues qui font perdre du temps aux développeurs.

### Outils

Automatisation web : Selenium, Cypress, Playwright, Puppeteer
Mobile : Appium, XCTest, Espresso
Performance : JMeter, k6, Gatling, Locust
APIs : Postman, REST Assured, Karate
CI/CD : GitHub Actions, GitLab CI, Jenkins

### Quand les clients nous appellent

Avant les lancements de produit pour assurer la qualité. Pendant les projets de migration pour vérifier que rien ne casse. Pour du support QA continu aux côtés de leur équipe de dev. Pour construire des tests automatisés from scratch. Pour réparer un processus de test qui ne marche pas.

### Livrables

Plans de test et documentation des cas de test. Suites de tests automatisés avec docs de maintenance. Benchmarks de performance et recommandations. Rapports de bugs avec ratings de sévérité. Dashboards de métriques de test.', 'tests-qa');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (59, 1, 'de', 'Technische Beratung', 'Expertenberatung zu Architekturentscheidungen, Technologieauswahl und Entwicklungsstrategien.', 'Manchmal brauchen Sie eine zweite Meinung oder Expertenberatung, bevor Sie sich für eine Richtung entscheiden. Wir bieten Beratungsdienste, um Ihnen zu helfen, fundierte Entscheidungen über Ihren Technologie-Stack, Ihre Architektur und Ihren Entwicklungsansatz zu treffen.', NULL, '## Wie wir wirklich arbeiten

Jede Empfehlung, die wir geben, stammt aus unserer Erfahrung beim Aufbau und der Skalierung von Systemen bei EA, TUI und Nagarro. Keine Frameworks, über die wir gelesen haben - Sachen, die wir ausgeliefert haben.

### Der Prozess

Wir beginnen damit, Ihre Situation zu verstehen. Was bauen Sie? Welche Einschränkungen gibt es? Was hat vorher funktioniert, und was nicht? Das prägt alles, was folgt.

Dann schauen wir uns Ihre Systeme an. Wir identifizieren Engpässe, kartieren Abhängigkeiten und geben Ihnen ein klares Bild davon, wo Sie stehen. Keine Überraschungen.

Von dort erstellen wir einen priorisierten Plan. Kein 100-seitiges Dokument, das im Regal verstaubt - konkrete Schritte mit klaren Ergebnissen.

### Probleme, die wir regelmäßig sehen

Die meisten Unternehmen, mit denen wir arbeiten, stecken bei einem davon fest:

Sie haben zu viele Technologieoptionen und nicht genug Klarheit über die Kompromisse. Sie haben etwas gebaut, das bei 1.000 Nutzern funktionierte, aber bei 100.000 kämpft. Schnelle Lösungen wurden zu dauerhaften Problemen und jetzt ist der Code ein Chaos. Ihre Prozesse und Tools verlangsamen die Auslieferung, anstatt zu helfen. Oder sie haben vor Jahren Architekturentscheidungen getroffen, die jetzt Sicherheitslücken schaffen.

### Wer uns beauftragt

CTOs in ihrer ersten Position, die erfahrene Beratung brauchen. Sie treffen Architekturentscheidungen, bauen Teams auf und wählen Technologien - oft zum ersten Mal in diesem Umfang.

Unternehmen, die Legacy-Systeme modernisieren. Sie brauchen jemanden, der bewertet, was sie haben, entscheidet, was behalten vs. ersetzt wird, und den Übergang plant, ohne alles kaputt zu machen.

Investoren, die technische Due Diligence durchführen. Sie wollen eine ehrliche Bewertung des Codes, der Infrastruktur und des Teams, bevor sie unterschreiben.

### Was Sie bekommen

Klare Empfehlungen, auf die Sie handeln können. Dokumentation, die Ihr Team tatsächlich nutzen wird. Follow-up-Support, während Sie Änderungen implementieren. Direkter Zugang zu Ingenieuren, die ähnliche Probleme im großen Maßstab gelöst haben.', 'beratung');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (60, 2, 'de', 'Sicherheitsdienste', 'Mit Erfahrung bei Electronic Arts und TUI bauen wir nicht nur Software. Wir wissen, wie man sie knackt. Diese Perspektive prägt alles, was wir schaffen.', 'Wenn Ihre Benutzer Ihrer Sicherheit nicht vertrauen, bleiben sie nicht. Der Schutz Ihrer Systeme und Daten ist das Fundament, auf dem alles andere aufgebaut ist.', 'Wir können als eigenständiges Sicherheitsteam oder neben Ihrer Entwicklung arbeiten, arbeiten Sie mit uns!', '## Sicherheit von Leuten, die auf beiden Seiten waren

Unser Sicherheitsteam hat Penetrationstests bei EA und DDoS-Schutz bei TUI gemacht. Wir haben gesehen, wie Angreifer denken, weil wir sowohl in der Offensive als auch in der Defensive gearbeitet haben.

### Was wir machen

Wir versuchen, in Ihre Systeme einzudringen, wie es echte Angreifer tun würden - Webanwendungen, APIs, mobile Apps, Infrastruktur. Sie erhalten einen detaillierten Bericht darüber, was wir gefunden haben und genau wie Sie es beheben können.

Bei Sicherheitsaudits untersuchen wir Code, Konfigurationen, Prozesse und Architektur. Keine Checkbox-Compliance. Wir suchen nach Problemen, die automatische Scanner übersehen.

Wir auditieren AWS-, Azure- und GCP-Konfigurationen auf Fehlkonfigurationen, übermäßige Berechtigungen und Compliance-Lücken. Zu viele Sicherheitsverletzungen beginnen mit einem einzigen S3-Bucket, der auf öffentlich gesetzt wurde.

Für DDoS-Schutz konfigurieren und optimieren wir Cloudflare, Akamai oder AWS Shield. Rate Limiting, WAF-Regeln, Incident-Response-Planung. Basierend auf dem Schutz von stark frequentierten Seiten bei TUI während der Hauptsaison.

### Wie ein Pentest funktioniert

Wir definieren den Umfang gemeinsam - was enthalten ist, welche Methoden wir verwenden, was Sie vorbereiten müssen. Dann sammeln wir Informationen so, wie es ein Angreifer tun würde. Aktive Tests finden innerhalb der vereinbarten Grenzen statt. Wir verifizieren Ergebnisse und bewerten das tatsächliche Risiko, nicht den theoretischen Impact. Sie erhalten klare Dokumentation mit Reproduktionsschritten. Wir bleiben, um Ihrem Team zu helfen, das Gefundene zu verstehen und zu beheben.

### Was wir typischerweise finden

Authentifizierungs-Bypasses und Session-Management-Probleme. Injection-Schwachstellen - SQL, NoSQL, Command Injection. Unsichere direkte Objektreferenzen, bei denen Benutzer auf die Daten anderer zugreifen können. API-Probleme wie defekte Authentifizierung oder übermäßige Datenexposition. Cloud-Fehlkonfigurationen - öffentliche Buckets, zu permissive IAM-Rollen. Ungepatchte Systeme und schwache Protokolle.

### Branchen, die wir gut kennen

Gaming - Anti-Cheat-Überlegungen, Kontosicherheit, In-Game-Economy-Schutz. Reise - PCI-Compliance, Buchungssystem-Sicherheit, API-Integrationen. Gesundheitswesen - HIPAA-Compliance, PHI-Schutz, Audit-Logging. Finanzen - SOC 2-Vorbereitung, Transaktionssicherheit, Betrugsprävention.', 'sicherheit');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (61, 3, 'de', 'Big Data & Analytics', 'Verwandeln Sie Rohdaten in etwas Nützliches. Individuelle Dashboards, Metriken und Analysen, die Ihnen bei Entscheidungen helfen.', 'Sie können nicht verbessern, was Sie nicht messen. Wir richten Analysen ein, die Ihnen zeigen, was mit Ihren Benutzern, Ihrem System und Ihrem Unternehmen passiert.', NULL, '## Daten in Entscheidungen verwandeln

Rohdaten, die in einer Datenbank liegen, sind nutzlos. Wir helfen Ihnen, sie in Erkenntnisse zu verwandeln, die ändern, wie Sie arbeiten.

### Was wir bauen

Individuelle Dashboards mit Echtzeit-Sichtbarkeit auf die Metriken, die für Ihr Business wichtig sind. Keine generischen Templates - Dashboards, die um Ihre spezifischen KPIs und die tatsächliche Arbeitsweise Ihres Teams herum entwickelt wurden.

Datenpipelines, die Daten aus mehreren Quellen sammeln, transformieren und laden. Wir handhaben Streaming, Batch-Verarbeitung und hybride Ansätze je nach Bedarf.

Predictive Analytics, wenn der Business Case da ist. Machine-Learning-Modelle, die helfen, Trends zu antizipieren, Risiken zu identifizieren und Abläufe zu optimieren. Wir konzentrieren uns auf interpretierbare Modelle - keine Black Boxes, denen niemand vertraut.

Self-Service-Reporting, damit Ihr Team seine eigenen Fragen beantworten kann. Wir legen das Fundament, damit Sie nicht für jeden Bericht von Ingenieuren abhängig sind.

### Unser Ansatz

Wir beginnen mit den Entscheidungen, die Sie treffen wollen. Was würde sich ändern, wenn Sie perfekte Informationen hätten? Wir arbeiten rückwärts von Business-Ergebnissen zu Datenanforderungen.

Wir liefern funktionierende Dashboards früh. Sie bekommen sofort Wert, während wir die Fähigkeiten erweitern. Keine Sechs-Monats-Projekte, die alles am Ende liefern.

Wir verbringen Zeit mit Datenqualität, weil Analytics nur so gut ist wie die zugrunde liegenden Daten. Validierung, Governance, Monitoring.

### Tools

Visualisierung: Grafana, Metabase, Apache Superset, individuelle D3.js-Dashboards wenn Sie etwas Spezifisches brauchen.

Verarbeitung: Apache Spark, Apache Kafka, dbt, Airflow.

Speicherung: PostgreSQL, ClickHouse, BigQuery, Snowflake - abhängig von Ihrem Volumen und Ihren Query-Patterns.

### Anwendungsfälle, die wir gebaut haben

E-Commerce-Conversion-Funnels und Customer-Lifetime-Value-Berechnungen. SaaS-Nutzungsanalysen und Churn-Vorhersage. Operations-Monitoring und Kostenanalyse. Marketing-Kampagnen-Attribution und A/B-Test-Analyse.

### Warum wir

Wir sind zuerst Ingenieure. Wir verstehen, wie Daten generiert werden, woher Qualitätsprobleme kommen und wie man Systeme baut, die skalieren. Wir machen nicht nur Grafiken - wir bauen zuverlässige Dateninfrastruktur.', 'datenanalyse');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (62, 4, 'de', 'QA & Testdienste', 'Wir stellen sicher, dass Ihre Software tatsächlich funktioniert. Manuelle und automatisierte Tests, die Probleme erkennen, bevor Ihre Benutzer es tun.', 'Unser Testansatz umfasst Funktionalität, Leistung, Sicherheit und Benutzererfahrung. Wir verwenden branchenübliche Tools wie Selenium, Appium und JMeter, um Probleme zu erkennen, bevor sie Ihre Benutzer erreichen.', NULL, '## Bugs finden, bevor Ihre Nutzer sie finden

Manuelle Tests, automatisierte Tests, Performance-Tests - was auch immer nötig ist, um mit Vertrauen auszuliefern.

### Was wir machen

Exploratives Testen durch erfahrene QA-Ingenieure, die wie Nutzer denken. Wir finden die Edge Cases, die automatisierte Tests übersehen.

Testautomatisierung mit Selenium, Cypress oder Playwright für Web. Appium für Mobile. Wir bauen Test-Suites, die zuverlässig laufen und schnelles Feedback geben - keine flaky Tests, die ignoriert werden.

Load Testing mit JMeter, k6 oder Gatling. Wir identifizieren Engpässe, bevor sie zu Ausfällen werden. Sie werden genau wissen, wie sich Ihr System bei 10x Ihres aktuellen Traffics verhält.

API-Tests für REST und GraphQL. Contract Testing, Integration Testing, Security Testing für Backend-Services.

OWASP Top 10-Abdeckung in Ihren Testprozess integriert. Wir fangen häufige Schwachstellen während der Entwicklung, nicht nach dem Deployment.

### Wie wir arbeiten

Wir analysieren Ihre Anwendung, um kritische Pfade, Hochrisikobereiche und Testprioritäten zu identifizieren. Nicht alles braucht das gleiche Abdeckungsniveau.

Wir erstellen Testfälle, die funktionale Anforderungen, Edge Cases und echte Nutzerszenarien abdecken. Tests, die echten Wert liefern, nicht nur Coverage-Zahlen.

Tests laufen kontinuierlich, nicht nur vor Releases. Wir integrieren uns in Ihre CI/CD-Pipeline.

Bug-Reports enthalten Reproduktionsschritte, Schweregrad-Bewertung und Fix-Vorschläge. Keine vagen Beschreibungen, die Entwicklerzeit verschwenden.

### Tools

Web-Automatisierung: Selenium, Cypress, Playwright, Puppeteer
Mobile: Appium, XCTest, Espresso
Performance: JMeter, k6, Gatling, Locust
APIs: Postman, REST Assured, Karate
CI/CD: GitHub Actions, GitLab CI, Jenkins

### Wann Kunden uns anrufen

Vor Produktlaunches, um Qualität sicherzustellen. Während Migrationsprojekten, um zu verifizieren, dass nichts kaputt geht. Für kontinuierlichen QA-Support neben ihrem Entwicklungsteam. Um automatisierte Tests von Grund auf aufzubauen. Um einen Testprozess zu reparieren, der nicht funktioniert.

### Lieferumfang

Testpläne und Testfall-Dokumentation. Automatisierte Test-Suites mit Wartungsdokumentation. Performance-Benchmarks und Empfehlungen. Bug-Reports mit Schweregrad-Bewertungen. Testing-Metriken-Dashboards.', 'qa-tests');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (63, 1, 'it', 'Consulenza Tecnica', 'Guida esperta su decisioni architetturali, scelte tecnologiche e strategie di sviluppo.', 'A volte hai bisogno di un secondo parere o di una guida esperta prima di impegnarti in una direzione. Offriamo servizi di consulenza per aiutarti a prendere decisioni informate sul tuo stack tecnologico, architettura e approccio di sviluppo.', NULL, '## Come lavoriamo davvero

Ogni raccomandazione che facciamo viene dalla nostra esperienza nel costruire e scalare sistemi presso EA, TUI e Nagarro. Non framework di cui abbiamo letto - cose che abbiamo consegnato.

### Il processo

Iniziamo capendo la vostra situazione. Cosa state costruendo? Quali vincoli esistono? Cosa ha funzionato prima, e cosa no? Questo plasma tutto ciò che segue.

Poi guardiamo i vostri sistemi. Identifichiamo i colli di bottiglia, mappiamo le dipendenze e vi diamo un''immagine chiara di dove siete. Nessuna sorpresa.

Da lì, creiamo un piano prioritizzato. Non un documento di 100 pagine che resta sullo scaffale - passi concreti con risultati chiari.

### Problemi che vediamo regolarmente

La maggior parte delle aziende con cui lavoriamo è bloccata su uno di questi:

Hanno troppe opzioni tecnologiche e non abbastanza chiarezza sui compromessi. Hanno costruito qualcosa che funzionava a 1.000 utenti ma fatica a 100.000. Le soluzioni rapide sono diventate problemi permanenti e ora il codice è un casino. I loro processi e strumenti rallentano le consegne invece di aiutare. O hanno preso decisioni architetturali anni fa che ora creano vulnerabilità di sicurezza.

### Chi ci assume

CTO al primo incarico che hanno bisogno di guida esperta. Prendono decisioni architetturali, costruiscono team e scelgono tecnologie - spesso per la prima volta a questa scala.

Aziende che modernizzano sistemi legacy. Hanno bisogno di qualcuno che valuti cosa hanno, decida cosa tenere vs sostituire, e pianifichi la transizione senza rompere tutto.

Investitori che fanno due diligence tecnica. Vogliono una valutazione onesta del codice, dell''infrastruttura e del team prima di firmare l''assegno.

### Cosa ottenete

Raccomandazioni chiare su cui potete agire. Documentazione che il vostro team userà davvero. Supporto di follow-up mentre implementate i cambiamenti. Accesso diretto a ingegneri che hanno risolto problemi simili su larga scala.', 'consulenza');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (64, 2, 'it', 'Servizi di Sicurezza', 'Con esperienza presso Electronic Arts e TUI, non costruiamo solo software. Sappiamo come violarlo. Questa prospettiva plasma tutto ciò che creiamo.', 'Se i tuoi utenti non si fidano della tua sicurezza, non rimarranno. Proteggere i tuoi sistemi e dati è la base su cui tutto il resto è costruito.', 'Possiamo lavorare come team di sicurezza indipendente o insieme al tuo sviluppo, lavora con noi!', '## Sicurezza da persone che sono state da entrambe le parti

Il nostro team di sicurezza ha fatto penetration testing presso EA e protezione DDoS presso TUI. Abbiamo visto come pensano gli attaccanti perché abbiamo lavorato sia in attacco che in difesa.

### Cosa facciamo

Tentiamo di penetrare i vostri sistemi come farebbero veri attaccanti - applicazioni web, API, app mobile, infrastruttura. Ricevete un report dettagliato di cosa abbiamo trovato e esattamente come sistemarlo.

Per gli audit di sicurezza, esaminiamo codice, configurazioni, processi e architettura. Non conformità da spuntare. Cerchiamo problemi che gli scanner automatici mancano.

Auditiamo configurazioni AWS, Azure e GCP per errori di configurazione, permessi eccessivi e lacune di conformità. Troppe violazioni iniziano con un singolo bucket S3 impostato come pubblico.

Per la protezione DDoS, configuriamo e ottimizziamo Cloudflare, Akamai o AWS Shield. Rate limiting, regole WAF, pianificazione della risposta agli incidenti. Basato sulla protezione di siti ad alto traffico presso TUI durante l''alta stagione.

### Come funziona un pentest

Definiamo l''ambito insieme - cosa è incluso, quali metodi useremo, cosa dovete preparare. Poi raccogliamo informazioni come farebbe un attaccante. I test attivi avvengono entro i limiti concordati. Verifichiamo le scoperte e valutiamo il rischio reale, non l''impatto teorico. Ricevete documentazione chiara con passi di riproduzione. Restiamo per aiutare il vostro team a capire e sistemare ciò che abbiamo trovato.

### Cosa troviamo tipicamente

Bypass di autenticazione e problemi di gestione sessioni. Vulnerabilità di injection - SQL, NoSQL, command injection. Riferimenti diretti non sicuri dove gli utenti possono accedere ai dati di altri. Problemi API come autenticazione rotta o esposizione eccessiva di dati. Errori di configurazione cloud - bucket pubblici, ruoli IAM troppo permissivi. Sistemi non patchati e protocolli deboli.

### Settori che conosciamo bene

Gaming - considerazioni anti-cheat, sicurezza account, protezione economia in-game. Travel - conformità PCI, sicurezza sistemi di prenotazione, integrazioni API. Sanità - conformità HIPAA, protezione PHI, audit logging. Finanza - preparazione SOC 2, sicurezza transazioni, prevenzione frodi.', 'sicurezza');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (65, 3, 'it', 'Big Data & Analytics', 'Trasforma i dati grezzi in qualcosa di utile. Dashboard personalizzate, metriche e analisi che ti aiutano a prendere decisioni.', 'Non puoi migliorare ciò che non misuri. Configuriamo analisi che ti mostrano cosa sta succedendo con i tuoi utenti, il tuo sistema e la tua azienda.', NULL, '## Trasformare i dati in decisioni

I dati grezzi che stanno in un database sono inutili. Vi aiutiamo a trasformarli in insight che cambiano come operate.

### Cosa costruiamo

Dashboard personalizzate con visibilità in tempo reale sulle metriche che contano per il vostro business. Non template generici - dashboard progettate attorno ai vostri KPI specifici e a come il vostro team lavora davvero.

Pipeline di dati che raccolgono, trasformano e caricano dati da fonti multiple. Gestiamo streaming, elaborazione batch e approcci ibridi a seconda delle necessità.

Analytics predittiva quando il caso business esiste. Modelli di machine learning che aiutano ad anticipare trend, identificare rischi e ottimizzare le operazioni. Ci concentriamo su modelli interpretabili - non scatole nere di cui nessuno si fida.

Reporting self-service così il vostro team può rispondere alle proprie domande. Mettiamo le fondamenta così non dipendete dagli ingegneri per ogni report.

### Il nostro approccio

Iniziamo dalle decisioni che state cercando di prendere. Cosa cambierebbe se aveste informazioni perfette? Lavoriamo a ritroso dai risultati di business ai requisiti dei dati.

Consegniamo dashboard funzionanti presto. Iniziate a ricevere valore immediatamente mentre espandiamo le capacità. Niente progetti di sei mesi che consegnano tutto alla fine.

Dedichiamo tempo alla qualità dei dati perché l''analytics è buono tanto quanto i dati sottostanti. Validazione, governance, monitoring.

### Strumenti

Visualizzazione: Grafana, Metabase, Apache Superset, dashboard D3.js personalizzate quando serve qualcosa di specifico.

Elaborazione: Apache Spark, Apache Kafka, dbt, Airflow.

Storage: PostgreSQL, ClickHouse, BigQuery, Snowflake - dipende dal vostro volume e pattern di query.

### Casi d''uso costruiti

Funnel di conversione e-commerce e calcoli di customer lifetime value. Analytics di utilizzo SaaS e previsione churn. Monitoring operazioni e analisi costi. Attribuzione campagne marketing e analisi test A/B.

### Perché noi

Siamo ingegneri prima di tutto. Capiamo come vengono generati i dati, da dove vengono i problemi di qualità e come costruire sistemi che scalano. Non facciamo solo grafici - costruiamo infrastruttura dati affidabile.', 'analisi-dati');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (66, 4, 'it', 'Servizi QA & Testing', 'Ci assicuriamo che il tuo software funzioni davvero. Test manuali e automatizzati che individuano i problemi prima che lo facciano i tuoi utenti.', 'Il nostro approccio di testing copre funzionalità, prestazioni, sicurezza ed esperienza utente. Utilizziamo strumenti standard del settore come Selenium, Appium e JMeter per rilevare problemi prima che raggiungano i tuoi utenti.', NULL, '## Trovare bug prima che li trovino i vostri utenti

Test manuali, test automatizzati, test di performance - qualsiasi cosa serva per consegnare con fiducia.

### Cosa facciamo

Test esplorativi da ingegneri QA esperti che pensano come utenti. Troviamo i casi limite che i test automatici mancano.

Automazione test con Selenium, Cypress o Playwright per web. Appium per mobile. Costruiamo suite di test che girano in modo affidabile e danno feedback rapido - non test instabili che vengono ignorati.

Load testing con JMeter, k6 o Gatling. Identifichiamo i colli di bottiglia prima che diventino outage. Saprete esattamente come si comporta il vostro sistema a 10x del traffico attuale.

Test API per REST e GraphQL. Contract testing, integration testing, security testing per servizi backend.

Copertura OWASP Top 10 integrata nel vostro processo di test. Intercettiamo vulnerabilità comuni durante lo sviluppo, non dopo il deployment.

### Come lavoriamo

Analizziamo la vostra applicazione per identificare percorsi critici, aree ad alto rischio e priorità di test. Non tutto ha bisogno dello stesso livello di copertura.

Creiamo casi di test che coprono requisiti funzionali, casi limite e scenari utente reali. Test che portano valore reale, non solo numeri di copertura.

I test avvengono continuamente, non solo prima dei release. Ci integriamo con la vostra pipeline CI/CD.

I report dei bug includono passi di riproduzione, valutazione della severità e suggerimenti per il fix. Niente descrizioni vaghe che fanno perdere tempo agli sviluppatori.

### Strumenti

Automazione web: Selenium, Cypress, Playwright, Puppeteer
Mobile: Appium, XCTest, Espresso
Performance: JMeter, k6, Gatling, Locust
API: Postman, REST Assured, Karate
CI/CD: GitHub Actions, GitLab CI, Jenkins

### Quando i clienti ci chiamano

Prima dei lanci prodotto per assicurare la qualità. Durante progetti di migrazione per verificare che nulla si rompa. Per supporto QA continuo accanto al loro team di sviluppo. Per costruire test automatizzati da zero. Per sistemare un processo di test che non funziona.

### Deliverable

Piani di test e documentazione casi di test. Suite di test automatizzati con documentazione di manutenzione. Benchmark di performance e raccomandazioni. Report bug con rating di severità. Dashboard metriche di test.', 'test-qa');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (67, 1, 'es', 'Consultoría Técnica', 'Orientación experta en decisiones de arquitectura, elecciones tecnológicas y estrategias de desarrollo.', 'A veces necesitas una segunda opinión o orientación experta antes de comprometerte con una dirección. Ofrecemos servicios de consultoría para ayudarte a tomar decisiones informadas sobre tu stack tecnológico, arquitectura y enfoque de desarrollo.', NULL, '## Cómo trabajamos realmente

Cada recomendación que hacemos viene de nuestra experiencia construyendo y escalando sistemas en EA, TUI y Nagarro. No frameworks que leímos - cosas que entregamos.

### El proceso

Empezamos entendiendo tu situación. ¿Qué estás construyendo? ¿Qué restricciones existen? ¿Qué funcionó antes y qué no? Esto moldea todo lo que sigue.

Luego miramos tus sistemas. Identificamos cuellos de botella, mapeamos dependencias y te damos una imagen clara de dónde estás. Sin sorpresas.

Desde ahí, creamos un plan priorizado. No un documento de 100 páginas que se queda en el estante - pasos concretos con resultados claros.

### Problemas que vemos regularmente

La mayoría de las empresas con las que trabajamos están atascadas en uno de estos:

Tienen demasiadas opciones tecnológicas y no suficiente claridad sobre los compromisos. Construyeron algo que funcionaba con 1.000 usuarios pero lucha con 100.000. Las soluciones rápidas se convirtieron en problemas permanentes y ahora el código es un desastre. Sus procesos y herramientas ralentizan la entrega en lugar de ayudar. O tomaron decisiones de arquitectura hace años que ahora crean vulnerabilidades de seguridad.

### Quién nos contrata

CTOs en su primer puesto que necesitan orientación experimentada. Toman decisiones de arquitectura, construyen equipos y eligen tecnologías - a menudo por primera vez a esta escala.

Empresas que modernizan sistemas legacy. Necesitan a alguien que evalúe lo que tienen, decida qué mantener vs reemplazar, y planifique la transición sin romper todo.

Inversores haciendo due diligence técnico. Quieren una evaluación honesta del código, la infraestructura y el equipo antes de firmar el cheque.

### Lo que obtienes

Recomendaciones claras sobre las que puedes actuar. Documentación que tu equipo realmente usará. Soporte de seguimiento mientras implementas los cambios. Acceso directo a ingenieros que han resuelto problemas similares a gran escala.', 'consultoria');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (68, 2, 'es', 'Servicios de Seguridad', 'Con experiencia en Electronic Arts y TUI, no solo construimos software. Sabemos cómo romperlo. Esa perspectiva moldea todo lo que creamos.', 'Si tus usuarios no confían en tu seguridad, no se quedarán. Proteger tus sistemas y datos es la base sobre la que se construye todo lo demás.', 'Podemos trabajar como equipo de seguridad independiente o junto a tu desarrollo, ¡trabaja con nosotros!', '## Seguridad de personas que han estado en ambos lados

Nuestro equipo de seguridad hizo pruebas de penetración en EA y protección DDoS en TUI. Hemos visto cómo piensan los atacantes porque hemos trabajado tanto en ataque como en defensa.

### Lo que hacemos

Intentamos penetrar tus sistemas como lo harían atacantes reales - aplicaciones web, APIs, apps móviles, infraestructura. Recibes un informe detallado de lo que encontramos y exactamente cómo arreglarlo.

Para auditorías de seguridad, examinamos código, configuraciones, procesos y arquitectura. No cumplimiento de casillas. Buscamos problemas que los escáneres automáticos no detectan.

Auditamos configuraciones de AWS, Azure y GCP por errores de configuración, permisos excesivos y brechas de cumplimiento. Demasiadas violaciones empiezan con un solo bucket S3 configurado como público.

Para protección DDoS, configuramos y optimizamos Cloudflare, Akamai o AWS Shield. Rate limiting, reglas WAF, planificación de respuesta a incidentes. Basado en proteger sitios de alto tráfico en TUI durante la temporada alta.

### Cómo funciona un pentest

Definimos el alcance juntos - qué está incluido, qué métodos usaremos, qué necesitas preparar. Luego recopilamos información como lo haría un atacante. Las pruebas activas ocurren dentro de los límites acordados. Verificamos los hallazgos y evaluamos el riesgo real, no el impacto teórico. Recibes documentación clara con pasos de reproducción. Nos quedamos para ayudar a tu equipo a entender y arreglar lo que encontramos.

### Lo que típicamente encontramos

Bypasses de autenticación y problemas de gestión de sesiones. Vulnerabilidades de inyección - SQL, NoSQL, inyección de comandos. Referencias directas inseguras donde usuarios pueden acceder a datos de otros. Problemas de API como autenticación rota o exposición excesiva de datos. Errores de configuración cloud - buckets públicos, roles IAM demasiado permisivos. Sistemas sin parchear y protocolos débiles.

### Industrias que conocemos bien

Gaming - consideraciones anti-cheat, seguridad de cuentas, protección de economía in-game. Viajes - cumplimiento PCI, seguridad de sistemas de reservas, integraciones API. Salud - cumplimiento HIPAA, protección PHI, audit logging. Finanzas - preparación SOC 2, seguridad de transacciones, prevención de fraude.', 'seguridad');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (69, 3, 'es', 'Big Data & Analytics', 'Convierte datos brutos en algo útil. Dashboards personalizados, métricas y analíticas que te ayudan a tomar decisiones.', 'No puedes mejorar lo que no mides. Configuramos analíticas que te muestran qué está pasando con tus usuarios, tu sistema y tu negocio.', NULL, '## Transformando datos en decisiones

Los datos crudos que están en una base de datos son inútiles. Te ayudamos a transformarlos en insights que cambian cómo operas.

### Lo que construimos

Dashboards personalizados con visibilidad en tiempo real sobre las métricas que importan para tu negocio. No templates genéricos - dashboards diseñados alrededor de tus KPIs específicos y cómo tu equipo realmente trabaja.

Pipelines de datos que recolectan, transforman y cargan datos de múltiples fuentes. Manejamos streaming, procesamiento batch y enfoques híbridos según lo que necesites.

Analytics predictivo cuando el caso de negocio existe. Modelos de machine learning que ayudan a anticipar tendencias, identificar riesgos y optimizar operaciones. Nos enfocamos en modelos interpretables - no cajas negras en las que nadie confía.

Reporting self-service para que tu equipo pueda responder sus propias preguntas. Ponemos los cimientos para que no dependas de ingenieros para cada informe.

### Nuestro enfoque

Empezamos con las decisiones que estás tratando de tomar. ¿Qué cambiaría si tuvieras información perfecta? Trabajamos hacia atrás desde resultados de negocio hasta requisitos de datos.

Entregamos dashboards funcionales temprano. Empiezas a recibir valor inmediatamente mientras expandimos las capacidades. Nada de proyectos de seis meses que entregan todo al final.

Dedicamos tiempo a la calidad de datos porque el analytics es tan bueno como los datos subyacentes. Validación, governance, monitoring.

### Herramientas

Visualización: Grafana, Metabase, Apache Superset, dashboards D3.js personalizados cuando necesitas algo específico.

Procesamiento: Apache Spark, Apache Kafka, dbt, Airflow.

Almacenamiento: PostgreSQL, ClickHouse, BigQuery, Snowflake - depende de tu volumen y patrones de consulta.

### Casos de uso construidos

Funnels de conversión e-commerce y cálculos de customer lifetime value. Analytics de uso SaaS y predicción de churn. Monitoring de operaciones y análisis de costos. Atribución de campañas de marketing y análisis de tests A/B.

### Por qué nosotros

Somos ingenieros primero. Entendemos cómo se generan los datos, de dónde vienen los problemas de calidad y cómo construir sistemas que escalan. No solo hacemos gráficos - construimos infraestructura de datos confiable.', 'analisis-datos');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (70, 4, 'es', 'Servicios de QA y Testing', 'Nos aseguramos de que tu software realmente funcione. Testing manual y automatizado que detecta problemas antes que tus usuarios.', 'Nuestro enfoque de testing cubre funcionalidad, rendimiento, seguridad y experiencia de usuario. Usamos herramientas estándar de la industria como Selenium, Appium y JMeter para detectar problemas antes de que lleguen a tus usuarios.', NULL, '## Encontrando bugs antes que tus usuarios

Pruebas manuales, pruebas automatizadas, pruebas de rendimiento - lo que sea necesario para entregar con confianza.

### Lo que hacemos

Pruebas exploratorias por ingenieros QA experimentados que piensan como usuarios. Encontramos los casos límite que las pruebas automatizadas no detectan.

Automatización de pruebas con Selenium, Cypress o Playwright para web. Appium para móvil. Construimos suites de pruebas que corren de forma confiable y dan feedback rápido - no pruebas inestables que se ignoran.

Load testing con JMeter, k6 o Gatling. Identificamos cuellos de botella antes de que se conviertan en caídas. Sabrás exactamente cómo se comporta tu sistema a 10x tu tráfico actual.

Pruebas de API para REST y GraphQL. Contract testing, integration testing, security testing para servicios backend.

Cobertura OWASP Top 10 integrada en tu proceso de pruebas. Atrapamos vulnerabilidades comunes durante el desarrollo, no después del deployment.

### Cómo trabajamos

Analizamos tu aplicación para identificar caminos críticos, áreas de alto riesgo y prioridades de prueba. No todo necesita el mismo nivel de cobertura.

Creamos casos de prueba que cubren requisitos funcionales, casos límite y escenarios de usuario reales. Pruebas que aportan valor real, no solo números de cobertura.

Las pruebas ocurren continuamente, no solo antes de los releases. Nos integramos con tu pipeline CI/CD.

Los reportes de bugs incluyen pasos de reproducción, evaluación de severidad y sugerencias de fix. Nada de descripciones vagas que hacen perder tiempo a los desarrolladores.

### Herramientas

Automatización web: Selenium, Cypress, Playwright, Puppeteer
Móvil: Appium, XCTest, Espresso
Rendimiento: JMeter, k6, Gatling, Locust
APIs: Postman, REST Assured, Karate
CI/CD: GitHub Actions, GitLab CI, Jenkins

### Cuándo nos llaman los clientes

Antes de lanzamientos de producto para asegurar calidad. Durante proyectos de migración para verificar que nada se rompa. Para soporte QA continuo junto a su equipo de desarrollo. Para construir pruebas automatizadas desde cero. Para arreglar un proceso de pruebas que no funciona.

### Entregables

Planes de prueba y documentación de casos de prueba. Suites de pruebas automatizadas con documentación de mantenimiento. Benchmarks de rendimiento y recomendaciones. Reportes de bugs con ratings de severidad. Dashboards de métricas de pruebas.', 'pruebas-qa');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (71, 5, 'ro', 'AI & Machine Learning', 'De la procesarea limbajului natural la viziune computerizată, construim sisteme care învață și se adaptează. Transformă datele în ceva util.', 'Construim soluții AI personalizate folosind TensorFlow, PyTorch și Scikit-learn. Modele predictive, chatboți cu NLP, recunoaștere de imagini. Ne concentrăm pe AI care rezolvă probleme reale, nu demo-uri.', NULL, '## AI care funcționează în producție

Construim sisteme de machine learning care livrează valoare - nu demo-uri impresionante care se destramă când încerci să le deploy-ezi.

### Ce construim

Clasificare text, analiză sentiment, extracție entități, înțelegere documente. Procesare text nestructurat la scară.

Clasificare imagini, detecție obiecte, OCR, sisteme de inspecție vizuală. De la control calitate pe linii de producție la procesare documente.

Motoare de recomandare care învață din comportamentul utilizatorilor. Recomandări produse, sugestii conținut, prețuri dinamice.

Prognoză, detecție anomalii, scoring risc. Modele care te ajută să anticipezi problemele înainte să se întâmple.

### Abordarea noastră

Nu orice problemă are nevoie de AI. Începem prin a înțelege ce încerci să realizezi și dacă machine learning e de fapt abordarea potrivită. Uneori un motor de reguli e mai bun.

Modelele ML sunt la fel de bune ca datele de antrenament. Evaluăm ce date ai, ce ai nevoie și cum să gestionezi lacunele înainte să scriem cod.

Construim modele simple întâi, validăm că funcționează, apoi creștem complexitatea dacă e nevoie. Vezi rezultate devreme și poți corecta cursul.

Un model nu e util până nu e deploy-at. Ne ocupăm de ingineria necesară ca ML să funcționeze fiabil în producție - monitorizare, pipeline-uri de re-antrenament, detecție drift.

### Stack tehnic

Framework-uri: PyTorch, TensorFlow, scikit-learn, Hugging Face
MLOps: MLflow, Kubeflow, pipeline-uri custom de deployment
Infrastructură: Clustere GPU, AWS SageMaker, Google Vertex AI
LLM-uri: Fine-tuning, sisteme RAG, prompt engineering

### Cazuri de utilizare livrate

Chatboți serviciu clienți și clasificare tichete. Extracție facturi și analiză contracte. Inspecție vizuală pentru defecte de fabricație. Recomandări produse pentru e-commerce. Prognoză cerere și optimizare inventar.

### Ce ne diferențiază

Suntem pragmatici cu AI. Nu vom recomanda deep learning când logistic regression e suficient. Ne concentrăm pe soluții care sunt mentenabile, explicabile și care chiar mișcă metricile tale de business.', 'inteligenta-artificiala');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (72, 6, 'ro', 'Aplicații Web', 'De la dashboarduri interne la platforme pentru clienți. SPA-uri, PWA-uri, panouri admin, produse SaaS. Orice au nevoie utilizatorii tăi.', 'Lucrăm cu Laravel, Symfony, Drupal, WordPress, CraftCMS și framework-uri JavaScript moderne. Alegem bazat pe cerințele tale, nu pe preferințele noastre. Ai nevoie de SEO? Renderizare server-side. Interactivitate mare? Un SPA modern. Nevoi simple? Poate deloc framework.', NULL, '## Aplicații web care funcționează sub presiune

De la unelte interne la platforme pentru clienți, construim aplicații web care performează și scalează.

### Ce construim

Aplicații single page cu React și Next.js. Rapide, responsive, optimizate pentru browsere moderne.

Aplicații web progresive care funcționează offline, trimit notificări push și se simt native. Reach-ul web-ului cu capabilități de aplicație.

Panouri admin și unelte interne care fac echipa ta mai productivă. Construim interfețe care sunt rapide de folosit, nu doar rapide de construit.

Produse SaaS cu autentificare, facturare și infrastructura pentru a scala. Am construit produse care servesc mii de utilizatori concurenți.

E-commerce custom cu gestionare inventar și fluxuri checkout. Integrate cu procesatori de plăți și servicii de livrare.

### Stack tehnologic

Frontend: React, Next.js, TypeScript, Tailwind CSS. State management cu Zustand sau React Query. Testare cu Playwright și Jest.

Backend: Node.js, Python, PHP (Laravel). PostgreSQL, MySQL, MongoDB. Redis pentru caching și cozi. API-uri GraphQL sau REST.

Infrastructură: Cloudflare Workers, AWS, Vercel. Docker și Kubernetes când e nevoie. CI/CD cu GitHub Actions.

### Cum lucrăm

Începem prin a înțelege cerințele, nevoile utilizatorilor și constrângerile. Apoi wireframe-uri, prototipuri și arhitectură tehnică.

Dezvoltarea se întâmplă în sprint-uri iterative cu demo-uri regulate. Vezi progres săptămânal, nu lunar.

Testare automatizată, review de securitate și optimizare performanță înainte de lansare.

Setup CI/CD, monitorizare și documentație. Apoi mentenanță continuă și dezvoltare feature-uri dacă ai nevoie.

### Ce primești

Cod curat, mentenabil cu documentație. Pipeline-uri de deployment automatizate. Setup monitorizare și alertare. Optimizare performanță. Best practices de securitate integrate. Transfer de cunoștințe ca echipa ta să poată menține.', 'aplicatii-web');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (73, 7, 'ro', 'Aplicații Mobile', 'Aplicații native iOS și Android construite de ingineri cu peste 10 ani la Nagarro și Enea AB. Nu compromisuri cross-platform, performanță nativă reală.', 'Ne specializăm în dezvoltare nativă pentru că unele aplicații o cer. Integrări IoT, wearables, sisteme de plăți, aplicații de sănătate. Când performanța și integrarea platformei contează, construim nativ. Ne ocupăm și de publicarea în app store, pipeline-uri CI/CD și mentenanță continuă.', NULL, '## Aplicații mobile native

Construim aplicații native reale - Swift pentru iOS, Kotlin pentru Android. Echipa noastră mobile are 10+ ani la Nagarro și Enea AB, construind aplicații folosite de milioane.

### De ce nativ

Aplicațiile native sunt mai rapide. Fără bridge JavaScript, fără compromis. Utilizatorii tăi simt diferența, mai ales pe dispozitive mai vechi.

Acces complet la capabilitățile iOS și Android. Cameră, senzori, date de sănătate, plăți - orice oferă platforma, putem folosi.

Aplicațiile native respectă convențiile platformei. Utilizatorii iOS primesc o experiență iOS. Utilizatorii Android primesc o experiență Android. Asta contează mai mult decât realizează majoritatea.

Actualizările platformei nu îți strică aplicația. Nu aștepți după o echipă de framework să suporte ultimele feature-uri OS.

### Ce construim

Aplicații consumer care trebuie să fie rapide și fiabile. Feature-uri sociale, redare media, suport offline.

Aplicații enterprise - unelte interne, aplicații field service, produse B2B. Securitate, integrare MDM, cerințe corporate.

Aplicații companion IoT cu conectivitate Bluetooth și gestionare dispozitive. Am construit aplicații pentru dispozitive medicale, senzori industriali și electronice consumer.

Experiențe native de shopping cu checkout fluid, notificări push și personalizare.

### Cum lucrăm

Definim feature-uri, creăm wireframe-uri și planificăm journey-ul utilizatorului. Considerăm ambele platforme de la început.

Dezvoltare iOS și Android în paralel cu pattern-uri de arhitectură comune. Build-uri regulate pentru testare și feedback.

Testare pe dispozitive cu multiple dimensiuni ecran și versiuni OS. Profilare performanță și optimizare memorie.

Ne ocupăm de submiterea în App Store și Play Store, adresăm feedback-ul de review și obținem aprobarea aplicației tale.

Actualizări OS, fix-uri de bug, adăugări de feature-uri. Menținem aplicații ani de zile.

### Capabilități tehnice

iOS: Swift, SwiftUI, UIKit, Core Data, HealthKit, ARKit
Android: Kotlin, Jetpack Compose, Room, WorkManager
Backend: REST, GraphQL, WebSockets, gRPC
Push: Firebase, APNs, soluții custom
Analytics: Firebase Analytics, Mixpanel, tracking custom

### Industrii

Aplicații healthcare (conforme HIPAA). IoT industrial (date senzori în timp real). E-commerce (tranzacții volum mare). Travel (cerințe offline-first). Finanțe (critice pentru securitate).', 'aplicatii-mobile');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (74, 8, 'ro', 'DevOps & Infrastructură Cloud', 'Deploymenturi containerizate, pipeline-uri CI/CD și arhitectură cloud pe AWS. Construim infrastructură care scalează și rămâne securizată.', 'Docker, Kubernetes, Terraform, CircleCI, GitHub Actions. Configurăm deploymenturi automatizate, monitorizare și infrastructură ca cod pentru ca echipa ta să poată livra cu încredere.', NULL, '## Infrastructură care scalează

Construim infrastructură cloud pe AWS care gestionează creșterea, rezistă atacurilor și nu te ține treaz noaptea.

### Ce facem

Design și implementare infrastructură AWS. VPC-uri, load balancers, auto-scaling groups, servicii managed. Configurate pentru securitate și eficiență costuri.

Deployment-uri Docker și Kubernetes când ai nevoie. Containerizare, orchestrare, gestionare resurse.

Workflow-uri automatizate de build, test și deployment. GitHub Actions, GitLab CI sau AWS CodePipeline - configurate pentru release-uri rapide și sigure.

Terraform și CloudFormation pentru infrastructură reproductibilă. Fără configurare manuală sau modificări nedocumentate.

Monitorizare cu Prometheus, Grafana și CloudWatch. Alertare care îți spune despre probleme înainte să observe utilizatorii.

### Cum gândim

Fiecare decizie de infrastructură consideră securitatea. Acces cu privilegii minime, criptare at rest și în tranzit, segmentare rețea.

Proiectăm pentru eficiență. Reserved instances, spot instances, right-sizing. Te ajutăm să eviți șocul facturii cloud.

Deployment-uri multi-AZ, failover automat, planificare disaster recovery. Construim pentru scenarii de eșec pentru că se întâmplă.

Fiecare sistem vine cu runbook-uri, diagrame de arhitectură și proceduri operaționale. Echipa ta poate gestiona fără noi.

### Proiecte comune

Migrare cloud de la on-premises la AWS. Adopție Kubernetes pentru aplicații care au nevoie. Implementare CI/CD. Hardening securitate pentru cerințe de conformitate. Reducere costuri în deployment-uri cloud existente. Implementare disaster recovery.

### Tehnologii

Cloud: AWS (principal), GCP, Cloudflare
Containere: Docker, Kubernetes, ECS, EKS
IaC: Terraform, CloudFormation, Pulumi
CI/CD: GitHub Actions, GitLab CI, ArgoCD
Monitorizare: Prometheus, Grafana, CloudWatch, Datadog
Securitate: AWS IAM, Vault, SOPS, security scanning

### Livrabile

Documentație arhitectură cu diagrame. Repositories Infrastructure as Code. Dashboard-uri monitorizare și alertare. Runbook-uri pentru operațiuni comune. Review și recomandări securitate. Analiză și optimizare costuri.', 'infrastructura-cloud');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (75, 9, 'ro', 'Backend, API-uri & Integrări', 'Motorul din spatele aplicației tale. API-uri RESTful, microservicii, optimizare baze de date și integrări third-party.', 'MySQL, PostgreSQL, Elastic Search pentru query-uri complexe. Ne ocupăm de modernizarea sistemelor legacy, integrări de sistem și module standalone pentru produse mai mari. Dacă ai o provocare tehnică specifică, suntem bucuroși să ne apucăm.', NULL, '## Sisteme backend care funcționează

Construim sisteme server-side care alimentează aplicații. API-uri, microservicii, baze de date, integrări - proiectate pentru fiabilitate și performanță.

### Ce construim

API-uri RESTful pe care echipele frontend și mobile le adoră. Autentificare corectă, rate limiting, error handling, documentație.

Servicii GraphQL când clienții au nevoie de flexibilitate. Design schemă, resolvere, optimizare performanță.

Microservicii când monoliții trebuie sparți. Granițe de serviciu, comunicare inter-servicii, gestionarea complexității.

Integrări third-party. Procesatori plăți, CRM-uri, ERP-uri, furnizori livrare - conectăm sistemul tău la servicii externe.

Procesare background. Cozi de job-uri, task-uri programate, procesare event-driven. Sisteme care gestionează munca fiabil fără să blocheze request-urile utilizatorilor.

### Cum lucrăm

Proiectăm API-uri înainte să le implementăm. Contracte clare, pattern-uri consistente, documentație de la început.

Autentificare, autorizare, validare input, rate limiting integrate din prima zi. Nu adăugate ulterior.

Optimizare query-uri baze de date, strategii de caching, connection pooling. Măsurăm și optimizăm înainte să apară probleme.

Logging, metrici și tracing care te ajută să înțelegi ce se întâmplă în producție. Debugging-ul nu ar trebui să fie ghicitori.

### Tehnologii

Limbaje: Node.js (Express, Fastify, NestJS), Python (FastAPI, Django), PHP (Laravel), Go pentru servicii critice pentru performanță.

Baze de date: PostgreSQL, MySQL pentru relațional. MongoDB, DynamoDB pentru documente. Redis pentru caching și cozi. Elasticsearch pentru căutare.

Cozi de mesaje: RabbitMQ, AWS SQS, Redis Streams, Kafka.

Unelte API: Documentație OpenAPI/Swagger, GraphQL cu Apollo, gRPC pentru servicii interne.

### Integrări comune

Procesare plăți: Stripe, PayPal, Adyen, metode locale de plată.
Autentificare: Provideri OAuth, SSO, identity management.
Comunicare: Email (SendGrid, SES), SMS (Twilio), notificări push.
Stocare: S3, Cloudflare R2, integrare CDN.
Analytics: Segment, Mixpanel, tracking custom de evenimente.

### Livrabile

API-uri bine documentate cu specificații OpenAPI. Teste de integrare și medii de test. Configurații deployment și CI/CD. Monitorizare și alertare. Benchmark-uri performanță. Documentație review securitate.', 'backend');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (76, 10, 'ro', 'Design & Management Baze de Date', 'SQL, NoSQL, modelare date și administrare. Proiectăm baze de date care scalează și rămân rapide.', 'De la design de schemă la optimizare de performanță, ne ocupăm de stratul de date. MySQL, PostgreSQL, MongoDB, Redis. Alegem bazat pe pattern-urile tale de acces, nu pe preferințele noastre. Administrare baze de date, migrări și disaster recovery incluse.', NULL, '## Baze de date care rămân rapide

Datele sunt fundația aplicației tale. Proiectăm scheme, optimizăm query-uri și construim arhitecturi de date care gestionează creșterea.

### Ce facem

Modelare date care reflectă domeniul tău de business. Structuri normalizate pentru integritate, denormalizate unde performanța o cere.

Query-uri lente identificate și reparate. Strategii de indexare, rescrieri query, analiză plan execuție. Facem bazele de date rapide.

Mutare între sisteme sau versiuni de baze de date fără pierdere de date. Migrări care nu necesită downtime extins.

Când bazele de date single-server nu sunt suficiente - read replicas, setup-uri master-master, sharding orizontal.

Backup-uri automatizate, point-in-time recovery, testare disaster recovery. Datele tale supraviețuiesc defecțiunilor hardware și erorilor umane.

### Tehnologii baze de date

Relațional: PostgreSQL (recomandarea noastră default), MySQL/MariaDB, Amazon RDS și Aurora.

Document: MongoDB, Amazon DynamoDB, Couchbase.

Căutare și analytics: Elasticsearch, ClickHouse, TimescaleDB.

Caching: Redis, Memcached.

### Cum gândim

Începem cu pattern-urile de acces. Cum vor fi scrise datele tale? Cum vor fi citite? Răspunsurile determină designul schemei și alegerile tehnologice.

Nu ghicim problemele de performanță. Măsurăm timpii query-urilor, analizăm planurile de execuție și reparăm blocajele reale.

Ce funcționează la 1.000 de rânduri poate eșua la 1.000.000. Proiectăm cu trajectoria ta de creștere în minte.

Nu folosim feature-uri complexe decât dacă sunt necesare. Schemele simple sunt mai ușor de înțeles, menținut și optimizat.

### Proiecte comune

Optimizare performanță - reparare query-uri lente și blocaje baze de date. Redesign schemă pentru baze de date care au crescut organic. Migrare tehnologie - MySQL la PostgreSQL, SQL la NoSQL. Scalare cu read replicas, connection pooling, layere de caching. Modelare date pentru aplicații noi. Conformitate - audit logging, criptare, controale acces.

### Livrabile

Diagrame entity-relationship și documentație schemă. Analiză query și recomandări optimizare. Script-uri migrare și proceduri rollback. Dashboard-uri monitorizare pentru sănătatea bazei de date. Runbook-uri backup și recovery. Benchmark-uri și baseline-uri performanță.', 'baze-de-date');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (77, 5, 'fr', 'IA & Machine Learning', 'Du traitement du langage naturel à la vision par ordinateur, nous construisons des systèmes qui apprennent et s''adaptent. Transformez les données en quelque chose d''utile.', 'Nous construisons des solutions IA personnalisées utilisant TensorFlow, PyTorch et Scikit-learn. Modèles prédictifs, chatbots avec NLP, reconnaissance d''images. Nous nous concentrons sur l''IA qui résout de vrais problèmes, pas des démos.', NULL, '## L''IA qui marche en production

On construit des systèmes de machine learning qui délivrent de la valeur - pas des démos impressionnantes qui s''effondrent quand on essaie de les déployer.

### Ce qu''on construit

Classification de texte, analyse de sentiment, extraction d''entités, compréhension de documents. Traitement de texte non structuré à grande échelle.

Classification d''images, détection d''objets, OCR, systèmes d''inspection visuelle. Du contrôle qualité sur les lignes de production au traitement de documents.

Des moteurs de recommandation qui apprennent du comportement des utilisateurs. Recommandations de produits, suggestions de contenu, pricing dynamique.

Prévision, détection d''anomalies, scoring de risque. Des modèles qui vous aident à anticiper les problèmes avant qu''ils arrivent.

### Notre approche

Tous les problèmes n''ont pas besoin d''IA. On commence par comprendre ce que vous essayez d''accomplir et si le machine learning est vraiment la bonne approche. Parfois un moteur de règles est mieux.

Les modèles ML sont aussi bons que leurs données d''entraînement. On évalue quelles données vous avez, ce dont vous avez besoin et comment gérer les lacunes avant d''écrire du code.

On construit des modèles simples d''abord, on valide qu''ils marchent, puis on augmente la complexité si nécessaire. Vous voyez des résultats tôt et pouvez corriger le cap.

Un modèle n''est pas utile tant qu''il n''est pas déployé. On gère l''ingénierie pour faire marcher le ML de façon fiable en production - monitoring, pipelines de ré-entraînement, détection de drift.

### Stack technique

Frameworks : PyTorch, TensorFlow, scikit-learn, Hugging Face
MLOps : MLflow, Kubeflow, pipelines de déploiement custom
Infrastructure : Clusters GPU, AWS SageMaker, Google Vertex AI
LLMs : Fine-tuning, systèmes RAG, prompt engineering

### Cas d''usage livrés

Chatbots service client et classification de tickets. Extraction de factures et analyse de contrats. Inspection visuelle pour défauts de fabrication. Recommandations produits pour e-commerce. Prévision de demande et optimisation d''inventaire.

### Ce qui nous différencie

On est pragmatiques avec l''IA. On ne recommandera pas du deep learning quand une régression logistique suffit. On se concentre sur des solutions maintenables, explicables et qui font vraiment bouger vos métriques business.', 'intelligence-artificielle');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (78, 6, 'fr', 'Applications Web', 'Des tableaux de bord internes aux plateformes clients. SPAs, PWAs, panneaux d''administration, produits SaaS. Tout ce dont vos utilisateurs ont besoin.', 'Nous travaillons avec Laravel, Symfony, Drupal, WordPress, CraftCMS et les frameworks JavaScript modernes. Nous choisissons en fonction de vos besoins, pas de nos préférences. Besoin de SEO? Rendu côté serveur. Forte interactivité? Un SPA moderne. Besoins simples? Peut-être pas de framework du tout.', NULL, '## Des applis web qui tiennent sous la pression

Des outils internes aux plateformes client, on construit des applications web qui performent et scalent.

### Ce qu''on construit

Des single page applications avec React et Next.js. Rapides, responsives, optimisées pour les navigateurs modernes.

Des progressive web apps qui marchent offline, envoient des notifications push et se comportent comme des apps natives. La portée du web avec les capacités d''une app.

Des panneaux admin et outils internes qui rendent votre équipe plus productive. On construit des interfaces qui sont rapides à utiliser, pas juste rapides à construire.

Des produits SaaS avec authentification, facturation et l''infrastructure pour scaler. On a construit des produits qui servent des milliers d''utilisateurs simultanés.

De l''e-commerce custom avec gestion d''inventaire et flux de checkout. Intégré avec les processeurs de paiement et services de livraison.

### Stack technique

Frontend : React, Next.js, TypeScript, Tailwind CSS. State management avec Zustand ou React Query. Tests avec Playwright et Jest.

Backend : Node.js, Python, PHP (Laravel). PostgreSQL, MySQL, MongoDB. Redis pour le caching et les queues. APIs GraphQL ou REST.

Infrastructure : Cloudflare Workers, AWS, Vercel. Docker et Kubernetes quand nécessaire. CI/CD avec GitHub Actions.

### Comment on travaille

On commence par comprendre les exigences, les besoins utilisateur et les contraintes. Puis wireframes, prototypes et architecture technique.

Le développement se fait en sprints itératifs avec des démos régulières. Vous voyez les progrès chaque semaine, pas chaque mois.

Tests automatisés, revue de sécurité et optimisation de performance avant le lancement.

Setup CI/CD, monitoring et documentation. Puis maintenance continue et développement de features si vous en avez besoin.

### Ce que vous obtenez

Du code propre et maintenable avec documentation. Des pipelines de déploiement automatisés. Setup monitoring et alertes. Optimisation de performance. Bonnes pratiques de sécurité intégrées. Transfert de connaissances pour que votre équipe puisse maintenir.', 'applications-web');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (79, 7, 'fr', 'Applications Mobiles', 'Applications natives iOS et Android construites par des ingénieurs avec plus de 10 ans chez Nagarro et Enea AB. Pas de compromis cross-platform, de vraies performances natives.', 'Nous nous spécialisons dans le développement natif car certaines applications l''exigent. Intégrations IoT, wearables, systèmes de paiement, applications de santé. Quand la performance et l''intégration de la plateforme comptent, nous construisons natif. Nous gérons aussi la publication sur les app stores, les pipelines CI/CD et la maintenance continue.', NULL, '## Apps mobiles natives

On construit de vraies apps natives - Swift pour iOS, Kotlin pour Android. Notre équipe mobile a 10+ ans chez Nagarro et Enea AB, à construire des apps utilisées par des millions.

### Pourquoi natif

Les apps natives sont plus rapides. Pas de bridge JavaScript, pas de compromis. Vos utilisateurs sentent la différence, surtout sur les appareils plus anciens.

Accès complet aux capacités iOS et Android. Caméra, capteurs, données de santé, paiements - tout ce que la plateforme offre, on peut l''utiliser.

Les apps natives respectent les conventions de la plateforme. Les utilisateurs iOS ont une expérience iOS. Les utilisateurs Android ont une expérience Android. Ça compte plus que la plupart des gens réalisent.

Les mises à jour de la plateforme ne cassent pas votre app. Vous n''attendez pas après une équipe de framework pour supporter les dernières fonctionnalités OS.

### Ce qu''on construit

Des apps consumer qui doivent être rapides et fiables. Fonctionnalités sociales, lecture média, support offline.

Des apps enterprise - outils internes, applications de service terrain, produits B2B. Sécurité, intégration MDM, exigences corporate.

Des apps companion IoT avec connectivité Bluetooth et gestion d''appareils. On a construit des apps pour des appareils médicaux, des capteurs industriels et de l''électronique grand public.

Des expériences shopping natives avec checkout fluide, notifications push et personnalisation.

### Comment on travaille

On définit les fonctionnalités, on crée des wireframes et on planifie le parcours utilisateur. On considère les deux plateformes dès le début.

Développement iOS et Android en parallèle avec des patterns d''architecture partagés. Builds régulières pour test et feedback.

Tests sur appareils avec multiples tailles d''écran et versions OS. Profilage de performance et optimisation mémoire.

On gère la soumission App Store et Play Store, on répond aux feedbacks de review et on obtient l''approbation de votre app.

Mises à jour OS, corrections de bugs, ajouts de fonctionnalités. On maintient des apps pendant des années.

### Capacités techniques

iOS : Swift, SwiftUI, UIKit, Core Data, HealthKit, ARKit
Android : Kotlin, Jetpack Compose, Room, WorkManager
Backend : REST, GraphQL, WebSockets, gRPC
Push : Firebase, APNs, solutions custom
Analytics : Firebase Analytics, Mixpanel, tracking custom

### Industries

Apps santé (conformes HIPAA). IoT industriel (données capteurs en temps réel). E-commerce (transactions à fort volume). Voyage (exigences offline-first). Finance (critiques pour la sécurité).', 'applications-mobiles');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (80, 8, 'fr', 'DevOps & Infrastructure Cloud', 'Déploiements containerisés, pipelines CI/CD et architecture cloud sur AWS. Nous construisons une infrastructure qui évolue et reste sécurisée.', 'Docker, Kubernetes, Terraform, CircleCI, GitHub Actions. Nous mettons en place des déploiements automatisés, de la surveillance et de l''infrastructure en tant que code pour que votre équipe puisse livrer en toute confiance.', NULL, '## Infrastructure qui scale

On construit de l''infrastructure cloud sur AWS qui gère la croissance, résiste aux attaques et ne vous empêche pas de dormir.

### Ce qu''on fait

Conception et implémentation d''infrastructure AWS. VPCs, load balancers, auto-scaling groups, services managés. Configurés pour la sécurité et l''efficacité des coûts.

Déploiements Docker et Kubernetes quand vous en avez besoin. Conteneurisation, orchestration, gestion des ressources.

Workflows automatisés de build, test et déploiement. GitHub Actions, GitLab CI ou AWS CodePipeline - configurés pour des releases rapides et sûres.

Terraform et CloudFormation pour une infrastructure reproductible. Plus de configuration manuelle ou de changements non documentés.

Monitoring avec Prometheus, Grafana et CloudWatch. Des alertes qui vous préviennent des problèmes avant que les utilisateurs remarquent.

### Comment on pense

Chaque décision d''infrastructure considère la sécurité. Accès à privilèges minimum, chiffrement au repos et en transit, segmentation réseau.

On conçoit pour l''efficacité. Reserved instances, spot instances, right-sizing. On vous aide à éviter le choc de la facture cloud.

Déploiements multi-AZ, failover automatique, planification de disaster recovery. On construit pour les scénarios d''échec parce qu''ils arrivent.

Chaque système vient avec des runbooks, des diagrammes d''architecture et des procédures opérationnelles. Votre équipe peut gérer sans nous.

### Projets courants

Migration cloud depuis on-premises vers AWS. Adoption Kubernetes pour les applications qui en ont besoin. Implémentation CI/CD. Hardening sécurité pour les exigences de conformité. Réduction des coûts sur les déploiements cloud existants. Implémentation disaster recovery.

### Technologies

Cloud : AWS (principal), GCP, Cloudflare
Conteneurs : Docker, Kubernetes, ECS, EKS
IaC : Terraform, CloudFormation, Pulumi
CI/CD : GitHub Actions, GitLab CI, ArgoCD
Monitoring : Prometheus, Grafana, CloudWatch, Datadog
Sécurité : AWS IAM, Vault, SOPS, security scanning

### Livrables

Documentation d''architecture avec diagrammes. Repositories Infrastructure as Code. Dashboards de monitoring et alertes. Runbooks pour les opérations courantes. Revue et recommandations sécurité. Analyse et optimisation des coûts.', 'infrastructure-cloud');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (81, 9, 'fr', 'Backend, APIs & Intégrations', 'Le moteur derrière votre application. APIs RESTful, microservices, optimisation de base de données et intégrations tierces.', 'MySQL, PostgreSQL, Elastic Search pour les requêtes complexes. Nous gérons la modernisation des systèmes legacy, les intégrations système et les modules autonomes pour les plus gros produits. Si vous avez un défi technique spécifique, nous sommes heureux de nous y plonger.', NULL, '## Des systèmes backend qui marchent

On construit des systèmes côté serveur qui alimentent les applications. APIs, microservices, bases de données, intégrations - conçus pour la fiabilité et la performance.

### Ce qu''on construit

Des APIs RESTful que les équipes frontend et mobile adorent. Authentification correcte, rate limiting, gestion des erreurs, documentation.

Des services GraphQL quand les clients ont besoin de flexibilité. Conception de schéma, resolvers, optimisation de performance.

Des microservices quand les monolithes doivent être découpés. Limites de services, communication inter-services, gestion de la complexité.

Des intégrations tierces. Processeurs de paiement, CRMs, ERPs, fournisseurs de livraison - on connecte votre système aux services externes.

Du traitement en arrière-plan. Queues de jobs, tâches planifiées, traitement event-driven. Des systèmes qui gèrent le travail de façon fiable sans bloquer les requêtes utilisateur.

### Comment on travaille

On conçoit les APIs avant de les implémenter. Contrats clairs, patterns consistants, documentation dès le début.

Authentification, autorisation, validation des inputs, rate limiting intégrés dès le premier jour. Pas ajoutés après.

Optimisation des requêtes base de données, stratégies de caching, connection pooling. On mesure et optimise avant que les problèmes arrivent.

Logging, métriques et tracing qui vous aident à comprendre ce qui se passe en production. Le debugging ne devrait pas être de la devinette.

### Technologies

Langages : Node.js (Express, Fastify, NestJS), Python (FastAPI, Django), PHP (Laravel), Go pour les services critiques en performance.

Bases de données : PostgreSQL, MySQL pour le relationnel. MongoDB, DynamoDB pour les documents. Redis pour le caching et les queues. Elasticsearch pour la recherche.

Queues de messages : RabbitMQ, AWS SQS, Redis Streams, Kafka.

Outils API : Documentation OpenAPI/Swagger, GraphQL avec Apollo, gRPC pour les services internes.

### Intégrations courantes

Traitement des paiements : Stripe, PayPal, Adyen, méthodes de paiement locales.
Authentification : Providers OAuth, SSO, identity management.
Communication : Email (SendGrid, SES), SMS (Twilio), notifications push.
Stockage : S3, Cloudflare R2, intégration CDN.
Analytics : Segment, Mixpanel, tracking d''événements custom.

### Livrables

Des APIs bien documentées avec specs OpenAPI. Tests d''intégration et environnements de test. Configurations de déploiement et CI/CD. Monitoring et alertes. Benchmarks de performance. Documentation de revue sécurité.', 'backend');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (82, 10, 'fr', 'Conception & Gestion de Bases de Données', 'SQL, NoSQL, modélisation de données et administration. Nous concevons des bases de données qui évoluent et restent rapides.', 'De la conception de schéma à l''optimisation des performances, nous gérons la couche de données. MySQL, PostgreSQL, MongoDB, Redis. Nous choisissons en fonction de vos modèles d''accès, pas de nos préférences. Administration de bases de données, migrations et reprise après sinistre incluses.', NULL, '## Des bases de données qui restent rapides

Les données sont la fondation de votre application. On conçoit des schémas, on optimise les requêtes et on construit des architectures de données qui gèrent la croissance.

### Ce qu''on fait

De la modélisation de données qui reflète votre domaine business. Structures normalisées pour l''intégrité, dénormalisées là où la performance l''exige.

Des requêtes lentes identifiées et réparées. Stratégies d''indexation, réécriture de requêtes, analyse des plans d''exécution. On rend les bases de données rapides.

Migration entre systèmes ou versions de base de données sans perte de données. Des migrations qui ne nécessitent pas de downtime prolongé.

Quand les bases de données mono-serveur ne suffisent pas - read replicas, setups master-master, sharding horizontal.

Backups automatisés, point-in-time recovery, tests de disaster recovery. Vos données survivent aux pannes matérielles et aux erreurs humaines.

### Technologies de base de données

Relationnel : PostgreSQL (notre recommandation par défaut), MySQL/MariaDB, Amazon RDS et Aurora.

Document : MongoDB, Amazon DynamoDB, Couchbase.

Recherche et analytics : Elasticsearch, ClickHouse, TimescaleDB.

Caching : Redis, Memcached.

### Comment on pense

On commence par les patterns d''accès. Comment vos données seront-elles écrites ? Comment seront-elles lues ? Les réponses déterminent la conception du schéma et les choix technologiques.

On ne devine pas les problèmes de performance. On mesure les temps de requête, on analyse les plans d''exécution et on répare les vrais goulots d''étranglement.

Ce qui marche à 1 000 lignes peut échouer à 1 000 000. On conçoit avec votre trajectoire de croissance en tête.

On n''utilise pas de fonctionnalités complexes sauf si nécessaire. Les schémas simples sont plus faciles à comprendre, maintenir et optimiser.

### Projets courants

Optimisation de performance - réparer les requêtes lentes et les goulots d''étranglement. Refonte de schéma pour les bases de données qui ont grandi organiquement. Migration technologique - MySQL vers PostgreSQL, SQL vers NoSQL. Scaling avec read replicas, connection pooling, couches de caching. Modélisation de données pour les nouvelles applications. Conformité - audit logging, chiffrement, contrôles d''accès.

### Livrables

Diagrammes entité-relation et documentation du schéma. Analyse des requêtes et recommandations d''optimisation. Scripts de migration et procédures de rollback. Dashboards de monitoring pour la santé de la base de données. Runbooks de backup et recovery. Benchmarks et baselines de performance.', 'bases-de-donnees');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (83, 5, 'de', 'KI & Machine Learning', 'Von der Verarbeitung natürlicher Sprache bis zur Computer Vision bauen wir Systeme, die lernen und sich anpassen. Verwandeln Sie Daten in etwas Nützliches.', 'Wir bauen kundenspezifische KI-Lösungen mit TensorFlow, PyTorch und Scikit-learn. Prädiktive Modelle, Chatbots mit NLP, Bilderkennung. Wir konzentrieren uns auf KI, die echte Probleme löst, nicht Demos.', NULL, '## KI, die in Produktion funktioniert

Wir bauen Machine-Learning-Systeme, die Wert liefern - keine beeindruckenden Demos, die auseinanderfallen, wenn man sie deployen will.

### Was wir bauen

Textklassifikation, Sentiment-Analyse, Entity-Extraktion, Dokumentenverständnis. Verarbeitung unstrukturierter Texte im großen Maßstab.

Bildklassifikation, Objekterkennung, OCR, visuelle Inspektionssysteme. Von der Qualitätskontrolle an Produktionslinien bis zur Dokumentenverarbeitung.

Empfehlungsengines, die aus Nutzerverhalten lernen. Produktempfehlungen, Content-Vorschläge, dynamische Preisgestaltung.

Prognosen, Anomalieerkennung, Risikobewertung. Modelle, die Ihnen helfen, Probleme zu antizipieren, bevor sie auftreten.

### Unser Ansatz

Nicht jedes Problem braucht KI. Wir beginnen damit zu verstehen, was Sie erreichen wollen und ob Machine Learning wirklich der richtige Ansatz ist. Manchmal ist eine Regel-Engine besser.

ML-Modelle sind nur so gut wie ihre Trainingsdaten. Wir bewerten, welche Daten Sie haben, was Sie brauchen und wie Lücken zu handhaben sind, bevor wir Code schreiben.

Wir bauen erst einfache Modelle, validieren, dass sie funktionieren, und erhöhen dann die Komplexität wenn nötig. Sie sehen früh Ergebnisse und können den Kurs korrigieren.

Ein Modell ist nicht nützlich, bis es deployed ist. Wir kümmern uns um das Engineering, damit ML zuverlässig in Produktion läuft - Monitoring, Retraining-Pipelines, Drift-Erkennung.

### Tech-Stack

Frameworks: PyTorch, TensorFlow, scikit-learn, Hugging Face
MLOps: MLflow, Kubeflow, individuelle Deployment-Pipelines
Infrastruktur: GPU-Cluster, AWS SageMaker, Google Vertex AI
LLMs: Fine-Tuning, RAG-Systeme, Prompt Engineering

### Ausgelieferte Anwendungsfälle

Kundenservice-Chatbots und Ticket-Klassifikation. Rechnungsextraktion und Vertragsanalyse. Visuelle Inspektion für Fertigungsfehler. Produktempfehlungen für E-Commerce. Nachfrageprognose und Bestandsoptimierung.

### Was uns unterscheidet

Wir sind pragmatisch mit KI. Wir empfehlen kein Deep Learning, wenn logistische Regression reicht. Wir konzentrieren uns auf Lösungen, die wartbar und erklärbar sind und Ihre Business-Metriken wirklich bewegen.', 'kuenstliche-intelligenz');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (84, 6, 'de', 'Webanwendungen', 'Von internen Dashboards bis zu kundenorientierten Plattformen. SPAs, PWAs, Admin-Panels, SaaS-Produkte. Was auch immer Ihre Benutzer brauchen.', 'Wir arbeiten mit Laravel, Symfony, Drupal, WordPress, CraftCMS und modernen JavaScript-Frameworks. Wir wählen basierend auf Ihren Anforderungen, nicht unseren Vorlieben. SEO benötigt? Server-seitiges Rendering. Hohe Interaktivität? Ein modernes SPA. Einfache Bedürfnisse? Vielleicht überhaupt kein Framework.', NULL, '## Webanwendungen, die unter Druck funktionieren

Von internen Tools bis zu Kundenplattformen bauen wir Webanwendungen, die performen und skalieren.

### Was wir bauen

Single Page Applications mit React und Next.js. Schnell, responsiv, optimiert für moderne Browser.

Progressive Web Apps, die offline funktionieren, Push-Benachrichtigungen senden und sich wie native Apps anfühlen. Die Reichweite des Webs mit App-Fähigkeiten.

Admin-Panels und interne Tools, die Ihr Team produktiver machen. Wir bauen Interfaces, die schnell zu benutzen sind, nicht nur schnell zu bauen.

SaaS-Produkte mit Authentifizierung, Abrechnung und der Infrastruktur zum Skalieren. Wir haben Produkte gebaut, die Tausende gleichzeitige Nutzer bedienen.

Individueller E-Commerce mit Bestandsverwaltung und Checkout-Flows. Integriert mit Zahlungsanbietern und Versanddienstleistern.

### Tech-Stack

Frontend: React, Next.js, TypeScript, Tailwind CSS. State Management mit Zustand oder React Query. Testing mit Playwright und Jest.

Backend: Node.js, Python, PHP (Laravel). PostgreSQL, MySQL, MongoDB. Redis für Caching und Queues. GraphQL- oder REST-APIs.

Infrastruktur: Cloudflare Workers, AWS, Vercel. Docker und Kubernetes wenn nötig. CI/CD mit GitHub Actions.

### Wie wir arbeiten

Wir beginnen damit, Anforderungen, Nutzerbedürfnisse und Einschränkungen zu verstehen. Dann Wireframes, Prototypen und technische Architektur.

Entwicklung erfolgt in iterativen Sprints mit regelmäßigen Demos. Sie sehen wöchentlich Fortschritt, nicht monatlich.

Automatisierte Tests, Security Review und Performance-Optimierung vor dem Launch.

CI/CD-Setup, Monitoring und Dokumentation. Dann laufende Wartung und Feature-Entwicklung wenn Sie es brauchen.

### Was Sie bekommen

Sauberer, wartbarer Code mit Dokumentation. Automatisierte Deployment-Pipelines. Monitoring- und Alerting-Setup. Performance-Optimierung. Security Best Practices eingebaut. Wissenstransfer, damit Ihr Team es warten kann.', 'webanwendungen');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (85, 7, 'de', 'Mobile Anwendungen', 'Native iOS- und Android-Apps von Ingenieuren mit über 10 Jahren Erfahrung bei Nagarro und Enea AB. Keine Cross-Platform-Kompromisse, echte native Leistung.', 'Wir spezialisieren uns auf native Entwicklung, weil manche Apps es verlangen. IoT-Integrationen, Wearables, Zahlungssysteme, Gesundheits-Apps. Wenn Leistung und Plattformintegration wichtig sind, bauen wir nativ. Wir kümmern uns auch um App-Store-Veröffentlichung, CI/CD-Pipelines und laufende Wartung.', NULL, '## Native mobile Apps

Wir bauen echte native Apps - Swift für iOS, Kotlin für Android. Unser Mobile-Team hat 10+ Jahre bei Nagarro und Enea AB, baut Apps, die von Millionen genutzt werden.

### Warum nativ

Native Apps sind schneller. Keine JavaScript-Bridge, kein Kompromiss. Ihre Nutzer spüren den Unterschied, besonders auf älteren Geräten.

Voller Zugriff auf iOS- und Android-Fähigkeiten. Kamera, Sensoren, Gesundheitsdaten, Zahlungen - was auch immer die Plattform bietet, können wir nutzen.

Native Apps respektieren die Plattformkonventionen. iOS-Nutzer bekommen ein iOS-Erlebnis. Android-Nutzer bekommen ein Android-Erlebnis. Das zählt mehr, als die meisten realisieren.

Plattform-Updates brechen Ihre App nicht. Sie warten nicht auf ein Framework-Team, um die neuesten OS-Features zu unterstützen.

### Was wir bauen

Consumer-Apps, die schnell und zuverlässig sein müssen. Soziale Features, Medienwiedergabe, Offline-Support.

Enterprise-Apps - interne Tools, Field-Service-Anwendungen, B2B-Produkte. Sicherheit, MDM-Integration, Unternehmensanforderungen.

IoT-Companion-Apps mit Bluetooth-Konnektivität und Geräteverwaltung. Wir haben Apps für medizinische Geräte, Industriesensoren und Consumer Electronics gebaut.

Native Shopping-Erlebnisse mit flüssigem Checkout, Push-Benachrichtigungen und Personalisierung.

### Wie wir arbeiten

Wir definieren Features, erstellen Wireframes und planen die User Journey. Wir berücksichtigen beide Plattformen von Anfang an.

Parallele iOS- und Android-Entwicklung mit gemeinsamen Architekturmustern. Regelmäßige Builds für Tests und Feedback.

Gerätetests über mehrere Bildschirmgrößen und OS-Versionen. Performance-Profiling und Speicheroptimierung.

Wir übernehmen die App Store- und Play Store-Einreichung, reagieren auf Review-Feedback und holen die Genehmigung für Ihre App.

OS-Updates, Bugfixes, Feature-Ergänzungen. Wir warten Apps über Jahre.

### Technische Fähigkeiten

iOS: Swift, SwiftUI, UIKit, Core Data, HealthKit, ARKit
Android: Kotlin, Jetpack Compose, Room, WorkManager
Backend: REST, GraphQL, WebSockets, gRPC
Push: Firebase, APNs, individuelle Lösungen
Analytics: Firebase Analytics, Mixpanel, individuelles Tracking

### Branchen

Healthcare-Apps (HIPAA-konform). Industrielles IoT (Echtzeit-Sensordaten). E-Commerce (Hochvolumen-Transaktionen). Reise (Offline-first-Anforderungen). Finanzen (sicherheitskritisch).', 'mobile-apps');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (86, 8, 'de', 'DevOps & Cloud-Infrastruktur', 'Containerisierte Deployments, CI/CD-Pipelines und Cloud-Architektur auf AWS. Wir bauen Infrastruktur, die skaliert und sicher bleibt.', 'Docker, Kubernetes, Terraform, CircleCI, GitHub Actions. Wir richten automatisierte Deployments, Monitoring und Infrastructure as Code ein, damit Ihr Team mit Zuversicht ausliefern kann.', NULL, '## Infrastruktur, die skaliert

Wir bauen Cloud-Infrastruktur auf AWS, die Wachstum handhabt, Angriffen widersteht und Sie nachts nicht wach hält.

### Was wir machen

AWS-Infrastruktur-Design und -Implementierung. VPCs, Load Balancer, Auto-Scaling-Gruppen, Managed Services. Konfiguriert für Sicherheit und Kosteneffizienz.

Docker- und Kubernetes-Deployments wenn Sie sie brauchen. Containerisierung, Orchestrierung, Ressourcenmanagement.

Automatisierte Build-, Test- und Deployment-Workflows. GitHub Actions, GitLab CI oder AWS CodePipeline - konfiguriert für schnelle, sichere Releases.

Terraform und CloudFormation für reproduzierbare Infrastruktur. Keine manuelle Konfiguration oder undokumentierte Änderungen mehr.

Monitoring mit Prometheus, Grafana und CloudWatch. Alerting, das Sie über Probleme informiert, bevor Nutzer es bemerken.

### Wie wir denken

Jede Infrastrukturentscheidung berücksichtigt Sicherheit. Least-Privilege-Zugriff, Verschlüsselung at rest und in transit, Netzwerksegmentierung.

Wir designen für Effizienz. Reserved Instances, Spot Instances, Right-Sizing. Wir helfen Ihnen, den Cloud-Rechnungsschock zu vermeiden.

Multi-AZ-Deployments, automatisches Failover, Disaster-Recovery-Planung. Wir bauen für Ausfallszenarien, weil sie passieren.

Jedes System kommt mit Runbooks, Architekturdiagrammen und Betriebsverfahren. Ihr Team kann es ohne uns verwalten.

### Häufige Projekte

Cloud-Migration von On-Premises zu AWS. Kubernetes-Adoption für Anwendungen, die es brauchen. CI/CD-Implementierung. Security Hardening für Compliance-Anforderungen. Kostenreduzierung bei bestehenden Cloud-Deployments. Disaster-Recovery-Implementierung.

### Technologien

Cloud: AWS (primär), GCP, Cloudflare
Container: Docker, Kubernetes, ECS, EKS
IaC: Terraform, CloudFormation, Pulumi
CI/CD: GitHub Actions, GitLab CI, ArgoCD
Monitoring: Prometheus, Grafana, CloudWatch, Datadog
Sicherheit: AWS IAM, Vault, SOPS, Security Scanning

### Lieferumfang

Architekturdokumentation mit Diagrammen. Infrastructure-as-Code-Repositories. Monitoring-Dashboards und Alerting. Runbooks für häufige Operationen. Security Review und Empfehlungen. Kostenanalyse und -optimierung.', 'cloud-infrastruktur');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (87, 9, 'de', 'Backend, APIs & Integrationen', 'Der Motor hinter Ihrer Anwendung. RESTful APIs, Microservices, Datenbankoptimierung und Drittanbieter-Integrationen.', 'MySQL, PostgreSQL, Elastic Search für komplexe Abfragen. Wir kümmern uns um Legacy-Modernisierung, Systemintegrationen und eigenständige Module für größere Produkte. Wenn Sie eine spezifische technische Herausforderung haben, graben wir uns gerne rein.', NULL, '## Backend-Systeme, die funktionieren

Wir bauen serverseitige Systeme, die Anwendungen antreiben. APIs, Microservices, Datenbanken, Integrationen - engineered für Zuverlässigkeit und Performance.

### Was wir bauen

RESTful APIs, die Frontend- und Mobile-Teams lieben. Korrekte Authentifizierung, Rate Limiting, Error Handling, Dokumentation.

GraphQL-Services wenn Clients Flexibilität brauchen. Schema-Design, Resolver, Performance-Optimierung.

Microservices wenn Monolithen aufgebrochen werden müssen. Service-Grenzen, Inter-Service-Kommunikation, Komplexitätsmanagement.

Third-Party-Integrationen. Zahlungsanbieter, CRMs, ERPs, Versanddienstleister - wir verbinden Ihr System mit externen Services.

Hintergrundverarbeitung. Job-Queues, geplante Tasks, Event-driven Processing. Systeme, die Arbeit zuverlässig erledigen, ohne Nutzeranfragen zu blockieren.

### Wie wir arbeiten

Wir designen APIs, bevor wir sie implementieren. Klare Verträge, konsistente Patterns, Dokumentation von Anfang an.

Authentifizierung, Autorisierung, Input-Validierung, Rate Limiting von Tag eins eingebaut. Nicht nachträglich angeschraubt.

Datenbank-Query-Optimierung, Caching-Strategien, Connection Pooling. Wir messen und optimieren, bevor Probleme auftreten.

Logging, Metriken und Tracing, die Ihnen helfen zu verstehen, was in Produktion passiert. Debugging sollte kein Raten sein.

### Technologien

Sprachen: Node.js (Express, Fastify, NestJS), Python (FastAPI, Django), PHP (Laravel), Go für performance-kritische Services.

Datenbanken: PostgreSQL, MySQL für relational. MongoDB, DynamoDB für Dokumente. Redis für Caching und Queues. Elasticsearch für Suche.

Message Queues: RabbitMQ, AWS SQS, Redis Streams, Kafka.

API-Tools: OpenAPI/Swagger-Dokumentation, GraphQL mit Apollo, gRPC für interne Services.

### Häufige Integrationen

Zahlungsverarbeitung: Stripe, PayPal, Adyen, lokale Zahlungsmethoden.
Authentifizierung: OAuth-Provider, SSO, Identity Management.
Kommunikation: E-Mail (SendGrid, SES), SMS (Twilio), Push-Benachrichtigungen.
Speicherung: S3, Cloudflare R2, CDN-Integration.
Analytics: Segment, Mixpanel, individuelles Event-Tracking.

### Lieferumfang

Gut dokumentierte APIs mit OpenAPI-Specs. Integrationstests und Testumgebungen. Deployment-Konfigurationen und CI/CD. Monitoring und Alerting. Performance-Benchmarks. Security-Review-Dokumentation.', 'backend');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (88, 10, 'de', 'Datenbankdesign & -verwaltung', 'SQL, NoSQL, Datenmodellierung und Administration. Wir entwerfen Datenbanken, die skalieren und schnell bleiben.', 'Von Schema-Design bis Leistungsoptimierung kümmern wir uns um die Datenschicht. MySQL, PostgreSQL, MongoDB, Redis. Wir wählen basierend auf Ihren Zugriffsmustern, nicht unseren Vorlieben. Datenbankadministration, Migrationen und Disaster Recovery inklusive.', NULL, '## Datenbanken, die schnell bleiben

Daten sind das Fundament Ihrer Anwendung. Wir designen Schemas, optimieren Queries und bauen Datenarchitekturen, die Wachstum handhaben.

### Was wir machen

Datenmodellierung, die Ihre Business-Domain widerspiegelt. Normalisierte Strukturen für Integrität, denormalisiert wo Performance es erfordert.

Langsame Queries identifiziert und repariert. Indexierungsstrategien, Query-Rewrites, Execution-Plan-Analyse. Wir machen Datenbanken schnell.

Migration zwischen Datenbanksystemen oder -versionen ohne Datenverlust. Migrationen, die keine ausgedehnte Downtime erfordern.

Wenn Single-Server-Datenbanken nicht reichen - Read Replicas, Master-Master-Setups, horizontales Sharding.

Automatisierte Backups, Point-in-Time Recovery, Disaster-Recovery-Tests. Ihre Daten überleben Hardwareausfälle und menschliche Fehler.

### Datenbanktechnologien

Relational: PostgreSQL (unsere Standardempfehlung), MySQL/MariaDB, Amazon RDS und Aurora.

Dokument: MongoDB, Amazon DynamoDB, Couchbase.

Suche und Analytics: Elasticsearch, ClickHouse, TimescaleDB.

Caching: Redis, Memcached.

### Wie wir denken

Wir beginnen mit den Zugriffsmustern. Wie werden Ihre Daten geschrieben? Wie werden sie gelesen? Die Antworten bestimmen Schema-Design und Technologiewahl.

Wir raten nicht bei Performance-Problemen. Wir messen Query-Zeiten, analysieren Execution Plans und beheben die echten Engpässe.

Was bei 1.000 Zeilen funktioniert, kann bei 1.000.000 scheitern. Wir designen mit Ihrer Wachstumstrajektorie im Kopf.

Wir nutzen keine komplexen Features, es sei denn sie werden gebraucht. Einfache Schemas sind leichter zu verstehen, zu warten und zu optimieren.

### Häufige Projekte

Performance-Optimierung - langsame Queries und Datenbankengpässe beheben. Schema-Redesign für Datenbanken, die organisch gewachsen sind. Technologiemigration - MySQL zu PostgreSQL, SQL zu NoSQL. Skalierung mit Read Replicas, Connection Pooling, Caching-Schichten. Datenmodellierung für neue Anwendungen. Compliance - Audit Logging, Verschlüsselung, Zugriffskontrollen.

### Lieferumfang

Entity-Relationship-Diagramme und Schema-Dokumentation. Query-Analyse und Optimierungsempfehlungen. Migrationsskripte und Rollback-Prozeduren. Monitoring-Dashboards für Datenbankgesundheit. Backup- und Recovery-Runbooks. Performance-Benchmarks und Baselines.', 'datenbanken');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (89, 5, 'it', 'AI & Machine Learning', 'Dall''elaborazione del linguaggio naturale alla computer vision, costruiamo sistemi che imparano e si adattano. Trasforma i dati in qualcosa di utile.', 'Costruiamo soluzioni AI personalizzate usando TensorFlow, PyTorch e Scikit-learn. Modelli predittivi, chatbot con NLP, riconoscimento immagini. Ci concentriamo su AI che risolve problemi reali, non demo.', NULL, '## AI che funziona in produzione

Costruiamo sistemi di machine learning che portano valore - non demo impressionanti che crollano quando provi a deployarli.

### Cosa costruiamo

Classificazione testo, analisi sentiment, estrazione entità, comprensione documenti. Elaborazione di testo non strutturato su larga scala.

Classificazione immagini, rilevamento oggetti, OCR, sistemi di ispezione visiva. Dal controllo qualità sulle linee di produzione all''elaborazione documenti.

Motori di raccomandazione che imparano dal comportamento degli utenti. Raccomandazioni prodotti, suggerimenti contenuti, pricing dinamico.

Previsioni, rilevamento anomalie, scoring del rischio. Modelli che vi aiutano ad anticipare i problemi prima che accadano.

### Il nostro approccio

Non tutti i problemi hanno bisogno di AI. Iniziamo capendo cosa state cercando di ottenere e se il machine learning è davvero l''approccio giusto. A volte un motore di regole è meglio.

I modelli ML sono buoni tanto quanto i loro dati di training. Valutiamo quali dati avete, di cosa avete bisogno e come gestire le lacune prima di scrivere codice.

Costruiamo modelli semplici prima, validiamo che funzionino, poi aumentiamo la complessità se necessario. Vedete risultati presto e potete correggere la rotta.

Un modello non è utile finché non è deployato. Ci occupiamo dell''engineering per far funzionare ML in modo affidabile in produzione - monitoring, pipeline di re-training, rilevamento drift.

### Stack tecnico

Framework: PyTorch, TensorFlow, scikit-learn, Hugging Face
MLOps: MLflow, Kubeflow, pipeline di deployment personalizzate
Infrastruttura: Cluster GPU, AWS SageMaker, Google Vertex AI
LLM: Fine-tuning, sistemi RAG, prompt engineering

### Casi d''uso consegnati

Chatbot servizio clienti e classificazione ticket. Estrazione fatture e analisi contratti. Ispezione visiva per difetti di fabbricazione. Raccomandazioni prodotti per e-commerce. Previsione domanda e ottimizzazione inventario.

### Cosa ci differenzia

Siamo pragmatici con l''AI. Non raccomanderemo deep learning quando la regressione logistica basta. Ci concentriamo su soluzioni che sono mantenibili, spiegabili e che muovono davvero le vostre metriche di business.', 'intelligenza-artificiale');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (90, 6, 'it', 'Applicazioni Web', 'Da dashboard interni a piattaforme per clienti. SPA, PWA, pannelli admin, prodotti SaaS. Qualsiasi cosa di cui i tuoi utenti hanno bisogno.', 'Lavoriamo con Laravel, Symfony, Drupal, WordPress, CraftCMS e framework JavaScript moderni. Scegliamo in base alle tue esigenze, non alle nostre preferenze. Hai bisogno di SEO? Rendering lato server. Alta interattività? Una SPA moderna. Esigenze semplici? Forse nessun framework.', NULL, '## Applicazioni web che funzionano sotto pressione

Da strumenti interni a piattaforme per clienti, costruiamo applicazioni web che performano e scalano.

### Cosa costruiamo

Single page application con React e Next.js. Veloci, responsive, ottimizzate per browser moderni.

Progressive web app che funzionano offline, inviano notifiche push e si comportano come app native. La portata del web con le capacità di un''app.

Pannelli admin e strumenti interni che rendono il vostro team più produttivo. Costruiamo interfacce che sono veloci da usare, non solo veloci da costruire.

Prodotti SaaS con autenticazione, fatturazione e l''infrastruttura per scalare. Abbiamo costruito prodotti che servono migliaia di utenti simultanei.

E-commerce personalizzato con gestione inventario e flussi di checkout. Integrato con processori di pagamento e servizi di spedizione.

### Stack tecnologico

Frontend: React, Next.js, TypeScript, Tailwind CSS. State management con Zustand o React Query. Testing con Playwright e Jest.

Backend: Node.js, Python, PHP (Laravel). PostgreSQL, MySQL, MongoDB. Redis per caching e code. API GraphQL o REST.

Infrastruttura: Cloudflare Workers, AWS, Vercel. Docker e Kubernetes quando necessario. CI/CD con GitHub Actions.

### Come lavoriamo

Iniziamo capendo requisiti, esigenze utente e vincoli. Poi wireframe, prototipi e architettura tecnica.

Lo sviluppo avviene in sprint iterativi con demo regolari. Vedete progressi settimanalmente, non mensilmente.

Test automatizzati, review di sicurezza e ottimizzazione performance prima del lancio.

Setup CI/CD, monitoring e documentazione. Poi manutenzione continua e sviluppo feature se ne avete bisogno.

### Cosa ottenete

Codice pulito e mantenibile con documentazione. Pipeline di deployment automatizzate. Setup monitoring e alerting. Ottimizzazione performance. Best practice di sicurezza integrate. Trasferimento conoscenze così il vostro team può mantenere.', 'applicazioni-web');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (91, 7, 'it', 'Applicazioni Mobile', 'App native iOS e Android costruite da ingegneri con oltre 10 anni presso Nagarro ed Enea AB. Non compromessi cross-platform, prestazioni native reali.', 'Ci specializziamo nello sviluppo nativo perché alcune app lo richiedono. Integrazioni IoT, wearables, sistemi di pagamento, app sanitarie. Quando prestazioni e integrazione della piattaforma contano, costruiamo nativo. Gestiamo anche la pubblicazione sugli app store, pipeline CI/CD e manutenzione continua.', NULL, '## App mobile native

Costruiamo vere app native - Swift per iOS, Kotlin per Android. Il nostro team mobile ha 10+ anni presso Nagarro ed Enea AB, costruendo app usate da milioni.

### Perché nativo

Le app native sono più veloci. Nessun bridge JavaScript, nessun compromesso. I vostri utenti sentono la differenza, specialmente su dispositivi più vecchi.

Accesso completo alle capacità iOS e Android. Fotocamera, sensori, dati sulla salute, pagamenti - qualsiasi cosa offra la piattaforma, possiamo usarla.

Le app native rispettano le convenzioni della piattaforma. Gli utenti iOS ottengono un''esperienza iOS. Gli utenti Android ottengono un''esperienza Android. Questo conta più di quanto la maggior parte realizzi.

Gli aggiornamenti della piattaforma non rompono la vostra app. Non aspettate un team di framework per supportare le ultime funzionalità OS.

### Cosa costruiamo

App consumer che devono essere veloci e affidabili. Funzionalità social, riproduzione media, supporto offline.

App enterprise - strumenti interni, applicazioni field service, prodotti B2B. Sicurezza, integrazione MDM, requisiti aziendali.

App companion IoT con connettività Bluetooth e gestione dispositivi. Abbiamo costruito app per dispositivi medici, sensori industriali ed elettronica consumer.

Esperienze shopping native con checkout fluido, notifiche push e personalizzazione.

### Come lavoriamo

Definiamo funzionalità, creiamo wireframe e pianifichiamo il percorso utente. Consideriamo entrambe le piattaforme dall''inizio.

Sviluppo iOS e Android in parallelo con pattern architetturali condivisi. Build regolari per test e feedback.

Test su dispositivi con multiple dimensioni schermo e versioni OS. Profilazione performance e ottimizzazione memoria.

Gestiamo la submission su App Store e Play Store, rispondiamo al feedback di review e otteniamo l''approvazione della vostra app.

Aggiornamenti OS, fix di bug, aggiunte di funzionalità. Manteniamo app per anni.

### Capacità tecniche

iOS: Swift, SwiftUI, UIKit, Core Data, HealthKit, ARKit
Android: Kotlin, Jetpack Compose, Room, WorkManager
Backend: REST, GraphQL, WebSockets, gRPC
Push: Firebase, APNs, soluzioni personalizzate
Analytics: Firebase Analytics, Mixpanel, tracking personalizzato

### Settori

App healthcare (conformi HIPAA). IoT industriale (dati sensori in tempo reale). E-commerce (transazioni ad alto volume). Travel (requisiti offline-first). Finanza (critiche per la sicurezza).', 'app-mobile');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (92, 8, 'it', 'DevOps & Infrastruttura Cloud', 'Deployment containerizzati, pipeline CI/CD e architettura cloud su AWS. Costruiamo infrastrutture che scalano e rimangono sicure.', 'Docker, Kubernetes, Terraform, CircleCI, GitHub Actions. Configuriamo deployment automatizzati, monitoraggio e infrastructure as code così il tuo team può distribuire con fiducia.', NULL, '## Infrastruttura che scala

Costruiamo infrastruttura cloud su AWS che gestisce la crescita, resiste agli attacchi e non vi tiene svegli la notte.

### Cosa facciamo

Design e implementazione infrastruttura AWS. VPC, load balancer, auto-scaling group, servizi gestiti. Configurati per sicurezza ed efficienza dei costi.

Deployment Docker e Kubernetes quando ne avete bisogno. Containerizzazione, orchestrazione, gestione risorse.

Workflow automatizzati di build, test e deployment. GitHub Actions, GitLab CI o AWS CodePipeline - configurati per release veloci e sicure.

Terraform e CloudFormation per infrastruttura riproducibile. Niente più configurazione manuale o modifiche non documentate.

Monitoring con Prometheus, Grafana e CloudWatch. Alerting che vi avvisa dei problemi prima che gli utenti notino.

### Come pensiamo

Ogni decisione infrastrutturale considera la sicurezza. Accesso a privilegi minimi, crittografia at rest e in transit, segmentazione rete.

Progettiamo per l''efficienza. Reserved instance, spot instance, right-sizing. Vi aiutiamo a evitare lo shock della bolletta cloud.

Deployment multi-AZ, failover automatico, pianificazione disaster recovery. Costruiamo per scenari di fallimento perché succedono.

Ogni sistema viene con runbook, diagrammi architetturali e procedure operative. Il vostro team può gestire senza di noi.

### Progetti comuni

Migrazione cloud da on-premises ad AWS. Adozione Kubernetes per applicazioni che ne hanno bisogno. Implementazione CI/CD. Hardening sicurezza per requisiti di conformità. Riduzione costi su deployment cloud esistenti. Implementazione disaster recovery.

### Tecnologie

Cloud: AWS (principale), GCP, Cloudflare
Container: Docker, Kubernetes, ECS, EKS
IaC: Terraform, CloudFormation, Pulumi
CI/CD: GitHub Actions, GitLab CI, ArgoCD
Monitoring: Prometheus, Grafana, CloudWatch, Datadog
Sicurezza: AWS IAM, Vault, SOPS, security scanning

### Deliverable

Documentazione architettura con diagrammi. Repository Infrastructure as Code. Dashboard di monitoring e alerting. Runbook per operazioni comuni. Review e raccomandazioni sicurezza. Analisi e ottimizzazione costi.', 'infrastruttura-cloud');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (93, 9, 'it', 'Backend, API & Integrazioni', 'Il motore dietro la tua applicazione. API RESTful, microservizi, ottimizzazione database e integrazioni di terze parti.', 'MySQL, PostgreSQL, Elastic Search per query complesse. Gestiamo modernizzazione di sistemi legacy, integrazioni di sistema e moduli standalone per prodotti più grandi. Se hai una sfida tecnica specifica, siamo felici di approfondire.', NULL, '## Sistemi backend che funzionano

Costruiamo sistemi lato server che alimentano le applicazioni. API, microservizi, database, integrazioni - progettati per affidabilità e performance.

### Cosa costruiamo

API RESTful che i team frontend e mobile adorano. Autenticazione corretta, rate limiting, gestione errori, documentazione.

Servizi GraphQL quando i client hanno bisogno di flessibilità. Design schema, resolver, ottimizzazione performance.

Microservizi quando i monoliti devono essere suddivisi. Confini dei servizi, comunicazione inter-servizi, gestione della complessità.

Integrazioni third-party. Processori di pagamento, CRM, ERP, fornitori di spedizione - colleghiamo il vostro sistema a servizi esterni.

Elaborazione in background. Code di job, task schedulati, elaborazione event-driven. Sistemi che gestiscono il lavoro in modo affidabile senza bloccare le richieste utente.

### Come lavoriamo

Progettiamo le API prima di implementarle. Contratti chiari, pattern consistenti, documentazione dall''inizio.

Autenticazione, autorizzazione, validazione input, rate limiting integrati dal primo giorno. Non aggiunti dopo.

Ottimizzazione query database, strategie di caching, connection pooling. Misuriamo e ottimizziamo prima che i problemi si verifichino.

Logging, metriche e tracing che vi aiutano a capire cosa succede in produzione. Il debugging non dovrebbe essere tirare a indovinare.

### Tecnologie

Linguaggi: Node.js (Express, Fastify, NestJS), Python (FastAPI, Django), PHP (Laravel), Go per servizi critici per la performance.

Database: PostgreSQL, MySQL per relazionale. MongoDB, DynamoDB per documenti. Redis per caching e code. Elasticsearch per ricerca.

Code di messaggi: RabbitMQ, AWS SQS, Redis Streams, Kafka.

Strumenti API: Documentazione OpenAPI/Swagger, GraphQL con Apollo, gRPC per servizi interni.

### Integrazioni comuni

Elaborazione pagamenti: Stripe, PayPal, Adyen, metodi di pagamento locali.
Autenticazione: Provider OAuth, SSO, identity management.
Comunicazione: Email (SendGrid, SES), SMS (Twilio), notifiche push.
Storage: S3, Cloudflare R2, integrazione CDN.
Analytics: Segment, Mixpanel, tracking eventi personalizzato.

### Deliverable

API ben documentate con spec OpenAPI. Test di integrazione e ambienti di test. Configurazioni deployment e CI/CD. Monitoring e alerting. Benchmark di performance. Documentazione review sicurezza.', 'backend');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (94, 10, 'it', 'Progettazione & Gestione Database', 'SQL, NoSQL, modellazione dati e amministrazione. Progettiamo database che scalano e rimangono veloci.', 'Dalla progettazione dello schema all''ottimizzazione delle prestazioni, gestiamo il livello dati. MySQL, PostgreSQL, MongoDB, Redis. Scegliamo in base ai tuoi pattern di accesso, non alle nostre preferenze. Amministrazione database, migrazioni e disaster recovery inclusi.', NULL, '## Database che restano veloci

I dati sono il fondamento della vostra applicazione. Progettiamo schemi, ottimizziamo query e costruiamo architetture dati che gestiscono la crescita.

### Cosa facciamo

Modellazione dati che riflette il vostro dominio di business. Strutture normalizzate per l''integrità, denormalizzate dove la performance lo richiede.

Query lente identificate e sistemate. Strategie di indicizzazione, riscrittura query, analisi piani di esecuzione. Rendiamo i database veloci.

Migrazione tra sistemi o versioni di database senza perdita dati. Migrazioni che non richiedono downtime prolungato.

Quando i database single-server non bastano - read replica, setup master-master, sharding orizzontale.

Backup automatizzati, point-in-time recovery, test disaster recovery. I vostri dati sopravvivono a guasti hardware ed errori umani.

### Tecnologie database

Relazionale: PostgreSQL (la nostra raccomandazione di default), MySQL/MariaDB, Amazon RDS e Aurora.

Documento: MongoDB, Amazon DynamoDB, Couchbase.

Ricerca e analytics: Elasticsearch, ClickHouse, TimescaleDB.

Caching: Redis, Memcached.

### Come pensiamo

Iniziamo dai pattern di accesso. Come verranno scritti i vostri dati? Come verranno letti? Le risposte determinano il design dello schema e le scelte tecnologiche.

Non indoviniamo i problemi di performance. Misuriamo i tempi delle query, analizziamo i piani di esecuzione e sistemiamo i veri colli di bottiglia.

Quello che funziona a 1.000 righe può fallire a 1.000.000. Progettiamo con la vostra traiettoria di crescita in mente.

Non usiamo funzionalità complesse a meno che non siano necessarie. Gli schemi semplici sono più facili da capire, mantenere e ottimizzare.

### Progetti comuni

Ottimizzazione performance - sistemare query lente e colli di bottiglia database. Redesign schema per database cresciuti organicamente. Migrazione tecnologica - MySQL a PostgreSQL, SQL a NoSQL. Scaling con read replica, connection pooling, layer di caching. Modellazione dati per nuove applicazioni. Conformità - audit logging, crittografia, controlli accesso.

### Deliverable

Diagrammi entity-relationship e documentazione schema. Analisi query e raccomandazioni di ottimizzazione. Script di migrazione e procedure di rollback. Dashboard di monitoring per la salute del database. Runbook backup e recovery. Benchmark e baseline di performance.', 'database');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (95, 5, 'es', 'IA & Machine Learning', 'Desde procesamiento de lenguaje natural hasta visión por computadora, construimos sistemas que aprenden y se adaptan. Convierte datos en algo útil.', 'Construimos soluciones de IA personalizadas usando TensorFlow, PyTorch y Scikit-learn. Modelos predictivos, chatbots con NLP, reconocimiento de imágenes. Nos enfocamos en IA que resuelve problemas reales, no demos.', NULL, '## IA que funciona en producción

Construimos sistemas de machine learning que entregan valor - no demos impresionantes que se desmoronan cuando intentas deployarlos.

### Lo que construimos

Clasificación de texto, análisis de sentimiento, extracción de entidades, comprensión de documentos. Procesamiento de texto no estructurado a escala.

Clasificación de imágenes, detección de objetos, OCR, sistemas de inspección visual. Desde control de calidad en líneas de producción hasta procesamiento de documentos.

Motores de recomendación que aprenden del comportamiento de usuarios. Recomendaciones de productos, sugerencias de contenido, precios dinámicos.

Pronósticos, detección de anomalías, scoring de riesgo. Modelos que te ayudan a anticipar problemas antes de que ocurran.

### Nuestro enfoque

No todos los problemas necesitan IA. Empezamos entendiendo qué estás tratando de lograr y si machine learning es realmente el enfoque correcto. A veces un motor de reglas es mejor.

Los modelos ML son tan buenos como sus datos de entrenamiento. Evaluamos qué datos tienes, qué necesitas y cómo manejar las brechas antes de escribir código.

Construimos modelos simples primero, validamos que funcionan, luego aumentamos la complejidad si es necesario. Ves resultados temprano y puedes corregir el rumbo.

Un modelo no es útil hasta que está deployado. Nos encargamos de la ingeniería para que ML funcione de forma confiable en producción - monitoring, pipelines de re-entrenamiento, detección de drift.

### Stack técnico

Frameworks: PyTorch, TensorFlow, scikit-learn, Hugging Face
MLOps: MLflow, Kubeflow, pipelines de deployment personalizados
Infraestructura: Clusters GPU, AWS SageMaker, Google Vertex AI
LLMs: Fine-tuning, sistemas RAG, prompt engineering

### Casos de uso entregados

Chatbots de servicio al cliente y clasificación de tickets. Extracción de facturas y análisis de contratos. Inspección visual para defectos de fabricación. Recomendaciones de productos para e-commerce. Pronóstico de demanda y optimización de inventario.

### Lo que nos diferencia

Somos pragmáticos con la IA. No recomendaremos deep learning cuando regresión logística es suficiente. Nos enfocamos en soluciones que son mantenibles, explicables y que realmente mueven tus métricas de negocio.', 'inteligencia-artificial');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (96, 6, 'es', 'Aplicaciones Web', 'Desde dashboards internos hasta plataformas para clientes. SPAs, PWAs, paneles de administración, productos SaaS. Lo que tus usuarios necesiten.', 'Trabajamos con Laravel, Symfony, Drupal, WordPress, CraftCMS y frameworks JavaScript modernos. Elegimos basándonos en tus requisitos, no en nuestras preferencias. ¿Necesitas SEO? Renderizado del lado del servidor. ¿Alta interactividad? Una SPA moderna. ¿Necesidades simples? Quizás ningún framework.', NULL, '## Aplicaciones web que funcionan bajo presión

Desde herramientas internas hasta plataformas para clientes, construimos aplicaciones web que rinden y escalan.

### Lo que construimos

Single page applications con React y Next.js. Rápidas, responsivas, optimizadas para navegadores modernos.

Progressive web apps que funcionan offline, envían notificaciones push y se sienten como apps nativas. El alcance de la web con capacidades de app.

Paneles de admin y herramientas internas que hacen a tu equipo más productivo. Construimos interfaces que son rápidas de usar, no solo rápidas de construir.

Productos SaaS con autenticación, facturación y la infraestructura para escalar. Hemos construido productos que sirven a miles de usuarios simultáneos.

E-commerce personalizado con gestión de inventario y flujos de checkout. Integrado con procesadores de pago y servicios de envío.

### Stack tecnológico

Frontend: React, Next.js, TypeScript, Tailwind CSS. State management con Zustand o React Query. Testing con Playwright y Jest.

Backend: Node.js, Python, PHP (Laravel). PostgreSQL, MySQL, MongoDB. Redis para caching y colas. APIs GraphQL o REST.

Infraestructura: Cloudflare Workers, AWS, Vercel. Docker y Kubernetes cuando es necesario. CI/CD con GitHub Actions.

### Cómo trabajamos

Empezamos entendiendo requisitos, necesidades de usuario y restricciones. Luego wireframes, prototipos y arquitectura técnica.

El desarrollo ocurre en sprints iterativos con demos regulares. Ves progreso semanalmente, no mensualmente.

Pruebas automatizadas, review de seguridad y optimización de rendimiento antes del lanzamiento.

Setup de CI/CD, monitoring y documentación. Luego mantenimiento continuo y desarrollo de features si lo necesitas.

### Lo que obtienes

Código limpio y mantenible con documentación. Pipelines de deployment automatizados. Setup de monitoring y alertas. Optimización de rendimiento. Mejores prácticas de seguridad integradas. Transferencia de conocimiento para que tu equipo pueda mantener.', 'aplicaciones-web');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (97, 7, 'es', 'Aplicaciones Móviles', 'Apps nativas iOS y Android construidas por ingenieros con más de 10 años en Nagarro y Enea AB. Sin compromisos cross-platform, rendimiento nativo real.', 'Nos especializamos en desarrollo nativo porque algunas apps lo exigen. Integraciones IoT, wearables, sistemas de pago, apps de salud. Cuando el rendimiento y la integración de plataforma importan, construimos nativo. También manejamos publicación en app stores, pipelines CI/CD y mantenimiento continuo.', NULL, '## Apps móviles nativas

Construimos apps nativas reales - Swift para iOS, Kotlin para Android. Nuestro equipo móvil tiene 10+ años en Nagarro y Enea AB, construyendo apps usadas por millones.

### Por qué nativo

Las apps nativas son más rápidas. Sin bridge JavaScript, sin compromiso. Tus usuarios sienten la diferencia, especialmente en dispositivos más antiguos.

Acceso completo a las capacidades de iOS y Android. Cámara, sensores, datos de salud, pagos - lo que sea que ofrezca la plataforma, podemos usarlo.

Las apps nativas respetan las convenciones de la plataforma. Los usuarios de iOS obtienen una experiencia iOS. Los usuarios de Android obtienen una experiencia Android. Esto importa más de lo que la mayoría se da cuenta.

Las actualizaciones de plataforma no rompen tu app. No estás esperando a un equipo de framework para soportar las últimas características del OS.

### Lo que construimos

Apps de consumidor que necesitan ser rápidas y confiables. Características sociales, reproducción de medios, soporte offline.

Apps enterprise - herramientas internas, aplicaciones de servicio de campo, productos B2B. Seguridad, integración MDM, requisitos corporativos.

Apps companion IoT con conectividad Bluetooth y gestión de dispositivos. Hemos construido apps para dispositivos médicos, sensores industriales y electrónica de consumo.

Experiencias de compra nativas con checkout fluido, notificaciones push y personalización.

### Cómo trabajamos

Definimos características, creamos wireframes y planificamos el journey del usuario. Consideramos ambas plataformas desde el inicio.

Desarrollo iOS y Android en paralelo con patrones de arquitectura compartidos. Builds regulares para pruebas y feedback.

Pruebas en dispositivos con múltiples tamaños de pantalla y versiones de OS. Profiling de rendimiento y optimización de memoria.

Manejamos el envío a App Store y Play Store, respondemos al feedback de review y obtenemos la aprobación de tu app.

Actualizaciones de OS, correcciones de bugs, adiciones de características. Mantenemos apps por años.

### Capacidades técnicas

iOS: Swift, SwiftUI, UIKit, Core Data, HealthKit, ARKit
Android: Kotlin, Jetpack Compose, Room, WorkManager
Backend: REST, GraphQL, WebSockets, gRPC
Push: Firebase, APNs, soluciones personalizadas
Analytics: Firebase Analytics, Mixpanel, tracking personalizado

### Industrias

Apps de salud (conformes con HIPAA). IoT industrial (datos de sensores en tiempo real). E-commerce (transacciones de alto volumen). Viajes (requisitos offline-first). Finanzas (críticas para la seguridad).', 'aplicaciones-moviles');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (98, 8, 'es', 'DevOps & Infraestructura Cloud', 'Deployments containerizados, pipelines CI/CD y arquitectura cloud en AWS. Construimos infraestructura que escala y permanece segura.', 'Docker, Kubernetes, Terraform, CircleCI, GitHub Actions. Configuramos deployments automatizados, monitoreo e infraestructura como código para que tu equipo pueda entregar con confianza.', NULL, '## Infraestructura que escala

Construimos infraestructura cloud en AWS que maneja el crecimiento, resiste ataques y no te mantiene despierto por la noche.

### Lo que hacemos

Diseño e implementación de infraestructura AWS. VPCs, load balancers, auto-scaling groups, servicios gestionados. Configurados para seguridad y eficiencia de costos.

Deployments de Docker y Kubernetes cuando los necesitas. Containerización, orquestación, gestión de recursos.

Workflows automatizados de build, test y deployment. GitHub Actions, GitLab CI o AWS CodePipeline - configurados para releases rápidos y seguros.

Terraform y CloudFormation para infraestructura reproducible. No más configuración manual o cambios no documentados.

Monitoring con Prometheus, Grafana y CloudWatch. Alertas que te avisan de problemas antes de que los usuarios noten.

### Cómo pensamos

Cada decisión de infraestructura considera la seguridad. Acceso de mínimo privilegio, encriptación en reposo y en tránsito, segmentación de red.

Diseñamos para eficiencia. Reserved instances, spot instances, right-sizing. Te ayudamos a evitar el shock de la factura cloud.

Deployments multi-AZ, failover automático, planificación de disaster recovery. Construimos para escenarios de fallo porque ocurren.

Cada sistema viene con runbooks, diagramas de arquitectura y procedimientos operativos. Tu equipo puede gestionar sin nosotros.

### Proyectos comunes

Migración cloud desde on-premises a AWS. Adopción de Kubernetes para aplicaciones que lo necesitan. Implementación de CI/CD. Hardening de seguridad para requisitos de cumplimiento. Reducción de costos en deployments cloud existentes. Implementación de disaster recovery.

### Tecnologías

Cloud: AWS (principal), GCP, Cloudflare
Containers: Docker, Kubernetes, ECS, EKS
IaC: Terraform, CloudFormation, Pulumi
CI/CD: GitHub Actions, GitLab CI, ArgoCD
Monitoring: Prometheus, Grafana, CloudWatch, Datadog
Seguridad: AWS IAM, Vault, SOPS, security scanning

### Entregables

Documentación de arquitectura con diagramas. Repositorios Infrastructure as Code. Dashboards de monitoring y alertas. Runbooks para operaciones comunes. Review y recomendaciones de seguridad. Análisis y optimización de costos.', 'infraestructura-cloud');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (99, 9, 'es', 'Backend, APIs e Integraciones', 'El motor detrás de tu aplicación. APIs RESTful, microservicios, optimización de bases de datos e integraciones de terceros.', 'MySQL, PostgreSQL, Elastic Search para consultas complejas. Manejamos modernización de sistemas legacy, integraciones de sistemas y módulos independientes para productos más grandes. Si tienes un desafío técnico específico, estaremos encantados de profundizar.', NULL, '## Sistemas backend que funcionan

Construimos sistemas del lado servidor que alimentan aplicaciones. APIs, microservicios, bases de datos, integraciones - diseñados para confiabilidad y rendimiento.

### Lo que construimos

APIs RESTful que los equipos frontend y móvil adoran. Autenticación correcta, rate limiting, manejo de errores, documentación.

Servicios GraphQL cuando los clientes necesitan flexibilidad. Diseño de schema, resolvers, optimización de rendimiento.

Microservicios cuando los monolitos necesitan dividirse. Límites de servicios, comunicación inter-servicios, gestión de la complejidad.

Integraciones de terceros. Procesadores de pago, CRMs, ERPs, proveedores de envío - conectamos tu sistema a servicios externos.

Procesamiento en background. Colas de jobs, tareas programadas, procesamiento event-driven. Sistemas que manejan trabajo de forma confiable sin bloquear las peticiones de usuario.

### Cómo trabajamos

Diseñamos APIs antes de implementarlas. Contratos claros, patrones consistentes, documentación desde el inicio.

Autenticación, autorización, validación de input, rate limiting integrados desde el día uno. No añadidos después.

Optimización de queries de base de datos, estrategias de caching, connection pooling. Medimos y optimizamos antes de que ocurran problemas.

Logging, métricas y tracing que te ayudan a entender qué está pasando en producción. El debugging no debería ser adivinar.

### Tecnologías

Lenguajes: Node.js (Express, Fastify, NestJS), Python (FastAPI, Django), PHP (Laravel), Go para servicios críticos en rendimiento.

Bases de datos: PostgreSQL, MySQL para relacional. MongoDB, DynamoDB para documentos. Redis para caching y colas. Elasticsearch para búsqueda.

Colas de mensajes: RabbitMQ, AWS SQS, Redis Streams, Kafka.

Herramientas API: Documentación OpenAPI/Swagger, GraphQL con Apollo, gRPC para servicios internos.

### Integraciones comunes

Procesamiento de pagos: Stripe, PayPal, Adyen, métodos de pago locales.
Autenticación: Proveedores OAuth, SSO, identity management.
Comunicación: Email (SendGrid, SES), SMS (Twilio), notificaciones push.
Almacenamiento: S3, Cloudflare R2, integración CDN.
Analytics: Segment, Mixpanel, tracking de eventos personalizado.

### Entregables

APIs bien documentadas con specs OpenAPI. Tests de integración y entornos de prueba. Configuraciones de deployment y CI/CD. Monitoring y alertas. Benchmarks de rendimiento. Documentación de review de seguridad.', 'backend');
INSERT OR IGNORE INTO service_translations (id, service_id, locale, title, description, details, note, long_description, slug) VALUES (100, 10, 'es', 'Diseño y Gestión de Bases de Datos', 'SQL, NoSQL, modelado de datos y administración. Diseñamos bases de datos que escalan y permanecen rápidas.', 'Desde diseño de esquemas hasta optimización de rendimiento, manejamos la capa de datos. MySQL, PostgreSQL, MongoDB, Redis. Elegimos basándonos en tus patrones de acceso, no en nuestras preferencias. Administración de bases de datos, migraciones y recuperación ante desastres incluidos.', NULL, '## Bases de datos que se mantienen rápidas

Los datos son el fundamento de tu aplicación. Diseñamos schemas, optimizamos queries y construimos arquitecturas de datos que manejan el crecimiento.

### Lo que hacemos

Modelado de datos que refleja tu dominio de negocio. Estructuras normalizadas para integridad, desnormalizadas donde el rendimiento lo requiere.

Queries lentas identificadas y arregladas. Estrategias de indexación, reescritura de queries, análisis de planes de ejecución. Hacemos las bases de datos rápidas.

Migración entre sistemas o versiones de base de datos sin pérdida de datos. Migraciones que no requieren downtime extendido.

Cuando las bases de datos de servidor único no son suficientes - read replicas, setups master-master, sharding horizontal.

Backups automatizados, point-in-time recovery, pruebas de disaster recovery. Tus datos sobreviven a fallos de hardware y errores humanos.

### Tecnologías de base de datos

Relacional: PostgreSQL (nuestra recomendación por defecto), MySQL/MariaDB, Amazon RDS y Aurora.

Documento: MongoDB, Amazon DynamoDB, Couchbase.

Búsqueda y analytics: Elasticsearch, ClickHouse, TimescaleDB.

Caching: Redis, Memcached.

### Cómo pensamos

Empezamos con los patrones de acceso. ¿Cómo se escribirán tus datos? ¿Cómo se leerán? Las respuestas determinan el diseño del schema y las elecciones tecnológicas.

No adivinamos los problemas de rendimiento. Medimos tiempos de query, analizamos planes de ejecución y arreglamos los cuellos de botella reales.

Lo que funciona a 1.000 filas puede fallar a 1.000.000. Diseñamos con tu trayectoria de crecimiento en mente.

No usamos características complejas a menos que sean necesarias. Los schemas simples son más fáciles de entender, mantener y optimizar.

### Proyectos comunes

Optimización de rendimiento - arreglar queries lentas y cuellos de botella de base de datos. Rediseño de schema para bases de datos que crecieron orgánicamente. Migración tecnológica - MySQL a PostgreSQL, SQL a NoSQL. Escalado con read replicas, connection pooling, capas de caching. Modelado de datos para nuevas aplicaciones. Cumplimiento - audit logging, encriptación, controles de acceso.

### Entregables

Diagramas entidad-relación y documentación de schema. Análisis de queries y recomendaciones de optimización. Scripts de migración y procedimientos de rollback. Dashboards de monitoring para salud de base de datos. Runbooks de backup y recovery. Benchmarks y baselines de rendimiento.', 'bases-de-datos');

-- === service_technologies ===
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (1, 2, 'Akamai', 0);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (2, 2, 'Cloudflare', 1);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (3, 2, 'Kali Linux', 2);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (4, 2, 'AWS Security', 3);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (5, 2, 'Burp Suite', 4);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (6, 3, 'Google Analytics', 0);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (7, 3, 'Mixpanel', 1);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (8, 3, 'Grafana', 2);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (9, 3, 'Elasticsearch', 3);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (10, 3, 'Python', 4);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (11, 4, 'Selenium', 0);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (12, 4, 'Appium', 1);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (13, 4, 'JMeter', 2);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (14, 4, 'Postman', 3);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (15, 4, 'Cypress', 4);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (507, 5, 'Python', 0);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (508, 5, 'TensorFlow', 1);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (509, 5, 'PyTorch', 2);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (510, 5, 'Scikit-learn', 3);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (511, 5, 'OpenAI', 4);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (512, 6, 'PHP 8', 0);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (513, 6, 'Laravel', 1);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (514, 6, 'Drupal', 2);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (515, 6, 'WordPress', 3);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (516, 6, 'React', 4);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (517, 6, 'Next.js', 5);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (523, 7, 'Swift', 0);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (524, 7, 'Kotlin', 1);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (525, 7, 'iOS SDK', 2);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (526, 7, 'Android SDK', 3);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (527, 7, 'Fitbit SDK', 4);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (538, 8, 'AWS', 0);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (539, 8, 'Docker', 1);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (540, 8, 'Kubernetes', 2);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (541, 8, 'Terraform', 3);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (542, 8, 'CircleCI', 4);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (548, 9, 'Node.js', 0);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (549, 9, 'Python', 1);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (550, 9, 'PHP', 2);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (551, 9, 'GraphQL', 3);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (552, 9, 'REST APIs', 4);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (558, 10, 'MySQL', 0);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (559, 10, 'PostgreSQL', 1);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (560, 10, 'MongoDB', 2);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (561, 10, 'Redis', 3);
INSERT OR IGNORE INTO service_technologies (id, service_id, technology, sort_order) VALUES (562, 10, 'Elasticsearch', 4);

-- === subservices ===
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (1, 1, 'architecture-review', 0);
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (2, 1, 'technology-selection', 1);
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (3, 1, 'code-review', 2);
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (4, 1, 'devsecops-strategy', 3);
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (5, 2, 'penetration-testing', 0);
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (6, 2, 'security-audits', 1);
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (7, 2, 'cloud-security', 2);
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (8, 2, 'ddos-bot-protection', 3);
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (9, 2, 'incident-response', 4);
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (10, 2, 'zero-trust-implementation', 5);
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (11, 3, 'dashboard-design', 0);
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (12, 3, 'performance-tracking', 1);
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (13, 3, 'competitive-analysis', 2);
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (14, 3, 'real-time-monitoring', 3);
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (15, 4, 'manual-testing', 0);
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (16, 4, 'automated-testing', 1);
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (17, 4, 'performance-testing', 2);
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (18, 4, 'security-testing', 3);
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (331, 5, 'natural-language-processing', 0);
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (332, 5, 'computer-vision', 1);
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (333, 5, 'deep-learning', 2);
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (334, 5, 'predictive-analytics', 3);
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (339, 7, 'native-ios-android', 0);
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (340, 7, 'iot-wearables', 1);
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (341, 7, 'payment-ecommerce', 2);
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (342, 7, 'healthcare-pharma', 3);
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (347, 10, 'sql-databases', 0);
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (348, 10, 'nosql-solutions', 1);
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (349, 10, 'data-modeling', 2);
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (350, 10, 'database-administration', 3);

-- === subservice_translations ===
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1, 1, 'en', 'Architecture Review', 'Assessment of your current architecture with recommendations for scalability, security, and maintainability.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (2, 2, 'en', 'Technology Selection', 'Unbiased guidance on choosing the right technologies for your specific requirements and constraints.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (3, 3, 'en', 'Code Review', 'Expert review of your codebase focusing on best practices, security vulnerabilities, and performance issues.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (4, 4, 'en', 'DevSecOps Strategy', 'Integrating security into your development process. Shifting left without slowing down.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (5, 5, 'en', 'Penetration Testing', 'Manual and automated vulnerability testing against web apps, APIs, and infrastructure. The same techniques we used at EA, now for your applications.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (6, 6, 'en', 'Security Audits', 'Code reviews and architecture assessments to find vulnerabilities before attackers do. We''ve reviewed game binaries and enterprise platforms.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (7, 7, 'en', 'Cloud Security', 'AWS configuration reviews, IAM policies, network segmentation, secrets management. The boring stuff that prevents breaches.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (8, 8, 'en', 'DDoS & Bot Protection', 'Implementation and tuning of Akamai and Cloudflare defenses. Credential stuffing, scraping, DDoS, account takeover prevention. Akamai-certified.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (9, 9, 'en', 'Incident Response', 'Swift assessment, containment, and recovery when breaches occur. Post-incident analysis and security hardening.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (10, 10, 'en', 'Zero Trust Implementation', 'Multi-factor authentication, access controls, and continuous monitoring. Every user and device verified before access is granted.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (11, 11, 'en', 'Dashboard Design', 'Data presented in charts and visualizations anyone can understand. Numbers that tell a story.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (12, 12, 'en', 'Performance Tracking', 'Accurate tracking with the right metrics for your situation. No garbage data.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (13, 13, 'en', 'Competitive Analysis', 'See how users behave, what they prefer, and how you compare to competitors.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (14, 14, 'en', 'Real-time Monitoring', 'Live data when you need it, even at high volume.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (15, 15, 'en', 'Manual Testing', 'Hands-on testing that catches UX issues, edge cases, and real-world scenarios automated tests miss.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (16, 16, 'en', 'Automated Testing', 'Selenium, Appium, and custom test suites for fast, repeatable regression testing across builds.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (17, 17, 'en', 'Performance Testing', 'Load testing, stress testing, and bottleneck identification. Know your limits before your users find them.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (18, 18, 'en', 'Security Testing', 'Vulnerability scanning, penetration testing, and risk assessment integrated into your development cycle.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (151, 1, 'ro', 'Revizuire Arhitectură', 'Evaluarea arhitecturii tale actuale cu recomandări pentru scalabilitate, securitate și mentenabilitate.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (152, 2, 'ro', 'Selecție Tehnologie', 'Ghidare imparțială în alegerea tehnologiilor potrivite pentru cerințele și constrângerile tale specifice.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (153, 3, 'ro', 'Revizuire Cod', 'Revizuire expertă a bazei tale de cod concentrată pe best practices, vulnerabilități de securitate și probleme de performanță.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (154, 4, 'ro', 'Strategie DevSecOps', 'Integrarea securității în procesul tău de dezvoltare. Shifting left fără a încetini.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (155, 5, 'ro', 'Testare de Penetrare', 'Testare manuală și automatizată de vulnerabilități pentru aplicații web, API-uri și infrastructură. Aceleași tehnici pe care le-am folosit la EA, acum pentru aplicațiile tale.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (156, 6, 'ro', 'Audituri de Securitate', 'Revizuiri de cod și evaluări de arhitectură pentru a găsi vulnerabilități înainte ca atacatorii să o facă. Am revizuit binare de jocuri și platforme enterprise.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (157, 7, 'ro', 'Securitate Cloud', 'Revizuiri de configurație AWS, politici IAM, segmentare rețea, gestionare secrete. Lucrurile plictisitoare care previn breșele.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (158, 8, 'ro', 'Protecție DDoS & Bot', 'Implementare și acordare Akamai și Cloudflare. Credential stuffing, scraping, DDoS, prevenire account takeover. Certificat Akamai.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (159, 9, 'ro', 'Răspuns la Incidente', 'Evaluare rapidă, izolare și recuperare când apar breșele. Analiză post-incident și consolidare securitate.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (160, 10, 'ro', 'Implementare Zero Trust', 'Autentificare multi-factor, controale de acces și monitorizare continuă. Fiecare utilizator și dispozitiv verificat înainte de acordarea accesului.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (161, 11, 'ro', 'Design Dashboard', 'Date prezentate în grafice și vizualizări pe care oricine le poate înțelege. Numere care spun o poveste.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (162, 12, 'ro', 'Urmărire Performanță', 'Urmărire precisă cu metricile potrivite pentru situația ta. Fără date de gunoi.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (163, 13, 'ro', 'Analiză Competitivă', 'Vezi cum se comportă utilizatorii, ce preferă și cum te compari cu competitorii.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (164, 14, 'ro', 'Monitorizare în Timp Real', 'Date live când ai nevoie, chiar la volum mare.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (165, 15, 'ro', 'Testare Manuală', 'Testare hands-on care prinde probleme UX, cazuri limită și scenarii din lumea reală pe care testele automate le pierd.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (166, 16, 'ro', 'Testare Automatizată', 'Selenium, Appium și suite de teste personalizate pentru testare de regresie rapidă și repetabilă între build-uri.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (167, 17, 'ro', 'Testare de Performanță', 'Testare de încărcare, testare de stres și identificare bottleneck. Cunoaște-ți limitele înainte ca utilizatorii să le găsească.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (168, 18, 'ro', 'Testare de Securitate', 'Scanare de vulnerabilități, testare de penetrare și evaluare de risc integrate în ciclul tău de dezvoltare.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (169, 1, 'fr', 'Revue d''Architecture', 'Évaluation de votre architecture actuelle avec des recommandations pour la scalabilité, la sécurité et la maintenabilité.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (170, 2, 'fr', 'Sélection de Technologies', 'Conseils impartiaux sur le choix des bonnes technologies pour vos besoins et contraintes spécifiques.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (171, 3, 'fr', 'Revue de Code', 'Revue experte de votre base de code axée sur les meilleures pratiques, les vulnérabilités de sécurité et les problèmes de performance.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (172, 4, 'fr', 'Stratégie DevSecOps', 'Intégration de la sécurité dans votre processus de développement. Shifting left sans ralentir.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (173, 5, 'fr', 'Tests de Pénétration', 'Tests de vulnérabilité manuels et automatisés sur les applications web, APIs et infrastructure. Les mêmes techniques utilisées chez EA, maintenant pour vos applications.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (174, 6, 'fr', 'Audits de Sécurité', 'Revues de code et évaluations d''architecture pour trouver les vulnérabilités avant les attaquants. Nous avons examiné des binaires de jeux et des plateformes entreprise.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (175, 7, 'fr', 'Sécurité Cloud', 'Revues de configuration AWS, politiques IAM, segmentation réseau, gestion des secrets. Les choses ennuyeuses qui préviennent les violations.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (176, 8, 'fr', 'Protection DDoS & Bot', 'Implémentation et réglage des défenses Akamai et Cloudflare. Credential stuffing, scraping, DDoS, prévention de prise de compte. Certifié Akamai.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (177, 9, 'fr', 'Réponse aux Incidents', 'Évaluation rapide, confinement et récupération lors de violations. Analyse post-incident et renforcement de la sécurité.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (178, 10, 'fr', 'Implémentation Zero Trust', 'Authentification multi-facteurs, contrôles d''accès et surveillance continue. Chaque utilisateur et appareil vérifié avant l''accès.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (179, 11, 'fr', 'Conception de Tableaux de Bord', 'Données présentées dans des graphiques et visualisations que tout le monde peut comprendre. Des chiffres qui racontent une histoire.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (180, 12, 'fr', 'Suivi de Performance', 'Suivi précis avec les bonnes métriques pour votre situation. Pas de données poubelles.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (181, 13, 'fr', 'Analyse Concurrentielle', 'Voyez comment les utilisateurs se comportent, ce qu''ils préfèrent et comment vous vous comparez aux concurrents.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (182, 14, 'fr', 'Surveillance en Temps Réel', 'Données en direct quand vous en avez besoin, même à haut volume.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (183, 15, 'fr', 'Tests Manuels', 'Tests pratiques qui détectent les problèmes UX, les cas limites et les scénarios réels que les tests automatisés manquent.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (184, 16, 'fr', 'Tests Automatisés', 'Selenium, Appium et suites de tests personnalisées pour des tests de régression rapides et répétables entre les builds.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (185, 17, 'fr', 'Tests de Performance', 'Tests de charge, tests de stress et identification des goulots d''étranglement. Connaissez vos limites avant que vos utilisateurs ne les trouvent.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (186, 18, 'fr', 'Tests de Sécurité', 'Analyse de vulnérabilités, tests de pénétration et évaluation des risques intégrés à votre cycle de développement.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (187, 1, 'de', 'Architektur-Review', 'Bewertung Ihrer aktuellen Architektur mit Empfehlungen für Skalierbarkeit, Sicherheit und Wartbarkeit.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (188, 2, 'de', 'Technologieauswahl', 'Unvoreingenommene Beratung bei der Auswahl der richtigen Technologien für Ihre spezifischen Anforderungen und Einschränkungen.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (189, 3, 'de', 'Code-Review', 'Experten-Review Ihrer Codebasis mit Fokus auf Best Practices, Sicherheitslücken und Performance-Probleme.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (190, 4, 'de', 'DevSecOps-Strategie', 'Integration von Sicherheit in Ihren Entwicklungsprozess. Shifting left ohne zu verlangsamen.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (191, 5, 'de', 'Penetrationstests', 'Manuelle und automatisierte Schwachstellentests für Webanwendungen, APIs und Infrastruktur. Die gleichen Techniken, die wir bei EA verwendet haben, jetzt für Ihre Anwendungen.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (192, 6, 'de', 'Sicherheitsaudits', 'Code-Reviews und Architekturbewertungen, um Schwachstellen zu finden, bevor Angreifer es tun. Wir haben Spiel-Binaries und Enterprise-Plattformen überprüft.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (193, 7, 'de', 'Cloud-Sicherheit', 'AWS-Konfigurationsprüfungen, IAM-Richtlinien, Netzwerksegmentierung, Secrets-Management. Die langweiligen Dinge, die Verletzungen verhindern.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (194, 8, 'de', 'DDoS- & Bot-Schutz', 'Implementierung und Tuning von Akamai- und Cloudflare-Abwehrmaßnahmen. Credential Stuffing, Scraping, DDoS, Konto-Übernahme-Prävention. Akamai-zertifiziert.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (195, 9, 'de', 'Incident Response', 'Schnelle Bewertung, Eindämmung und Wiederherstellung bei Sicherheitsverletzungen. Post-Incident-Analyse und Sicherheitshärtung.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (196, 10, 'de', 'Zero-Trust-Implementierung', 'Multi-Faktor-Authentifizierung, Zugriffskontrollen und kontinuierliche Überwachung. Jeder Benutzer und jedes Gerät wird vor dem Zugriff verifiziert.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (197, 11, 'de', 'Dashboard-Design', 'Daten präsentiert in Diagrammen und Visualisierungen, die jeder verstehen kann. Zahlen, die eine Geschichte erzählen.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (198, 12, 'de', 'Performance-Tracking', 'Präzises Tracking mit den richtigen Metriken für Ihre Situation. Keine Mülldaten.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (199, 13, 'de', 'Wettbewerbsanalyse', 'Sehen Sie, wie sich Benutzer verhalten, was sie bevorzugen und wie Sie im Vergleich zu Wettbewerbern abschneiden.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (200, 14, 'de', 'Echtzeit-Überwachung', 'Live-Daten, wenn Sie sie brauchen, auch bei hohem Volumen.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (201, 15, 'de', 'Manuelles Testen', 'Praktisches Testen, das UX-Probleme, Grenzfälle und reale Szenarien erkennt, die automatisierte Tests übersehen.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (202, 16, 'de', 'Automatisiertes Testen', 'Selenium, Appium und kundenspezifische Testsuiten für schnelle, wiederholbare Regressionstests über Builds hinweg.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (203, 17, 'de', 'Performance-Tests', 'Lasttests, Stresstests und Engpass-Identifikation. Kennen Sie Ihre Grenzen, bevor Ihre Benutzer sie finden.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (204, 18, 'de', 'Sicherheitstests', 'Schwachstellenscanning, Penetrationstests und Risikobewertung in Ihren Entwicklungszyklus integriert.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (205, 1, 'it', 'Revisione Architettura', 'Valutazione della tua architettura attuale con raccomandazioni per scalabilità, sicurezza e manutenibilità.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (206, 2, 'it', 'Selezione Tecnologie', 'Guida imparziale nella scelta delle tecnologie giuste per i tuoi requisiti e vincoli specifici.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (207, 3, 'it', 'Revisione Codice', 'Revisione esperta della tua codebase focalizzata su best practice, vulnerabilità di sicurezza e problemi di performance.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (208, 4, 'it', 'Strategia DevSecOps', 'Integrazione della sicurezza nel tuo processo di sviluppo. Shifting left senza rallentare.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (209, 5, 'it', 'Penetration Testing', 'Test di vulnerabilità manuali e automatizzati su applicazioni web, API e infrastruttura. Le stesse tecniche usate in EA, ora per le tue applicazioni.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (210, 6, 'it', 'Audit di Sicurezza', 'Revisioni del codice e valutazioni dell''architettura per trovare vulnerabilità prima degli attaccanti. Abbiamo revisionato binari di giochi e piattaforme enterprise.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (211, 7, 'it', 'Sicurezza Cloud', 'Revisioni configurazione AWS, policy IAM, segmentazione rete, gestione secrets. Le cose noiose che prevengono le violazioni.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (212, 8, 'it', 'Protezione DDoS & Bot', 'Implementazione e tuning delle difese Akamai e Cloudflare. Credential stuffing, scraping, DDoS, prevenzione account takeover. Certificato Akamai.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (213, 9, 'it', 'Risposta agli Incidenti', 'Valutazione rapida, contenimento e recupero quando si verificano violazioni. Analisi post-incidente e hardening della sicurezza.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (214, 10, 'it', 'Implementazione Zero Trust', 'Autenticazione multi-fattore, controlli di accesso e monitoraggio continuo. Ogni utente e dispositivo verificato prima dell''accesso.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (215, 11, 'it', 'Design Dashboard', 'Dati presentati in grafici e visualizzazioni che chiunque può capire. Numeri che raccontano una storia.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (216, 12, 'it', 'Tracking Prestazioni', 'Tracking accurato con le metriche giuste per la tua situazione. Niente dati spazzatura.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (217, 13, 'it', 'Analisi Competitiva', 'Vedi come si comportano gli utenti, cosa preferiscono e come ti confronti con i concorrenti.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (218, 14, 'it', 'Monitoraggio in Tempo Reale', 'Dati live quando ne hai bisogno, anche ad alto volume.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (219, 15, 'it', 'Testing Manuale', 'Testing pratico che individua problemi UX, casi limite e scenari reali che i test automatizzati perdono.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (220, 16, 'it', 'Testing Automatizzato', 'Selenium, Appium e suite di test personalizzate per test di regressione veloci e ripetibili tra le build.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (221, 17, 'it', 'Testing Prestazioni', 'Load testing, stress testing e identificazione dei colli di bottiglia. Conosci i tuoi limiti prima che li trovino i tuoi utenti.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (222, 18, 'it', 'Testing Sicurezza', 'Scansione vulnerabilità, penetration testing e valutazione del rischio integrati nel tuo ciclo di sviluppo.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (223, 1, 'es', 'Revisión de Arquitectura', 'Evaluación de tu arquitectura actual con recomendaciones para escalabilidad, seguridad y mantenibilidad.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (224, 2, 'es', 'Selección de Tecnología', 'Orientación imparcial para elegir las tecnologías adecuadas para tus requisitos y restricciones específicas.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (225, 3, 'es', 'Revisión de Código', 'Revisión experta de tu código enfocada en mejores prácticas, vulnerabilidades de seguridad y problemas de rendimiento.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (226, 4, 'es', 'Estrategia DevSecOps', 'Integrando seguridad en tu proceso de desarrollo. Shifting left sin ralentizar.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (227, 5, 'es', 'Pruebas de Penetración', 'Pruebas de vulnerabilidad manuales y automatizadas en aplicaciones web, APIs e infraestructura. Las mismas técnicas que usamos en EA, ahora para tus aplicaciones.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (228, 6, 'es', 'Auditorías de Seguridad', 'Revisiones de código y evaluaciones de arquitectura para encontrar vulnerabilidades antes que los atacantes. Hemos revisado binarios de juegos y plataformas enterprise.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (229, 7, 'es', 'Seguridad Cloud', 'Revisiones de configuración AWS, políticas IAM, segmentación de red, gestión de secretos. Las cosas aburridas que previenen violaciones.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (230, 8, 'es', 'Protección DDoS & Bot', 'Implementación y ajuste de defensas Akamai y Cloudflare. Credential stuffing, scraping, DDoS, prevención de robo de cuentas. Certificado Akamai.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (231, 9, 'es', 'Respuesta a Incidentes', 'Evaluación rápida, contención y recuperación cuando ocurren violaciones. Análisis post-incidente y fortalecimiento de seguridad.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (232, 10, 'es', 'Implementación Zero Trust', 'Autenticación multi-factor, controles de acceso y monitoreo continuo. Cada usuario y dispositivo verificado antes de otorgar acceso.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (233, 11, 'es', 'Diseño de Dashboards', 'Datos presentados en gráficos y visualizaciones que cualquiera puede entender. Números que cuentan una historia.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (234, 12, 'es', 'Seguimiento de Rendimiento', 'Seguimiento preciso con las métricas correctas para tu situación. Sin datos basura.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (235, 13, 'es', 'Análisis Competitivo', 'Ve cómo se comportan los usuarios, qué prefieren y cómo te comparas con los competidores.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (236, 14, 'es', 'Monitoreo en Tiempo Real', 'Datos en vivo cuando los necesitas, incluso a alto volumen.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (237, 15, 'es', 'Testing Manual', 'Testing práctico que detecta problemas de UX, casos límite y escenarios del mundo real que los tests automatizados pierden.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (238, 16, 'es', 'Testing Automatizado', 'Selenium, Appium y suites de tests personalizadas para testing de regresión rápido y repetible entre builds.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (239, 17, 'es', 'Testing de Rendimiento', 'Load testing, stress testing e identificación de cuellos de botella. Conoce tus límites antes de que tus usuarios los encuentren.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (240, 18, 'es', 'Testing de Seguridad', 'Escaneo de vulnerabilidades, pruebas de penetración y evaluación de riesgos integrados en tu ciclo de desarrollo.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1381, 331, 'de', 'Natürliche Sprachverarbeitung', 'Chatbots, Sentiment-Analyse, Textklassifizierung und maschinelle Übersetzung. Lassen Sie Ihre Anwendungen menschliche Sprache verstehen und darauf reagieren.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1382, 331, 'en', 'Natural Language Processing', 'Chatbots, sentiment analysis, text classification, and machine translation. Make your applications understand and respond to human language.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1383, 331, 'es', 'Procesamiento de Lenguaje Natural', 'Chatbots, análisis de sentimiento, clasificación de texto y traducción automática. Haz que tus aplicaciones entiendan y respondan al lenguaje humano.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1384, 331, 'fr', 'Traitement du Langage Naturel', 'Chatbots, analyse de sentiment, classification de texte et traduction automatique. Faites comprendre et répondre vos applications au langage humain.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1385, 331, 'it', 'Elaborazione del Linguaggio Naturale', 'Chatbot, analisi del sentiment, classificazione del testo e traduzione automatica. Fai capire e rispondere le tue applicazioni al linguaggio umano.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1386, 331, 'ro', 'Procesarea Limbajului Natural', 'Chatboți, analiză de sentiment, clasificare text și traducere automată. Fă aplicațiile tale să înțeleagă și să răspundă limbajului uman.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1387, 332, 'de', 'Computer Vision', 'Bilderkennung, Objekterkennung und Videoanalyse. Von der Qualitätskontrolle bis zur Sicherheitsüberwachung.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1388, 332, 'en', 'Computer Vision', 'Image recognition, object detection, and video analysis. From quality control to security monitoring.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1389, 332, 'es', 'Visión por Computadora', 'Reconocimiento de imágenes, detección de objetos y análisis de video. Desde control de calidad hasta monitoreo de seguridad.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1390, 332, 'fr', 'Vision par Ordinateur', 'Reconnaissance d''images, détection d''objets et analyse vidéo. Du contrôle qualité à la surveillance de sécurité.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1391, 332, 'it', 'Computer Vision', 'Riconoscimento immagini, rilevamento oggetti e analisi video. Dal controllo qualità al monitoraggio della sicurezza.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1392, 332, 'ro', 'Computer Vision', 'Recunoaștere de imagini, detecție de obiecte și analiză video. De la controlul calității la monitorizarea securității.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1393, 333, 'de', 'Deep Learning', 'Neuronale Netze für komplexe Mustererkennung. Wenn traditionelle Algorithmen nicht ausreichen.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1394, 333, 'en', 'Deep Learning', 'Neural networks for complex pattern recognition. When traditional algorithms aren''t enough.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1395, 333, 'es', 'Deep Learning', 'Redes neuronales para reconocimiento de patrones complejos. Cuando los algoritmos tradicionales no son suficientes.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1396, 333, 'fr', 'Deep Learning', 'Réseaux de neurones pour la reconnaissance de patterns complexes. Quand les algorithmes traditionnels ne suffisent pas.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1397, 333, 'it', 'Deep Learning', 'Reti neurali per il riconoscimento di pattern complessi. Quando gli algoritmi tradizionali non bastano.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1398, 333, 'ro', 'Deep Learning', 'Rețele neuronale pentru recunoaștere complexă de pattern-uri. Când algoritmii tradiționali nu sunt suficienți.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1399, 334, 'de', 'Prädiktive Analytik', 'Machine-Learning-Modelle, die Trends vorhersagen, Anomalien erkennen und Entscheidungen basierend auf historischen Daten optimieren.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1400, 334, 'en', 'Predictive Analytics', 'Machine learning models that forecast trends, detect anomalies, and optimize decisions based on historical data.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1401, 334, 'es', 'Analítica Predictiva', 'Modelos de machine learning que pronostican tendencias, detectan anomalías y optimizan decisiones basadas en datos históricos.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1402, 334, 'fr', 'Analytique Prédictive', 'Modèles de machine learning qui prévoient les tendances, détectent les anomalies et optimisent les décisions basées sur les données historiques.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1403, 334, 'it', 'Analisi Predittiva', 'Modelli di machine learning che prevedono tendenze, rilevano anomalie e ottimizzano decisioni basate su dati storici.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1404, 334, 'ro', 'Analize Predictive', 'Modele de machine learning care anticipează tendințe, detectează anomalii și optimizează decizii bazate pe date istorice.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1429, 339, 'de', 'Natives iOS & Android', 'Echte native Apps mit vollständiger Plattformintegration. Nicht React Native oder Flutter. Wenn sich Ihre App auf dem Gerät heimisch anfühlen muss.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1430, 339, 'en', 'Native iOS & Android', 'True native apps with full platform integration. Not React Native or Flutter. When your app needs to feel like it belongs on the device.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1431, 339, 'es', 'iOS & Android Nativo', 'Apps verdaderamente nativas con integración completa de plataforma. No React Native ni Flutter. Cuando tu app necesita sentirse en casa en el dispositivo.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1432, 339, 'fr', 'iOS & Android Natif', 'De vraies applications natives avec intégration complète de la plateforme. Pas React Native ou Flutter. Quand votre application doit se sentir chez elle sur l''appareil.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1433, 339, 'it', 'iOS & Android Nativo', 'App veramente native con integrazione completa della piattaforma. Non React Native o Flutter. Quando la tua app deve sentirsi a casa sul dispositivo.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1434, 339, 'ro', 'iOS & Android Nativ', 'Aplicații cu adevărat native cu integrare completă a platformei. Fără React Native sau Flutter. Când aplicația ta trebuie să se simtă ca acasă pe dispozitiv.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1435, 340, 'de', 'IoT & Wearables', 'Apps für vernetzte Geräte, Fitbit-Integrationen und Hardware-SDKs. Erfahrung in der Lieferung von IoT-Produkten bei Enea AB.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1436, 340, 'en', 'IoT & Wearables', 'Connected device apps, Fitbit integrations, and hardware SDKs. Experience shipping IoT products at Enea AB.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1437, 340, 'es', 'IoT & Wearables', 'Apps para dispositivos conectados, integraciones Fitbit y SDKs de hardware. Experiencia entregando productos IoT en Enea AB.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1438, 340, 'fr', 'IoT & Wearables', 'Applications pour appareils connectés, intégrations Fitbit et SDKs matériels. Expérience dans la livraison de produits IoT chez Enea AB.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1439, 340, 'it', 'IoT & Wearables', 'App per dispositivi connessi, integrazioni Fitbit e SDK hardware. Esperienza nella consegna di prodotti IoT presso Enea AB.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1440, 340, 'ro', 'IoT & Wearables', 'Aplicații pentru dispozitive conectate, integrări Fitbit și SDK-uri hardware. Experiență în livrarea produselor IoT la Enea AB.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1441, 341, 'de', 'Zahlung & E-Commerce', 'Stripe, Shopify und kundenspezifische Zahlungsintegrationen. Sichere Transaktionen, die Compliance-Anforderungen erfüllen.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1442, 341, 'en', 'Payment & E-commerce', 'Stripe, Shopify, and custom payment integrations. Secure transactions that meet compliance requirements.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1443, 341, 'es', 'Pagos & E-commerce', 'Stripe, Shopify e integraciones de pago personalizadas. Transacciones seguras que cumplen requisitos de cumplimiento.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1444, 341, 'fr', 'Paiement & E-commerce', 'Stripe, Shopify et intégrations de paiement personnalisées. Transactions sécurisées conformes aux exigences.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1445, 341, 'it', 'Pagamenti & E-commerce', 'Stripe, Shopify e integrazioni di pagamento personalizzate. Transazioni sicure che soddisfano i requisiti di conformità.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1446, 341, 'ro', 'Plăți & E-commerce', 'Stripe, Shopify și integrări de plăți personalizate. Tranzacții securizate care respectă cerințele de conformitate.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1447, 342, 'de', 'Gesundheit & Pharma', 'Apps für Veterinär-, Ernährungs- und Pharmaindustrie. Verständnis für regulatorische Anforderungen und Datensensibilität.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1448, 342, 'en', 'Healthcare & Pharma', 'Apps for veterinary, nutrition, and pharmaceutical industries. Understanding of regulatory requirements and data sensitivity.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1449, 342, 'es', 'Salud & Farmacéutica', 'Apps para industrias veterinaria, nutrición y farmacéutica. Comprensión de requisitos regulatorios y sensibilidad de datos.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1450, 342, 'fr', 'Santé & Pharma', 'Applications pour les industries vétérinaire, nutrition et pharmaceutique. Compréhension des exigences réglementaires et de la sensibilité des données.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1451, 342, 'it', 'Sanità & Farmaceutica', 'App per industrie veterinaria, nutrizione e farmaceutica. Comprensione dei requisiti normativi e della sensibilità dei dati.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1452, 342, 'ro', 'Sănătate & Farma', 'Aplicații pentru industria veterinară, nutriție și farmaceutică. Înțelegerea cerințelor de reglementare și sensibilitatea datelor.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1477, 347, 'de', 'SQL-Datenbanken', 'Design, Optimierung und Verwaltung relationaler Datenbanken. MySQL, PostgreSQL und Enterprise-Lösungen.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1478, 347, 'en', 'SQL Databases', 'Relational database design, optimization, and management. MySQL, PostgreSQL, and enterprise solutions.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1479, 347, 'es', 'Bases de Datos SQL', 'Diseño, optimización y gestión de bases de datos relacionales. MySQL, PostgreSQL y soluciones enterprise.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1480, 347, 'fr', 'Bases de Données SQL', 'Conception, optimisation et gestion de bases de données relationnelles. MySQL, PostgreSQL et solutions entreprise.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1481, 347, 'it', 'Database SQL', 'Progettazione, ottimizzazione e gestione di database relazionali. MySQL, PostgreSQL e soluzioni enterprise.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1482, 347, 'ro', 'Baze de Date SQL', 'Design, optimizare și management de baze de date relaționale. MySQL, PostgreSQL și soluții enterprise.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1483, 348, 'de', 'NoSQL-Lösungen', 'Dokumentenspeicher, Key-Value-Datenbanken und Graph-Datenbanken für hochgeschwindigkeits- und unstrukturierte Daten.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1484, 348, 'en', 'NoSQL Solutions', 'Document stores, key-value databases, and graph databases for high-velocity and unstructured data.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1485, 348, 'es', 'Soluciones NoSQL', 'Document stores, bases de datos key-value y bases de datos de grafos para datos de alta velocidad y no estructurados.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1486, 348, 'fr', 'Solutions NoSQL', 'Bases documentaires, bases clé-valeur et bases graphes pour données haute vélocité et non structurées.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1487, 348, 'it', 'Soluzioni NoSQL', 'Document store, database key-value e graph database per dati ad alta velocità e non strutturati.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1488, 348, 'ro', 'Soluții NoSQL', 'Baze de date documentare, de tip key-value și graf, pentru date nestructurate procesate la viteză mare.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1489, 349, 'de', 'Datenmodellierung', 'Schema-Design, das Ihre Abfragen unterstützt und mit Ihrem Wachstum skaliert. Das Fundament richtig legen.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1490, 349, 'en', 'Data Modeling', 'Schema design that supports your queries and scales with your growth. Getting the foundation right.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1491, 349, 'es', 'Modelado de Datos', 'Diseño de esquema que soporta tus consultas y escala con tu crecimiento. Estableciendo la base correcta.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1492, 349, 'fr', 'Modélisation de Données', 'Conception de schéma qui supporte vos requêtes et évolue avec votre croissance. Poser les bonnes fondations.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1493, 349, 'it', 'Modellazione Dati', 'Progettazione di schema che supporta le tue query e scala con la tua crescita. Mettere le basi giuste.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1494, 349, 'ro', 'Modelare Date', 'Design de structură care suportă interogările tale și se extinde ușor cu creșterea afacerii. Punem fundația corectă.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1495, 350, 'de', 'Datenbankadministration', 'Backup-Strategien, Performance-Tuning, Sicherheitshärtung und Disaster-Recovery-Planung.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1496, 350, 'en', 'Database Administration', 'Backup strategies, performance tuning, security hardening, and disaster recovery planning.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1497, 350, 'es', 'Administración de Bases de Datos', 'Estrategias de respaldo, ajuste de rendimiento, fortalecimiento de seguridad y planificación de recuperación ante desastres.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1498, 350, 'fr', 'Administration de Bases de Données', 'Stratégies de sauvegarde, optimisation des performances, renforcement de la sécurité et planification de reprise après sinistre.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1499, 350, 'it', 'Amministrazione Database', 'Strategie di backup, tuning delle prestazioni, hardening della sicurezza e pianificazione del disaster recovery.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (1500, 350, 'ro', 'Administrare Baze de Date', 'Strategii de backup, tuning de performanță, securizare și planificare disaster recovery.');

-- === team_members ===
INSERT OR IGNORE INTO team_members (id, slug, email, gravatar_email, linkedin_url, image_path, sort_order, is_active, created_at, updated_at) VALUES (1, 'catalin-teodorescu', 'contact@itguys.ro', 'dustfeather@gmail.com', 'https://www.linkedin.com/in/dustfeather/', NULL, 0, 1, '2026-01-25 04:34:56', '2026-01-25 04:34:56');
INSERT OR IGNORE INTO team_members (id, slug, email, gravatar_email, linkedin_url, image_path, sort_order, is_active, created_at, updated_at) VALUES (2, 'cristian-marian-mincu', NULL, 'cristi90mincu@gmail.com', 'https://www.linkedin.com/in/cristian-marian-mincu-44849690/', NULL, 1, 1, '2026-01-25 04:34:56', '2026-01-25 19:48:34');

-- === team_member_translations ===
INSERT OR IGNORE INTO team_member_translations (id, team_member_id, locale, name, role, bio) VALUES (1, 1, 'en', 'Catalin Teodorescu', 'Founder & Lead Engineer', '15+ years in software development and cybersecurity. Previously at TUI, Electronic Arts, and Team Extension AG. Specializes in secure architecture, DevOps, and web application security.');
INSERT OR IGNORE INTO team_member_translations (id, team_member_id, locale, name, role, bio) VALUES (2, 2, 'en', 'Cristian-Marian Mincu', 'Senior Mobile Developer', '10+ years building native iOS and Android apps. Previously at Nagarro and Enea AB. Expert in mobile architecture, IoT integrations, and CI/CD pipelines. Master''s in Information Security from University Politehnica of Bucharest.');
INSERT OR IGNORE INTO team_member_translations (id, team_member_id, locale, name, role, bio) VALUES (11, 1, 'ro', 'Cătălin Teodorescu', 'Fondator & Inginer Principal', 'Peste 15 ani de experiență în dezvoltare software și securitate cibernetică. Anterior la TUI, Electronic Arts și Team Extension AG. Specializat în arhitectură securizată, DevOps și securitatea aplicațiilor web.');
INSERT OR IGNORE INTO team_member_translations (id, team_member_id, locale, name, role, bio) VALUES (12, 2, 'ro', 'Cristian-Marian Mincu', 'Dezvoltator Mobile Senior', 'Peste 10 ani de experiență în dezvoltarea aplicațiilor native iOS și Android. Anterior la Nagarro și Enea AB. Expert în arhitectură mobilă, integrații IoT și pipeline-uri CI/CD. Master în Securitate Informatică la Universitatea Politehnica din București.');
INSERT OR IGNORE INTO team_member_translations (id, team_member_id, locale, name, role, bio) VALUES (13, 1, 'fr', 'Catalin Teodorescu', 'Fondateur & Ingénieur Principal', 'Plus de 15 ans d''expérience en développement logiciel et cybersécurité. Anciennement chez TUI, Electronic Arts et Team Extension AG. Spécialisé en architecture sécurisée, DevOps et sécurité des applications web.');
INSERT OR IGNORE INTO team_member_translations (id, team_member_id, locale, name, role, bio) VALUES (14, 2, 'fr', 'Cristian-Marian Mincu', 'Développeur Mobile Senior', 'Plus de 10 ans d''expérience dans le développement d''applications natives iOS et Android. Anciennement chez Nagarro et Enea AB. Expert en architecture mobile, intégrations IoT et pipelines CI/CD. Master en Sécurité Informatique de l''Université Politehnica de Bucarest.');
INSERT OR IGNORE INTO team_member_translations (id, team_member_id, locale, name, role, bio) VALUES (15, 1, 'de', 'Catalin Teodorescu', 'Gründer & Leitender Ingenieur', 'Über 15 Jahre Erfahrung in Softwareentwicklung und Cybersicherheit. Zuvor bei TUI, Electronic Arts und Team Extension AG. Spezialisiert auf sichere Architektur, DevOps und Webanwendungssicherheit.');
INSERT OR IGNORE INTO team_member_translations (id, team_member_id, locale, name, role, bio) VALUES (16, 2, 'de', 'Cristian-Marian Mincu', 'Senior Mobile-Entwickler', 'Über 10 Jahre Erfahrung in der Entwicklung nativer iOS- und Android-Apps. Zuvor bei Nagarro und Enea AB. Experte für mobile Architektur, IoT-Integrationen und CI/CD-Pipelines. Master in Informationssicherheit an der Politehnica-Universität Bukarest.');
INSERT OR IGNORE INTO team_member_translations (id, team_member_id, locale, name, role, bio) VALUES (17, 1, 'it', 'Catalin Teodorescu', 'Fondatore & Ingegnere Principale', 'Oltre 15 anni di esperienza nello sviluppo software e nella sicurezza informatica. In precedenza presso TUI, Electronic Arts e Team Extension AG. Specializzato in architettura sicura, DevOps e sicurezza delle applicazioni web.');
INSERT OR IGNORE INTO team_member_translations (id, team_member_id, locale, name, role, bio) VALUES (18, 2, 'it', 'Cristian-Marian Mincu', 'Sviluppatore Mobile Senior', 'Oltre 10 anni di esperienza nello sviluppo di app native iOS e Android. In precedenza presso Nagarro ed Enea AB. Esperto in architettura mobile, integrazioni IoT e pipeline CI/CD. Master in Sicurezza Informatica presso l''Università Politehnica di Bucarest.');
INSERT OR IGNORE INTO team_member_translations (id, team_member_id, locale, name, role, bio) VALUES (19, 1, 'es', 'Catalin Teodorescu', 'Fundador e Ingeniero Principal', 'Más de 15 años de experiencia en desarrollo de software y ciberseguridad. Anteriormente en TUI, Electronic Arts y Team Extension AG. Especializado en arquitectura segura, DevOps y seguridad de aplicaciones web.');
INSERT OR IGNORE INTO team_member_translations (id, team_member_id, locale, name, role, bio) VALUES (20, 2, 'es', 'Cristian-Marian Mincu', 'Desarrollador Mobile Senior', 'Más de 10 años desarrollando aplicaciones nativas iOS y Android. Anteriormente en Nagarro y Enea AB. Experto en arquitectura móvil, integraciones IoT y pipelines CI/CD. Master en Seguridad Informática de la Universidad Politehnica de Bucarest.');

-- === projects ===
INSERT OR IGNORE INTO projects (id, slug, image_path, external_url, sort_order, is_active, created_at, updated_at, is_case_study, duration, completed_at) VALUES (1, 'xtendlive', NULL, 'https://xtendlive.com/', 0, 1, '2026-01-25 04:34:56', '2026-01-25 04:34:56', 0, NULL, NULL);
INSERT OR IGNORE INTO projects (id, slug, image_path, external_url, sort_order, is_active, created_at, updated_at, is_case_study, duration, completed_at) VALUES (2, 'insight6', NULL, 'https://www.insight6.com/', 1, 1, '2026-01-25 04:34:56', '2026-01-25 19:22:10', 0, NULL, NULL);
INSERT OR IGNORE INTO projects (id, slug, image_path, external_url, sort_order, is_active, created_at, updated_at, is_case_study, duration, completed_at) VALUES (3, 'audiomovers-listento', NULL, 'https://audiomovers.com/products/listento', 2, 1, '2026-01-25 04:34:56', '2026-01-25 19:23:52', 0, NULL, NULL);
INSERT OR IGNORE INTO projects (id, slug, image_path, external_url, sort_order, is_active, created_at, updated_at, is_case_study, duration, completed_at) VALUES (4, 'fsc', NULL, 'https://fsc.org/en', 3, 1, '2026-01-25 04:34:56', '2026-01-25 19:25:53', 0, NULL, NULL);
INSERT OR IGNORE INTO projects (id, slug, image_path, external_url, sort_order, is_active, created_at, updated_at, is_case_study, duration, completed_at) VALUES (5, 'raketherake', NULL, 'https://www.raketherake.com/', 4, 1, '2026-01-25 04:34:56', '2026-01-25 19:29:05', 0, NULL, NULL);
INSERT OR IGNORE INTO projects (id, slug, image_path, external_url, sort_order, is_active, created_at, updated_at, is_case_study, duration, completed_at) VALUES (6, 'keyvision-pro', NULL, 'https://www.keyvision.eu/', 5, 1, '2026-01-25 04:34:56', '2026-01-25 19:31:16', 0, NULL, NULL);

-- === project_translations ===
INSERT OR IGNORE INTO project_translations (id, project_id, locale, name, client_type, industry, challenge, solution, result, content, meta_title, meta_description, slug) VALUES (1, 1, 'en', 'XtendLive', 'Enterprise', 'Events & Media', 'Build a virtual events platform that''s powerful enough for enterprise conferences yet simple enough for anyone to use. The platform needed to handle large-scale live streaming, real-time attendee engagement, and detailed analytics.', 'Developed a scalable event management system with intuitive event creation tools, interactive engagement features, and a comprehensive analytics dashboard. Focused on reliability and ease of use without sacrificing capabilities.', 'Platform now powers virtual events for organizations worldwide.', NULL, NULL, NULL, NULL);
INSERT OR IGNORE INTO project_translations (id, project_id, locale, name, client_type, industry, challenge, solution, result, content, meta_title, meta_description, slug) VALUES (2, 2, 'en', 'Insight6', 'Enterprise', 'Customer Experience', 'A leading UK mystery shopping agency needed to modernize their platform to handle thousands of monthly evaluations across retail, hospitality, healthcare, and legal sectors. The system had to coordinate 800+ mystery shoppers and deliver feedback within 48 hours.', 'Built a comprehensive evaluation management system with mobile-friendly data collection, automated workflow routing, and a client portal for real-time access to results. Integrated video, phone, and chat evaluation capabilities.', 'System processes over 23,000 mystery shops annually for 500+ UK brands.', NULL, NULL, NULL, NULL);
INSERT OR IGNORE INTO project_translations (id, project_id, locale, name, client_type, industry, challenge, solution, result, content, meta_title, meta_description, slug) VALUES (3, 3, 'en', 'AudioMovers ListenTo', 'Product Company', 'Audio & Music', 'Create a professional-grade audio streaming plugin that lets music producers and audio engineers stream high-quality audio from their DAW to clients anywhere in the world. Required support for up to 128 channels of lossless audio with minimal latency.', 'Developed a cross-platform plugin (VST, AU, AAX) with adaptive bitrate streaming, supporting everything from compressed AAC to lossless 32-bit PCM at 192kHz. Built receiver apps for web, iOS, and Android so clients can listen without installing software.', 'Industry-standard tool used by audio professionals and studios globally.', NULL, NULL, NULL, NULL);
INSERT OR IGNORE INTO project_translations (id, project_id, locale, name, client_type, industry, challenge, solution, result, content, meta_title, meta_description, slug) VALUES (4, 4, 'en', 'FSC (Forest Stewardship Council)', 'Non-Profit', 'Environmental', 'The world''s leading forest certification organization needed digital tools to support their mission of protecting forests globally. Required systems for certification management, supply chain traceability, and stakeholder coordination across multiple countries.', 'Contributed to the development of certification and traceability systems that help verify sustainable forestry practices across global supply chains. Implemented secure data handling for sensitive compliance information.', 'Supporting FSC''s mission to protect forests through trusted certification.', NULL, NULL, NULL, NULL);
INSERT OR IGNORE INTO project_translations (id, project_id, locale, name, client_type, industry, challenge, solution, result, content, meta_title, meta_description, slug) VALUES (5, 5, 'en', 'RakeTheRake', 'Enterprise', 'iGaming', 'A poker affiliate platform operating since 2004 with over 250,000 members needed to scale their rakeback tracking and payout systems while integrating with dozens of poker rooms and gaming sites. Security and accurate financial tracking were critical.', 'Built robust tracking and payment systems capable of handling high transaction volumes. Implemented secure integrations with multiple gaming platforms and automated payout calculations. Added community features including freeroll tournaments and leaderboards.', 'Platform has distributed over $190 million in rakeback to members since 2004.', NULL, NULL, NULL, NULL);
INSERT OR IGNORE INTO project_translations (id, project_id, locale, name, client_type, industry, challenge, solution, result, content, meta_title, meta_description, slug) VALUES (6, 6, 'en', 'KeyVision PRO', 'Product Company', 'Legal Tech', 'Law firms needed a comprehensive cloud-based practice management solution covering time tracking, billing, case management, and financial reporting. The system had to handle sensitive client data with strict security requirements.', 'Developed a full-featured legal practice management platform with integrated timesheets, automated invoicing, court hearing tracking, and performance dashboards. Implemented SSL encryption and role-based access controls for data protection.', 'Serving law firms from solo practitioners to large multi-team practices across Europe.', NULL, NULL, NULL, NULL);
INSERT OR IGNORE INTO project_translations (id, project_id, locale, name, client_type, industry, challenge, solution, result, content, meta_title, meta_description, slug) VALUES (31, 1, 'ro', 'XtendLive', 'Enterprise', 'Evenimente & Media', 'Construirea unei platforme de evenimente virtuale suficient de puternică pentru conferințe enterprise, dar suficient de simplă pentru a fi folosită de oricine. Platforma trebuia să gestioneze streaming live la scară largă, interacțiune în timp real și analize detaliate.', 'Am dezvoltat un sistem scalabil de gestionare a evenimentelor cu instrumente intuitive de creare, funcții interactive de engagement și un dashboard complet de analize. Ne-am concentrat pe fiabilitate și ușurință în utilizare fără a sacrifica capabilitățile.', 'Platforma alimentează acum evenimente virtuale pentru organizații din întreaga lume.', NULL, NULL, NULL, NULL);
INSERT OR IGNORE INTO project_translations (id, project_id, locale, name, client_type, industry, challenge, solution, result, content, meta_title, meta_description, slug) VALUES (32, 2, 'ro', 'Insight6', 'Enterprise', 'Experiența Clienților', 'O agenție lider de mystery shopping din UK avea nevoie să-și modernizeze platforma pentru a gestiona mii de evaluări lunare în retail, hospitality, sănătate și sectorul legal. Sistemul trebuia să coordoneze peste 800 de mystery shopperi și să livreze feedback în 48 de ore.', 'Am construit un sistem complet de gestionare a evaluărilor cu colectare de date prietenoasă pentru mobil, rutare automatizată a workflow-ului și un portal pentru clienți cu acces în timp real la rezultate. Am integrat evaluări video, telefon și chat.', 'Sistemul procesează peste 23.000 de mystery shops anual pentru peste 500 de branduri din UK.', NULL, NULL, NULL, NULL);
INSERT OR IGNORE INTO project_translations (id, project_id, locale, name, client_type, industry, challenge, solution, result, content, meta_title, meta_description, slug) VALUES (33, 3, 'ro', 'AudioMovers ListenTo', 'Companie Produs', 'Audio & Muzică', 'Crearea unui plugin de streaming audio de calitate profesională care permite producătorilor muzicali și inginerilor audio să transmită audio de înaltă calitate din DAW-ul lor către clienți oriunde în lume. Necesită suport pentru până la 128 canale de audio lossless cu latență minimă.', 'Am dezvoltat un plugin cross-platform (VST, AU, AAX) cu streaming adaptiv, suportând de la AAC comprimat la PCM lossless 32-bit la 192kHz. Am construit aplicații receptor pentru web, iOS și Android pentru ca clienții să poată asculta fără a instala software.', 'Instrument standard în industrie folosit de profesioniști audio și studiouri la nivel global.', NULL, NULL, NULL, NULL);
INSERT OR IGNORE INTO project_translations (id, project_id, locale, name, client_type, industry, challenge, solution, result, content, meta_title, meta_description, slug) VALUES (34, 4, 'ro', 'FSC (Forest Stewardship Council)', 'Non-Profit', 'Mediu', 'Organizația lider mondial în certificarea pădurilor avea nevoie de instrumente digitale pentru a-și susține misiunea de protejare a pădurilor la nivel global. Erau necesare sisteme pentru gestionarea certificărilor, trasabilitatea lanțului de aprovizionare și coordonarea părților interesate din mai multe țări.', 'Am contribuit la dezvoltarea sistemelor de certificare și trasabilitate care ajută la verificarea practicilor forestiere sustenabile în lanțurile de aprovizionare globale. Am implementat gestionarea securizată a datelor pentru informații sensibile de conformitate.', 'Susținem misiunea FSC de a proteja pădurile prin certificare de încredere.', NULL, NULL, NULL, NULL);
INSERT OR IGNORE INTO project_translations (id, project_id, locale, name, client_type, industry, challenge, solution, result, content, meta_title, meta_description, slug) VALUES (35, 5, 'ro', 'RakeTheRake', 'Enterprise', 'iGaming', 'O platformă de afiliere poker operând din 2004 cu peste 250.000 de membri avea nevoie să-și scaleze sistemele de tracking rakeback și plăți, integrând cu zeci de camere de poker și site-uri de gaming. Securitatea și urmărirea financiară precisă erau critice.', 'Am construit sisteme robuste de tracking și plăți capabile să gestioneze volume mari de tranzacții. Am implementat integrări securizate cu multiple platforme de gaming și calcule automate de plăți. Am adăugat funcții de comunitate inclusiv turnee freeroll și clasamente.', 'Platforma a distribuit peste 190 milioane dolari în rakeback membrilor din 2004.', NULL, NULL, NULL, NULL);
INSERT OR IGNORE INTO project_translations (id, project_id, locale, name, client_type, industry, challenge, solution, result, content, meta_title, meta_description, slug) VALUES (36, 6, 'ro', 'KeyVision PRO', 'Companie Produs', 'Legal Tech', 'Firmele de avocatură aveau nevoie de o soluție completă de management al practicii bazată pe cloud, acoperind înregistrarea timpului, facturare, gestionarea cazurilor și raportare financiară. Sistemul trebuia să gestioneze date sensibile ale clienților cu cerințe stricte de securitate.', 'Am dezvoltat o platformă completă de management al practicii juridice cu pontaje integrate, facturare automatizată, urmărirea audierilor și dashboarduri de performanță. Am implementat criptare SSL și controale de acces bazate pe roluri pentru protecția datelor.', 'Servim firme de avocatură de la practicieni individuali la practici mari multi-echipă din toată Europa.', NULL, NULL, NULL, NULL);
INSERT OR IGNORE INTO project_translations (id, project_id, locale, name, client_type, industry, challenge, solution, result, content, meta_title, meta_description, slug) VALUES (37, 1, 'fr', 'XtendLive', 'Enterprise', 'Événements & Médias', 'Construire une plateforme d''événements virtuels assez puissante pour les conférences d''entreprise mais assez simple pour être utilisée par tous. La plateforme devait gérer le streaming en direct à grande échelle, l''engagement en temps réel et des analyses détaillées.', 'Nous avons développé un système de gestion d''événements évolutif avec des outils de création intuitifs, des fonctionnalités d''engagement interactives et un tableau de bord analytique complet. L''accent a été mis sur la fiabilité et la facilité d''utilisation.', 'La plateforme alimente maintenant des événements virtuels pour des organisations du monde entier.', NULL, NULL, NULL, NULL);
INSERT OR IGNORE INTO project_translations (id, project_id, locale, name, client_type, industry, challenge, solution, result, content, meta_title, meta_description, slug) VALUES (38, 2, 'fr', 'Insight6', 'Enterprise', 'Expérience Client', 'Une agence leader de clients mystères au Royaume-Uni devait moderniser sa plateforme pour gérer des milliers d''évaluations mensuelles dans le commerce de détail, l''hôtellerie, la santé et le secteur juridique. Le système devait coordonner plus de 800 clients mystères et livrer des retours dans les 48 heures.', 'Nous avons construit un système complet de gestion des évaluations avec une collecte de données adaptée aux mobiles, un routage automatisé des workflows et un portail client pour un accès en temps réel aux résultats. Intégration des évaluations vidéo, téléphoniques et chat.', 'Le système traite plus de 23 000 visites mystères par an pour plus de 500 marques britanniques.', NULL, NULL, NULL, NULL);
INSERT OR IGNORE INTO project_translations (id, project_id, locale, name, client_type, industry, challenge, solution, result, content, meta_title, meta_description, slug) VALUES (39, 3, 'fr', 'AudioMovers ListenTo', 'Entreprise Produit', 'Audio & Musique', 'Créer un plugin de streaming audio de qualité professionnelle permettant aux producteurs de musique et ingénieurs audio de diffuser de l''audio haute qualité depuis leur DAW vers des clients n''importe où dans le monde. Support nécessaire pour jusqu''à 128 canaux audio sans perte avec une latence minimale.', 'Nous avons développé un plugin multiplateforme (VST, AU, AAX) avec streaming à débit adaptatif, supportant du AAC compressé au PCM sans perte 32 bits à 192kHz. Applications récepteur construites pour web, iOS et Android.', 'Outil standard de l''industrie utilisé par les professionnels audio et studios dans le monde entier.', NULL, NULL, NULL, NULL);
INSERT OR IGNORE INTO project_translations (id, project_id, locale, name, client_type, industry, challenge, solution, result, content, meta_title, meta_description, slug) VALUES (40, 4, 'fr', 'FSC (Forest Stewardship Council)', 'Non-Profit', 'Environnement', 'L''organisation leader mondial de certification forestière avait besoin d''outils numériques pour soutenir sa mission de protection des forêts. Systèmes nécessaires pour la gestion des certifications, la traçabilité de la chaîne d''approvisionnement et la coordination des parties prenantes.', 'Nous avons contribué au développement de systèmes de certification et de traçabilité qui aident à vérifier les pratiques forestières durables dans les chaînes d''approvisionnement mondiales. Gestion sécurisée des données pour les informations de conformité sensibles.', 'Soutenir la mission du FSC de protéger les forêts grâce à une certification de confiance.', NULL, NULL, NULL, NULL);
INSERT OR IGNORE INTO project_translations (id, project_id, locale, name, client_type, industry, challenge, solution, result, content, meta_title, meta_description, slug) VALUES (41, 5, 'fr', 'RakeTheRake', 'Enterprise', 'iGaming', 'Une plateforme d''affiliation poker opérant depuis 2004 avec plus de 250 000 membres devait faire évoluer ses systèmes de suivi de rakeback et de paiement tout en s''intégrant avec des dizaines de salles de poker. La sécurité et le suivi financier précis étaient critiques.', 'Nous avons construit des systèmes de suivi et de paiement robustes capables de gérer des volumes de transactions élevés. Intégrations sécurisées avec plusieurs plateformes de jeux et calculs de paiement automatisés. Fonctionnalités communautaires ajoutées.', 'La plateforme a distribué plus de 190 millions de dollars en rakeback aux membres depuis 2004.', NULL, NULL, NULL, NULL);
INSERT OR IGNORE INTO project_translations (id, project_id, locale, name, client_type, industry, challenge, solution, result, content, meta_title, meta_description, slug) VALUES (42, 6, 'fr', 'KeyVision PRO', 'Entreprise Produit', 'Legal Tech', 'Les cabinets d''avocats avaient besoin d''une solution complète de gestion de cabinet basée sur le cloud couvrant le suivi du temps, la facturation, la gestion des dossiers et les rapports financiers. Le système devait gérer des données clients sensibles avec des exigences de sécurité strictes.', 'Nous avons développé une plateforme complète de gestion de cabinet juridique avec feuilles de temps intégrées, facturation automatisée, suivi des audiences et tableaux de bord de performance. Chiffrement SSL et contrôles d''accès basés sur les rôles.', 'Au service des cabinets d''avocats des praticiens indépendants aux grands cabinets multi-équipes à travers l''Europe.', NULL, NULL, NULL, NULL);
INSERT OR IGNORE INTO project_translations (id, project_id, locale, name, client_type, industry, challenge, solution, result, content, meta_title, meta_description, slug) VALUES (43, 1, 'de', 'XtendLive', 'Enterprise', 'Events & Medien', 'Aufbau einer virtuellen Event-Plattform, die leistungsstark genug für Unternehmenskonferenzen ist, aber einfach genug für jeden zu bedienen. Die Plattform musste großangelegtes Live-Streaming, Echtzeit-Engagement und detaillierte Analysen bewältigen.', 'Wir entwickelten ein skalierbares Event-Management-System mit intuitiven Erstellungstools, interaktiven Engagement-Funktionen und einem umfassenden Analyse-Dashboard. Fokus auf Zuverlässigkeit und Benutzerfreundlichkeit ohne Kompromisse bei den Funktionen.', 'Die Plattform betreibt jetzt virtuelle Events für Organisationen weltweit.', NULL, NULL, NULL, NULL);
INSERT OR IGNORE INTO project_translations (id, project_id, locale, name, client_type, industry, challenge, solution, result, content, meta_title, meta_description, slug) VALUES (44, 2, 'de', 'Insight6', 'Enterprise', 'Kundenerlebnis', 'Eine führende britische Mystery-Shopping-Agentur musste ihre Plattform modernisieren, um tausende monatliche Bewertungen in Einzelhandel, Gastgewerbe, Gesundheitswesen und Rechtssektor zu bewältigen. Das System musste über 800 Mystery Shopper koordinieren.', 'Wir bauten ein umfassendes Bewertungsmanagementsystem mit mobilfreundlicher Datenerfassung, automatisiertem Workflow-Routing und einem Kundenportal für Echtzeitzugriff auf Ergebnisse. Video-, Telefon- und Chat-Bewertungen integriert.', 'Das System verarbeitet jährlich über 23.000 Mystery Shops für mehr als 500 britische Marken.', NULL, NULL, NULL, NULL);
INSERT OR IGNORE INTO project_translations (id, project_id, locale, name, client_type, industry, challenge, solution, result, content, meta_title, meta_description, slug) VALUES (45, 3, 'de', 'AudioMovers ListenTo', 'Produktunternehmen', 'Audio & Musik', 'Erstellung eines professionellen Audio-Streaming-Plugins, das Musikproduzenten und Toningenieuren ermöglicht, hochwertige Audio von ihrer DAW an Kunden überall auf der Welt zu streamen. Unterstützung für bis zu 128 Kanäle verlustfreies Audio mit minimaler Latenz erforderlich.', 'Wir entwickelten ein plattformübergreifendes Plugin (VST, AU, AAX) mit adaptivem Bitrate-Streaming, von komprimiertem AAC bis verlustfreiem 32-Bit PCM bei 192kHz. Empfänger-Apps für Web, iOS und Android erstellt.', 'Branchenstandard-Tool, das von Audio-Profis und Studios weltweit genutzt wird.', NULL, NULL, NULL, NULL);
INSERT OR IGNORE INTO project_translations (id, project_id, locale, name, client_type, industry, challenge, solution, result, content, meta_title, meta_description, slug) VALUES (46, 4, 'de', 'FSC (Forest Stewardship Council)', 'Non-Profit', 'Umwelt', 'Die weltweit führende Waldzertifizierungsorganisation benötigte digitale Tools zur Unterstützung ihrer Mission zum globalen Waldschutz. Systeme für Zertifizierungsmanagement, Lieferkettenrückverfolgbarkeit und Stakeholder-Koordination erforderlich.', 'Wir trugen zur Entwicklung von Zertifizierungs- und Rückverfolgbarkeitssystemen bei, die nachhaltige Forstwirtschaftspraktiken in globalen Lieferketten verifizieren. Sichere Datenhandhabung für sensible Compliance-Informationen implementiert.', 'Unterstützung der FSC-Mission zum Waldschutz durch vertrauenswürdige Zertifizierung.', NULL, NULL, NULL, NULL);
INSERT OR IGNORE INTO project_translations (id, project_id, locale, name, client_type, industry, challenge, solution, result, content, meta_title, meta_description, slug) VALUES (47, 5, 'de', 'RakeTheRake', 'Enterprise', 'iGaming', 'Eine Poker-Affiliate-Plattform, die seit 2004 mit über 250.000 Mitgliedern operiert, musste ihre Rakeback-Tracking- und Auszahlungssysteme skalieren und sich mit Dutzenden von Pokerräumen integrieren. Sicherheit und genaue Finanzverfolgung waren kritisch.', 'Wir bauten robuste Tracking- und Zahlungssysteme, die hohe Transaktionsvolumen bewältigen können. Sichere Integrationen mit mehreren Gaming-Plattformen und automatisierte Auszahlungsberechnungen implementiert. Community-Funktionen hinzugefügt.', 'Die Plattform hat seit 2004 über 190 Millionen Dollar an Rakeback an Mitglieder ausgeschüttet.', NULL, NULL, NULL, NULL);
INSERT OR IGNORE INTO project_translations (id, project_id, locale, name, client_type, industry, challenge, solution, result, content, meta_title, meta_description, slug) VALUES (48, 6, 'de', 'KeyVision PRO', 'Produktunternehmen', 'Legal Tech', 'Anwaltskanzleien benötigten eine umfassende cloudbasierte Kanzleimanagement-Lösung für Zeiterfassung, Abrechnung, Fallmanagement und Finanzberichterstattung. Das System musste sensible Mandantendaten mit strengen Sicherheitsanforderungen handhaben.', 'Wir entwickelten eine vollständige juristische Kanzleimanagement-Plattform mit integrierten Stundenzetteln, automatisierter Rechnungsstellung, Gerichtsverhandlungsverfolgung und Performance-Dashboards. SSL-Verschlüsselung und rollenbasierte Zugriffskontrollen.', 'Wir bedienen Anwaltskanzleien von Einzelpraktikern bis zu großen Multi-Team-Kanzleien in ganz Europa.', NULL, NULL, NULL, NULL);
INSERT OR IGNORE INTO project_translations (id, project_id, locale, name, client_type, industry, challenge, solution, result, content, meta_title, meta_description, slug) VALUES (49, 1, 'it', 'XtendLive', 'Enterprise', 'Eventi & Media', 'Costruire una piattaforma per eventi virtuali abbastanza potente per conferenze aziendali ma abbastanza semplice da usare per chiunque. La piattaforma doveva gestire streaming live su larga scala, coinvolgimento in tempo reale e analisi dettagliate.', 'Abbiamo sviluppato un sistema scalabile di gestione eventi con strumenti intuitivi di creazione, funzionalità di coinvolgimento interattivo e una dashboard analitica completa. Focus su affidabilità e facilità d''uso senza sacrificare le capacità.', 'La piattaforma ora alimenta eventi virtuali per organizzazioni in tutto il mondo.', NULL, NULL, NULL, NULL);
INSERT OR IGNORE INTO project_translations (id, project_id, locale, name, client_type, industry, challenge, solution, result, content, meta_title, meta_description, slug) VALUES (50, 2, 'it', 'Insight6', 'Enterprise', 'Customer Experience', 'Un''agenzia leader di mystery shopping nel Regno Unito doveva modernizzare la propria piattaforma per gestire migliaia di valutazioni mensili in retail, hospitality, sanità e settore legale. Il sistema doveva coordinare oltre 800 mystery shopper.', 'Abbiamo costruito un sistema completo di gestione delle valutazioni con raccolta dati mobile-friendly, routing automatizzato del workflow e un portale clienti per l''accesso in tempo reale ai risultati. Integrate valutazioni video, telefono e chat.', 'Il sistema elabora oltre 23.000 mystery shop all''anno per oltre 500 marchi britannici.', NULL, NULL, NULL, NULL);
INSERT OR IGNORE INTO project_translations (id, project_id, locale, name, client_type, industry, challenge, solution, result, content, meta_title, meta_description, slug) VALUES (51, 3, 'it', 'AudioMovers ListenTo', 'Azienda Prodotto', 'Audio & Musica', 'Creare un plugin di streaming audio di qualità professionale che permetta a produttori musicali e ingegneri audio di trasmettere audio di alta qualità dalla loro DAW a clienti ovunque nel mondo. Necessario supporto fino a 128 canali audio lossless con latenza minima.', 'Abbiamo sviluppato un plugin cross-platform (VST, AU, AAX) con streaming a bitrate adattivo, supportando da AAC compresso a PCM lossless 32-bit a 192kHz. App ricevitore costruite per web, iOS e Android.', 'Strumento standard del settore usato da professionisti audio e studi in tutto il mondo.', NULL, NULL, NULL, NULL);
INSERT OR IGNORE INTO project_translations (id, project_id, locale, name, client_type, industry, challenge, solution, result, content, meta_title, meta_description, slug) VALUES (52, 4, 'it', 'FSC (Forest Stewardship Council)', 'Non-Profit', 'Ambiente', 'L''organizzazione leader mondiale nella certificazione forestale aveva bisogno di strumenti digitali per supportare la sua missione di protezione delle foreste. Necessari sistemi per la gestione delle certificazioni, tracciabilità della supply chain e coordinamento stakeholder.', 'Abbiamo contribuito allo sviluppo di sistemi di certificazione e tracciabilità che aiutano a verificare pratiche forestali sostenibili nelle supply chain globali. Implementata gestione sicura dei dati per informazioni di conformità sensibili.', 'Supportiamo la missione FSC di proteggere le foreste attraverso certificazioni affidabili.', NULL, NULL, NULL, NULL);
INSERT OR IGNORE INTO project_translations (id, project_id, locale, name, client_type, industry, challenge, solution, result, content, meta_title, meta_description, slug) VALUES (53, 5, 'it', 'RakeTheRake', 'Enterprise', 'iGaming', 'Una piattaforma di affiliazione poker operante dal 2004 con oltre 250.000 membri doveva scalare i propri sistemi di tracking rakeback e pagamenti integrandosi con dozzine di poker room. Sicurezza e tracking finanziario accurato erano critici.', 'Abbiamo costruito sistemi robusti di tracking e pagamento capaci di gestire alti volumi di transazioni. Implementate integrazioni sicure con multiple piattaforme di gaming e calcoli automatici dei pagamenti. Aggiunte funzionalità community.', 'La piattaforma ha distribuito oltre 190 milioni di dollari in rakeback ai membri dal 2004.', NULL, NULL, NULL, NULL);
INSERT OR IGNORE INTO project_translations (id, project_id, locale, name, client_type, industry, challenge, solution, result, content, meta_title, meta_description, slug) VALUES (54, 6, 'it', 'KeyVision PRO', 'Azienda Prodotto', 'Legal Tech', 'Gli studi legali avevano bisogno di una soluzione completa di gestione dello studio basata su cloud che coprisse time tracking, fatturazione, gestione casi e reportistica finanziaria. Il sistema doveva gestire dati sensibili dei clienti con requisiti di sicurezza rigorosi.', 'Abbiamo sviluppato una piattaforma completa di gestione dello studio legale con timesheet integrati, fatturazione automatizzata, tracking delle udienze e dashboard delle performance. Implementata crittografia SSL e controlli di accesso basati sui ruoli.', 'Serviamo studi legali da professionisti singoli a grandi studi multi-team in tutta Europa.', NULL, NULL, NULL, NULL);
INSERT OR IGNORE INTO project_translations (id, project_id, locale, name, client_type, industry, challenge, solution, result, content, meta_title, meta_description, slug) VALUES (55, 1, 'es', 'XtendLive', 'Enterprise', 'Eventos y Medios', 'Construir una plataforma de eventos virtuales lo suficientemente potente para conferencias empresariales pero lo suficientemente simple para que cualquiera la use. La plataforma necesitaba manejar streaming en vivo a gran escala, engagement en tiempo real y analíticas detalladas.', 'Desarrollamos un sistema escalable de gestión de eventos con herramientas intuitivas de creación, funciones de engagement interactivo y un dashboard analítico completo. Enfoque en fiabilidad y facilidad de uso sin sacrificar capacidades.', 'La plataforma ahora impulsa eventos virtuales para organizaciones en todo el mundo.', NULL, NULL, NULL, NULL);
INSERT OR IGNORE INTO project_translations (id, project_id, locale, name, client_type, industry, challenge, solution, result, content, meta_title, meta_description, slug) VALUES (56, 2, 'es', 'Insight6', 'Enterprise', 'Experiencia del Cliente', 'Una agencia líder de mystery shopping en UK necesitaba modernizar su plataforma para manejar miles de evaluaciones mensuales en retail, hostelería, salud y sector legal. El sistema debía coordinar más de 800 mystery shoppers y entregar feedback en 48 horas.', 'Construimos un sistema integral de gestión de evaluaciones con recolección de datos mobile-friendly, enrutamiento automatizado de workflows y un portal de clientes para acceso en tiempo real a resultados. Integradas evaluaciones de video, teléfono y chat.', 'El sistema procesa más de 23.000 mystery shops anualmente para más de 500 marcas británicas.', NULL, NULL, NULL, NULL);
INSERT OR IGNORE INTO project_translations (id, project_id, locale, name, client_type, industry, challenge, solution, result, content, meta_title, meta_description, slug) VALUES (57, 3, 'es', 'AudioMovers ListenTo', 'Empresa Producto', 'Audio y Música', 'Crear un plugin de streaming de audio de calidad profesional que permita a productores musicales e ingenieros de audio transmitir audio de alta calidad desde su DAW a clientes en cualquier parte del mundo. Soporte requerido para hasta 128 canales de audio lossless con latencia mínima.', 'Desarrollamos un plugin multiplataforma (VST, AU, AAX) con streaming de bitrate adaptativo, soportando desde AAC comprimido hasta PCM lossless de 32 bits a 192kHz. Apps receptoras construidas para web, iOS y Android.', 'Herramienta estándar de la industria usada por profesionales de audio y estudios globalmente.', NULL, NULL, NULL, NULL);
INSERT OR IGNORE INTO project_translations (id, project_id, locale, name, client_type, industry, challenge, solution, result, content, meta_title, meta_description, slug) VALUES (58, 4, 'es', 'FSC (Forest Stewardship Council)', 'Non-Profit', 'Medio Ambiente', 'La organización líder mundial de certificación forestal necesitaba herramientas digitales para apoyar su misión de proteger los bosques globalmente. Se requerían sistemas para gestión de certificaciones, trazabilidad de la cadena de suministro y coordinación de stakeholders.', 'Contribuimos al desarrollo de sistemas de certificación y trazabilidad que ayudan a verificar prácticas forestales sostenibles en cadenas de suministro globales. Implementado manejo seguro de datos para información sensible de cumplimiento.', 'Apoyando la misión de FSC de proteger los bosques a través de certificación confiable.', NULL, NULL, NULL, NULL);
INSERT OR IGNORE INTO project_translations (id, project_id, locale, name, client_type, industry, challenge, solution, result, content, meta_title, meta_description, slug) VALUES (59, 5, 'es', 'RakeTheRake', 'Enterprise', 'iGaming', 'Una plataforma de afiliados de poker operando desde 2004 con más de 250.000 miembros necesitaba escalar sus sistemas de tracking de rakeback y pagos mientras se integraba con docenas de salas de poker. La seguridad y el seguimiento financiero preciso eran críticos.', 'Construimos sistemas robustos de tracking y pagos capaces de manejar altos volúmenes de transacciones. Implementamos integraciones seguras con múltiples plataformas de gaming y cálculos automatizados de pagos. Añadidas funciones de comunidad.', 'La plataforma ha distribuido más de 190 millones de dólares en rakeback a miembros desde 2004.', NULL, NULL, NULL, NULL);
INSERT OR IGNORE INTO project_translations (id, project_id, locale, name, client_type, industry, challenge, solution, result, content, meta_title, meta_description, slug) VALUES (60, 6, 'es', 'KeyVision PRO', 'Empresa Producto', 'Legal Tech', 'Los bufetes de abogados necesitaban una solución integral de gestión de práctica basada en la nube que cubriera seguimiento de tiempo, facturación, gestión de casos y reportes financieros. El sistema debía manejar datos sensibles de clientes con requisitos estrictos de seguridad.', 'Desarrollamos una plataforma completa de gestión de práctica legal con hojas de tiempo integradas, facturación automatizada, seguimiento de audiencias y dashboards de rendimiento. Implementada encriptación SSL y controles de acceso basados en roles.', 'Sirviendo bufetes de abogados desde profesionales individuales hasta grandes prácticas multi-equipo en toda Europa.', NULL, NULL, NULL, NULL);

-- === project_technologies ===
INSERT OR IGNORE INTO project_technologies (id, project_id, technology, sort_order) VALUES (1, 1, 'React', 0);
INSERT OR IGNORE INTO project_technologies (id, project_id, technology, sort_order) VALUES (2, 1, 'Node.js', 1);
INSERT OR IGNORE INTO project_technologies (id, project_id, technology, sort_order) VALUES (3, 1, 'WebRTC', 2);
INSERT OR IGNORE INTO project_technologies (id, project_id, technology, sort_order) VALUES (4, 1, 'AWS', 3);
INSERT OR IGNORE INTO project_technologies (id, project_id, technology, sort_order) VALUES (5, 1, 'PostgreSQL', 4);
INSERT OR IGNORE INTO project_technologies (id, project_id, technology, sort_order) VALUES (347, 2, 'PHP', 0);
INSERT OR IGNORE INTO project_technologies (id, project_id, technology, sort_order) VALUES (348, 2, 'Laravel', 1);
INSERT OR IGNORE INTO project_technologies (id, project_id, technology, sort_order) VALUES (349, 2, 'MySQL', 2);
INSERT OR IGNORE INTO project_technologies (id, project_id, technology, sort_order) VALUES (350, 2, 'Vue.js', 3);
INSERT OR IGNORE INTO project_technologies (id, project_id, technology, sort_order) VALUES (351, 2, 'AWS', 4);
INSERT OR IGNORE INTO project_technologies (id, project_id, technology, sort_order) VALUES (352, 3, 'C++', 0);
INSERT OR IGNORE INTO project_technologies (id, project_id, technology, sort_order) VALUES (353, 3, 'JUCE', 1);
INSERT OR IGNORE INTO project_technologies (id, project_id, technology, sort_order) VALUES (354, 3, 'WebRTC', 2);
INSERT OR IGNORE INTO project_technologies (id, project_id, technology, sort_order) VALUES (355, 3, 'React', 3);
INSERT OR IGNORE INTO project_technologies (id, project_id, technology, sort_order) VALUES (356, 3, 'iOS', 4);
INSERT OR IGNORE INTO project_technologies (id, project_id, technology, sort_order) VALUES (357, 3, 'Android', 5);
INSERT OR IGNORE INTO project_technologies (id, project_id, technology, sort_order) VALUES (358, 4, 'PHP', 0);
INSERT OR IGNORE INTO project_technologies (id, project_id, technology, sort_order) VALUES (359, 4, 'Drupal', 1);
INSERT OR IGNORE INTO project_technologies (id, project_id, technology, sort_order) VALUES (360, 4, 'PostgreSQL', 2);
INSERT OR IGNORE INTO project_technologies (id, project_id, technology, sort_order) VALUES (361, 4, 'Docker', 3);
INSERT OR IGNORE INTO project_technologies (id, project_id, technology, sort_order) VALUES (362, 4, 'REST APIs', 4);
INSERT OR IGNORE INTO project_technologies (id, project_id, technology, sort_order) VALUES (363, 5, 'CraftCMS', 0);
INSERT OR IGNORE INTO project_technologies (id, project_id, technology, sort_order) VALUES (364, 5, 'PHP', 1);
INSERT OR IGNORE INTO project_technologies (id, project_id, technology, sort_order) VALUES (365, 5, 'MySQL', 2);
INSERT OR IGNORE INTO project_technologies (id, project_id, technology, sort_order) VALUES (366, 5, 'Redis', 3);
INSERT OR IGNORE INTO project_technologies (id, project_id, technology, sort_order) VALUES (367, 5, 'JavaScript', 4);
INSERT OR IGNORE INTO project_technologies (id, project_id, technology, sort_order) VALUES (373, 6, 'PHP', 0);
INSERT OR IGNORE INTO project_technologies (id, project_id, technology, sort_order) VALUES (374, 6, 'Laravel', 1);
INSERT OR IGNORE INTO project_technologies (id, project_id, technology, sort_order) VALUES (375, 6, 'Angular', 2);
INSERT OR IGNORE INTO project_technologies (id, project_id, technology, sort_order) VALUES (376, 6, 'MySQL', 3);
INSERT OR IGNORE INTO project_technologies (id, project_id, technology, sort_order) VALUES (377, 6, 'AWS', 4);

-- === faq_items ===
INSERT OR IGNORE INTO faq_items (id, slug, category, sort_order, is_active, created_at, updated_at) VALUES (1, 'security-pentest-frequency', 'security', 1, 1, '2026-01-28 07:10:01', '2026-01-28 07:10:01');
INSERT OR IGNORE INTO faq_items (id, slug, category, sort_order, is_active, created_at, updated_at) VALUES (2, 'security-pentest-duration', 'security', 2, 1, '2026-01-28 07:10:01', '2026-01-28 07:10:01');
INSERT OR IGNORE INTO faq_items (id, slug, category, sort_order, is_active, created_at, updated_at) VALUES (3, 'security-compliance', 'security', 3, 1, '2026-01-28 07:10:01', '2026-01-28 07:10:01');
INSERT OR IGNORE INTO faq_items (id, slug, category, sort_order, is_active, created_at, updated_at) VALUES (4, 'security-cloud-audit', 'security', 4, 1, '2026-01-28 07:10:01', '2026-01-28 07:10:01');
INSERT OR IGNORE INTO faq_items (id, slug, category, sort_order, is_active, created_at, updated_at) VALUES (5, 'web-timeline', 'web-applications', 1, 1, '2026-01-28 07:10:01', '2026-01-28 07:10:01');
INSERT OR IGNORE INTO faq_items (id, slug, category, sort_order, is_active, created_at, updated_at) VALUES (6, 'web-technology-choice', 'web-applications', 2, 1, '2026-01-28 07:10:01', '2026-01-28 07:10:01');
INSERT OR IGNORE INTO faq_items (id, slug, category, sort_order, is_active, created_at, updated_at) VALUES (7, 'web-maintenance', 'web-applications', 3, 1, '2026-01-28 07:10:01', '2026-01-28 07:10:01');
INSERT OR IGNORE INTO faq_items (id, slug, category, sort_order, is_active, created_at, updated_at) VALUES (8, 'mobile-native-vs-cross', 'mobile', 1, 1, '2026-01-28 07:10:01', '2026-01-28 07:10:01');
INSERT OR IGNORE INTO faq_items (id, slug, category, sort_order, is_active, created_at, updated_at) VALUES (9, 'mobile-timeline', 'mobile', 2, 1, '2026-01-28 07:10:01', '2026-01-28 07:10:01');
INSERT OR IGNORE INTO faq_items (id, slug, category, sort_order, is_active, created_at, updated_at) VALUES (10, 'mobile-app-store', 'mobile', 3, 1, '2026-01-28 07:10:01', '2026-01-28 07:10:01');
INSERT OR IGNORE INTO faq_items (id, slug, category, sort_order, is_active, created_at, updated_at) VALUES (11, 'devops-cloud-choice', 'cloud', 1, 1, '2026-01-28 07:10:01', '2026-01-28 07:10:01');
INSERT OR IGNORE INTO faq_items (id, slug, category, sort_order, is_active, created_at, updated_at) VALUES (12, 'devops-kubernetes', 'cloud', 2, 1, '2026-01-28 07:10:01', '2026-01-28 07:10:01');
INSERT OR IGNORE INTO faq_items (id, slug, category, sort_order, is_active, created_at, updated_at) VALUES (13, 'devops-cost', 'cloud', 3, 1, '2026-01-28 07:10:01', '2026-01-28 07:10:01');
INSERT OR IGNORE INTO faq_items (id, slug, category, sort_order, is_active, created_at, updated_at) VALUES (14, 'consulting-engagement', 'consulting', 1, 1, '2026-01-28 07:10:01', '2026-01-28 07:10:01');
INSERT OR IGNORE INTO faq_items (id, slug, category, sort_order, is_active, created_at, updated_at) VALUES (15, 'consulting-deliverables', 'consulting', 2, 1, '2026-01-28 07:10:01', '2026-01-28 07:10:01');
INSERT OR IGNORE INTO faq_items (id, slug, category, sort_order, is_active, created_at, updated_at) VALUES (16, 'qa-automation-worth', 'qa-testing', 1, 1, '2026-01-28 07:10:01', '2026-01-28 07:10:01');
INSERT OR IGNORE INTO faq_items (id, slug, category, sort_order, is_active, created_at, updated_at) VALUES (17, 'qa-integration', 'qa-testing', 2, 1, '2026-01-28 07:10:01', '2026-01-28 07:10:01');

-- === faq_translations ===
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (1, 1, 'en', 'How often should we do penetration testing?', 'Once a year at minimum, plus after any major changes to your app or infrastructure. If you handle payments, health data, or financial information, quarterly is better. And always before a big launch - you don''t want to find out about vulnerabilities from your users.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (2, 2, 'en', 'How long does a penetration test take?', 'Most web application tests take 1-2 weeks. A simple API might be done in a few days. Full infrastructure tests can run 3-4 weeks. We''ll give you a specific timeline during scoping once we understand what we''re testing.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (3, 3, 'en', 'Can you help us achieve SOC 2 or ISO 27001 compliance?', 'Yes. We help companies prepare for compliance audits - identifying gaps, implementing controls, documenting practices. We''ve guided teams through SOC 2, ISO 27001, HIPAA, and GDPR. The process is less painful when someone who''s done it before is helping.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (4, 4, 'en', 'What does a cloud security audit cover?', 'IAM configurations, network security, encryption settings, logging, monitoring, data protection, and how you stack up against CIS benchmarks. You get a prioritized list of what to fix and how to fix it.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (5, 5, 'en', 'How long does it take to build a web application?', 'A simple MVP: 6-8 weeks. A full SaaS product with auth, billing, and real features: 3-6 months. Enterprise applications with complex integrations: longer. We can give you a real estimate once we understand what you''re building.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (6, 6, 'en', 'Why do you primarily use React and Next.js?', 'React has the biggest ecosystem, the best tooling, and the most developers who know it. Next.js adds server-side rendering, API routes, and performance optimizations that would take months to build yourself. For most projects, it''s the right choice.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (7, 7, 'en', 'Do you provide ongoing maintenance after launch?', 'Yes. We offer maintenance packages - security updates, bug fixes, performance monitoring, new features. A lot of clients start with a build project and keep us around for ongoing work.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (8, 8, 'en', 'Why native development instead of React Native or Flutter?', 'Native apps are faster and have full access to platform features. Cross-platform frameworks like React Native add complexity, and you often end up writing native code anyway for anything advanced. If your app needs to feel polished, native is worth it.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (9, 9, 'en', 'How long does mobile app development take?', 'A simple app for one platform: 2-3 months. Both iOS and Android with a shared backend: 4-6 months. Apps with offline support, real-time features, or hardware integration take longer. Complexity drives timeline more than feature count.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (10, 10, 'en', 'Do you handle App Store and Play Store submission?', 'Yes. We prepare assets, handle submission, respond to review feedback, and make whatever changes Apple or Google ask for. We''ve been through the process enough times to know what triggers rejections and how to avoid them.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (11, 11, 'en', 'Which cloud provider do you recommend?', 'AWS for most things - broadest services, best docs. We also use GCP and Cloudflare Workers when they''re a better fit. The right answer depends on what you''re building, what compliance you need, and what your team already knows.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (12, 12, 'en', 'Do we need Kubernetes?', 'Probably not. Kubernetes adds operational overhead that most projects don''t need. ECS, Cloud Run, or well-configured EC2 instances work fine for most workloads. We only recommend Kubernetes when the requirements actually justify the complexity.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (13, 13, 'en', 'How can we reduce our cloud costs?', 'Right-size your instances, use reserved or spot instances where you can, set up auto-scaling, optimize data transfer, and delete things you''re not using. We usually find 20-40% savings when we audit existing AWS setups.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (14, 14, 'en', 'How do consulting engagements typically work?', 'Usually starts with 1-2 weeks of discovery to understand your situation. Then recommendations, documentation, and often hands-on help implementing changes. Some engagements are fixed-scope projects, others turn into ongoing advisory relationships.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (15, 15, 'en', 'What deliverables do we receive from a consulting engagement?', 'Architecture docs, technology recommendations with reasoning, implementation roadmaps, sometimes working prototypes. Everything documented so your team can run with it independently.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (16, 16, 'en', 'Is test automation worth the investment?', 'If you''re actively developing the app and plan to maintain it long-term, yes. Automated tests catch regressions, let you refactor without fear, and speed up releases. Most active projects see positive ROI within 6-12 months.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (17, 17, 'en', 'Can you integrate with our existing development team?', 'Yes. We can join your sprints, attend standups, use your tools. A lot of clients like this model - we''re basically an extension of their team rather than a separate vendor.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (18, 1, 'ro', 'Cât de des ar trebui să facem teste de penetrare?', 'Minimum o dată pe an, plus după orice schimbări majore la aplicație sau infrastructură. Dacă gestionezi plăți, date medicale sau informații financiare, trimestrial e mai bine. Și întotdeauna înainte de un lansare mare - nu vrei să afli despre vulnerabilități de la utilizatori.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (19, 2, 'ro', 'Cât durează un test de penetrare?', 'Majoritatea testelor de aplicații web durează 1-2 săptămâni. Un API simplu poate fi gata în câteva zile. Testele complete de infrastructură pot dura 3-4 săptămâni. Îți vom da un timeline specific în faza de scoping odată ce înțelegem ce testăm.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (20, 3, 'ro', 'Ne puteți ajuta să obținem conformitate SOC 2 sau ISO 27001?', 'Da. Ajutăm companiile să se pregătească pentru audituri de conformitate - identificăm lacune, implementăm controale, documentăm practici. Am ghidat echipe prin SOC 2, ISO 27001, HIPAA și GDPR. Procesul e mai puțin dureros când cineva care a mai făcut asta te ajută.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (21, 4, 'ro', 'Ce acoperă un audit de securitate cloud?', 'Configurații IAM, securitate rețea, setări de criptare, logging, monitoring, protecția datelor și cum te situezi față de benchmark-urile CIS. Primești o listă prioritizată cu ce să repari și cum.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (22, 5, 'ro', 'Cât durează să construiești o aplicație web?', 'Un MVP simplu: 6-8 săptămâni. Un produs SaaS complet cu autentificare, facturare și funcționalități reale: 3-6 luni. Aplicații enterprise cu integrări complexe: mai mult. Putem da o estimare reală odată ce înțelegem ce construiești.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (23, 6, 'ro', 'De ce folosiți în principal React și Next.js?', 'React are cel mai mare ecosistem, cele mai bune unelte și cei mai mulți developeri care îl cunosc. Next.js adaugă server-side rendering, rute API și optimizări de performanță care ar dura luni să le construiești singur. Pentru majoritatea proiectelor, e alegerea corectă.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (24, 7, 'ro', 'Oferiți mentenanță continuă după lansare?', 'Da. Oferim pachete de mentenanță - actualizări de securitate, fix-uri de bug-uri, monitorizare performanță, funcționalități noi. Mulți clienți încep cu un proiect de construcție și ne păstrează pentru lucru continuu.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (25, 8, 'ro', 'De ce dezvoltare nativă în loc de React Native sau Flutter?', 'Aplicațiile native sunt mai rapide și au acces complet la funcțiile platformei. Framework-urile cross-platform adaugă complexitate și adesea ajungi să scrii cod nativ oricum pentru orice avansat. Dacă aplicația ta trebuie să se simtă premium, nativ merită.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (26, 9, 'ro', 'Cât durează dezvoltarea unei aplicații mobile?', 'O aplicație simplă pentru o platformă: 2-3 luni. Atât iOS cât și Android cu backend comun: 4-6 luni. Aplicații cu suport offline, funcții în timp real sau integrare hardware durează mai mult. Complexitatea determină timeline-ul mai mult decât numărul de funcționalități.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (27, 10, 'ro', 'Vă ocupați de submiterea în App Store și Play Store?', 'Da. Pregătim asset-urile, gestionăm submiterea, răspundem la feedback-ul de review și facem orice modificări cer Apple sau Google. Am trecut prin proces de suficiente ori să știm ce declanșează respingeri și cum să le evităm.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (28, 11, 'ro', 'Ce furnizor cloud recomandați?', 'AWS pentru majoritatea lucrurilor - cele mai multe servicii, cea mai bună documentație. Folosim și GCP și Cloudflare Workers când se potrivesc mai bine. Răspunsul corect depinde de ce construiești, ce conformitate ai nevoie și ce știe deja echipa ta.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (29, 12, 'ro', 'Avem nevoie de Kubernetes?', 'Probabil nu. Kubernetes adaugă overhead operațional de care majoritatea proiectelor nu au nevoie. ECS, Cloud Run sau instanțe EC2 bine configurate funcționează bine pentru majoritatea workload-urilor. Recomandăm Kubernetes doar când cerințele chiar justifică complexitatea.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (30, 13, 'ro', 'Cum putem reduce costurile cloud?', 'Dimensionează corect instanțele, folosește reserved sau spot instances unde poți, configurează auto-scaling, optimizează transferul de date și șterge ce nu folosești. De obicei găsim economii de 20-40% când audităm setup-uri AWS existente.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (31, 14, 'ro', 'Cum funcționează de obicei angajamentele de consultanță?', 'De obicei începe cu 1-2 săptămâni de discovery pentru a înțelege situația ta. Apoi recomandări, documentație și adesea ajutor practic la implementarea schimbărilor. Unele angajamente sunt proiecte cu scop fix, altele devin relații de advisory continuu.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (32, 15, 'ro', 'Ce livrabile primim dintr-un angajament de consultanță?', 'Documentație de arhitectură, recomandări tehnologice cu argumentare, roadmap-uri de implementare, uneori prototipuri funcționale. Totul documentat ca echipa ta să poată continua independent.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (33, 16, 'ro', 'Merită investiția în automatizarea testelor?', 'Dacă dezvolți activ aplicația și planifici să o menții pe termen lung, da. Testele automate prind regresii, te lasă să refactorizezi fără frică și accelerează release-urile. Majoritatea proiectelor active văd ROI pozitiv în 6-12 luni.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (34, 17, 'ro', 'Vă puteți integra cu echipa noastră de dezvoltare existentă?', 'Da. Putem să ne alăturăm sprint-urilor tale, să participăm la standup-uri, să folosim uneltele tale. Multor clienți le place acest model - suntem practic o extensie a echipei lor în loc de un vendor separat.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (35, 1, 'fr', 'À quelle fréquence devons-nous faire des tests de pénétration ?', 'Au minimum une fois par an, plus après tout changement majeur de votre application ou infrastructure. Si vous gérez des paiements, des données de santé ou des informations financières, trimestriel c''est mieux. Et toujours avant un lancement important - vous ne voulez pas découvrir les vulnérabilités par vos utilisateurs.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (36, 2, 'fr', 'Combien de temps dure un test de pénétration ?', 'La plupart des tests d''applications web prennent 1-2 semaines. Une API simple peut être faite en quelques jours. Les tests d''infrastructure complets peuvent prendre 3-4 semaines. On vous donnera un calendrier précis pendant le scoping une fois qu''on comprend ce qu''on teste.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (37, 3, 'fr', 'Pouvez-vous nous aider à obtenir la conformité SOC 2 ou ISO 27001 ?', 'Oui. On aide les entreprises à se préparer aux audits de conformité - identifier les lacunes, implémenter les contrôles, documenter les pratiques. On a guidé des équipes à travers SOC 2, ISO 27001, HIPAA et GDPR. Le processus est moins douloureux quand quelqu''un qui l''a déjà fait vous aide.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (38, 4, 'fr', 'Que couvre un audit de sécurité cloud ?', 'Configurations IAM, sécurité réseau, paramètres de chiffrement, logging, monitoring, protection des données, et comment vous vous situez par rapport aux benchmarks CIS. Vous recevez une liste priorisée de ce qu''il faut corriger et comment.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (39, 5, 'fr', 'Combien de temps faut-il pour construire une application web ?', 'Un MVP simple : 6-8 semaines. Un produit SaaS complet avec auth, facturation et vraies fonctionnalités : 3-6 mois. Applications enterprise avec intégrations complexes : plus longtemps. On peut donner une vraie estimation une fois qu''on comprend ce que vous construisez.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (40, 6, 'fr', 'Pourquoi utilisez-vous principalement React et Next.js ?', 'React a le plus grand écosystème, les meilleurs outils et le plus de développeurs qui le connaissent. Next.js ajoute le rendu côté serveur, les routes API et des optimisations de performance qui prendraient des mois à construire vous-même. Pour la plupart des projets, c''est le bon choix.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (41, 7, 'fr', 'Proposez-vous une maintenance continue après le lancement ?', 'Oui. On propose des forfaits de maintenance - mises à jour de sécurité, corrections de bugs, monitoring de performance, nouvelles fonctionnalités. Beaucoup de clients commencent par un projet de construction et nous gardent pour du travail continu.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (42, 8, 'fr', 'Pourquoi le développement natif plutôt que React Native ou Flutter ?', 'Les apps natives sont plus rapides et ont un accès complet aux fonctionnalités de la plateforme. Les frameworks cross-platform ajoutent de la complexité, et vous finissez souvent par écrire du code natif de toute façon pour les fonctions avancées. Si votre app doit paraître premium, le natif en vaut la peine.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (43, 9, 'fr', 'Combien de temps prend le développement d''une application mobile ?', 'Une app simple pour une plateforme : 2-3 mois. iOS et Android avec un backend partagé : 4-6 mois. Les apps avec support offline, fonctionnalités temps réel ou intégration hardware prennent plus longtemps. La complexité détermine le calendrier plus que le nombre de fonctionnalités.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (44, 10, 'fr', 'Gérez-vous la soumission sur l''App Store et le Play Store ?', 'Oui. On prépare les assets, on gère la soumission, on répond aux retours de review et on fait les modifications demandées par Apple ou Google. On a assez d''expérience pour savoir ce qui déclenche les rejets et comment les éviter.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (45, 11, 'fr', 'Quel fournisseur cloud recommandez-vous ?', 'AWS pour la plupart des choses - le plus de services, la meilleure documentation. On utilise aussi GCP et Cloudflare Workers quand ils conviennent mieux. La bonne réponse dépend de ce que vous construisez, de vos besoins de conformité et de ce que votre équipe connaît déjà.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (46, 12, 'fr', 'Avons-nous besoin de Kubernetes ?', 'Probablement pas. Kubernetes ajoute une charge opérationnelle dont la plupart des projets n''ont pas besoin. ECS, Cloud Run ou des instances EC2 bien configurées fonctionnent bien pour la plupart des workloads. On recommande Kubernetes seulement quand les besoins justifient vraiment la complexité.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (47, 13, 'fr', 'Comment pouvons-nous réduire nos coûts cloud ?', 'Dimensionnez correctement vos instances, utilisez des reserved ou spot instances où vous pouvez, configurez l''auto-scaling, optimisez le transfert de données et supprimez ce que vous n''utilisez pas. On trouve généralement 20-40% d''économies quand on audite des setups AWS existants.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (48, 14, 'fr', 'Comment fonctionnent généralement les missions de consulting ?', 'Ça commence généralement par 1-2 semaines de discovery pour comprendre votre situation. Puis des recommandations, de la documentation et souvent de l''aide pratique pour implémenter les changements. Certaines missions sont des projets à périmètre fixe, d''autres deviennent des relations de conseil continues.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (49, 15, 'fr', 'Quels livrables recevons-nous d''une mission de consulting ?', 'Documentation d''architecture, recommandations technologiques avec justification, roadmaps d''implémentation, parfois des prototypes fonctionnels. Tout documenté pour que votre équipe puisse continuer de manière indépendante.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (50, 16, 'fr', 'L''automatisation des tests vaut-elle l''investissement ?', 'Si vous développez activement l''app et prévoyez de la maintenir à long terme, oui. Les tests automatisés attrapent les régressions, vous permettent de refactorer sans peur et accélèrent les releases. La plupart des projets actifs voient un ROI positif en 6-12 mois.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (51, 17, 'fr', 'Pouvez-vous vous intégrer à notre équipe de développement existante ?', 'Oui. On peut rejoindre vos sprints, participer aux standups, utiliser vos outils. Beaucoup de clients aiment ce modèle - on est essentiellement une extension de leur équipe plutôt qu''un prestataire séparé.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (52, 1, 'de', 'Wie oft sollten wir Penetrationstests durchführen?', 'Mindestens einmal im Jahr, plus nach größeren Änderungen an Ihrer Anwendung oder Infrastruktur. Wenn Sie Zahlungen, Gesundheitsdaten oder Finanzinformationen verarbeiten, ist vierteljährlich besser. Und immer vor einem großen Launch - Sie wollen nicht von Ihren Nutzern über Schwachstellen erfahren.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (53, 2, 'de', 'Wie lange dauert ein Penetrationstest?', 'Die meisten Webanwendungstests dauern 1-2 Wochen. Eine einfache API kann in wenigen Tagen fertig sein. Vollständige Infrastrukturtests können 3-4 Wochen dauern. Wir geben Ihnen einen konkreten Zeitplan während des Scopings, sobald wir verstehen, was wir testen.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (54, 3, 'de', 'Können Sie uns bei der SOC 2 oder ISO 27001 Zertifizierung helfen?', 'Ja. Wir helfen Unternehmen bei der Vorbereitung auf Compliance-Audits - Lücken identifizieren, Kontrollen implementieren, Praktiken dokumentieren. Wir haben Teams durch SOC 2, ISO 27001, HIPAA und DSGVO begleitet. Der Prozess ist weniger schmerzhaft, wenn jemand hilft, der es schon gemacht hat.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (55, 4, 'de', 'Was deckt ein Cloud-Sicherheitsaudit ab?', 'IAM-Konfigurationen, Netzwerksicherheit, Verschlüsselungseinstellungen, Logging, Monitoring, Datenschutz und wie Sie im Vergleich zu CIS-Benchmarks abschneiden. Sie erhalten eine priorisierte Liste, was zu beheben ist und wie.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (56, 5, 'de', 'Wie lange dauert es, eine Webanwendung zu bauen?', 'Ein einfaches MVP: 6-8 Wochen. Ein vollständiges SaaS-Produkt mit Auth, Abrechnung und echten Features: 3-6 Monate. Enterprise-Anwendungen mit komplexen Integrationen: länger. Wir können eine realistische Schätzung geben, sobald wir verstehen, was Sie bauen.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (57, 6, 'de', 'Warum nutzen Sie hauptsächlich React und Next.js?', 'React hat das größte Ökosystem, die besten Tools und die meisten Entwickler, die es kennen. Next.js fügt Server-Side Rendering, API-Routen und Performance-Optimierungen hinzu, die selbst zu bauen Monate dauern würde. Für die meisten Projekte ist es die richtige Wahl.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (58, 7, 'de', 'Bieten Sie laufende Wartung nach dem Launch an?', 'Ja. Wir bieten Wartungspakete - Sicherheitsupdates, Bugfixes, Performance-Monitoring, neue Features. Viele Kunden starten mit einem Entwicklungsprojekt und behalten uns für die laufende Arbeit.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (59, 8, 'de', 'Warum native Entwicklung statt React Native oder Flutter?', 'Native Apps sind schneller und haben vollen Zugriff auf Plattform-Features. Cross-Platform-Frameworks fügen Komplexität hinzu, und Sie schreiben am Ende oft sowieso nativen Code für fortgeschrittene Funktionen. Wenn Ihre App hochwertig wirken soll, lohnt sich nativ.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (60, 9, 'de', 'Wie lange dauert die Entwicklung einer mobilen App?', 'Eine einfache App für eine Plattform: 2-3 Monate. iOS und Android mit gemeinsamem Backend: 4-6 Monate. Apps mit Offline-Support, Echtzeit-Features oder Hardware-Integration dauern länger. Komplexität bestimmt den Zeitplan mehr als die Anzahl der Features.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (61, 10, 'de', 'Übernehmen Sie die App Store und Play Store Einreichung?', 'Ja. Wir bereiten Assets vor, wickeln die Einreichung ab, reagieren auf Review-Feedback und nehmen alle Änderungen vor, die Apple oder Google verlangen. Wir haben genug Erfahrung, um zu wissen, was Ablehnungen auslöst und wie man sie vermeidet.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (62, 11, 'de', 'Welchen Cloud-Anbieter empfehlen Sie?', 'AWS für die meisten Dinge - die meisten Services, die beste Dokumentation. Wir nutzen auch GCP und Cloudflare Workers, wenn sie besser passen. Die richtige Antwort hängt davon ab, was Sie bauen, welche Compliance Sie brauchen und was Ihr Team bereits kennt.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (63, 12, 'de', 'Brauchen wir Kubernetes?', 'Wahrscheinlich nicht. Kubernetes fügt operativen Overhead hinzu, den die meisten Projekte nicht brauchen. ECS, Cloud Run oder gut konfigurierte EC2-Instanzen funktionieren für die meisten Workloads gut. Wir empfehlen Kubernetes nur, wenn die Anforderungen die Komplexität wirklich rechtfertigen.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (64, 13, 'de', 'Wie können wir unsere Cloud-Kosten reduzieren?', 'Instanzen richtig dimensionieren, Reserved oder Spot Instances nutzen wo möglich, Auto-Scaling einrichten, Datentransfer optimieren und Ungenutztes löschen. Wir finden typischerweise 20-40% Einsparungen, wenn wir bestehende AWS-Setups auditieren.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (65, 14, 'de', 'Wie laufen Beratungsengagements typischerweise ab?', 'Normalerweise beginnt es mit 1-2 Wochen Discovery, um Ihre Situation zu verstehen. Dann Empfehlungen, Dokumentation und oft praktische Hilfe bei der Umsetzung von Änderungen. Manche Engagements sind Projekte mit festem Umfang, andere werden zu laufenden Beratungsbeziehungen.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (66, 15, 'de', 'Welche Liefergegenstände erhalten wir aus einem Beratungsengagement?', 'Architekturdokumentation, Technologieempfehlungen mit Begründung, Implementierungs-Roadmaps, manchmal funktionierende Prototypen. Alles dokumentiert, damit Ihr Team eigenständig weitermachen kann.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (67, 16, 'de', 'Lohnt sich die Investition in Testautomatisierung?', 'Wenn Sie die App aktiv entwickeln und langfristig warten wollen, ja. Automatisierte Tests fangen Regressionen ab, ermöglichen angstfreies Refactoring und beschleunigen Releases. Die meisten aktiven Projekte sehen positiven ROI innerhalb von 6-12 Monaten.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (68, 17, 'de', 'Können Sie sich in unser bestehendes Entwicklungsteam integrieren?', 'Ja. Wir können an Ihren Sprints teilnehmen, bei Standups dabei sein, Ihre Tools nutzen. Viele Kunden mögen dieses Modell - wir sind praktisch eine Erweiterung ihres Teams statt ein separater Dienstleister.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (86, 1, 'it', 'Con quale frequenza dovremmo fare test di penetrazione?', 'Minimo una volta all''anno, più dopo qualsiasi cambiamento importante all''applicazione o infrastruttura. Se gestite pagamenti, dati sanitari o informazioni finanziarie, trimestrale è meglio. E sempre prima di un lancio importante - non volete scoprire le vulnerabilità dai vostri utenti.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (87, 2, 'it', 'Quanto dura un test di penetrazione?', 'La maggior parte dei test di applicazioni web richiede 1-2 settimane. Un''API semplice può essere fatta in pochi giorni. I test completi dell''infrastruttura possono richiedere 3-4 settimane. Vi daremo una timeline specifica durante lo scoping una volta capito cosa stiamo testando.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (88, 3, 'it', 'Potete aiutarci a ottenere la conformità SOC 2 o ISO 27001?', 'Sì. Aiutiamo le aziende a prepararsi per gli audit di conformità - identificare lacune, implementare controlli, documentare pratiche. Abbiamo guidato team attraverso SOC 2, ISO 27001, HIPAA e GDPR. Il processo è meno doloroso quando qualcuno che l''ha già fatto vi aiuta.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (89, 4, 'it', 'Cosa copre un audit di sicurezza cloud?', 'Configurazioni IAM, sicurezza di rete, impostazioni di crittografia, logging, monitoring, protezione dati e come vi posizionate rispetto ai benchmark CIS. Ricevete una lista prioritizzata di cosa sistemare e come.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (90, 5, 'it', 'Quanto tempo ci vuole per costruire un''applicazione web?', 'Un MVP semplice: 6-8 settimane. Un prodotto SaaS completo con auth, fatturazione e funzionalità reali: 3-6 mesi. Applicazioni enterprise con integrazioni complesse: di più. Possiamo dare una stima reale una volta capito cosa state costruendo.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (91, 6, 'it', 'Perché usate principalmente React e Next.js?', 'React ha l''ecosistema più grande, i migliori strumenti e il maggior numero di sviluppatori che lo conoscono. Next.js aggiunge server-side rendering, route API e ottimizzazioni di performance che richiederebbero mesi per costruirle da soli. Per la maggior parte dei progetti, è la scelta giusta.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (92, 7, 'it', 'Offrite manutenzione continua dopo il lancio?', 'Sì. Offriamo pacchetti di manutenzione - aggiornamenti di sicurezza, fix di bug, monitoring delle performance, nuove funzionalità. Molti clienti iniziano con un progetto di sviluppo e ci tengono per il lavoro continuo.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (93, 8, 'it', 'Perché sviluppo nativo invece di React Native o Flutter?', 'Le app native sono più veloci e hanno accesso completo alle funzionalità della piattaforma. I framework cross-platform aggiungono complessità, e spesso finite per scrivere codice nativo comunque per le funzioni avanzate. Se la vostra app deve sembrare premium, il nativo vale la pena.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (94, 9, 'it', 'Quanto tempo richiede lo sviluppo di un''app mobile?', 'Un''app semplice per una piattaforma: 2-3 mesi. Sia iOS che Android con backend condiviso: 4-6 mesi. App con supporto offline, funzionalità real-time o integrazione hardware richiedono più tempo. La complessità determina la timeline più del numero di funzionalità.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (95, 10, 'it', 'Gestite la submission su App Store e Play Store?', 'Sì. Prepariamo gli asset, gestiamo la submission, rispondiamo al feedback di review e facciamo qualsiasi modifica richiesta da Apple o Google. Abbiamo abbastanza esperienza per sapere cosa scatena i rifiuti e come evitarli.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (96, 11, 'it', 'Quale provider cloud raccomandate?', 'AWS per la maggior parte delle cose - più servizi, migliore documentazione. Usiamo anche GCP e Cloudflare Workers quando si adattano meglio. La risposta giusta dipende da cosa state costruendo, di quale conformità avete bisogno e cosa il vostro team già conosce.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (97, 12, 'it', 'Abbiamo bisogno di Kubernetes?', 'Probabilmente no. Kubernetes aggiunge overhead operativo di cui la maggior parte dei progetti non ha bisogno. ECS, Cloud Run o istanze EC2 ben configurate funzionano bene per la maggior parte dei workload. Raccomandiamo Kubernetes solo quando i requisiti giustificano davvero la complessità.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (98, 13, 'it', 'Come possiamo ridurre i nostri costi cloud?', 'Dimensionate correttamente le istanze, usate reserved o spot instance dove potete, configurate l''auto-scaling, ottimizzate il trasferimento dati e cancellate quello che non usate. Tipicamente troviamo risparmi del 20-40% quando auditiamo setup AWS esistenti.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (99, 14, 'it', 'Come funzionano tipicamente gli ingaggi di consulenza?', 'Di solito inizia con 1-2 settimane di discovery per capire la vostra situazione. Poi raccomandazioni, documentazione e spesso aiuto pratico nell''implementare i cambiamenti. Alcuni ingaggi sono progetti a scope fisso, altri diventano relazioni di advisory continuative.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (100, 15, 'it', 'Quali deliverable riceviamo da un ingaggio di consulenza?', 'Documentazione di architettura, raccomandazioni tecnologiche con motivazioni, roadmap di implementazione, a volte prototipi funzionanti. Tutto documentato così il vostro team può procedere in autonomia.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (101, 16, 'it', 'Vale la pena investire nell''automazione dei test?', 'Se state sviluppando attivamente l''app e pianificate di mantenerla a lungo termine, sì. I test automatizzati catturano le regressioni, vi permettono di fare refactoring senza paura e accelerano i release. La maggior parte dei progetti attivi vede ROI positivo in 6-12 mesi.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (102, 17, 'it', 'Potete integrarvi con il nostro team di sviluppo esistente?', 'Sì. Possiamo unirci ai vostri sprint, partecipare agli standup, usare i vostri strumenti. A molti clienti piace questo modello - siamo praticamente un''estensione del loro team invece di un vendor separato.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (103, 1, 'es', '¿Con qué frecuencia deberíamos hacer pruebas de penetración?', 'Mínimo una vez al año, más después de cualquier cambio importante en tu aplicación o infraestructura. Si manejas pagos, datos de salud o información financiera, trimestral es mejor. Y siempre antes de un lanzamiento grande - no quieres enterarte de las vulnerabilidades por tus usuarios.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (104, 2, 'es', '¿Cuánto dura una prueba de penetración?', 'La mayoría de los tests de aplicaciones web toman 1-2 semanas. Una API simple puede estar lista en unos días. Los tests completos de infraestructura pueden tomar 3-4 semanas. Te daremos un timeline específico durante el scoping una vez que entendamos qué estamos probando.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (105, 3, 'es', '¿Pueden ayudarnos a obtener la certificación SOC 2 o ISO 27001?', 'Sí. Ayudamos a las empresas a prepararse para auditorías de cumplimiento - identificar brechas, implementar controles, documentar prácticas. Hemos guiado equipos a través de SOC 2, ISO 27001, HIPAA y GDPR. El proceso es menos doloroso cuando alguien que ya lo ha hecho te ayuda.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (106, 4, 'es', '¿Qué cubre una auditoría de seguridad cloud?', 'Configuraciones IAM, seguridad de red, configuraciones de encriptación, logging, monitoring, protección de datos y cómo te comparas con los benchmarks CIS. Recibes una lista priorizada de qué arreglar y cómo.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (107, 5, 'es', '¿Cuánto tiempo toma construir una aplicación web?', 'Un MVP simple: 6-8 semanas. Un producto SaaS completo con auth, facturación y funcionalidades reales: 3-6 meses. Aplicaciones enterprise con integraciones complejas: más tiempo. Podemos dar una estimación real una vez que entendamos qué estás construyendo.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (108, 6, 'es', '¿Por qué usan principalmente React y Next.js?', 'React tiene el ecosistema más grande, las mejores herramientas y la mayor cantidad de desarrolladores que lo conocen. Next.js añade server-side rendering, rutas API y optimizaciones de rendimiento que tomarían meses construir por tu cuenta. Para la mayoría de los proyectos, es la elección correcta.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (109, 7, 'es', '¿Ofrecen mantenimiento continuo después del lanzamiento?', 'Sí. Ofrecemos paquetes de mantenimiento - actualizaciones de seguridad, corrección de bugs, monitoreo de rendimiento, nuevas funcionalidades. Muchos clientes empiezan con un proyecto de desarrollo y nos mantienen para trabajo continuo.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (110, 8, 'es', '¿Por qué desarrollo nativo en lugar de React Native o Flutter?', 'Las apps nativas son más rápidas y tienen acceso completo a las funcionalidades de la plataforma. Los frameworks cross-platform añaden complejidad, y a menudo terminas escribiendo código nativo de todos modos para funciones avanzadas. Si tu app necesita sentirse premium, nativo vale la pena.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (111, 9, 'es', '¿Cuánto tiempo toma el desarrollo de una app móvil?', 'Una app simple para una plataforma: 2-3 meses. iOS y Android con backend compartido: 4-6 meses. Apps con soporte offline, funcionalidades en tiempo real o integración de hardware toman más tiempo. La complejidad determina el timeline más que la cantidad de funcionalidades.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (112, 10, 'es', '¿Manejan el envío a App Store y Play Store?', 'Sí. Preparamos los assets, manejamos el envío, respondemos al feedback de revisión y hacemos cualquier cambio que Apple o Google pidan. Tenemos suficiente experiencia para saber qué dispara rechazos y cómo evitarlos.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (113, 11, 'es', '¿Qué proveedor cloud recomiendan?', 'AWS para la mayoría de las cosas - más servicios, mejor documentación. También usamos GCP y Cloudflare Workers cuando encajan mejor. La respuesta correcta depende de qué estás construyendo, qué cumplimiento necesitas y qué ya conoce tu equipo.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (114, 12, 'es', '¿Necesitamos Kubernetes?', 'Probablemente no. Kubernetes añade overhead operacional que la mayoría de los proyectos no necesitan. ECS, Cloud Run o instancias EC2 bien configuradas funcionan bien para la mayoría de los workloads. Solo recomendamos Kubernetes cuando los requisitos realmente justifican la complejidad.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (115, 13, 'es', '¿Cómo podemos reducir nuestros costos cloud?', 'Dimensiona correctamente tus instancias, usa reserved o spot instances donde puedas, configura auto-scaling, optimiza la transferencia de datos y elimina lo que no usas. Típicamente encontramos ahorros de 20-40% cuando auditamos setups AWS existentes.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (116, 14, 'es', '¿Cómo funcionan típicamente los compromisos de consultoría?', 'Usualmente empieza con 1-2 semanas de discovery para entender tu situación. Luego recomendaciones, documentación y a menudo ayuda práctica implementando los cambios. Algunos compromisos son proyectos de alcance fijo, otros se convierten en relaciones de asesoría continua.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (117, 15, 'es', '¿Qué entregables recibimos de un compromiso de consultoría?', 'Documentación de arquitectura, recomendaciones tecnológicas con razonamiento, roadmaps de implementación, a veces prototipos funcionales. Todo documentado para que tu equipo pueda continuar independientemente.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (118, 16, 'es', '¿Vale la pena la inversión en automatización de pruebas?', 'Si estás desarrollando activamente la app y planeas mantenerla a largo plazo, sí. Las pruebas automatizadas atrapan regresiones, te permiten refactorizar sin miedo y aceleran los releases. La mayoría de los proyectos activos ven ROI positivo en 6-12 meses.');
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer) VALUES (119, 17, 'es', '¿Pueden integrarse con nuestro equipo de desarrollo existente?', 'Sí. Podemos unirnos a tus sprints, asistir a standups, usar tus herramientas. A muchos clientes les gusta este modelo - somos básicamente una extensión de su equipo en lugar de un vendor separado.');

