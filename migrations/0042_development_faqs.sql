-- Add development-focused FAQs to balance SEO content
-- 3 web-applications, 3 cloud, 3 backend

-- === FAQ Items ===
-- Web Applications FAQs
INSERT OR IGNORE INTO faq_items (id, slug, category, sort_order, is_active, created_at, updated_at)
VALUES (51, 'web-tech-stack', 'web-applications', 3, 1, datetime('now'), datetime('now'));
INSERT OR IGNORE INTO faq_items (id, slug, category, sort_order, is_active, created_at, updated_at)
VALUES (52, 'web-app-scaling', 'web-applications', 4, 1, datetime('now'), datetime('now'));
INSERT OR IGNORE INTO faq_items (id, slug, category, sort_order, is_active, created_at, updated_at)
VALUES (53, 'web-system-integration', 'web-applications', 5, 1, datetime('now'), datetime('now'));

-- Cloud FAQs
INSERT OR IGNORE INTO faq_items (id, slug, category, sort_order, is_active, created_at, updated_at)
VALUES (54, 'cloud-provider-support', 'cloud', 3, 1, datetime('now'), datetime('now'));
INSERT OR IGNORE INTO faq_items (id, slug, category, sort_order, is_active, created_at, updated_at)
VALUES (55, 'cicd-setup', 'cloud', 4, 1, datetime('now'), datetime('now'));
INSERT OR IGNORE INTO faq_items (id, slug, category, sort_order, is_active, created_at, updated_at)
VALUES (56, 'cloud-migration-help', 'cloud', 5, 1, datetime('now'), datetime('now'));

-- Backend FAQs
INSERT OR IGNORE INTO faq_items (id, slug, category, sort_order, is_active, created_at, updated_at)
VALUES (57, 'rest-vs-graphql', 'backend', 3, 1, datetime('now'), datetime('now'));
INSERT OR IGNORE INTO faq_items (id, slug, category, sort_order, is_active, created_at, updated_at)
VALUES (58, 'api-security-auth', 'backend', 4, 1, datetime('now'), datetime('now'));
INSERT OR IGNORE INTO faq_items (id, slug, category, sort_order, is_active, created_at, updated_at)
VALUES (59, 'payment-integrations', 'backend', 5, 1, datetime('now'), datetime('now'));

-- === English translations ===
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (282, 51, 'en', 'What technologies do you use for web application development?',
'We work across the modern web stack. For frontend, we build with React, Vue, and Next.js. Backend work includes PHP (Laravel, Symfony), Node.js, and Python. We choose tools based on your project needs, not our preferences. If you have an existing stack, we can work with that too.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (283, 52, 'en', 'How do you handle web application scaling for high traffic?',
'We design for scale from the start. This includes caching strategies (Redis, CDN), database optimization, horizontal scaling with load balancers, and queue-based processing for heavy workloads. We''ve built systems handling millions of requests for travel and gaming companies.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (284, 53, 'en', 'Can you integrate with existing systems and third-party APIs?',
'Yes, integrations are a core part of what we do. We connect web applications to CRMs, ERPs, payment gateways, shipping providers, and custom internal systems. We handle authentication, error handling, and data mapping to make integrations reliable.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (285, 54, 'en', 'Do you work with AWS, Google Cloud, or Azure?',
'We work primarily with AWS, which covers most use cases well. We also support Google Cloud and Azure when clients have existing investments or specific requirements. Our expertise spans compute, storage, networking, and managed services across all major providers.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (286, 55, 'en', 'How do you set up CI/CD pipelines?',
'We use GitHub Actions, GitLab CI, or Jenkins depending on your setup. A typical pipeline includes automated testing, security scanning, building Docker images, and deploying to staging and production environments. We aim for deployments that take minutes, not hours.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (287, 56, 'en', 'Can you help migrate existing applications to the cloud?',
'Yes. We assess your current infrastructure, plan the migration path, and execute the move with minimal downtime. This can range from lift-and-shift to full re-architecture depending on your goals and budget. We''ve migrated monoliths, databases, and entire platforms.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (288, 57, 'en', 'Do you build REST APIs or GraphQL APIs?',
'Both. REST is our default for most projects because it''s simpler and well-understood. GraphQL makes sense when clients need flexibility in data fetching or when you have many different consumers. We''ll recommend the right approach based on your specific situation.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (289, 58, 'en', 'How do you ensure API security and authentication?',
'We implement industry-standard authentication with OAuth 2.0, JWT tokens, and API keys where appropriate. Every API includes rate limiting, input validation, and proper error handling. Our security background means we think about attack vectors from the start.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (290, 59, 'en', 'Can you integrate with payment gateways and third-party services?',
'Yes. We''ve integrated Stripe, PayPal, Adyen, and various regional payment providers. Beyond payments, we connect to shipping APIs, CRMs like Salesforce and HubSpot, accounting systems, and custom enterprise software. We handle the complexity so your team doesn''t have to.');

-- === Romanian translations ===
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (291, 51, 'ro', 'Ce tehnologii folosiți pentru dezvoltarea aplicațiilor web?',
'Lucrăm cu tot stack-ul web modern. Pentru frontend, construim cu React, Vue și Next.js. Pentru backend, folosim PHP (Laravel, Symfony), Node.js și Python. Alegem uneltele în funcție de nevoile proiectului tău, nu de preferințele noastre. Dacă ai deja un stack, putem lucra și cu acela.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (292, 52, 'ro', 'Cum gestionați scalarea aplicațiilor web pentru trafic mare?',
'Proiectăm pentru scalabilitate de la început. Asta include strategii de caching (Redis, CDN), optimizare bază de date, scalare orizontală cu load balancers și procesare bazată pe cozi pentru sarcini grele. Am construit sisteme care gestionează milioane de cereri pentru companii de turism și gaming.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (293, 53, 'ro', 'Puteți integra cu sisteme existente și API-uri terțe?',
'Da, integrările sunt o parte esențială din ceea ce facem. Conectăm aplicații web la CRM-uri, ERP-uri, gateway-uri de plăți, furnizori de livrare și sisteme interne personalizate. Ne ocupăm de autentificare, gestionarea erorilor și maparea datelor pentru a face integrările fiabile.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (294, 54, 'ro', 'Lucrați cu AWS, Google Cloud sau Azure?',
'Lucrăm în principal cu AWS, care acoperă bine majoritatea cazurilor de utilizare. Suportăm și Google Cloud și Azure când clienții au investiții existente sau cerințe specifice. Expertiza noastră acoperă compute, stocare, rețele și servicii gestionate pe toți furnizorii majori.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (295, 55, 'ro', 'Cum configurați pipeline-urile CI/CD?',
'Folosim GitHub Actions, GitLab CI sau Jenkins în funcție de setup-ul tău. Un pipeline tipic include testare automată, scanare de securitate, construirea imaginilor Docker și deployment în mediile de staging și producție. Țintim deployment-uri care durează minute, nu ore.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (296, 56, 'ro', 'Puteți ajuta la migrarea aplicațiilor existente în cloud?',
'Da. Evaluăm infrastructura ta actuală, planificăm calea de migrare și executăm mutarea cu downtime minim. Poate varia de la lift-and-shift la re-arhitecturare completă, în funcție de obiectivele și bugetul tău. Am migrat monoliți, baze de date și platforme întregi.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (297, 57, 'ro', 'Construiți API-uri REST sau GraphQL?',
'Ambele. REST este alegerea noastră implicită pentru majoritatea proiectelor pentru că e mai simplu și bine înțeles. GraphQL are sens când clienții au nevoie de flexibilitate în obținerea datelor sau când ai mulți consumatori diferiți. Vom recomanda abordarea potrivită pe baza situației tale specifice.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (298, 58, 'ro', 'Cum asigurați securitatea și autentificarea API-urilor?',
'Implementăm autentificare standard cu OAuth 2.0, token-uri JWT și chei API unde e cazul. Fiecare API include rate limiting, validare input și gestionare corectă a erorilor. Background-ul nostru în securitate înseamnă că ne gândim la vectorii de atac de la început.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (299, 59, 'ro', 'Puteți integra cu gateway-uri de plăți și servicii terțe?',
'Da. Am integrat Stripe, PayPal, Adyen și diverși furnizori regionali de plăți. Dincolo de plăți, conectăm la API-uri de livrare, CRM-uri precum Salesforce și HubSpot, sisteme de contabilitate și software enterprise personalizat. Gestionăm complexitatea ca echipa ta să nu fie nevoită.');

-- === French translations ===
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (300, 51, 'fr', 'Quelles technologies utilisez-vous pour le développement d''applications web ?',
'Nous travaillons avec toute la stack web moderne. Pour le frontend, nous construisons avec React, Vue et Next.js. Le backend inclut PHP (Laravel, Symfony), Node.js et Python. Nous choisissons les outils en fonction des besoins de votre projet, pas de nos préférences. Si vous avez déjà une stack, nous pouvons aussi travailler avec.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (301, 52, 'fr', 'Comment gérez-vous la mise à l''échelle des applications web pour un trafic élevé ?',
'Nous concevons pour la mise à l''échelle dès le départ. Cela inclut des stratégies de mise en cache (Redis, CDN), l''optimisation de la base de données, la mise à l''échelle horizontale avec des load balancers et le traitement basé sur les files d''attente pour les charges lourdes. Nous avons construit des systèmes gérant des millions de requêtes pour des entreprises de voyage et de jeux.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (302, 53, 'fr', 'Pouvez-vous intégrer des systèmes existants et des API tierces ?',
'Oui, les intégrations sont au cœur de ce que nous faisons. Nous connectons les applications web aux CRM, ERP, passerelles de paiement, transporteurs et systèmes internes personnalisés. Nous gérons l''authentification, la gestion des erreurs et le mapping des données pour rendre les intégrations fiables.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (303, 54, 'fr', 'Travaillez-vous avec AWS, Google Cloud ou Azure ?',
'Nous travaillons principalement avec AWS, qui couvre bien la plupart des cas d''utilisation. Nous supportons également Google Cloud et Azure lorsque les clients ont des investissements existants ou des exigences spécifiques. Notre expertise couvre le calcul, le stockage, le réseau et les services gérés sur tous les principaux fournisseurs.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (304, 55, 'fr', 'Comment configurez-vous les pipelines CI/CD ?',
'Nous utilisons GitHub Actions, GitLab CI ou Jenkins selon votre configuration. Un pipeline typique inclut les tests automatisés, l''analyse de sécurité, la construction d''images Docker et le déploiement vers les environnements de staging et production. Nous visons des déploiements qui prennent des minutes, pas des heures.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (305, 56, 'fr', 'Pouvez-vous aider à migrer des applications existantes vers le cloud ?',
'Oui. Nous évaluons votre infrastructure actuelle, planifions le chemin de migration et exécutons le déménagement avec un temps d''arrêt minimal. Cela peut aller du lift-and-shift à une ré-architecture complète selon vos objectifs et votre budget. Nous avons migré des monolithes, des bases de données et des plateformes entières.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (306, 57, 'fr', 'Construisez-vous des API REST ou GraphQL ?',
'Les deux. REST est notre choix par défaut pour la plupart des projets car c''est plus simple et bien compris. GraphQL a du sens quand les clients ont besoin de flexibilité dans la récupération des données ou quand vous avez beaucoup de consommateurs différents. Nous recommanderons la bonne approche selon votre situation spécifique.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (307, 58, 'fr', 'Comment assurez-vous la sécurité et l''authentification des API ?',
'Nous implémentons une authentification standard avec OAuth 2.0, tokens JWT et clés API où c''est approprié. Chaque API inclut la limitation de débit, la validation des entrées et une gestion correcte des erreurs. Notre expérience en sécurité signifie que nous pensons aux vecteurs d''attaque dès le départ.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (308, 59, 'fr', 'Pouvez-vous intégrer des passerelles de paiement et des services tiers ?',
'Oui. Nous avons intégré Stripe, PayPal, Adyen et divers fournisseurs de paiement régionaux. Au-delà des paiements, nous connectons aux API de livraison, CRM comme Salesforce et HubSpot, systèmes de comptabilité et logiciels d''entreprise personnalisés. Nous gérons la complexité pour que votre équipe n''ait pas à le faire.');

-- === German translations ===
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (309, 51, 'de', 'Welche Technologien verwenden Sie für die Entwicklung von Webanwendungen?',
'Wir arbeiten mit dem gesamten modernen Web-Stack. Für das Frontend bauen wir mit React, Vue und Next.js. Backend-Arbeit umfasst PHP (Laravel, Symfony), Node.js und Python. Wir wählen Tools basierend auf Ihren Projektanforderungen, nicht unseren Vorlieben. Wenn Sie bereits einen Stack haben, können wir auch damit arbeiten.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (310, 52, 'de', 'Wie handhaben Sie die Skalierung von Webanwendungen für hohen Traffic?',
'Wir entwerfen von Anfang an für Skalierung. Das umfasst Caching-Strategien (Redis, CDN), Datenbankoptimierung, horizontale Skalierung mit Load Balancern und warteschlangenbasierte Verarbeitung für schwere Lasten. Wir haben Systeme gebaut, die Millionen von Anfragen für Reise- und Gaming-Unternehmen verarbeiten.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (311, 53, 'de', 'Können Sie mit bestehenden Systemen und Drittanbieter-APIs integrieren?',
'Ja, Integrationen sind ein Kernbestandteil unserer Arbeit. Wir verbinden Webanwendungen mit CRMs, ERPs, Zahlungs-Gateways, Versanddienstleistern und kundenspezifischen internen Systemen. Wir kümmern uns um Authentifizierung, Fehlerbehandlung und Datenmapping, um Integrationen zuverlässig zu machen.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (312, 54, 'de', 'Arbeiten Sie mit AWS, Google Cloud oder Azure?',
'Wir arbeiten hauptsächlich mit AWS, das die meisten Anwendungsfälle gut abdeckt. Wir unterstützen auch Google Cloud und Azure, wenn Kunden bestehende Investitionen oder spezifische Anforderungen haben. Unsere Expertise umfasst Compute, Speicher, Netzwerk und verwaltete Dienste bei allen großen Anbietern.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (313, 55, 'de', 'Wie richten Sie CI/CD-Pipelines ein?',
'Wir verwenden GitHub Actions, GitLab CI oder Jenkins je nach Ihrem Setup. Eine typische Pipeline umfasst automatisierte Tests, Sicherheitsscans, das Erstellen von Docker-Images und das Deployment in Staging- und Produktionsumgebungen. Wir zielen auf Deployments, die Minuten dauern, nicht Stunden.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (314, 56, 'de', 'Können Sie bei der Migration bestehender Anwendungen in die Cloud helfen?',
'Ja. Wir bewerten Ihre aktuelle Infrastruktur, planen den Migrationspfad und führen den Umzug mit minimaler Ausfallzeit durch. Das kann von Lift-and-Shift bis zur vollständigen Re-Architektur reichen, je nach Ihren Zielen und Ihrem Budget. Wir haben Monolithen, Datenbanken und ganze Plattformen migriert.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (315, 57, 'de', 'Bauen Sie REST-APIs oder GraphQL-APIs?',
'Beides. REST ist unsere Standardwahl für die meisten Projekte, weil es einfacher und gut verstanden ist. GraphQL macht Sinn, wenn Clients Flexibilität beim Datenabruf brauchen oder wenn Sie viele verschiedene Konsumenten haben. Wir empfehlen den richtigen Ansatz basierend auf Ihrer spezifischen Situation.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (316, 58, 'de', 'Wie gewährleisten Sie API-Sicherheit und Authentifizierung?',
'Wir implementieren branchenübliche Authentifizierung mit OAuth 2.0, JWT-Tokens und API-Keys wo angebracht. Jede API enthält Rate Limiting, Input-Validierung und ordnungsgemäße Fehlerbehandlung. Unser Sicherheitshintergrund bedeutet, dass wir von Anfang an an Angriffsvektoren denken.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (317, 59, 'de', 'Können Sie mit Zahlungs-Gateways und Drittanbieterdiensten integrieren?',
'Ja. Wir haben Stripe, PayPal, Adyen und verschiedene regionale Zahlungsanbieter integriert. Über Zahlungen hinaus verbinden wir mit Versand-APIs, CRMs wie Salesforce und HubSpot, Buchhaltungssystemen und kundenspezifischer Unternehmenssoftware. Wir handhaben die Komplexität, damit Ihr Team es nicht muss.');

-- === Italian translations ===
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (318, 51, 'it', 'Quali tecnologie utilizzate per lo sviluppo di applicazioni web?',
'Lavoriamo con tutto lo stack web moderno. Per il frontend, costruiamo con React, Vue e Next.js. Il backend include PHP (Laravel, Symfony), Node.js e Python. Scegliamo gli strumenti in base alle esigenze del tuo progetto, non alle nostre preferenze. Se hai già uno stack, possiamo lavorare anche con quello.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (319, 52, 'it', 'Come gestite la scalabilità delle applicazioni web per alto traffico?',
'Progettiamo per la scalabilità fin dall''inizio. Questo include strategie di caching (Redis, CDN), ottimizzazione del database, scalabilità orizzontale con load balancer ed elaborazione basata su code per carichi pesanti. Abbiamo costruito sistemi che gestiscono milioni di richieste per aziende di viaggi e gaming.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (320, 53, 'it', 'Potete integrare con sistemi esistenti e API di terze parti?',
'Sì, le integrazioni sono una parte fondamentale di ciò che facciamo. Colleghiamo applicazioni web a CRM, ERP, gateway di pagamento, corrieri e sistemi interni personalizzati. Gestiamo autenticazione, gestione degli errori e mapping dei dati per rendere le integrazioni affidabili.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (321, 54, 'it', 'Lavorate con AWS, Google Cloud o Azure?',
'Lavoriamo principalmente con AWS, che copre bene la maggior parte dei casi d''uso. Supportiamo anche Google Cloud e Azure quando i clienti hanno investimenti esistenti o requisiti specifici. La nostra esperienza copre compute, storage, networking e servizi gestiti su tutti i principali provider.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (322, 55, 'it', 'Come configurate le pipeline CI/CD?',
'Usiamo GitHub Actions, GitLab CI o Jenkins a seconda del tuo setup. Una pipeline tipica include test automatizzati, scansione di sicurezza, costruzione di immagini Docker e deployment negli ambienti di staging e produzione. Puntiamo a deployment che richiedono minuti, non ore.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (323, 56, 'it', 'Potete aiutare a migrare applicazioni esistenti nel cloud?',
'Sì. Valutiamo la tua infrastruttura attuale, pianifichiamo il percorso di migrazione ed eseguiamo lo spostamento con tempi di inattività minimi. Può variare da lift-and-shift a ri-architettura completa a seconda dei tuoi obiettivi e budget. Abbiamo migrato monoliti, database e intere piattaforme.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (324, 57, 'it', 'Costruite API REST o GraphQL?',
'Entrambe. REST è la nostra scelta predefinita per la maggior parte dei progetti perché è più semplice e ben compreso. GraphQL ha senso quando i client hanno bisogno di flessibilità nel recupero dei dati o quando hai molti consumatori diversi. Raccomanderemo l''approccio giusto in base alla tua situazione specifica.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (325, 58, 'it', 'Come garantite la sicurezza e l''autenticazione delle API?',
'Implementiamo autenticazione standard con OAuth 2.0, token JWT e chiavi API dove appropriato. Ogni API include rate limiting, validazione degli input e gestione corretta degli errori. Il nostro background nella sicurezza significa che pensiamo ai vettori di attacco fin dall''inizio.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (326, 59, 'it', 'Potete integrare con gateway di pagamento e servizi di terze parti?',
'Sì. Abbiamo integrato Stripe, PayPal, Adyen e vari fornitori di pagamento regionali. Oltre ai pagamenti, ci colleghiamo ad API di spedizione, CRM come Salesforce e HubSpot, sistemi di contabilità e software aziendale personalizzato. Gestiamo la complessità in modo che il tuo team non debba farlo.');

-- === Spanish translations ===
INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (327, 51, 'es', 'Que tecnologias utilizan para el desarrollo de aplicaciones web?',
'Trabajamos con todo el stack web moderno. Para frontend, construimos con React, Vue y Next.js. El backend incluye PHP (Laravel, Symfony), Node.js y Python. Elegimos herramientas basadas en las necesidades de tu proyecto, no en nuestras preferencias. Si ya tienes un stack, tambien podemos trabajar con el.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (328, 52, 'es', 'Como manejan la escalabilidad de aplicaciones web para alto trafico?',
'Disenamos para escalar desde el principio. Esto incluye estrategias de cache (Redis, CDN), optimizacion de base de datos, escalado horizontal con balanceadores de carga y procesamiento basado en colas para cargas pesadas. Hemos construido sistemas que manejan millones de solicitudes para empresas de viajes y gaming.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (329, 53, 'es', 'Pueden integrar con sistemas existentes y APIs de terceros?',
'Si, las integraciones son una parte fundamental de lo que hacemos. Conectamos aplicaciones web a CRMs, ERPs, pasarelas de pago, proveedores de envio y sistemas internos personalizados. Manejamos autenticacion, manejo de errores y mapeo de datos para hacer las integraciones confiables.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (330, 54, 'es', 'Trabajan con AWS, Google Cloud o Azure?',
'Trabajamos principalmente con AWS, que cubre bien la mayoria de los casos de uso. Tambien soportamos Google Cloud y Azure cuando los clientes tienen inversiones existentes o requisitos especificos. Nuestra experiencia abarca computo, almacenamiento, redes y servicios gestionados en todos los principales proveedores.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (331, 55, 'es', 'Como configuran los pipelines CI/CD?',
'Usamos GitHub Actions, GitLab CI o Jenkins dependiendo de tu configuracion. Un pipeline tipico incluye pruebas automatizadas, escaneo de seguridad, construccion de imagenes Docker y deployment a entornos de staging y produccion. Apuntamos a deployments que toman minutos, no horas.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (332, 56, 'es', 'Pueden ayudar a migrar aplicaciones existentes a la nube?',
'Si. Evaluamos tu infraestructura actual, planificamos la ruta de migracion y ejecutamos el traslado con tiempo de inactividad minimo. Puede variar desde lift-and-shift hasta re-arquitectura completa dependiendo de tus objetivos y presupuesto. Hemos migrado monolitos, bases de datos y plataformas enteras.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (333, 57, 'es', 'Construyen APIs REST o GraphQL?',
'Ambas. REST es nuestra opcion predeterminada para la mayoria de los proyectos porque es mas simple y bien entendido. GraphQL tiene sentido cuando los clientes necesitan flexibilidad en la obtencion de datos o cuando tienes muchos consumidores diferentes. Recomendaremos el enfoque correcto basado en tu situacion especifica.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (334, 58, 'es', 'Como aseguran la seguridad y autenticacion de las APIs?',
'Implementamos autenticacion estandar con OAuth 2.0, tokens JWT y claves API donde sea apropiado. Cada API incluye limitacion de tasa, validacion de entrada y manejo adecuado de errores. Nuestro background en seguridad significa que pensamos en vectores de ataque desde el principio.');

INSERT OR IGNORE INTO faq_translations (id, faq_id, locale, question, answer)
VALUES (335, 59, 'es', 'Pueden integrar con pasarelas de pago y servicios de terceros?',
'Si. Hemos integrado Stripe, PayPal, Adyen y varios proveedores de pago regionales. Mas alla de los pagos, conectamos con APIs de envio, CRMs como Salesforce y HubSpot, sistemas de contabilidad y software empresarial personalizado. Manejamos la complejidad para que tu equipo no tenga que hacerlo.');
