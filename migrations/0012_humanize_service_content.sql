-- Humanized service long descriptions
-- Removes AI writing patterns, adds voice and specificity

-- Technical Consulting
UPDATE service_translations SET long_description = '## How we actually work

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

Clear recommendations you can act on. Documentation your team will actually use. Follow-up support as you implement changes. Direct access to engineers who''ve solved similar problems at scale.' WHERE service_id = 1 AND locale = 'en';

-- Security Services
UPDATE service_translations SET long_description = '## Security from people who''ve been on both sides

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

Gaming - anti-cheat considerations, account security, in-game economy protection. Travel - PCI compliance, booking system security, API integrations. Healthcare - HIPAA compliance, PHI protection, audit logging. Finance - SOC 2 preparation, transaction security, fraud prevention.' WHERE service_id = 2 AND locale = 'en';

-- Big Data & Analytics
UPDATE service_translations SET long_description = '## Turning data into decisions

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

We''re engineers first. We understand how data is generated, where quality issues come from, and how to build systems that scale. We don''t just make charts - we build reliable data infrastructure.' WHERE service_id = 3 AND locale = 'en';

-- QA & Testing Services
UPDATE service_translations SET long_description = '## Finding bugs before your users do

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

Test plans and test case documentation. Automated test suites with maintenance docs. Performance benchmarks and recommendations. Bug reports with severity ratings. Testing metrics dashboards.' WHERE service_id = 4 AND locale = 'en';

-- AI & Machine Learning
UPDATE service_translations SET long_description = '## AI that works in production

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

We''re pragmatic about AI. We won''t recommend deep learning when logistic regression will do. We focus on solutions that are maintainable, explainable, and actually move your business metrics.' WHERE service_id = 5 AND locale = 'en';

-- Web Applications
UPDATE service_translations SET long_description = '## Web apps that work under pressure

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

Clean, maintainable code with documentation. Automated deployment pipelines. Monitoring and alerting setup. Performance optimization. Security best practices built in. Knowledge transfer so your team can maintain it.' WHERE service_id = 6 AND locale = 'en';

-- Mobile Applications
UPDATE service_translations SET long_description = '## Native mobile apps

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

Healthcare apps (HIPAA-compliant). Industrial IoT (real-time sensor data). E-commerce (high-volume transactions). Travel (offline-first requirements). Finance (security-critical).' WHERE service_id = 7 AND locale = 'en';

-- DevOps & Cloud Infrastructure
UPDATE service_translations SET long_description = '## Infrastructure that scales

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

Architecture documentation with diagrams. Infrastructure as Code repositories. Monitoring dashboards and alerting. Runbooks for common operations. Security review and recommendations. Cost analysis and optimization.' WHERE service_id = 8 AND locale = 'en';

-- Backend, APIs & Integrations
UPDATE service_translations SET long_description = '## Backend systems that work

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

Well-documented APIs with OpenAPI specs. Integration tests and test environments. Deployment configurations and CI/CD. Monitoring and alerting. Performance benchmarks. Security review documentation.' WHERE service_id = 9 AND locale = 'en';

-- Database Design & Management
UPDATE service_translations SET long_description = '## Databases that stay fast

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

Entity-relationship diagrams and schema documentation. Query analysis and optimization recommendations. Migration scripts and rollback procedures. Monitoring dashboards for database health. Backup and recovery runbooks. Performance benchmarks and baselines.' WHERE service_id = 10 AND locale = 'en';
