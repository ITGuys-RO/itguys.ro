-- French translations for FAQ items

-- Security FAQs
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'security-pentest-frequency'), 'fr',
'À quelle fréquence devons-nous faire des tests de pénétration ?',
'Au minimum une fois par an, plus après tout changement majeur de votre application ou infrastructure. Si vous gérez des paiements, des données de santé ou des informations financières, trimestriel c''est mieux. Et toujours avant un lancement important - vous ne voulez pas découvrir les vulnérabilités par vos utilisateurs.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'security-pentest-duration'), 'fr',
'Combien de temps dure un test de pénétration ?',
'La plupart des tests d''applications web prennent 1-2 semaines. Une API simple peut être faite en quelques jours. Les tests d''infrastructure complets peuvent prendre 3-4 semaines. On vous donnera un calendrier précis pendant le scoping une fois qu''on comprend ce qu''on teste.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'security-compliance'), 'fr',
'Pouvez-vous nous aider à obtenir la conformité SOC 2 ou ISO 27001 ?',
'Oui. On aide les entreprises à se préparer aux audits de conformité - identifier les lacunes, implémenter les contrôles, documenter les pratiques. On a guidé des équipes à travers SOC 2, ISO 27001, HIPAA et GDPR. Le processus est moins douloureux quand quelqu''un qui l''a déjà fait vous aide.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'security-cloud-audit'), 'fr',
'Que couvre un audit de sécurité cloud ?',
'Configurations IAM, sécurité réseau, paramètres de chiffrement, logging, monitoring, protection des données, et comment vous vous situez par rapport aux benchmarks CIS. Vous recevez une liste priorisée de ce qu''il faut corriger et comment.');

-- Web Development FAQs
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'web-timeline'), 'fr',
'Combien de temps faut-il pour construire une application web ?',
'Un MVP simple : 6-8 semaines. Un produit SaaS complet avec auth, facturation et vraies fonctionnalités : 3-6 mois. Applications enterprise avec intégrations complexes : plus longtemps. On peut donner une vraie estimation une fois qu''on comprend ce que vous construisez.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'web-technology-choice'), 'fr',
'Pourquoi utilisez-vous principalement React et Next.js ?',
'React a le plus grand écosystème, les meilleurs outils et le plus de développeurs qui le connaissent. Next.js ajoute le rendu côté serveur, les routes API et des optimisations de performance qui prendraient des mois à construire vous-même. Pour la plupart des projets, c''est le bon choix.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'web-maintenance'), 'fr',
'Proposez-vous une maintenance continue après le lancement ?',
'Oui. On propose des forfaits de maintenance - mises à jour de sécurité, corrections de bugs, monitoring de performance, nouvelles fonctionnalités. Beaucoup de clients commencent par un projet de construction et nous gardent pour du travail continu.');

-- Mobile Development FAQs
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'mobile-native-vs-cross'), 'fr',
'Pourquoi le développement natif plutôt que React Native ou Flutter ?',
'Les apps natives sont plus rapides et ont un accès complet aux fonctionnalités de la plateforme. Les frameworks cross-platform ajoutent de la complexité, et vous finissez souvent par écrire du code natif de toute façon pour les fonctions avancées. Si votre app doit paraître premium, le natif en vaut la peine.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'mobile-timeline'), 'fr',
'Combien de temps prend le développement d''une application mobile ?',
'Une app simple pour une plateforme : 2-3 mois. iOS et Android avec un backend partagé : 4-6 mois. Les apps avec support offline, fonctionnalités temps réel ou intégration hardware prennent plus longtemps. La complexité détermine le calendrier plus que le nombre de fonctionnalités.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'mobile-app-store'), 'fr',
'Gérez-vous la soumission sur l''App Store et le Play Store ?',
'Oui. On prépare les assets, on gère la soumission, on répond aux retours de review et on fait les modifications demandées par Apple ou Google. On a assez d''expérience pour savoir ce qui déclenche les rejets et comment les éviter.');

-- DevOps FAQs
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'devops-cloud-choice'), 'fr',
'Quel fournisseur cloud recommandez-vous ?',
'AWS pour la plupart des choses - le plus de services, la meilleure documentation. On utilise aussi GCP et Cloudflare Workers quand ils conviennent mieux. La bonne réponse dépend de ce que vous construisez, de vos besoins de conformité et de ce que votre équipe connaît déjà.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'devops-kubernetes'), 'fr',
'Avons-nous besoin de Kubernetes ?',
'Probablement pas. Kubernetes ajoute une charge opérationnelle dont la plupart des projets n''ont pas besoin. ECS, Cloud Run ou des instances EC2 bien configurées fonctionnent bien pour la plupart des workloads. On recommande Kubernetes seulement quand les besoins justifient vraiment la complexité.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'devops-cost'), 'fr',
'Comment pouvons-nous réduire nos coûts cloud ?',
'Dimensionnez correctement vos instances, utilisez des reserved ou spot instances où vous pouvez, configurez l''auto-scaling, optimisez le transfert de données et supprimez ce que vous n''utilisez pas. On trouve généralement 20-40% d''économies quand on audite des setups AWS existants.');

-- Consulting FAQs
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'consulting-engagement'), 'fr',
'Comment fonctionnent généralement les missions de consulting ?',
'Ça commence généralement par 1-2 semaines de discovery pour comprendre votre situation. Puis des recommandations, de la documentation et souvent de l''aide pratique pour implémenter les changements. Certaines missions sont des projets à périmètre fixe, d''autres deviennent des relations de conseil continues.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'consulting-deliverables'), 'fr',
'Quels livrables recevons-nous d''une mission de consulting ?',
'Documentation d''architecture, recommandations technologiques avec justification, roadmaps d''implémentation, parfois des prototypes fonctionnels. Tout documenté pour que votre équipe puisse continuer de manière indépendante.');

-- QA FAQs
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'qa-automation-worth'), 'fr',
'L''automatisation des tests vaut-elle l''investissement ?',
'Si vous développez activement l''app et prévoyez de la maintenir à long terme, oui. Les tests automatisés attrapent les régressions, vous permettent de refactorer sans peur et accélèrent les releases. La plupart des projets actifs voient un ROI positif en 6-12 mois.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'qa-integration'), 'fr',
'Pouvez-vous vous intégrer à notre équipe de développement existante ?',
'Oui. On peut rejoindre vos sprints, participer aux standups, utiliser vos outils. Beaucoup de clients aiment ce modèle - on est essentiellement une extension de leur équipe plutôt qu''un prestataire séparé.');
