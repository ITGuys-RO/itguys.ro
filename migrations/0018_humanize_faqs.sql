-- Humanized FAQ answers
-- Removes formulaic patterns, adds more direct voice

-- Security FAQs
UPDATE faq_translations SET answer = 'Once a year at minimum, plus after any major changes to your app or infrastructure. If you handle payments, health data, or financial information, quarterly is better. And always before a big launch - you don''t want to find out about vulnerabilities from your users.' WHERE faq_id = (SELECT id FROM faq_items WHERE slug = 'security-pentest-frequency') AND locale = 'en';

UPDATE faq_translations SET answer = 'Most web application tests take 1-2 weeks. A simple API might be done in a few days. Full infrastructure tests can run 3-4 weeks. We''ll give you a specific timeline during scoping once we understand what we''re testing.' WHERE faq_id = (SELECT id FROM faq_items WHERE slug = 'security-pentest-duration') AND locale = 'en';

UPDATE faq_translations SET answer = 'Yes. We help companies prepare for compliance audits - identifying gaps, implementing controls, documenting practices. We''ve guided teams through SOC 2, ISO 27001, HIPAA, and GDPR. The process is less painful when someone who''s done it before is helping.' WHERE faq_id = (SELECT id FROM faq_items WHERE slug = 'security-compliance') AND locale = 'en';

UPDATE faq_translations SET answer = 'IAM configurations, network security, encryption settings, logging, monitoring, data protection, and how you stack up against CIS benchmarks. You get a prioritized list of what to fix and how to fix it.' WHERE faq_id = (SELECT id FROM faq_items WHERE slug = 'security-cloud-audit') AND locale = 'en';

-- Web Development FAQs
UPDATE faq_translations SET answer = 'A simple MVP: 6-8 weeks. A full SaaS product with auth, billing, and real features: 3-6 months. Enterprise applications with complex integrations: longer. We can give you a real estimate once we understand what you''re building.' WHERE faq_id = (SELECT id FROM faq_items WHERE slug = 'web-timeline') AND locale = 'en';

UPDATE faq_translations SET answer = 'React has the biggest ecosystem, the best tooling, and the most developers who know it. Next.js adds server-side rendering, API routes, and performance optimizations that would take months to build yourself. For most projects, it''s the right choice.' WHERE faq_id = (SELECT id FROM faq_items WHERE slug = 'web-technology-choice') AND locale = 'en';

UPDATE faq_translations SET answer = 'Yes. We offer maintenance packages - security updates, bug fixes, performance monitoring, new features. A lot of clients start with a build project and keep us around for ongoing work.' WHERE faq_id = (SELECT id FROM faq_items WHERE slug = 'web-maintenance') AND locale = 'en';

-- Mobile Development FAQs
UPDATE faq_translations SET answer = 'Native apps are faster and have full access to platform features. Cross-platform frameworks like React Native add complexity, and you often end up writing native code anyway for anything advanced. If your app needs to feel polished, native is worth it.' WHERE faq_id = (SELECT id FROM faq_items WHERE slug = 'mobile-native-vs-cross') AND locale = 'en';

UPDATE faq_translations SET answer = 'A simple app for one platform: 2-3 months. Both iOS and Android with a shared backend: 4-6 months. Apps with offline support, real-time features, or hardware integration take longer. Complexity drives timeline more than feature count.' WHERE faq_id = (SELECT id FROM faq_items WHERE slug = 'mobile-timeline') AND locale = 'en';

UPDATE faq_translations SET answer = 'Yes. We prepare assets, handle submission, respond to review feedback, and make whatever changes Apple or Google ask for. We''ve been through the process enough times to know what triggers rejections and how to avoid them.' WHERE faq_id = (SELECT id FROM faq_items WHERE slug = 'mobile-app-store') AND locale = 'en';

-- DevOps FAQs
UPDATE faq_translations SET answer = 'AWS for most things - broadest services, best docs. We also use GCP and Cloudflare Workers when they''re a better fit. The right answer depends on what you''re building, what compliance you need, and what your team already knows.' WHERE faq_id = (SELECT id FROM faq_items WHERE slug = 'devops-cloud-choice') AND locale = 'en';

UPDATE faq_translations SET answer = 'Probably not. Kubernetes adds operational overhead that most projects don''t need. ECS, Cloud Run, or well-configured EC2 instances work fine for most workloads. We only recommend Kubernetes when the requirements actually justify the complexity.' WHERE faq_id = (SELECT id FROM faq_items WHERE slug = 'devops-kubernetes') AND locale = 'en';

UPDATE faq_translations SET answer = 'Right-size your instances, use reserved or spot instances where you can, set up auto-scaling, optimize data transfer, and delete things you''re not using. We usually find 20-40% savings when we audit existing AWS setups.' WHERE faq_id = (SELECT id FROM faq_items WHERE slug = 'devops-cost') AND locale = 'en';

-- Consulting FAQs
UPDATE faq_translations SET answer = 'Usually starts with 1-2 weeks of discovery to understand your situation. Then recommendations, documentation, and often hands-on help implementing changes. Some engagements are fixed-scope projects, others turn into ongoing advisory relationships.' WHERE faq_id = (SELECT id FROM faq_items WHERE slug = 'consulting-engagement') AND locale = 'en';

UPDATE faq_translations SET answer = 'Architecture docs, technology recommendations with reasoning, implementation roadmaps, sometimes working prototypes. Everything documented so your team can run with it independently.' WHERE faq_id = (SELECT id FROM faq_items WHERE slug = 'consulting-deliverables') AND locale = 'en';

-- QA FAQs
UPDATE faq_translations SET answer = 'If you''re actively developing the app and plan to maintain it long-term, yes. Automated tests catch regressions, let you refactor without fear, and speed up releases. Most active projects see positive ROI within 6-12 months.' WHERE faq_id = (SELECT id FROM faq_items WHERE slug = 'qa-automation-worth') AND locale = 'en';

UPDATE faq_translations SET answer = 'Yes. We can join your sprints, attend standups, use your tools. A lot of clients like this model - we''re basically an extension of their team rather than a separate vendor.' WHERE faq_id = (SELECT id FROM faq_items WHERE slug = 'qa-integration') AND locale = 'en';
