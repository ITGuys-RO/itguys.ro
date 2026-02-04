-- Add subservices for development services that were missing them
-- Web Applications (service_id=6), Cloud/DevOps (service_id=8), Backend/APIs (service_id=9)

-- === Web Applications subservices (service_id=6) ===
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (351, 6, 'progressive-web-apps', 0);
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (352, 6, 'single-page-applications', 1);
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (353, 6, 'ecommerce-platforms', 2);
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (354, 6, 'realtime-applications', 3);

-- === Cloud/DevOps subservices (service_id=8) ===
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (355, 8, 'aws-infrastructure', 0);
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (356, 8, 'docker-containers', 1);
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (357, 8, 'cicd-pipelines', 2);
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (358, 8, 'kubernetes-orchestration', 3);

-- === Backend/APIs subservices (service_id=9) ===
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (359, 9, 'rest-api-development', 0);
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (360, 9, 'graphql-implementation', 1);
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (361, 9, 'microservices-architecture', 2);
INSERT OR IGNORE INTO subservices (id, service_id, slug, sort_order) VALUES (362, 9, 'third-party-integrations', 3);

-- === English translations ===
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (351, 351, 'en', 'Progressive Web Apps', 'Installable web apps with offline support, push notifications, and native-like performance. The best of web and mobile.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (352, 352, 'en', 'Single Page Applications', 'Fast, fluid interfaces with React, Vue, or Angular. Client-side routing, state management, and optimized bundles.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (353, 353, 'en', 'E-commerce Platforms', 'Custom shopping experiences, payment integrations, inventory management. From Shopify customization to fully custom solutions.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (354, 354, 'en', 'Real-time Applications', 'WebSocket-based apps for live collaboration, chat, notifications, and streaming data. Built to scale.');

INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (355, 355, 'en', 'AWS Infrastructure', 'EC2, Lambda, RDS, S3, and more. We design and deploy scalable, cost-effective AWS architectures.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (356, 356, 'en', 'Docker & Containers', 'Containerized applications for consistent environments across development, staging, and production.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (357, 357, 'en', 'CI/CD Pipelines', 'Automated build, test, and deployment pipelines with GitHub Actions, GitLab CI, or Jenkins.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (358, 358, 'en', 'Kubernetes Orchestration', 'Container orchestration for complex deployments. Auto-scaling, load balancing, and zero-downtime updates.');

INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (359, 359, 'en', 'REST API Development', 'Clean, well-documented REST APIs following best practices. Versioning, pagination, error handling done right.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (360, 360, 'en', 'GraphQL Implementation', 'Flexible APIs that let clients request exactly what they need. Subscriptions for real-time updates.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (361, 361, 'en', 'Microservices Architecture', 'Breaking monoliths into manageable services. Event-driven communication, service discovery, distributed tracing.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (362, 362, 'en', 'Third-Party Integrations', 'Payment gateways, CRMs, ERPs, shipping providers. We connect your systems to the services you need.');

-- === Romanian translations ===
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (363, 351, 'ro', 'Aplicații Web Progresive', 'Aplicații web instalabile cu suport offline, notificări push și performanță nativă. Ce e mai bun din web și mobil.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (364, 352, 'ro', 'Aplicații Single Page', 'Interfețe rapide și fluide cu React, Vue sau Angular. Rutare client-side, gestionarea stării și bundle-uri optimizate.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (365, 353, 'ro', 'Platforme E-commerce', 'Experiențe personalizate de cumpărături, integrări de plăți, gestionarea stocurilor. De la personalizare Shopify la soluții complet custom.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (366, 354, 'ro', 'Aplicații în Timp Real', 'Aplicații bazate pe WebSocket pentru colaborare live, chat, notificări și streaming de date. Construite să scaleze.');

INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (367, 355, 'ro', 'Infrastructură AWS', 'EC2, Lambda, RDS, S3 și multe altele. Proiectăm și implementăm arhitecturi AWS scalabile și eficiente din punct de vedere al costurilor.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (368, 356, 'ro', 'Docker și Containere', 'Aplicații containerizate pentru medii consistente în development, staging și producție.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (369, 357, 'ro', 'Pipeline-uri CI/CD', 'Pipeline-uri automatizate de build, test și deployment cu GitHub Actions, GitLab CI sau Jenkins.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (370, 358, 'ro', 'Orchestrare Kubernetes', 'Orchestrare de containere pentru deployment-uri complexe. Auto-scaling, load balancing și actualizări fără downtime.');

INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (371, 359, 'ro', 'Dezvoltare API REST', 'API-uri REST curate și bine documentate, urmând best practices. Versionare, paginare, gestionarea erorilor făcute cum trebuie.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (372, 360, 'ro', 'Implementare GraphQL', 'API-uri flexibile care permit clienților să ceară exact ce au nevoie. Subscripții pentru actualizări în timp real.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (373, 361, 'ro', 'Arhitectură Microservicii', 'Transformarea monoliturilor în servicii gestionabile. Comunicare event-driven, service discovery, distributed tracing.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (374, 362, 'ro', 'Integrări Terțe', 'Gateway-uri de plăți, CRM-uri, ERP-uri, furnizori de livrare. Conectăm sistemele tale la serviciile de care ai nevoie.');

-- === French translations ===
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (375, 351, 'fr', 'Applications Web Progressives', 'Applications web installables avec support hors ligne, notifications push et performances natives. Le meilleur du web et du mobile.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (376, 352, 'fr', 'Applications Monopage', 'Interfaces rapides et fluides avec React, Vue ou Angular. Routage côté client, gestion d''état et bundles optimisés.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (377, 353, 'fr', 'Plateformes E-commerce', 'Expériences d''achat personnalisées, intégrations de paiement, gestion des stocks. De la personnalisation Shopify aux solutions entièrement sur mesure.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (378, 354, 'fr', 'Applications Temps Réel', 'Applications basées sur WebSocket pour la collaboration en direct, le chat, les notifications et le streaming de données. Conçues pour évoluer.');

INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (379, 355, 'fr', 'Infrastructure AWS', 'EC2, Lambda, RDS, S3 et plus encore. Nous concevons et déployons des architectures AWS évolutives et rentables.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (380, 356, 'fr', 'Docker et Conteneurs', 'Applications conteneurisées pour des environnements cohérents en développement, staging et production.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (381, 357, 'fr', 'Pipelines CI/CD', 'Pipelines automatisés de build, test et déploiement avec GitHub Actions, GitLab CI ou Jenkins.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (382, 358, 'fr', 'Orchestration Kubernetes', 'Orchestration de conteneurs pour les déploiements complexes. Auto-scaling, répartition de charge et mises à jour sans interruption.');

INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (383, 359, 'fr', 'Développement API REST', 'API REST propres et bien documentées suivant les meilleures pratiques. Versionnage, pagination, gestion des erreurs bien faits.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (384, 360, 'fr', 'Implémentation GraphQL', 'API flexibles permettant aux clients de demander exactement ce dont ils ont besoin. Subscriptions pour les mises à jour en temps réel.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (385, 361, 'fr', 'Architecture Microservices', 'Transformation des monolithes en services gérables. Communication événementielle, découverte de services, traçage distribué.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (386, 362, 'fr', 'Intégrations Tierces', 'Passerelles de paiement, CRM, ERP, transporteurs. Nous connectons vos systèmes aux services dont vous avez besoin.');

-- === German translations ===
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (387, 351, 'de', 'Progressive Web Apps', 'Installierbare Web-Apps mit Offline-Unterstützung, Push-Benachrichtigungen und nativer Leistung. Das Beste aus Web und Mobile.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (388, 352, 'de', 'Single Page Applications', 'Schnelle, flüssige Oberflächen mit React, Vue oder Angular. Client-seitiges Routing, State-Management und optimierte Bundles.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (389, 353, 'de', 'E-Commerce-Plattformen', 'Individuelle Einkaufserlebnisse, Zahlungsintegrationen, Bestandsverwaltung. Von Shopify-Anpassung bis zu vollständig maßgeschneiderten Lösungen.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (390, 354, 'de', 'Echtzeit-Anwendungen', 'WebSocket-basierte Apps für Live-Zusammenarbeit, Chat, Benachrichtigungen und Daten-Streaming. Gebaut für Skalierung.');

INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (391, 355, 'de', 'AWS-Infrastruktur', 'EC2, Lambda, RDS, S3 und mehr. Wir entwerfen und implementieren skalierbare, kosteneffiziente AWS-Architekturen.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (392, 356, 'de', 'Docker und Container', 'Containerisierte Anwendungen für konsistente Umgebungen in Entwicklung, Staging und Produktion.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (393, 357, 'de', 'CI/CD-Pipelines', 'Automatisierte Build-, Test- und Deployment-Pipelines mit GitHub Actions, GitLab CI oder Jenkins.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (394, 358, 'de', 'Kubernetes-Orchestrierung', 'Container-Orchestrierung für komplexe Deployments. Auto-Scaling, Load Balancing und Updates ohne Ausfallzeit.');

INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (395, 359, 'de', 'REST-API-Entwicklung', 'Saubere, gut dokumentierte REST-APIs nach Best Practices. Versionierung, Pagination, Fehlerbehandlung richtig gemacht.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (396, 360, 'de', 'GraphQL-Implementierung', 'Flexible APIs, die Clients erlauben, genau das anzufordern, was sie brauchen. Subscriptions für Echtzeit-Updates.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (397, 361, 'de', 'Microservices-Architektur', 'Monolithen in verwaltbare Services aufteilen. Event-driven Kommunikation, Service Discovery, Distributed Tracing.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (398, 362, 'de', 'Drittanbieter-Integrationen', 'Zahlungs-Gateways, CRMs, ERPs, Versanddienstleister. Wir verbinden Ihre Systeme mit den Services, die Sie brauchen.');

-- === Italian translations ===
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (399, 351, 'it', 'Progressive Web App', 'App web installabili con supporto offline, notifiche push e prestazioni native. Il meglio di web e mobile.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (400, 352, 'it', 'Single Page Application', 'Interfacce veloci e fluide con React, Vue o Angular. Routing lato client, gestione dello stato e bundle ottimizzati.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (401, 353, 'it', 'Piattaforme E-commerce', 'Esperienze di acquisto personalizzate, integrazioni di pagamento, gestione dell''inventario. Dalla personalizzazione Shopify a soluzioni completamente custom.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (402, 354, 'it', 'Applicazioni in Tempo Reale', 'App basate su WebSocket per collaborazione live, chat, notifiche e streaming dati. Costruite per scalare.');

INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (403, 355, 'it', 'Infrastruttura AWS', 'EC2, Lambda, RDS, S3 e altro. Progettiamo e implementiamo architetture AWS scalabili e convenienti.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (404, 356, 'it', 'Docker e Container', 'Applicazioni containerizzate per ambienti consistenti in sviluppo, staging e produzione.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (405, 357, 'it', 'Pipeline CI/CD', 'Pipeline automatizzate di build, test e deployment con GitHub Actions, GitLab CI o Jenkins.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (406, 358, 'it', 'Orchestrazione Kubernetes', 'Orchestrazione di container per deployment complessi. Auto-scaling, load balancing e aggiornamenti senza downtime.');

INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (407, 359, 'it', 'Sviluppo API REST', 'API REST pulite e ben documentate seguendo le best practice. Versionamento, paginazione, gestione errori fatta bene.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (408, 360, 'it', 'Implementazione GraphQL', 'API flessibili che permettono ai client di richiedere esattamente ciò di cui hanno bisogno. Subscription per aggiornamenti in tempo reale.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (409, 361, 'it', 'Architettura Microservizi', 'Trasformare monoliti in servizi gestibili. Comunicazione event-driven, service discovery, distributed tracing.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (410, 362, 'it', 'Integrazioni di Terze Parti', 'Gateway di pagamento, CRM, ERP, corrieri. Colleghiamo i tuoi sistemi ai servizi di cui hai bisogno.');

-- === Spanish translations ===
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (411, 351, 'es', 'Aplicaciones Web Progresivas', 'Apps web instalables con soporte offline, notificaciones push y rendimiento nativo. Lo mejor de web y móvil.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (412, 352, 'es', 'Aplicaciones de Página Única', 'Interfaces rápidas y fluidas con React, Vue o Angular. Enrutamiento del lado del cliente, gestión de estado y bundles optimizados.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (413, 353, 'es', 'Plataformas E-commerce', 'Experiencias de compra personalizadas, integraciones de pago, gestión de inventario. Desde personalización de Shopify hasta soluciones completamente custom.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (414, 354, 'es', 'Aplicaciones en Tiempo Real', 'Apps basadas en WebSocket para colaboración en vivo, chat, notificaciones y streaming de datos. Construidas para escalar.');

INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (415, 355, 'es', 'Infraestructura AWS', 'EC2, Lambda, RDS, S3 y más. Diseñamos e implementamos arquitecturas AWS escalables y rentables.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (416, 356, 'es', 'Docker y Contenedores', 'Aplicaciones containerizadas para entornos consistentes en desarrollo, staging y producción.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (417, 357, 'es', 'Pipelines CI/CD', 'Pipelines automatizados de build, test y deployment con GitHub Actions, GitLab CI o Jenkins.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (418, 358, 'es', 'Orquestación Kubernetes', 'Orquestación de contenedores para deployments complejos. Auto-scaling, balanceo de carga y actualizaciones sin tiempo de inactividad.');

INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (419, 359, 'es', 'Desarrollo de API REST', 'APIs REST limpias y bien documentadas siguiendo mejores prácticas. Versionado, paginación, manejo de errores bien hechos.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (420, 360, 'es', 'Implementación GraphQL', 'APIs flexibles que permiten a los clientes solicitar exactamente lo que necesitan. Suscripciones para actualizaciones en tiempo real.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (421, 361, 'es', 'Arquitectura de Microservicios', 'Transformar monolitos en servicios manejables. Comunicación basada en eventos, descubrimiento de servicios, trazado distribuido.');
INSERT OR IGNORE INTO subservice_translations (id, subservice_id, locale, title, description) VALUES (422, 362, 'es', 'Integraciones de Terceros', 'Pasarelas de pago, CRMs, ERPs, proveedores de envío. Conectamos tus sistemas a los servicios que necesitas.');
