-- Translations for new FAQ categories (data-analytics, ai-ml, backend, database)
-- Locales: ro, fr, de, it, es

-- =============================================
-- ROMANIAN (ro)
-- =============================================

-- Data & Analytics
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'analytics-data-types'), 'ro',
'Ce tipuri de analiză de date oferiți?',
'Oferim dashboarduri de business intelligence, monitorizare în timp real, urmărirea performanței, analiză competitivă și soluții personalizate de raportare. Lucrăm cu instrumente precum Google Analytics, Mixpanel, Grafana și construim pipeline-uri de date adaptate nevoilor tale.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'analytics-integration'), 'ro',
'Puteți integra analytics în sistemele noastre existente?',
'Da, integrăm soluții de analytics în aplicațiile și infrastructura existentă. Fie că ai nevoie să adaugi tracking într-o aplicație web, să configurezi analytics pe server sau să construiești un data warehouse centralizat, lucrăm cu stack-ul tău actual.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'analytics-gdpr'), 'ro',
'Cum gestionați confidențialitatea datelor în analytics?',
'Implementăm analytics cu accent pe confidențialitate, conforme cu GDPR, CCPA și alte reglementări. Asta include anonimizarea, gestionarea consimțământului, politici de retenție a datelor și utilizarea instrumentelor prietenoase cu confidențialitatea atunci când e necesar.');

-- AI & Machine Learning
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'ai-ml-use-cases'), 'ro',
'Ce soluții de inteligență artificială și machine learning construiți?',
'Construim soluții AI personalizate, inclusiv procesarea limbajului natural, computer vision, motoare de recomandare, analiză predictivă și automatizare inteligentă. De asemenea, integrăm LLM-uri și AI generativ în aplicațiile existente.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'ai-ml-existing-data'), 'ro',
'Avem nevoie de multe date pentru a începe cu AI?',
'Nu neapărat. Pentru modele personalizate, datele de calitate ajută, dar multe soluții folosesc modele pre-antrenate și transfer learning care funcționează bine și cu seturi de date mai mici. Evaluăm situația ta și recomandăm abordarea cea mai practică.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'ai-ml-cost'), 'ro',
'Cât costă de obicei un proiect de AI?',
'Variază mult în funcție de complexitate. Integrările simple cu LLM-uri se pot face în câteva săptămâni, în timp ce modelele ML personalizate necesită mai mult timp pentru pregătirea datelor, antrenare și validare. Începem cu o fază de scoping pentru a-ți oferi o estimare realistă.');

-- Backend Development
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'backend-tech-stack'), 'ro',
'Cu ce tehnologii backend lucrați?',
'Ne specializăm în Node.js, TypeScript, Python și Go. Ca framework-uri, folosim Express, Fastify, NestJS și Django. Proiectăm API-uri RESTful, servicii GraphQL și arhitecturi event-driven în funcție de cerințele tale.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'backend-scalability'), 'ro',
'Cum asigurați scalabilitatea backend-ului?',
'Proiectăm pentru scalabilitate de la început, folosind arhitectură de microservicii, pattern-uri de scalare orizontală, strategii de caching și cozi de mesaje. Implementăm și teste de încărcare și monitorizare pentru a identifica bottleneck-urile înainte să afecteze utilizatorii.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'backend-existing-api'), 'ro',
'Puteți îmbunătăți performanța API-ului nostru existent?',
'Da, realizăm audituri de performanță API care acoperă optimizarea query-urilor de bază de date, caching, connection pooling și îmbunătățiri de arhitectură. Avem experiență în îmbunătățirea timpilor de răspuns și reducerea costurilor de infrastructură pentru sistemele existente.');

-- Database Solutions
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'database-choice'), 'ro',
'Cum alegeți baza de date potrivită pentru un proiect?',
'Evaluăm modelul de date, pattern-urile de interogare, cerințele de scalare și nevoile de consistență. Lucrăm cu PostgreSQL, MySQL, MongoDB, Redis, Elasticsearch și opțiuni cloud-native precum DynamoDB și Cloudflare D1. Alegerea corectă depinde de cazul tău specific de utilizare.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'database-migration'), 'ro',
'Ne puteți ajuta să migrăm baza de date la un sistem nou?',
'Da, gestionăm migrări de baze de date inclusiv reproiectarea schemei, transformarea datelor, strategii de migrare fără downtime și validare. Avem experiență în migrări între baze de date SQL, de la SQL la NoSQL și către servicii gestionate în cloud.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'database-optimization'), 'ro',
'Cum optimizați performanța bazei de date?',
'Analizăm query-urile lente, adăugăm indexare corespunzătoare, implementăm connection pooling, configurăm replici de citire și proiectăm straturi de caching. De asemenea, revizuim designul schemei și pattern-urile de acces la date pentru a ne asigura că baza de date scalează odată cu aplicația ta.');

-- =============================================
-- FRENCH (fr)
-- =============================================

-- Data & Analytics
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'analytics-data-types'), 'fr',
'Quels types d''analyse de données proposez-vous ?',
'Nous proposons des tableaux de bord de business intelligence, une surveillance en temps réel, le suivi des performances, l''analyse concurrentielle et des solutions de reporting personnalisées. Nous travaillons avec des outils comme Google Analytics, Mixpanel, Grafana et construisons des pipelines de données adaptés à vos besoins.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'analytics-integration'), 'fr',
'Pouvez-vous intégrer l''analytics dans nos systèmes existants ?',
'Oui, nous intégrons des solutions d''analytics dans les applications et l''infrastructure existantes. Que vous ayez besoin d''ajouter du tracking à une application web, de configurer de l''analytics côté serveur ou de construire un entrepôt de données centralisé, nous travaillons avec votre stack actuel.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'analytics-gdpr'), 'fr',
'Comment gérez-vous la confidentialité des données en analytics ?',
'Nous mettons en place des solutions d''analytics axées sur la confidentialité, conformes au RGPD, au CCPA et aux autres réglementations. Cela inclut l''anonymisation, la gestion du consentement, les politiques de conservation des données et l''utilisation d''outils respectueux de la vie privée si nécessaire.');

-- AI & Machine Learning
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'ai-ml-use-cases'), 'fr',
'Quelles solutions d''IA et de machine learning développez-vous ?',
'Nous développons des solutions d''IA sur mesure incluant le traitement du langage naturel, la vision par ordinateur, les moteurs de recommandation, l''analyse prédictive et l''automatisation intelligente. Nous intégrons également des LLM et de l''IA générative dans les applications existantes.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'ai-ml-existing-data'), 'fr',
'Faut-il beaucoup de données pour commencer avec l''IA ?',
'Pas nécessairement. Pour les modèles personnalisés, des données de qualité sont utiles, mais de nombreuses solutions utilisent des modèles pré-entraînés et le transfer learning qui fonctionnent bien avec des jeux de données plus petits. Nous évaluons votre situation et recommandons l''approche la plus pratique.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'ai-ml-cost'), 'fr',
'Combien coûte généralement un projet d''IA ?',
'Cela varie considérablement selon la complexité. Les intégrations simples de LLM peuvent être réalisées en quelques semaines, tandis que les modèles ML personnalisés nécessitent plus de temps pour la préparation des données, l''entraînement et la validation. Nous commençons par une phase de cadrage pour vous donner une estimation réaliste.');

-- Backend Development
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'backend-tech-stack'), 'fr',
'Avec quelles technologies backend travaillez-vous ?',
'Nous sommes spécialisés en Node.js, TypeScript, Python et Go. Côté frameworks, nous utilisons Express, Fastify, NestJS et Django. Nous concevons des API RESTful, des services GraphQL et des architectures événementielles selon vos besoins.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'backend-scalability'), 'fr',
'Comment assurez-vous la scalabilité du backend ?',
'Nous concevons pour la scalabilité dès le départ en utilisant une architecture de microservices, des patterns de mise à l''échelle horizontale, des stratégies de cache et des files de messages. Nous mettons également en place des tests de charge et une surveillance pour identifier les goulots d''étranglement avant qu''ils n''affectent les utilisateurs.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'backend-existing-api'), 'fr',
'Pouvez-vous améliorer les performances de notre API existante ?',
'Oui, nous réalisons des audits de performance d''API couvrant l''optimisation des requêtes de base de données, le cache, le connection pooling et les améliorations architecturales. Nous avons l''expérience d''améliorer les temps de réponse et de réduire les coûts d''infrastructure pour les systèmes existants.');

-- Database Solutions
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'database-choice'), 'fr',
'Comment choisissez-vous la bonne base de données pour un projet ?',
'Nous évaluons votre modèle de données, vos patterns de requêtes, vos besoins en scalabilité et vos exigences de cohérence. Nous travaillons avec PostgreSQL, MySQL, MongoDB, Redis, Elasticsearch et des options cloud-natives comme DynamoDB et Cloudflare D1. Le bon choix dépend de votre cas d''utilisation spécifique.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'database-migration'), 'fr',
'Pouvez-vous nous aider à migrer notre base de données vers un nouveau système ?',
'Oui, nous gérons les migrations de bases de données incluant la refonte du schéma, la transformation des données, les stratégies de migration sans interruption et la validation. Nous avons l''expérience des migrations entre bases SQL, du SQL vers le NoSQL et vers des services managés dans le cloud.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'database-optimization'), 'fr',
'Comment optimisez-vous les performances de la base de données ?',
'Nous analysons les requêtes lentes, ajoutons une indexation appropriée, mettons en place le connection pooling, configurons des réplicas de lecture et concevons des couches de cache. Nous révisons également la conception du schéma et les patterns d''accès aux données pour garantir que votre base de données évolue avec votre application.');

-- =============================================
-- GERMAN (de)
-- =============================================

-- Data & Analytics
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'analytics-data-types'), 'de',
'Welche Arten von Datenanalyse bieten Sie an?',
'Wir bieten Business-Intelligence-Dashboards, Echtzeit-Monitoring, Performance-Tracking, Wettbewerbsanalysen und maßgeschneiderte Reporting-Lösungen. Wir arbeiten mit Tools wie Google Analytics, Mixpanel, Grafana und entwickeln individuelle Datenpipelines, die auf Ihre Bedürfnisse zugeschnitten sind.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'analytics-integration'), 'de',
'Können Sie Analytics in unsere bestehenden Systeme integrieren?',
'Ja, wir integrieren Analytics-Lösungen in bestehende Anwendungen und Infrastrukturen. Ob Sie Tracking in eine Webanwendung einbauen, serverseitige Analytics einrichten oder ein zentrales Data Warehouse aufbauen möchten – wir arbeiten mit Ihrem bestehenden Stack.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'analytics-gdpr'), 'de',
'Wie gehen Sie mit Datenschutz bei Analytics um?',
'Wir implementieren datenschutzorientierte Analytics, die DSGVO, CCPA und anderen Vorschriften entsprechen. Dazu gehören Anonymisierung, Consent-Management, Datenaufbewahrungsrichtlinien und der Einsatz datenschutzfreundlicher Tools, wenn nötig.');

-- AI & Machine Learning
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'ai-ml-use-cases'), 'de',
'Welche KI- und Machine-Learning-Lösungen entwickeln Sie?',
'Wir entwickeln maßgeschneiderte KI-Lösungen einschließlich natürlicher Sprachverarbeitung, Computer Vision, Empfehlungssysteme, prädiktiver Analytik und intelligenter Automatisierung. Außerdem integrieren wir LLMs und generative KI in bestehende Anwendungen.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'ai-ml-existing-data'), 'de',
'Brauchen wir viele Daten, um mit KI zu starten?',
'Nicht unbedingt. Für individuelle Modelle sind qualitativ hochwertige Daten hilfreich, aber viele Lösungen nutzen vortrainierte Modelle und Transfer Learning, die auch mit kleineren Datensätzen gut funktionieren. Wir bewerten Ihre Datenlage und empfehlen den praktischsten Ansatz.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'ai-ml-cost'), 'de',
'Was kostet ein KI-Projekt in der Regel?',
'Das variiert stark je nach Komplexität. Einfache LLM-Integrationen können in wenigen Wochen umgesetzt werden, während individuelle ML-Modelle mehr Zeit für Datenaufbereitung, Training und Validierung benötigen. Wir beginnen mit einer Scoping-Phase, um Ihnen eine realistische Schätzung zu geben.');

-- Backend Development
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'backend-tech-stack'), 'de',
'Mit welchen Backend-Technologien arbeiten Sie?',
'Wir sind spezialisiert auf Node.js, TypeScript, Python und Go. Als Frameworks nutzen wir Express, Fastify, NestJS und Django. Wir entwerfen RESTful APIs, GraphQL-Services und ereignisgesteuerte Architekturen je nach Ihren Anforderungen.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'backend-scalability'), 'de',
'Wie stellen Sie die Skalierbarkeit des Backends sicher?',
'Wir planen Skalierbarkeit von Anfang an mit Microservices-Architektur, horizontalen Skalierungsmustern, Caching-Strategien und Message Queues. Zusätzlich implementieren wir Lasttests und Monitoring, um Engpässe zu erkennen, bevor sie die Nutzer betreffen.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'backend-existing-api'), 'de',
'Können Sie die Performance unserer bestehenden API verbessern?',
'Ja, wir führen API-Performance-Audits durch, die Datenbankabfrage-Optimierung, Caching, Connection Pooling und architektonische Verbesserungen umfassen. Wir haben Erfahrung darin, Antwortzeiten zu verbessern und Infrastrukturkosten für bestehende Systeme zu senken.');

-- Database Solutions
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'database-choice'), 'de',
'Wie wählen Sie die richtige Datenbank für ein Projekt?',
'Wir bewerten Ihr Datenmodell, Abfragemuster, Skalierungsanforderungen und Konsistenzansprüche. Wir arbeiten mit PostgreSQL, MySQL, MongoDB, Redis, Elasticsearch und Cloud-nativen Optionen wie DynamoDB und Cloudflare D1. Die richtige Wahl hängt von Ihrem konkreten Anwendungsfall ab.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'database-migration'), 'de',
'Können Sie uns bei der Migration unserer Datenbank auf ein neues System helfen?',
'Ja, wir übernehmen Datenbankmigrationen einschließlich Schema-Neugestaltung, Datentransformation, Zero-Downtime-Migrationsstrategien und Validierung. Wir haben Erfahrung mit Migrationen zwischen SQL-Datenbanken, von SQL zu NoSQL und zu Cloud-Managed-Services.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'database-optimization'), 'de',
'Wie optimieren Sie die Datenbankperformance?',
'Wir analysieren langsame Abfragen, fügen geeignete Indizes hinzu, implementieren Connection Pooling, richten Read Replicas ein und entwerfen Caching-Schichten. Außerdem überprüfen wir das Schema-Design und die Datenzugriffsmuster, um sicherzustellen, dass Ihre Datenbank mit Ihrer Anwendung skaliert.');

-- =============================================
-- ITALIAN (it)
-- =============================================

-- Data & Analytics
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'analytics-data-types'), 'it',
'Quali tipi di analisi dei dati offrite?',
'Offriamo dashboard di business intelligence, monitoraggio in tempo reale, tracciamento delle prestazioni, analisi competitiva e soluzioni di reportistica personalizzate. Lavoriamo con strumenti come Google Analytics, Mixpanel, Grafana e costruiamo pipeline di dati su misura per le vostre esigenze.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'analytics-integration'), 'it',
'Potete integrare l''analytics nei nostri sistemi esistenti?',
'Sì, integriamo soluzioni di analytics nelle applicazioni e nell''infrastruttura esistenti. Che abbiate bisogno di aggiungere il tracking a un''applicazione web, configurare analytics lato server o costruire un data warehouse centralizzato, lavoriamo con il vostro stack attuale.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'analytics-gdpr'), 'it',
'Come gestite la privacy dei dati nell''analytics?',
'Implementiamo soluzioni di analytics incentrate sulla privacy, conformi al GDPR, CCPA e altre normative. Questo include anonimizzazione, gestione del consenso, politiche di conservazione dei dati e l''utilizzo di strumenti rispettosi della privacy quando necessario.');

-- AI & Machine Learning
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'ai-ml-use-cases'), 'it',
'Quali soluzioni di intelligenza artificiale e machine learning sviluppate?',
'Sviluppiamo soluzioni AI personalizzate tra cui elaborazione del linguaggio naturale, computer vision, motori di raccomandazione, analisi predittiva e automazione intelligente. Integriamo inoltre LLM e AI generativa nelle applicazioni esistenti.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'ai-ml-existing-data'), 'it',
'Servono molti dati per iniziare con l''AI?',
'Non necessariamente. Per i modelli personalizzati, dati di qualità sono utili, ma molte soluzioni utilizzano modelli pre-addestrati e transfer learning che funzionano bene anche con dataset più piccoli. Valutiamo la vostra situazione e raccomandiamo l''approccio più pratico.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'ai-ml-cost'), 'it',
'Quanto costa tipicamente un progetto di AI?',
'Varia molto in base alla complessità. Le integrazioni semplici con LLM possono essere completate in poche settimane, mentre i modelli ML personalizzati richiedono più tempo per la preparazione dei dati, l''addestramento e la validazione. Iniziamo con una fase di scoping per darvi una stima realistica.');

-- Backend Development
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'backend-tech-stack'), 'it',
'Con quali tecnologie backend lavorate?',
'Siamo specializzati in Node.js, TypeScript, Python e Go. Come framework utilizziamo Express, Fastify, NestJS e Django. Progettiamo API RESTful, servizi GraphQL e architetture event-driven in base alle vostre esigenze.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'backend-scalability'), 'it',
'Come garantite la scalabilità del backend?',
'Progettiamo per la scalabilità fin dall''inizio utilizzando architettura a microservizi, pattern di scalabilità orizzontale, strategie di caching e code di messaggi. Implementiamo inoltre test di carico e monitoraggio per identificare i colli di bottiglia prima che influenzino gli utenti.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'backend-existing-api'), 'it',
'Potete migliorare le prestazioni della nostra API esistente?',
'Sì, conduciamo audit delle prestazioni API che coprono ottimizzazione delle query del database, caching, connection pooling e miglioramenti architetturali. Abbiamo esperienza nel migliorare i tempi di risposta e ridurre i costi infrastrutturali per i sistemi esistenti.');

-- Database Solutions
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'database-choice'), 'it',
'Come scegliete il database giusto per un progetto?',
'Valutiamo il vostro modello dati, i pattern delle query, i requisiti di scalabilità e le esigenze di consistenza. Lavoriamo con PostgreSQL, MySQL, MongoDB, Redis, Elasticsearch e opzioni cloud-native come DynamoDB e Cloudflare D1. La scelta giusta dipende dal vostro caso d''uso specifico.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'database-migration'), 'it',
'Potete aiutarci a migrare il nostro database a un nuovo sistema?',
'Sì, gestiamo migrazioni di database inclusa la riprogettazione dello schema, la trasformazione dei dati, strategie di migrazione senza downtime e validazione. Abbiamo esperienza nelle migrazioni tra database SQL, da SQL a NoSQL e verso servizi gestiti nel cloud.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'database-optimization'), 'it',
'Come ottimizzate le prestazioni del database?',
'Analizziamo le query lente, aggiungiamo indicizzazione appropriata, implementiamo connection pooling, configuriamo repliche di lettura e progettiamo livelli di caching. Rivediamo inoltre il design dello schema e i pattern di accesso ai dati per assicurare che il vostro database scali con la vostra applicazione.');

-- =============================================
-- SPANISH (es)
-- =============================================

-- Data & Analytics
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'analytics-data-types'), 'es',
'¿Qué tipos de análisis de datos ofrecen?',
'Ofrecemos dashboards de business intelligence, monitorización en tiempo real, seguimiento del rendimiento, análisis competitivo y soluciones de reporting personalizadas. Trabajamos con herramientas como Google Analytics, Mixpanel, Grafana y construimos pipelines de datos adaptados a sus necesidades.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'analytics-integration'), 'es',
'¿Pueden integrar analytics en nuestros sistemas existentes?',
'Sí, integramos soluciones de analytics en aplicaciones e infraestructura existentes. Ya sea que necesite añadir tracking a una aplicación web, configurar analytics del lado del servidor o construir un data warehouse centralizado, trabajamos con su stack actual.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'analytics-gdpr'), 'es',
'¿Cómo manejan la privacidad de datos en analytics?',
'Implementamos soluciones de analytics centradas en la privacidad, conformes con GDPR, CCPA y otras regulaciones. Esto incluye anonimización, gestión del consentimiento, políticas de retención de datos y el uso de herramientas respetuosas con la privacidad cuando es necesario.');

-- AI & Machine Learning
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'ai-ml-use-cases'), 'es',
'¿Qué soluciones de inteligencia artificial y machine learning desarrollan?',
'Desarrollamos soluciones de IA personalizadas que incluyen procesamiento del lenguaje natural, visión por computadora, motores de recomendación, análisis predictivo y automatización inteligente. También integramos LLMs e IA generativa en aplicaciones existentes.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'ai-ml-existing-data'), 'es',
'¿Necesitamos muchos datos para empezar con IA?',
'No necesariamente. Para modelos personalizados, los datos de calidad ayudan, pero muchas soluciones usan modelos pre-entrenados y transfer learning que funcionan bien con conjuntos de datos más pequeños. Evaluamos su situación y recomendamos el enfoque más práctico.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'ai-ml-cost'), 'es',
'¿Cuánto cuesta normalmente un proyecto de IA?',
'Varía mucho según la complejidad. Las integraciones simples de LLM se pueden hacer en pocas semanas, mientras que los modelos ML personalizados requieren más tiempo para la preparación de datos, entrenamiento y validación. Comenzamos con una fase de alcance para darle una estimación realista.');

-- Backend Development
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'backend-tech-stack'), 'es',
'¿Con qué tecnologías backend trabajan?',
'Nos especializamos en Node.js, TypeScript, Python y Go. Como frameworks, usamos Express, Fastify, NestJS y Django. Diseñamos APIs RESTful, servicios GraphQL y arquitecturas orientadas a eventos según sus requisitos.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'backend-scalability'), 'es',
'¿Cómo aseguran la escalabilidad del backend?',
'Diseñamos para la escalabilidad desde el inicio usando arquitectura de microservicios, patrones de escalado horizontal, estrategias de caché y colas de mensajes. También implementamos pruebas de carga y monitorización para identificar cuellos de botella antes de que afecten a los usuarios.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'backend-existing-api'), 'es',
'¿Pueden mejorar el rendimiento de nuestra API existente?',
'Sí, realizamos auditorías de rendimiento de API que cubren optimización de consultas de base de datos, caché, connection pooling y mejoras arquitectónicas. Tenemos experiencia mejorando tiempos de respuesta y reduciendo costes de infraestructura para sistemas existentes.');

-- Database Solutions
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'database-choice'), 'es',
'¿Cómo eligen la base de datos adecuada para un proyecto?',
'Evaluamos su modelo de datos, patrones de consulta, requisitos de escalabilidad y necesidades de consistencia. Trabajamos con PostgreSQL, MySQL, MongoDB, Redis, Elasticsearch y opciones cloud-native como DynamoDB y Cloudflare D1. La elección correcta depende de su caso de uso específico.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'database-migration'), 'es',
'¿Pueden ayudarnos a migrar nuestra base de datos a un nuevo sistema?',
'Sí, gestionamos migraciones de bases de datos incluyendo rediseño de esquema, transformación de datos, estrategias de migración sin tiempo de inactividad y validación. Tenemos experiencia migrando entre bases de datos SQL, de SQL a NoSQL y a servicios gestionados en la nube.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'database-optimization'), 'es',
'¿Cómo optimizan el rendimiento de la base de datos?',
'Analizamos consultas lentas, añadimos indexación adecuada, implementamos connection pooling, configuramos réplicas de lectura y diseñamos capas de caché. También revisamos el diseño del esquema y los patrones de acceso a datos para asegurar que su base de datos escale con su aplicación.');
