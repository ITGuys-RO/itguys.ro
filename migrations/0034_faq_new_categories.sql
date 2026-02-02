-- FAQ entries for service categories that don't have any yet

-- Data & Analytics (category: data-analytics)
INSERT OR IGNORE INTO faq_items (slug, category, sort_order, is_active) VALUES
('analytics-data-types', 'data-analytics', 1, 1);
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'analytics-data-types'), 'en',
'What types of data analytics do you offer?',
'We provide business intelligence dashboards, real-time monitoring, performance tracking, competitive analysis, and custom reporting solutions. We work with tools like Google Analytics, Mixpanel, Grafana, and build custom data pipelines tailored to your needs.');

INSERT OR IGNORE INTO faq_items (slug, category, sort_order, is_active) VALUES
('analytics-integration', 'data-analytics', 2, 1);
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'analytics-integration'), 'en',
'Can you integrate analytics into our existing systems?',
'Yes, we integrate analytics solutions into existing applications and infrastructure. Whether you need to add tracking to a web app, set up server-side analytics, or build a centralized data warehouse, we work with your current stack.');

INSERT OR IGNORE INTO faq_items (slug, category, sort_order, is_active) VALUES
('analytics-gdpr', 'data-analytics', 3, 1);
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'analytics-gdpr'), 'en',
'How do you handle data privacy in analytics?',
'We implement privacy-first analytics that comply with GDPR, CCPA, and other regulations. This includes anonymization, consent management, data retention policies, and using privacy-friendly tools when needed.');

-- AI & Machine Learning (category: ai-ml)
INSERT OR IGNORE INTO faq_items (slug, category, sort_order, is_active) VALUES
('ai-ml-use-cases', 'ai-ml', 1, 1);
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'ai-ml-use-cases'), 'en',
'What AI and machine learning solutions do you build?',
'We build custom AI solutions including natural language processing, computer vision, recommendation engines, predictive analytics, and intelligent automation. We also integrate LLMs and generative AI into existing applications.');

INSERT OR IGNORE INTO faq_items (slug, category, sort_order, is_active) VALUES
('ai-ml-existing-data', 'ai-ml', 2, 1);
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'ai-ml-existing-data'), 'en',
'Do we need a lot of data to start with AI?',
'Not necessarily. For custom models, quality data helps, but many solutions use pre-trained models and transfer learning that work well with smaller datasets. We assess your data situation and recommend the most practical approach.');

INSERT OR IGNORE INTO faq_items (slug, category, sort_order, is_active) VALUES
('ai-ml-cost', 'ai-ml', 3, 1);
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'ai-ml-cost'), 'en',
'How much does an AI project typically cost?',
'It varies widely depending on complexity. Simple LLM integrations can be done in weeks, while custom ML models require more time for data preparation, training, and validation. We start with a scoping phase to give you a realistic estimate.');

-- Backend Development (category: backend)
INSERT OR IGNORE INTO faq_items (slug, category, sort_order, is_active) VALUES
('backend-tech-stack', 'backend', 1, 1);
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'backend-tech-stack'), 'en',
'What backend technologies do you work with?',
'We specialize in Node.js, TypeScript, Python, and Go. For frameworks, we use Express, Fastify, NestJS, and Django. We design RESTful APIs, GraphQL services, and event-driven architectures depending on your requirements.');

INSERT OR IGNORE INTO faq_items (slug, category, sort_order, is_active) VALUES
('backend-scalability', 'backend', 2, 1);
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'backend-scalability'), 'en',
'How do you ensure backend scalability?',
'We design for scalability from the start using microservices architecture, horizontal scaling patterns, caching strategies, and message queues. We also implement load testing and monitoring to identify bottlenecks before they affect users.');

INSERT OR IGNORE INTO faq_items (slug, category, sort_order, is_active) VALUES
('backend-existing-api', 'backend', 3, 1);
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'backend-existing-api'), 'en',
'Can you improve our existing API performance?',
'Yes, we conduct API performance audits covering database query optimization, caching, connection pooling, and architectural improvements. We have experience improving response times and reducing infrastructure costs for existing systems.');

-- Database Solutions (category: database)
INSERT OR IGNORE INTO faq_items (slug, category, sort_order, is_active) VALUES
('database-choice', 'database', 1, 1);
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'database-choice'), 'en',
'How do you choose the right database for a project?',
'We evaluate your data model, query patterns, scale requirements, and consistency needs. We work with PostgreSQL, MySQL, MongoDB, Redis, Elasticsearch, and cloud-native options like DynamoDB and Cloudflare D1. The right choice depends on your specific use case.');

INSERT OR IGNORE INTO faq_items (slug, category, sort_order, is_active) VALUES
('database-migration', 'database', 2, 1);
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'database-migration'), 'en',
'Can you help migrate our database to a new system?',
'Yes, we handle database migrations including schema redesign, data transformation, zero-downtime migration strategies, and validation. We have experience migrating between SQL databases, from SQL to NoSQL, and to cloud-managed services.');

INSERT OR IGNORE INTO faq_items (slug, category, sort_order, is_active) VALUES
('database-optimization', 'database', 3, 1);
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'database-optimization'), 'en',
'How do you optimize database performance?',
'We analyze slow queries, add proper indexing, implement connection pooling, set up read replicas, and design caching layers. We also review schema design and data access patterns to ensure your database scales with your application.');
