-- Long description content for all services (English)
-- Other locales can be added via the admin panel

-- Technical Consulting
UPDATE service_translations SET long_description = '## Our Consulting Approach

We don''t believe in generic advice. Every recommendation we make comes from hands-on experience building and scaling systems at companies like Electronic Arts, TUI, and Nagarro.

### How We Work

**Discovery Phase**
We start by understanding your current situation. What are you building? What constraints are you working with? What''s worked before, and what hasn''t? This isn''t a checkbox exercise - it''s a conversation that shapes everything that follows.

**Architecture Review**
We analyze your existing systems, identify bottlenecks, and map out dependencies. You get a clear picture of where you are and what options you have.

**Strategic Roadmap**
Based on our findings, we create a prioritized plan. Not a 100-page document that sits on a shelf, but actionable steps with clear outcomes.

### Common Problems We Solve

- **Technology selection paralysis** - Too many options, not enough clarity on trade-offs
- **Scaling challenges** - Systems that worked at 1,000 users struggling at 100,000
- **Technical debt accumulation** - Quick fixes that became permanent problems
- **Team productivity issues** - Processes and tools that slow down delivery
- **Security concerns** - Architecture decisions that create vulnerabilities

### Use Cases

**Startup CTO Support**
First-time technical leaders who need experienced guidance on architecture decisions, team structure, and technology choices.

**Enterprise Modernization**
Legacy system assessment and migration planning. We help you understand what to keep, what to replace, and how to manage the transition.

**Due Diligence**
Technical assessment for investors or acquirers. We evaluate codebases, infrastructure, and team capabilities.

### What You Get

- Clear, actionable recommendations (not theoretical frameworks)
- Documentation your team can actually use
- Follow-up support as you implement changes
- Direct access to engineers who''ve solved similar problems' WHERE service_id = 1 AND locale = 'en';

-- Security Services
UPDATE service_translations SET long_description = '## Security That Comes From Experience

Our security team has backgrounds in penetration testing at Electronic Arts and DDoS protection at TUI. We''ve seen how attackers think because we''ve worked on both sides of the equation.

### Our Security Services

**Penetration Testing**
We attempt to breach your systems the same way real attackers would. Web applications, APIs, mobile apps, and infrastructure. You get a detailed report of what we found and how to fix it.

**Security Audits**
Comprehensive review of your security posture. We examine code, configurations, processes, and architecture. Not just checking boxes - we look for the issues that automated tools miss.

**Cloud Security Reviews**
AWS, Azure, or GCP configurations audited for misconfigurations, excessive permissions, and compliance gaps. We''ve seen too many breaches caused by a single S3 bucket set to public.

**DDoS Protection**
Configuration and optimization of Cloudflare, Akamai, or AWS Shield. Rate limiting, WAF rules, and incident response planning. Based on our experience protecting high-traffic sites at TUI.

### Our Process

1. **Scoping** - We define what''s in scope, what testing methods we''ll use, and what you need to prepare
2. **Reconnaissance** - We gather information the same way an attacker would
3. **Testing** - Active testing against your systems within agreed boundaries
4. **Analysis** - We verify findings and assess actual risk, not theoretical impact
5. **Reporting** - Clear documentation with reproduction steps and remediation guidance
6. **Remediation Support** - We help your team understand and fix the issues we found

### Common Vulnerabilities We Find

- Authentication bypasses and session management flaws
- Injection vulnerabilities (SQL, NoSQL, command injection)
- Insecure direct object references (IDOR)
- API security issues (broken authentication, excessive data exposure)
- Cloud misconfigurations (public buckets, overly permissive IAM)
- Infrastructure vulnerabilities (unpatched systems, weak protocols)

### Industries We Serve

We have particular experience with:
- **Gaming** - Anti-cheat considerations, account security, in-game economy protection
- **Travel** - PCI compliance, booking system security, API integrations
- **Healthcare** - HIPAA compliance, PHI protection, audit logging
- **Finance** - SOC 2 preparation, transaction security, fraud prevention' WHERE service_id = 2 AND locale = 'en';

-- Big Data & Analytics
UPDATE service_translations SET long_description = '## Data That Drives Decisions

Raw data is useless. We help you turn information into insights that actually change how you operate.

### What We Build

**Custom Dashboards**
Real-time visibility into the metrics that matter to your business. Not generic templates - dashboards designed around your specific KPIs and workflows.

**Data Pipelines**
ETL processes that collect, transform, and load data from multiple sources. We work with streaming data, batch processing, and hybrid approaches.

**Predictive Analytics**
Machine learning models that help you anticipate trends, identify risks, and optimize operations. We focus on models that are interpretable and actionable.

**Business Intelligence**
Self-service reporting that empowers your team to answer their own questions. We set up the foundation so you''re not dependent on engineers for every report.

### Our Approach

**Start With Questions**
What decisions are you trying to make? What would change if you had perfect information? We work backwards from business outcomes to data requirements.

**Build Incrementally**
We deliver working dashboards and reports early. You start getting value immediately while we expand capabilities.

**Focus on Data Quality**
Analytics are only as good as the underlying data. We help you establish data governance, validation, and monitoring.

### Tools We Work With

- **Visualization**: Grafana, Metabase, Apache Superset, custom D3.js dashboards
- **Processing**: Apache Spark, Apache Kafka, dbt, Airflow
- **Storage**: PostgreSQL, ClickHouse, BigQuery, Snowflake
- **Streaming**: Kafka, AWS Kinesis, Redis Streams

### Common Use Cases

- **E-commerce**: Conversion funnels, customer lifetime value, inventory optimization
- **SaaS**: Usage analytics, churn prediction, feature adoption tracking
- **Operations**: System monitoring, performance metrics, cost analysis
- **Marketing**: Campaign attribution, audience segmentation, A/B test analysis

### What Makes Us Different

We''re engineers first. We understand how data is generated, where quality issues come from, and how to build systems that scale. We don''t just make pretty charts - we build reliable data infrastructure.' WHERE service_id = 3 AND locale = 'en';

-- QA & Testing Services
UPDATE service_translations SET long_description = '## Quality Assurance That Catches Real Problems

We find bugs before your users do. Manual testing, automated testing, performance testing - whatever it takes to ship with confidence.

### Our Testing Services

**Manual Testing**
Exploratory testing by experienced QA engineers who think like users. We find the edge cases that automated tests miss.

**Test Automation**
Selenium, Cypress, Playwright for web. Appium for mobile. We build test suites that run reliably and provide fast feedback.

**Performance Testing**
Load testing with JMeter, k6, or Gatling. We identify bottlenecks before they become outages. You''ll know exactly how your system behaves under stress.

**API Testing**
Comprehensive testing of REST and GraphQL APIs. Contract testing, integration testing, and security testing for your backend services.

**Security Testing**
OWASP Top 10 coverage integrated into your testing process. We catch common vulnerabilities during development, not after deployment.

### Our Process

**Test Planning**
We analyze your application to identify critical paths, high-risk areas, and testing priorities. Not everything needs the same level of coverage.

**Test Design**
We create test cases that cover functional requirements, edge cases, and real user scenarios. We focus on tests that provide actual value.

**Execution**
Testing happens continuously - not just before releases. We integrate with your CI/CD pipeline for fast feedback.

**Reporting**
Clear bug reports with reproduction steps, severity assessment, and suggested fixes. No vague descriptions that waste developer time.

### Tools & Frameworks

- **Web Automation**: Selenium, Cypress, Playwright, Puppeteer
- **Mobile Testing**: Appium, XCTest, Espresso
- **Performance**: JMeter, k6, Gatling, Locust
- **API Testing**: Postman, REST Assured, Karate
- **CI/CD Integration**: GitHub Actions, GitLab CI, Jenkins

### When You Need Us

- **Product launches** - Ensure quality before going live
- **Migration projects** - Verify nothing breaks during transitions
- **Continuous development** - Ongoing QA support for your team
- **Test suite creation** - Build automated testing from scratch
- **QA process improvement** - Optimize your existing testing workflow

### What We Deliver

- Test plans and test cases documentation
- Automated test suites with maintenance documentation
- Performance benchmarks and recommendations
- Bug reports with severity ratings
- Testing metrics and quality dashboards' WHERE service_id = 4 AND locale = 'en';

-- AI & Machine Learning
UPDATE service_translations SET long_description = '## AI That Solves Real Problems

We build machine learning systems that work in production - not just impressive demos. From natural language processing to computer vision, we focus on solutions that deliver measurable business value.

### What We Build

**Natural Language Processing**
Text classification, sentiment analysis, entity extraction, and document understanding. We help you process unstructured text at scale.

**Computer Vision**
Image classification, object detection, OCR, and visual inspection systems. From quality control to document processing.

**Recommendation Systems**
Personalization engines that learn from user behavior. Product recommendations, content suggestions, and dynamic pricing.

**Predictive Models**
Forecasting, anomaly detection, and risk scoring. We build models that help you anticipate problems and opportunities.

### Our Approach

**Problem Definition**
Not every problem needs AI. We start by understanding what you''re trying to achieve and whether machine learning is the right approach.

**Data Assessment**
ML models are only as good as their training data. We evaluate what data you have, what you need, and how to handle gaps.

**Iterative Development**
We build simple models first, validate they work, then increase complexity. You see results early and can course-correct.

**Production Engineering**
A model isn''t useful until it''s deployed. We handle the engineering required to make ML work reliably in production environments.

### Technical Capabilities

- **Frameworks**: PyTorch, TensorFlow, scikit-learn, Hugging Face
- **MLOps**: MLflow, Kubeflow, custom deployment pipelines
- **Infrastructure**: GPU clusters, AWS SageMaker, Google Vertex AI
- **LLMs**: Fine-tuning, RAG systems, prompt engineering

### Common Use Cases

- **Customer Service**: Chatbots, ticket classification, response suggestions
- **Document Processing**: Invoice extraction, contract analysis, compliance checking
- **Quality Control**: Visual inspection, defect detection, anomaly identification
- **Personalization**: Product recommendations, content curation, dynamic pricing
- **Operations**: Demand forecasting, inventory optimization, predictive maintenance

### What Sets Us Apart

We''re pragmatic about AI. We won''t recommend deep learning when logistic regression will do. We focus on solutions that are maintainable, explainable, and actually improve your business metrics.' WHERE service_id = 5 AND locale = 'en';

-- Web Applications
UPDATE service_translations SET long_description = '## Web Applications Built for the Real World

From internal tools to customer-facing platforms, we build web applications that perform under pressure and scale with your business.

### What We Build

**Single Page Applications (SPAs)**
React and Next.js applications with smooth user experiences. Fast, responsive, and optimized for modern browsers.

**Progressive Web Apps (PWAs)**
Web applications that work offline, send push notifications, and feel native. The reach of the web with app-like capabilities.

**Admin Panels & Dashboards**
Internal tools that make your team more productive. We build interfaces that are fast to use, not just fast to build.

**SaaS Products**
Multi-tenant applications with authentication, billing, and the infrastructure to scale. We''ve built products serving thousands of users.

**E-commerce Platforms**
Custom storefronts, inventory management, and checkout flows. Integrated with payment providers and shipping services.

### Our Technology Stack

**Frontend**
- React, Next.js, TypeScript
- Tailwind CSS for styling
- State management with Zustand or React Query
- Testing with Playwright and Jest

**Backend**
- Node.js, Python, PHP (Laravel)
- PostgreSQL, MySQL, MongoDB
- Redis for caching and queues
- GraphQL or REST APIs

**Infrastructure**
- Cloudflare Workers, AWS, Vercel
- Docker and Kubernetes
- CI/CD with GitHub Actions

### Our Development Process

1. **Discovery** - Understanding requirements, user needs, and technical constraints
2. **Design** - Wireframes, prototypes, and technical architecture
3. **Development** - Iterative sprints with regular demos and feedback
4. **Testing** - Automated testing, security review, performance optimization
5. **Deployment** - CI/CD setup, monitoring, and documentation
6. **Support** - Ongoing maintenance and feature development

### What We Deliver

- Clean, maintainable code with documentation
- Automated deployment pipelines
- Monitoring and alerting setup
- Performance optimization
- Security best practices built in
- Knowledge transfer to your team' WHERE service_id = 6 AND locale = 'en';

-- Mobile Applications
UPDATE service_translations SET long_description = '## Native Mobile Apps Built by Native Developers

We build real native apps - Swift for iOS, Kotlin for Android. Our mobile team has 10+ years of experience at Nagarro and Enea AB, building apps used by millions.

### Why Native Development?

**Performance**
Native apps are faster. Period. No JavaScript bridge, no compromise. Your users feel the difference.

**Platform Integration**
Full access to iOS and Android capabilities. Camera, sensors, health data, payments - whatever the platform offers.

**User Experience**
Native apps follow platform conventions. iOS users get an iOS experience. Android users get an Android experience.

**Long-term Maintainability**
Platform updates don''t break your app. You''re not dependent on a framework team''s update schedule.

### What We Build

**Consumer Apps**
Apps that need to be fast, reliable, and delightful. Social features, media playback, offline support.

**Enterprise Apps**
Internal tools, field service applications, and B2B products. Security, MDM integration, and corporate requirements.

**IoT Companion Apps**
Bluetooth connectivity, device management, and real-time data. We''ve built apps for healthcare devices, industrial sensors, and consumer electronics.

**E-commerce Apps**
Native shopping experiences with smooth checkout, push notifications, and personalization.

### Our Process

**Requirements & Design**
We work with your team to define features, create wireframes, and plan the user journey. We consider both platforms from the start.

**Development**
Parallel iOS and Android development with shared architecture patterns. Regular builds for testing and feedback.

**Quality Assurance**
Device testing across multiple screen sizes and OS versions. Performance profiling and memory optimization.

**App Store Submission**
We handle the submission process, address review feedback, and get your app approved.

**Ongoing Support**
OS updates, bug fixes, and feature additions. We maintain apps for the long term.

### Technical Capabilities

- **iOS**: Swift, SwiftUI, UIKit, Core Data, HealthKit, ARKit
- **Android**: Kotlin, Jetpack Compose, Room, WorkManager
- **Backend Integration**: REST, GraphQL, WebSockets, gRPC
- **Push Notifications**: Firebase, APNs, custom solutions
- **Analytics**: Firebase Analytics, Mixpanel, custom tracking

### Industries We''ve Served

- Healthcare (HIPAA-compliant apps)
- Industrial IoT (real-time sensor data)
- E-commerce (high-volume transactions)
- Travel (offline-first requirements)
- Finance (security-critical applications)' WHERE service_id = 7 AND locale = 'en';

-- DevOps & Cloud Infrastructure
UPDATE service_translations SET long_description = '## Infrastructure That Scales and Stays Secure

We build cloud infrastructure on AWS that handles growth, resists attacks, and doesn''t keep you up at night. Containers, CI/CD, and monitoring - done right.

### What We Do

**Cloud Architecture**
Design and implementation of AWS infrastructure. VPCs, load balancers, auto-scaling groups, and managed services configured for security and cost efficiency.

**Container Orchestration**
Docker and Kubernetes deployments. We containerize applications, set up orchestration, and implement proper resource management.

**CI/CD Pipelines**
Automated build, test, and deployment workflows. GitHub Actions, GitLab CI, or AWS CodePipeline - configured for fast, safe releases.

**Infrastructure as Code**
Terraform and CloudFormation for reproducible infrastructure. No more manual configuration or undocumented changes.

**Monitoring & Observability**
Comprehensive monitoring with Prometheus, Grafana, and CloudWatch. Alerting that tells you about problems before users notice.

### Our Approach

**Security First**
Every infrastructure decision considers security implications. Least privilege access, encryption at rest and in transit, network segmentation.

**Cost Optimization**
We design for efficiency. Reserved instances, spot instances, right-sizing - we help you avoid the cloud bill shock.

**Reliability Engineering**
Multi-AZ deployments, automated failover, and disaster recovery planning. We build for the failure scenarios.

**Documentation**
Every system we build comes with runbooks, architecture diagrams, and operational procedures. Your team can manage it independently.

### Common Projects

- **Cloud Migration** - Moving from on-premises to AWS
- **Kubernetes Adoption** - Containerizing applications and implementing orchestration
- **CI/CD Implementation** - Automating deployment processes
- **Security Hardening** - Addressing compliance requirements and vulnerabilities
- **Cost Reduction** - Optimizing existing cloud spend
- **Disaster Recovery** - Implementing backup and recovery procedures

### Technologies

- **Cloud**: AWS (primary), GCP, Cloudflare
- **Containers**: Docker, Kubernetes, ECS, EKS
- **IaC**: Terraform, CloudFormation, Pulumi
- **CI/CD**: GitHub Actions, GitLab CI, ArgoCD
- **Monitoring**: Prometheus, Grafana, CloudWatch, Datadog
- **Security**: AWS IAM, Vault, SOPS, security scanning

### What You Get

- Documented architecture with diagrams
- Infrastructure as Code repositories
- Monitoring dashboards and alerting
- Runbooks for common operations
- Security review and recommendations
- Cost analysis and optimization plan' WHERE service_id = 8 AND locale = 'en';

-- Backend, APIs & Integrations
UPDATE service_translations SET long_description = '## Backend Systems That Power Your Application

We build the server-side systems that make applications work. APIs, microservices, databases, and integrations - engineered for reliability and performance.

### What We Build

**RESTful APIs**
Clean, well-documented APIs that your frontend and mobile teams love to work with. Proper authentication, rate limiting, and error handling.

**GraphQL Services**
Flexible APIs that let clients request exactly what they need. Schema design, resolvers, and performance optimization.

**Microservices**
When monoliths need to be broken up, we design service boundaries, handle inter-service communication, and manage the complexity.

**Third-Party Integrations**
Payment processors, CRMs, ERPs, shipping providers - we connect your system to the services it needs to work with.

**Background Processing**
Job queues, scheduled tasks, and event-driven processing. We build systems that handle work reliably without blocking user requests.

### Our Approach

**API Design First**
We design APIs before implementing them. Clear contracts, consistent patterns, and documentation from the start.

**Security by Default**
Authentication, authorization, input validation, and rate limiting built in from day one. Not bolted on later.

**Performance Focus**
Database query optimization, caching strategies, and connection pooling. We measure and optimize before problems occur.

**Observability**
Logging, metrics, and tracing that help you understand what''s happening in production. Debugging shouldn''t be guesswork.

### Technologies

**Languages & Frameworks**
- Node.js (Express, Fastify, NestJS)
- Python (FastAPI, Django)
- PHP (Laravel, Symfony)
- Go for performance-critical services

**Databases**
- PostgreSQL, MySQL (relational)
- MongoDB, DynamoDB (document)
- Redis (caching, queues)
- Elasticsearch (search)

**Message Queues**
- RabbitMQ, AWS SQS
- Redis Streams, Apache Kafka

**API Tools**
- OpenAPI/Swagger documentation
- GraphQL with Apollo or Yoga
- gRPC for internal services

### Common Integration Projects

- **Payment Processing**: Stripe, PayPal, Adyen, local payment methods
- **Authentication**: OAuth providers, SSO, identity management
- **Communication**: Email (SendGrid, SES), SMS (Twilio), push notifications
- **Storage**: S3, Cloudflare R2, CDN integration
- **Analytics**: Segment, Mixpanel, custom event tracking

### What We Deliver

- Well-documented APIs with OpenAPI specs
- Integration tests and test environments
- Deployment configurations and CI/CD
- Monitoring and alerting setup
- Performance benchmarks
- Security review documentation' WHERE service_id = 9 AND locale = 'en';

-- Database Design & Management
UPDATE service_translations SET long_description = '## Databases That Scale and Stay Fast

Data is the foundation of your application. We design database schemas, optimize queries, and build data architectures that handle growth without slowing down.

### What We Do

**Schema Design**
Data modeling that reflects your business domain. Normalized structures for integrity, denormalized where performance demands it.

**Query Optimization**
Slow queries identified and fixed. Index strategies, query rewrites, and execution plan analysis. We make your database fast.

**Migration Planning**
Moving between database systems or versions without data loss. We plan and execute migrations that don''t require extended downtime.

**Replication & Sharding**
When single-server databases aren''t enough, we implement read replicas, master-master setups, and horizontal sharding.

**Backup & Recovery**
Automated backups, point-in-time recovery, and disaster recovery testing. Your data survives hardware failures and human error.

### Database Technologies

**Relational**
- PostgreSQL (our default recommendation)
- MySQL/MariaDB
- Amazon RDS and Aurora

**Document**
- MongoDB
- Amazon DynamoDB
- Couchbase

**Search & Analytics**
- Elasticsearch
- ClickHouse
- TimescaleDB

**Caching**
- Redis
- Memcached

### Our Approach

**Understand the Access Patterns**
How will your data be written? How will it be read? The answers determine schema design and technology choices.

**Measure Before Optimizing**
We don''t guess at performance problems. We measure query times, analyze execution plans, and fix the actual bottlenecks.

**Plan for Growth**
What works at 1,000 rows might fail at 1,000,000. We design with your growth trajectory in mind.

**Keep It Simple**
We don''t use complex features unless they''re needed. Simple schemas are easier to understand, maintain, and optimize.

### Common Projects

- **Performance Optimization** - Fixing slow queries and database bottlenecks
- **Schema Redesign** - Restructuring databases that have grown organically
- **Technology Migration** - Moving from MySQL to PostgreSQL, or SQL to NoSQL
- **Scaling Implementation** - Read replicas, connection pooling, caching layers
- **Data Modeling** - Designing schemas for new applications
- **Compliance** - Implementing audit logging, encryption, and access controls

### What You Get

- Entity-relationship diagrams and schema documentation
- Query analysis and optimization recommendations
- Migration scripts and rollback procedures
- Monitoring dashboards for database health
- Backup and recovery runbooks
- Performance benchmarks and baselines' WHERE service_id = 10 AND locale = 'en';


-- FAQ items linked to services via category field

-- Security FAQs
INSERT OR IGNORE INTO faq_items (slug, category, sort_order, is_active) VALUES
('security-pentest-frequency', 'security', 1, 1),
('security-pentest-duration', 'security', 2, 1),
('security-compliance', 'security', 3, 1),
('security-cloud-audit', 'security', 4, 1);

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'security-pentest-frequency'), 'en',
'How often should we do penetration testing?',
'At minimum, annually and after any significant changes to your application or infrastructure. High-risk applications (handling payments, health data, or financial information) should consider quarterly testing. We also recommend testing before major product launches.'),

((SELECT id FROM faq_items WHERE slug = 'security-pentest-duration'), 'en',
'How long does a penetration test take?',
'A typical web application test takes 1-2 weeks, depending on complexity. Simple APIs might take a few days, while comprehensive infrastructure tests can take 3-4 weeks. We provide a detailed timeline during scoping.'),

((SELECT id FROM faq_items WHERE slug = 'security-compliance'), 'en',
'Can you help us achieve SOC 2 or ISO 27001 compliance?',
'Yes. We help organizations prepare for compliance audits by identifying gaps, implementing required controls, and documenting security practices. We''ve helped companies through SOC 2, ISO 27001, HIPAA, and GDPR compliance processes.'),

((SELECT id FROM faq_items WHERE slug = 'security-cloud-audit'), 'en',
'What does a cloud security audit cover?',
'We review IAM configurations, network security, encryption settings, logging and monitoring, data protection, and compliance with security benchmarks like CIS. You receive a prioritized list of findings with remediation guidance.');

-- Web Development FAQs
INSERT OR IGNORE INTO faq_items (slug, category, sort_order, is_active) VALUES
('web-timeline', 'web-applications', 1, 1),
('web-technology-choice', 'web-applications', 2, 1),
('web-maintenance', 'web-applications', 3, 1);

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'web-timeline'), 'en',
'How long does it take to build a web application?',
'A simple MVP might take 6-8 weeks. A full-featured SaaS product typically takes 3-6 months. Complex enterprise applications can take longer. We provide detailed estimates after understanding your requirements.'),

((SELECT id FROM faq_items WHERE slug = 'web-technology-choice'), 'en',
'Why do you primarily use React and Next.js?',
'React has the largest ecosystem, best tooling, and largest talent pool. Next.js adds server-side rendering, API routes, and excellent performance optimizations. For most projects, this stack offers the best balance of capability and maintainability.'),

((SELECT id FROM faq_items WHERE slug = 'web-maintenance'), 'en',
'Do you provide ongoing maintenance after launch?',
'Yes. We offer maintenance packages that include security updates, bug fixes, performance monitoring, and feature development. Many clients start with a build project and transition to ongoing support.');

-- Mobile Development FAQs
INSERT OR IGNORE INTO faq_items (slug, category, sort_order, is_active) VALUES
('mobile-native-vs-cross', 'mobile', 1, 1),
('mobile-timeline', 'mobile', 2, 1),
('mobile-app-store', 'mobile', 3, 1);

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'mobile-native-vs-cross'), 'en',
'Why native development instead of React Native or Flutter?',
'Native apps perform better, have full access to platform features, and are easier to maintain long-term. Cross-platform frameworks add a layer of complexity and often require native code anyway for advanced features. For apps that need to feel premium, native is worth the investment.'),

((SELECT id FROM faq_items WHERE slug = 'mobile-timeline'), 'en',
'How long does mobile app development take?',
'A simple app for one platform takes 2-3 months. Developing for both iOS and Android with a shared backend typically takes 4-6 months. Complex apps with offline support, real-time features, or hardware integration take longer.'),

((SELECT id FROM faq_items WHERE slug = 'mobile-app-store'), 'en',
'Do you handle App Store and Play Store submission?',
'Yes. We prepare all required assets, handle the submission process, respond to review feedback, and make any required changes. We have experience navigating Apple''s review process and Google''s policies.');

-- DevOps FAQs
INSERT OR IGNORE INTO faq_items (slug, category, sort_order, is_active) VALUES
('devops-cloud-choice', 'cloud', 1, 1),
('devops-kubernetes', 'cloud', 2, 1),
('devops-cost', 'cloud', 3, 1);

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'devops-cloud-choice'), 'en',
'Which cloud provider do you recommend?',
'AWS for most projects - it has the broadest service offering and best documentation. We also work with GCP and Cloudflare Workers for specific use cases. The right choice depends on your technical requirements, compliance needs, and team expertise.'),

((SELECT id FROM faq_items WHERE slug = 'devops-kubernetes'), 'en',
'Do we need Kubernetes?',
'Probably not. Kubernetes adds operational complexity that many projects don''t need. We typically recommend simpler solutions (ECS, Cloud Run, or even well-configured EC2) unless you have specific requirements that justify Kubernetes overhead.'),

((SELECT id FROM faq_items WHERE slug = 'devops-cost'), 'en',
'How can we reduce our cloud costs?',
'Common optimizations include right-sizing instances, using reserved or spot instances, implementing auto-scaling, optimizing data transfer, and removing unused resources. We typically find 20-40% savings in existing AWS deployments.');

-- Consulting FAQs
INSERT OR IGNORE INTO faq_items (slug, category, sort_order, is_active) VALUES
('consulting-engagement', 'consulting', 1, 1),
('consulting-deliverables', 'consulting', 2, 1);

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'consulting-engagement'), 'en',
'How do consulting engagements typically work?',
'Most engagements start with a discovery phase (1-2 weeks) to understand your situation. Then we deliver recommendations, documentation, and often hands-on implementation support. Engagements can be fixed-scope projects or ongoing advisory relationships.'),

((SELECT id FROM faq_items WHERE slug = 'consulting-deliverables'), 'en',
'What deliverables do we receive from a consulting engagement?',
'Typical deliverables include architecture documentation, technology recommendations with rationale, implementation roadmaps, and often working prototypes or proof-of-concepts. Everything is documented so your team can execute independently.');

-- QA FAQs
INSERT OR IGNORE INTO faq_items (slug, category, sort_order, is_active) VALUES
('qa-automation-worth', 'qa-testing', 1, 1),
('qa-integration', 'qa-testing', 2, 1);

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'qa-automation-worth'), 'en',
'Is test automation worth the investment?',
'For applications that are actively developed and will be maintained long-term, yes. Automated tests catch regressions, enable confident refactoring, and speed up releases. The ROI typically becomes positive within 6-12 months for active projects.'),

((SELECT id FROM faq_items WHERE slug = 'qa-integration'), 'en',
'Can you integrate with our existing development team?',
'Yes. We can work as an extension of your team, participating in sprints, attending standups, and integrating with your tools and processes. Many clients prefer this model for ongoing QA support.');
