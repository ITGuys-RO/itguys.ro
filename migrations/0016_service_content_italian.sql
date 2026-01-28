-- Italian translations for service long descriptions

-- Technical Consulting
UPDATE service_translations SET long_description = '## Come lavoriamo davvero

Ogni raccomandazione che facciamo viene dalla nostra esperienza nel costruire e scalare sistemi presso EA, TUI e Nagarro. Non framework di cui abbiamo letto - cose che abbiamo consegnato.

### Il processo

Iniziamo capendo la vostra situazione. Cosa state costruendo? Quali vincoli esistono? Cosa ha funzionato prima, e cosa no? Questo plasma tutto ciò che segue.

Poi guardiamo i vostri sistemi. Identifichiamo i colli di bottiglia, mappiamo le dipendenze e vi diamo un''immagine chiara di dove siete. Nessuna sorpresa.

Da lì, creiamo un piano prioritizzato. Non un documento di 100 pagine che resta sullo scaffale - passi concreti con risultati chiari.

### Problemi che vediamo regolarmente

La maggior parte delle aziende con cui lavoriamo è bloccata su uno di questi:

Hanno troppe opzioni tecnologiche e non abbastanza chiarezza sui compromessi. Hanno costruito qualcosa che funzionava a 1.000 utenti ma fatica a 100.000. Le soluzioni rapide sono diventate problemi permanenti e ora il codice è un casino. I loro processi e strumenti rallentano le consegne invece di aiutare. O hanno preso decisioni architetturali anni fa che ora creano vulnerabilità di sicurezza.

### Chi ci assume

CTO al primo incarico che hanno bisogno di guida esperta. Prendono decisioni architetturali, costruiscono team e scelgono tecnologie - spesso per la prima volta a questa scala.

Aziende che modernizzano sistemi legacy. Hanno bisogno di qualcuno che valuti cosa hanno, decida cosa tenere vs sostituire, e pianifichi la transizione senza rompere tutto.

Investitori che fanno due diligence tecnica. Vogliono una valutazione onesta del codice, dell''infrastruttura e del team prima di firmare l''assegno.

### Cosa ottenete

Raccomandazioni chiare su cui potete agire. Documentazione che il vostro team userà davvero. Supporto di follow-up mentre implementate i cambiamenti. Accesso diretto a ingegneri che hanno risolto problemi simili su larga scala.' WHERE service_id = 1 AND locale = 'it';

-- Security Services
UPDATE service_translations SET long_description = '## Sicurezza da persone che sono state da entrambe le parti

Il nostro team di sicurezza ha fatto penetration testing presso EA e protezione DDoS presso TUI. Abbiamo visto come pensano gli attaccanti perché abbiamo lavorato sia in attacco che in difesa.

### Cosa facciamo

Tentiamo di penetrare i vostri sistemi come farebbero veri attaccanti - applicazioni web, API, app mobile, infrastruttura. Ricevete un report dettagliato di cosa abbiamo trovato e esattamente come sistemarlo.

Per gli audit di sicurezza, esaminiamo codice, configurazioni, processi e architettura. Non conformità da spuntare. Cerchiamo problemi che gli scanner automatici mancano.

Auditiamo configurazioni AWS, Azure e GCP per errori di configurazione, permessi eccessivi e lacune di conformità. Troppe violazioni iniziano con un singolo bucket S3 impostato come pubblico.

Per la protezione DDoS, configuriamo e ottimizziamo Cloudflare, Akamai o AWS Shield. Rate limiting, regole WAF, pianificazione della risposta agli incidenti. Basato sulla protezione di siti ad alto traffico presso TUI durante l''alta stagione.

### Come funziona un pentest

Definiamo l''ambito insieme - cosa è incluso, quali metodi useremo, cosa dovete preparare. Poi raccogliamo informazioni come farebbe un attaccante. I test attivi avvengono entro i limiti concordati. Verifichiamo le scoperte e valutiamo il rischio reale, non l''impatto teorico. Ricevete documentazione chiara con passi di riproduzione. Restiamo per aiutare il vostro team a capire e sistemare ciò che abbiamo trovato.

### Cosa troviamo tipicamente

Bypass di autenticazione e problemi di gestione sessioni. Vulnerabilità di injection - SQL, NoSQL, command injection. Riferimenti diretti non sicuri dove gli utenti possono accedere ai dati di altri. Problemi API come autenticazione rotta o esposizione eccessiva di dati. Errori di configurazione cloud - bucket pubblici, ruoli IAM troppo permissivi. Sistemi non patchati e protocolli deboli.

### Settori che conosciamo bene

Gaming - considerazioni anti-cheat, sicurezza account, protezione economia in-game. Travel - conformità PCI, sicurezza sistemi di prenotazione, integrazioni API. Sanità - conformità HIPAA, protezione PHI, audit logging. Finanza - preparazione SOC 2, sicurezza transazioni, prevenzione frodi.' WHERE service_id = 2 AND locale = 'it';

-- Big Data & Analytics
UPDATE service_translations SET long_description = '## Trasformare i dati in decisioni

I dati grezzi che stanno in un database sono inutili. Vi aiutiamo a trasformarli in insight che cambiano come operate.

### Cosa costruiamo

Dashboard personalizzate con visibilità in tempo reale sulle metriche che contano per il vostro business. Non template generici - dashboard progettate attorno ai vostri KPI specifici e a come il vostro team lavora davvero.

Pipeline di dati che raccolgono, trasformano e caricano dati da fonti multiple. Gestiamo streaming, elaborazione batch e approcci ibridi a seconda delle necessità.

Analytics predittiva quando il caso business esiste. Modelli di machine learning che aiutano ad anticipare trend, identificare rischi e ottimizzare le operazioni. Ci concentriamo su modelli interpretabili - non scatole nere di cui nessuno si fida.

Reporting self-service così il vostro team può rispondere alle proprie domande. Mettiamo le fondamenta così non dipendete dagli ingegneri per ogni report.

### Il nostro approccio

Iniziamo dalle decisioni che state cercando di prendere. Cosa cambierebbe se aveste informazioni perfette? Lavoriamo a ritroso dai risultati di business ai requisiti dei dati.

Consegniamo dashboard funzionanti presto. Iniziate a ricevere valore immediatamente mentre espandiamo le capacità. Niente progetti di sei mesi che consegnano tutto alla fine.

Dedichiamo tempo alla qualità dei dati perché l''analytics è buono tanto quanto i dati sottostanti. Validazione, governance, monitoring.

### Strumenti

Visualizzazione: Grafana, Metabase, Apache Superset, dashboard D3.js personalizzate quando serve qualcosa di specifico.

Elaborazione: Apache Spark, Apache Kafka, dbt, Airflow.

Storage: PostgreSQL, ClickHouse, BigQuery, Snowflake - dipende dal vostro volume e pattern di query.

### Casi d''uso costruiti

Funnel di conversione e-commerce e calcoli di customer lifetime value. Analytics di utilizzo SaaS e previsione churn. Monitoring operazioni e analisi costi. Attribuzione campagne marketing e analisi test A/B.

### Perché noi

Siamo ingegneri prima di tutto. Capiamo come vengono generati i dati, da dove vengono i problemi di qualità e come costruire sistemi che scalano. Non facciamo solo grafici - costruiamo infrastruttura dati affidabile.' WHERE service_id = 3 AND locale = 'it';

-- QA & Testing Services
UPDATE service_translations SET long_description = '## Trovare bug prima che li trovino i vostri utenti

Test manuali, test automatizzati, test di performance - qualsiasi cosa serva per consegnare con fiducia.

### Cosa facciamo

Test esplorativi da ingegneri QA esperti che pensano come utenti. Troviamo i casi limite che i test automatici mancano.

Automazione test con Selenium, Cypress o Playwright per web. Appium per mobile. Costruiamo suite di test che girano in modo affidabile e danno feedback rapido - non test instabili che vengono ignorati.

Load testing con JMeter, k6 o Gatling. Identifichiamo i colli di bottiglia prima che diventino outage. Saprete esattamente come si comporta il vostro sistema a 10x del traffico attuale.

Test API per REST e GraphQL. Contract testing, integration testing, security testing per servizi backend.

Copertura OWASP Top 10 integrata nel vostro processo di test. Intercettiamo vulnerabilità comuni durante lo sviluppo, non dopo il deployment.

### Come lavoriamo

Analizziamo la vostra applicazione per identificare percorsi critici, aree ad alto rischio e priorità di test. Non tutto ha bisogno dello stesso livello di copertura.

Creiamo casi di test che coprono requisiti funzionali, casi limite e scenari utente reali. Test che portano valore reale, non solo numeri di copertura.

I test avvengono continuamente, non solo prima dei release. Ci integriamo con la vostra pipeline CI/CD.

I report dei bug includono passi di riproduzione, valutazione della severità e suggerimenti per il fix. Niente descrizioni vaghe che fanno perdere tempo agli sviluppatori.

### Strumenti

Automazione web: Selenium, Cypress, Playwright, Puppeteer
Mobile: Appium, XCTest, Espresso
Performance: JMeter, k6, Gatling, Locust
API: Postman, REST Assured, Karate
CI/CD: GitHub Actions, GitLab CI, Jenkins

### Quando i clienti ci chiamano

Prima dei lanci prodotto per assicurare la qualità. Durante progetti di migrazione per verificare che nulla si rompa. Per supporto QA continuo accanto al loro team di sviluppo. Per costruire test automatizzati da zero. Per sistemare un processo di test che non funziona.

### Deliverable

Piani di test e documentazione casi di test. Suite di test automatizzati con documentazione di manutenzione. Benchmark di performance e raccomandazioni. Report bug con rating di severità. Dashboard metriche di test.' WHERE service_id = 4 AND locale = 'it';

-- AI & Machine Learning
UPDATE service_translations SET long_description = '## AI che funziona in produzione

Costruiamo sistemi di machine learning che portano valore - non demo impressionanti che crollano quando provi a deployarli.

### Cosa costruiamo

Classificazione testo, analisi sentiment, estrazione entità, comprensione documenti. Elaborazione di testo non strutturato su larga scala.

Classificazione immagini, rilevamento oggetti, OCR, sistemi di ispezione visiva. Dal controllo qualità sulle linee di produzione all''elaborazione documenti.

Motori di raccomandazione che imparano dal comportamento degli utenti. Raccomandazioni prodotti, suggerimenti contenuti, pricing dinamico.

Previsioni, rilevamento anomalie, scoring del rischio. Modelli che vi aiutano ad anticipare i problemi prima che accadano.

### Il nostro approccio

Non tutti i problemi hanno bisogno di AI. Iniziamo capendo cosa state cercando di ottenere e se il machine learning è davvero l''approccio giusto. A volte un motore di regole è meglio.

I modelli ML sono buoni tanto quanto i loro dati di training. Valutiamo quali dati avete, di cosa avete bisogno e come gestire le lacune prima di scrivere codice.

Costruiamo modelli semplici prima, validiamo che funzionino, poi aumentiamo la complessità se necessario. Vedete risultati presto e potete correggere la rotta.

Un modello non è utile finché non è deployato. Ci occupiamo dell''engineering per far funzionare ML in modo affidabile in produzione - monitoring, pipeline di re-training, rilevamento drift.

### Stack tecnico

Framework: PyTorch, TensorFlow, scikit-learn, Hugging Face
MLOps: MLflow, Kubeflow, pipeline di deployment personalizzate
Infrastruttura: Cluster GPU, AWS SageMaker, Google Vertex AI
LLM: Fine-tuning, sistemi RAG, prompt engineering

### Casi d''uso consegnati

Chatbot servizio clienti e classificazione ticket. Estrazione fatture e analisi contratti. Ispezione visiva per difetti di fabbricazione. Raccomandazioni prodotti per e-commerce. Previsione domanda e ottimizzazione inventario.

### Cosa ci differenzia

Siamo pragmatici con l''AI. Non raccomanderemo deep learning quando la regressione logistica basta. Ci concentriamo su soluzioni che sono mantenibili, spiegabili e che muovono davvero le vostre metriche di business.' WHERE service_id = 5 AND locale = 'it';

-- Web Applications
UPDATE service_translations SET long_description = '## Applicazioni web che funzionano sotto pressione

Da strumenti interni a piattaforme per clienti, costruiamo applicazioni web che performano e scalano.

### Cosa costruiamo

Single page application con React e Next.js. Veloci, responsive, ottimizzate per browser moderni.

Progressive web app che funzionano offline, inviano notifiche push e si comportano come app native. La portata del web con le capacità di un''app.

Pannelli admin e strumenti interni che rendono il vostro team più produttivo. Costruiamo interfacce che sono veloci da usare, non solo veloci da costruire.

Prodotti SaaS con autenticazione, fatturazione e l''infrastruttura per scalare. Abbiamo costruito prodotti che servono migliaia di utenti simultanei.

E-commerce personalizzato con gestione inventario e flussi di checkout. Integrato con processori di pagamento e servizi di spedizione.

### Stack tecnologico

Frontend: React, Next.js, TypeScript, Tailwind CSS. State management con Zustand o React Query. Testing con Playwright e Jest.

Backend: Node.js, Python, PHP (Laravel). PostgreSQL, MySQL, MongoDB. Redis per caching e code. API GraphQL o REST.

Infrastruttura: Cloudflare Workers, AWS, Vercel. Docker e Kubernetes quando necessario. CI/CD con GitHub Actions.

### Come lavoriamo

Iniziamo capendo requisiti, esigenze utente e vincoli. Poi wireframe, prototipi e architettura tecnica.

Lo sviluppo avviene in sprint iterativi con demo regolari. Vedete progressi settimanalmente, non mensilmente.

Test automatizzati, review di sicurezza e ottimizzazione performance prima del lancio.

Setup CI/CD, monitoring e documentazione. Poi manutenzione continua e sviluppo feature se ne avete bisogno.

### Cosa ottenete

Codice pulito e mantenibile con documentazione. Pipeline di deployment automatizzate. Setup monitoring e alerting. Ottimizzazione performance. Best practice di sicurezza integrate. Trasferimento conoscenze così il vostro team può mantenere.' WHERE service_id = 6 AND locale = 'it';

-- Mobile Applications
UPDATE service_translations SET long_description = '## App mobile native

Costruiamo vere app native - Swift per iOS, Kotlin per Android. Il nostro team mobile ha 10+ anni presso Nagarro ed Enea AB, costruendo app usate da milioni.

### Perché nativo

Le app native sono più veloci. Nessun bridge JavaScript, nessun compromesso. I vostri utenti sentono la differenza, specialmente su dispositivi più vecchi.

Accesso completo alle capacità iOS e Android. Fotocamera, sensori, dati sulla salute, pagamenti - qualsiasi cosa offra la piattaforma, possiamo usarla.

Le app native rispettano le convenzioni della piattaforma. Gli utenti iOS ottengono un''esperienza iOS. Gli utenti Android ottengono un''esperienza Android. Questo conta più di quanto la maggior parte realizzi.

Gli aggiornamenti della piattaforma non rompono la vostra app. Non aspettate un team di framework per supportare le ultime funzionalità OS.

### Cosa costruiamo

App consumer che devono essere veloci e affidabili. Funzionalità social, riproduzione media, supporto offline.

App enterprise - strumenti interni, applicazioni field service, prodotti B2B. Sicurezza, integrazione MDM, requisiti aziendali.

App companion IoT con connettività Bluetooth e gestione dispositivi. Abbiamo costruito app per dispositivi medici, sensori industriali ed elettronica consumer.

Esperienze shopping native con checkout fluido, notifiche push e personalizzazione.

### Come lavoriamo

Definiamo funzionalità, creiamo wireframe e pianifichiamo il percorso utente. Consideriamo entrambe le piattaforme dall''inizio.

Sviluppo iOS e Android in parallelo con pattern architetturali condivisi. Build regolari per test e feedback.

Test su dispositivi con multiple dimensioni schermo e versioni OS. Profilazione performance e ottimizzazione memoria.

Gestiamo la submission su App Store e Play Store, rispondiamo al feedback di review e otteniamo l''approvazione della vostra app.

Aggiornamenti OS, fix di bug, aggiunte di funzionalità. Manteniamo app per anni.

### Capacità tecniche

iOS: Swift, SwiftUI, UIKit, Core Data, HealthKit, ARKit
Android: Kotlin, Jetpack Compose, Room, WorkManager
Backend: REST, GraphQL, WebSockets, gRPC
Push: Firebase, APNs, soluzioni personalizzate
Analytics: Firebase Analytics, Mixpanel, tracking personalizzato

### Settori

App healthcare (conformi HIPAA). IoT industriale (dati sensori in tempo reale). E-commerce (transazioni ad alto volume). Travel (requisiti offline-first). Finanza (critiche per la sicurezza).' WHERE service_id = 7 AND locale = 'it';

-- DevOps & Cloud Infrastructure
UPDATE service_translations SET long_description = '## Infrastruttura che scala

Costruiamo infrastruttura cloud su AWS che gestisce la crescita, resiste agli attacchi e non vi tiene svegli la notte.

### Cosa facciamo

Design e implementazione infrastruttura AWS. VPC, load balancer, auto-scaling group, servizi gestiti. Configurati per sicurezza ed efficienza dei costi.

Deployment Docker e Kubernetes quando ne avete bisogno. Containerizzazione, orchestrazione, gestione risorse.

Workflow automatizzati di build, test e deployment. GitHub Actions, GitLab CI o AWS CodePipeline - configurati per release veloci e sicure.

Terraform e CloudFormation per infrastruttura riproducibile. Niente più configurazione manuale o modifiche non documentate.

Monitoring con Prometheus, Grafana e CloudWatch. Alerting che vi avvisa dei problemi prima che gli utenti notino.

### Come pensiamo

Ogni decisione infrastrutturale considera la sicurezza. Accesso a privilegi minimi, crittografia at rest e in transit, segmentazione rete.

Progettiamo per l''efficienza. Reserved instance, spot instance, right-sizing. Vi aiutiamo a evitare lo shock della bolletta cloud.

Deployment multi-AZ, failover automatico, pianificazione disaster recovery. Costruiamo per scenari di fallimento perché succedono.

Ogni sistema viene con runbook, diagrammi architetturali e procedure operative. Il vostro team può gestire senza di noi.

### Progetti comuni

Migrazione cloud da on-premises ad AWS. Adozione Kubernetes per applicazioni che ne hanno bisogno. Implementazione CI/CD. Hardening sicurezza per requisiti di conformità. Riduzione costi su deployment cloud esistenti. Implementazione disaster recovery.

### Tecnologie

Cloud: AWS (principale), GCP, Cloudflare
Container: Docker, Kubernetes, ECS, EKS
IaC: Terraform, CloudFormation, Pulumi
CI/CD: GitHub Actions, GitLab CI, ArgoCD
Monitoring: Prometheus, Grafana, CloudWatch, Datadog
Sicurezza: AWS IAM, Vault, SOPS, security scanning

### Deliverable

Documentazione architettura con diagrammi. Repository Infrastructure as Code. Dashboard di monitoring e alerting. Runbook per operazioni comuni. Review e raccomandazioni sicurezza. Analisi e ottimizzazione costi.' WHERE service_id = 8 AND locale = 'it';

-- Backend, APIs & Integrations
UPDATE service_translations SET long_description = '## Sistemi backend che funzionano

Costruiamo sistemi lato server che alimentano le applicazioni. API, microservizi, database, integrazioni - progettati per affidabilità e performance.

### Cosa costruiamo

API RESTful che i team frontend e mobile adorano. Autenticazione corretta, rate limiting, gestione errori, documentazione.

Servizi GraphQL quando i client hanno bisogno di flessibilità. Design schema, resolver, ottimizzazione performance.

Microservizi quando i monoliti devono essere suddivisi. Confini dei servizi, comunicazione inter-servizi, gestione della complessità.

Integrazioni third-party. Processori di pagamento, CRM, ERP, fornitori di spedizione - colleghiamo il vostro sistema a servizi esterni.

Elaborazione in background. Code di job, task schedulati, elaborazione event-driven. Sistemi che gestiscono il lavoro in modo affidabile senza bloccare le richieste utente.

### Come lavoriamo

Progettiamo le API prima di implementarle. Contratti chiari, pattern consistenti, documentazione dall''inizio.

Autenticazione, autorizzazione, validazione input, rate limiting integrati dal primo giorno. Non aggiunti dopo.

Ottimizzazione query database, strategie di caching, connection pooling. Misuriamo e ottimizziamo prima che i problemi si verifichino.

Logging, metriche e tracing che vi aiutano a capire cosa succede in produzione. Il debugging non dovrebbe essere tirare a indovinare.

### Tecnologie

Linguaggi: Node.js (Express, Fastify, NestJS), Python (FastAPI, Django), PHP (Laravel), Go per servizi critici per la performance.

Database: PostgreSQL, MySQL per relazionale. MongoDB, DynamoDB per documenti. Redis per caching e code. Elasticsearch per ricerca.

Code di messaggi: RabbitMQ, AWS SQS, Redis Streams, Kafka.

Strumenti API: Documentazione OpenAPI/Swagger, GraphQL con Apollo, gRPC per servizi interni.

### Integrazioni comuni

Elaborazione pagamenti: Stripe, PayPal, Adyen, metodi di pagamento locali.
Autenticazione: Provider OAuth, SSO, identity management.
Comunicazione: Email (SendGrid, SES), SMS (Twilio), notifiche push.
Storage: S3, Cloudflare R2, integrazione CDN.
Analytics: Segment, Mixpanel, tracking eventi personalizzato.

### Deliverable

API ben documentate con spec OpenAPI. Test di integrazione e ambienti di test. Configurazioni deployment e CI/CD. Monitoring e alerting. Benchmark di performance. Documentazione review sicurezza.' WHERE service_id = 9 AND locale = 'it';

-- Database Design & Management
UPDATE service_translations SET long_description = '## Database che restano veloci

I dati sono il fondamento della vostra applicazione. Progettiamo schemi, ottimizziamo query e costruiamo architetture dati che gestiscono la crescita.

### Cosa facciamo

Modellazione dati che riflette il vostro dominio di business. Strutture normalizzate per l''integrità, denormalizzate dove la performance lo richiede.

Query lente identificate e sistemate. Strategie di indicizzazione, riscrittura query, analisi piani di esecuzione. Rendiamo i database veloci.

Migrazione tra sistemi o versioni di database senza perdita dati. Migrazioni che non richiedono downtime prolungato.

Quando i database single-server non bastano - read replica, setup master-master, sharding orizzontale.

Backup automatizzati, point-in-time recovery, test disaster recovery. I vostri dati sopravvivono a guasti hardware ed errori umani.

### Tecnologie database

Relazionale: PostgreSQL (la nostra raccomandazione di default), MySQL/MariaDB, Amazon RDS e Aurora.

Documento: MongoDB, Amazon DynamoDB, Couchbase.

Ricerca e analytics: Elasticsearch, ClickHouse, TimescaleDB.

Caching: Redis, Memcached.

### Come pensiamo

Iniziamo dai pattern di accesso. Come verranno scritti i vostri dati? Come verranno letti? Le risposte determinano il design dello schema e le scelte tecnologiche.

Non indoviniamo i problemi di performance. Misuriamo i tempi delle query, analizziamo i piani di esecuzione e sistemiamo i veri colli di bottiglia.

Quello che funziona a 1.000 righe può fallire a 1.000.000. Progettiamo con la vostra traiettoria di crescita in mente.

Non usiamo funzionalità complesse a meno che non siano necessarie. Gli schemi semplici sono più facili da capire, mantenere e ottimizzare.

### Progetti comuni

Ottimizzazione performance - sistemare query lente e colli di bottiglia database. Redesign schema per database cresciuti organicamente. Migrazione tecnologica - MySQL a PostgreSQL, SQL a NoSQL. Scaling con read replica, connection pooling, layer di caching. Modellazione dati per nuove applicazioni. Conformità - audit logging, crittografia, controlli accesso.

### Deliverable

Diagrammi entity-relationship e documentazione schema. Analisi query e raccomandazioni di ottimizzazione. Script di migrazione e procedure di rollback. Dashboard di monitoring per la salute del database. Runbook backup e recovery. Benchmark e baseline di performance.' WHERE service_id = 10 AND locale = 'it';
