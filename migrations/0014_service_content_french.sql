-- French translations for service long descriptions

-- Technical Consulting
UPDATE service_translations SET long_description = '## Comment nous travaillons vraiment

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

Des recommandations claires sur lesquelles vous pouvez agir. De la documentation que votre équipe utilisera vraiment. Un support de suivi pendant que vous implémentez les changements. Un accès direct à des ingénieurs qui ont résolu des problèmes similaires à grande échelle.' WHERE service_id = 1 AND locale = 'fr';

-- Security Services
UPDATE service_translations SET long_description = '## La sécurité par des gens qui ont été des deux côtés

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

Gaming - considérations anti-cheat, sécurité des comptes, protection de l''économie in-game. Voyage - conformité PCI, sécurité des systèmes de réservation, intégrations API. Santé - conformité HIPAA, protection PHI, logging d''audit. Finance - préparation SOC 2, sécurité des transactions, prévention de la fraude.' WHERE service_id = 2 AND locale = 'fr';

-- Big Data & Analytics
UPDATE service_translations SET long_description = '## Transformer les données en décisions

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

On est ingénieurs d''abord. On comprend comment les données sont générées, d''où viennent les problèmes de qualité, et comment construire des systèmes qui scalent. On ne fait pas juste des graphiques - on construit une infrastructure de données fiable.' WHERE service_id = 3 AND locale = 'fr';

-- QA & Testing Services
UPDATE service_translations SET long_description = '## Trouver les bugs avant vos utilisateurs

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

Plans de test et documentation des cas de test. Suites de tests automatisés avec docs de maintenance. Benchmarks de performance et recommandations. Rapports de bugs avec ratings de sévérité. Dashboards de métriques de test.' WHERE service_id = 4 AND locale = 'fr';

-- AI & Machine Learning
UPDATE service_translations SET long_description = '## L''IA qui marche en production

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

On est pragmatiques avec l''IA. On ne recommandera pas du deep learning quand une régression logistique suffit. On se concentre sur des solutions maintenables, explicables et qui font vraiment bouger vos métriques business.' WHERE service_id = 5 AND locale = 'fr';

-- Web Applications
UPDATE service_translations SET long_description = '## Des applis web qui tiennent sous la pression

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

Du code propre et maintenable avec documentation. Des pipelines de déploiement automatisés. Setup monitoring et alertes. Optimisation de performance. Bonnes pratiques de sécurité intégrées. Transfert de connaissances pour que votre équipe puisse maintenir.' WHERE service_id = 6 AND locale = 'fr';

-- Mobile Applications
UPDATE service_translations SET long_description = '## Apps mobiles natives

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

Apps santé (conformes HIPAA). IoT industriel (données capteurs en temps réel). E-commerce (transactions à fort volume). Voyage (exigences offline-first). Finance (critiques pour la sécurité).' WHERE service_id = 7 AND locale = 'fr';

-- DevOps & Cloud Infrastructure
UPDATE service_translations SET long_description = '## Infrastructure qui scale

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

Documentation d''architecture avec diagrammes. Repositories Infrastructure as Code. Dashboards de monitoring et alertes. Runbooks pour les opérations courantes. Revue et recommandations sécurité. Analyse et optimisation des coûts.' WHERE service_id = 8 AND locale = 'fr';

-- Backend, APIs & Integrations
UPDATE service_translations SET long_description = '## Des systèmes backend qui marchent

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

Des APIs bien documentées avec specs OpenAPI. Tests d''intégration et environnements de test. Configurations de déploiement et CI/CD. Monitoring et alertes. Benchmarks de performance. Documentation de revue sécurité.' WHERE service_id = 9 AND locale = 'fr';

-- Database Design & Management
UPDATE service_translations SET long_description = '## Des bases de données qui restent rapides

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

Diagrammes entité-relation et documentation du schéma. Analyse des requêtes et recommandations d''optimisation. Scripts de migration et procédures de rollback. Dashboards de monitoring pour la santé de la base de données. Runbooks de backup et recovery. Benchmarks et baselines de performance.' WHERE service_id = 10 AND locale = 'fr';
