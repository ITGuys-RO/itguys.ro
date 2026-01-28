-- German translations for service long descriptions

-- Technical Consulting
UPDATE service_translations SET long_description = '## Wie wir wirklich arbeiten

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

Klare Empfehlungen, auf die Sie handeln können. Dokumentation, die Ihr Team tatsächlich nutzen wird. Follow-up-Support, während Sie Änderungen implementieren. Direkter Zugang zu Ingenieuren, die ähnliche Probleme im großen Maßstab gelöst haben.' WHERE service_id = 1 AND locale = 'de';

-- Security Services
UPDATE service_translations SET long_description = '## Sicherheit von Leuten, die auf beiden Seiten waren

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

Gaming - Anti-Cheat-Überlegungen, Kontosicherheit, In-Game-Economy-Schutz. Reise - PCI-Compliance, Buchungssystem-Sicherheit, API-Integrationen. Gesundheitswesen - HIPAA-Compliance, PHI-Schutz, Audit-Logging. Finanzen - SOC 2-Vorbereitung, Transaktionssicherheit, Betrugsprävention.' WHERE service_id = 2 AND locale = 'de';

-- Big Data & Analytics
UPDATE service_translations SET long_description = '## Daten in Entscheidungen verwandeln

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

Wir sind zuerst Ingenieure. Wir verstehen, wie Daten generiert werden, woher Qualitätsprobleme kommen und wie man Systeme baut, die skalieren. Wir machen nicht nur Grafiken - wir bauen zuverlässige Dateninfrastruktur.' WHERE service_id = 3 AND locale = 'de';

-- QA & Testing Services
UPDATE service_translations SET long_description = '## Bugs finden, bevor Ihre Nutzer sie finden

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

Testpläne und Testfall-Dokumentation. Automatisierte Test-Suites mit Wartungsdokumentation. Performance-Benchmarks und Empfehlungen. Bug-Reports mit Schweregrad-Bewertungen. Testing-Metriken-Dashboards.' WHERE service_id = 4 AND locale = 'de';

-- AI & Machine Learning
UPDATE service_translations SET long_description = '## KI, die in Produktion funktioniert

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

Wir sind pragmatisch mit KI. Wir empfehlen kein Deep Learning, wenn logistische Regression reicht. Wir konzentrieren uns auf Lösungen, die wartbar und erklärbar sind und Ihre Business-Metriken wirklich bewegen.' WHERE service_id = 5 AND locale = 'de';

-- Web Applications
UPDATE service_translations SET long_description = '## Webanwendungen, die unter Druck funktionieren

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

Sauberer, wartbarer Code mit Dokumentation. Automatisierte Deployment-Pipelines. Monitoring- und Alerting-Setup. Performance-Optimierung. Security Best Practices eingebaut. Wissenstransfer, damit Ihr Team es warten kann.' WHERE service_id = 6 AND locale = 'de';

-- Mobile Applications
UPDATE service_translations SET long_description = '## Native mobile Apps

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

Healthcare-Apps (HIPAA-konform). Industrielles IoT (Echtzeit-Sensordaten). E-Commerce (Hochvolumen-Transaktionen). Reise (Offline-first-Anforderungen). Finanzen (sicherheitskritisch).' WHERE service_id = 7 AND locale = 'de';

-- DevOps & Cloud Infrastructure
UPDATE service_translations SET long_description = '## Infrastruktur, die skaliert

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

Architekturdokumentation mit Diagrammen. Infrastructure-as-Code-Repositories. Monitoring-Dashboards und Alerting. Runbooks für häufige Operationen. Security Review und Empfehlungen. Kostenanalyse und -optimierung.' WHERE service_id = 8 AND locale = 'de';

-- Backend, APIs & Integrations
UPDATE service_translations SET long_description = '## Backend-Systeme, die funktionieren

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

Gut dokumentierte APIs mit OpenAPI-Specs. Integrationstests und Testumgebungen. Deployment-Konfigurationen und CI/CD. Monitoring und Alerting. Performance-Benchmarks. Security-Review-Dokumentation.' WHERE service_id = 9 AND locale = 'de';

-- Database Design & Management
UPDATE service_translations SET long_description = '## Datenbanken, die schnell bleiben

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

Entity-Relationship-Diagramme und Schema-Dokumentation. Query-Analyse und Optimierungsempfehlungen. Migrationsskripte und Rollback-Prozeduren. Monitoring-Dashboards für Datenbankgesundheit. Backup- und Recovery-Runbooks. Performance-Benchmarks und Baselines.' WHERE service_id = 10 AND locale = 'de';
