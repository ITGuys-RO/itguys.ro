-- Romanian translations for service long descriptions

-- Technical Consulting
UPDATE service_translations SET long_description = '## Cum lucrăm de fapt

Fiecare recomandare pe care o facem vine din experiența construirii și scalării sistemelor la EA, TUI și Nagarro. Nu framework-uri despre care am citit - lucruri pe care le-am livrat.

### Procesul

Începem prin a înțelege situația ta. Ce construiești? Ce constrângeri există? Ce a funcționat înainte și ce nu? Asta modelează tot ce urmează.

Apoi ne uităm la sistemele tale. Identificăm blocajele, mapăm dependențele și îți oferim o imagine clară a locului în care te afli. Fără surprize.

De acolo, creăm un plan prioritizat. Nu un document de 100 de pagini care stă pe raft - pași concreți cu rezultate clare.

### Probleme pe care le vedem în mod repetat

Majoritatea companiilor cu care lucrăm sunt blocate pe una dintre acestea:

Au prea multe opțiuni tehnologice și nu suficientă claritate asupra compromisurilor. Au construit ceva care funcționa la 1.000 de utilizatori dar se chinuie la 100.000. Soluțiile rapide au devenit probleme permanente și acum codul e un haos. Procesele și uneltele lor încetinesc livrarea în loc să ajute. Sau au luat decizii de arhitectură acum ani care acum creează vulnerabilități de securitate.

### Cine ne angajează

CTO-uri la primul job care au nevoie de îndrumare experimentată. Iau decizii de arhitectură, construiesc echipe și aleg tehnologii - adesea pentru prima dată la această scară.

Companii care modernizează sisteme legacy. Au nevoie de cineva să evalueze ce au, să decidă ce păstrează vs. înlocuiesc și să planifice tranziția fără să strice totul.

Investitori care fac due diligence tehnic. Vor o evaluare onestă a codului, infrastructurii și echipei înainte să semneze cecul.

### Cu ce pleci

Recomandări clare pe care poți acționa. Documentație pe care echipa ta chiar o va folosi. Suport de follow-up pe măsură ce implementezi schimbările. Acces direct la ingineri care au rezolvat probleme similare la scară.' WHERE service_id = 1 AND locale = 'ro';

-- Security Services
UPDATE service_translations SET long_description = '## Securitate de la oameni care au fost de ambele părți

Echipa noastră de securitate a făcut teste de penetrare la EA și protecție DDoS la TUI. Am văzut cum gândesc atacatorii pentru că am lucrat și în ofensivă și în defensivă.

### Ce facem

Încercăm să penetrăm sistemele tale așa cum ar face atacatorii reali - aplicații web, API-uri, aplicații mobile, infrastructură. Primești un raport detaliat cu ce am găsit și exact cum să repari.

Pentru audituri de securitate, examinăm codul, configurațiile, procesele și arhitectura. Nu conformitate de bifat căsuțe. Căutăm probleme pe care scannerele automate le ratează.

Audităm configurații AWS, Azure și GCP pentru greșeli de configurare, permisiuni excesive și lacune de conformitate. Prea multe breșe încep cu un singur bucket S3 setat pe public.

Pentru protecție DDoS, configurăm și optimizăm Cloudflare, Akamai sau AWS Shield. Rate limiting, reguli WAF, planificare răspuns la incidente. Bazat pe protejarea site-urilor cu trafic mare la TUI în sezonul de vârf.

### Cum funcționează un pentest

Definim scopul împreună - ce e inclus, ce metode vom folosi, ce trebuie să pregătești. Apoi colectăm informații așa cum ar face un atacator. Testarea activă se întâmplă în limitele agreate. Verificăm descoperirile și evaluăm riscul real, nu impactul teoretic. Primești documentație clară cu pași de reproducere. Rămânem să ajutăm echipa să înțeleagă și să repare ce am găsit.

### Ce găsim de obicei

Bypass-uri de autentificare și probleme de gestionare a sesiunilor. Vulnerabilități de injecție - SQL, NoSQL, command injection. Referințe directe nesecurizate la obiecte unde utilizatorii pot accesa datele altora. Probleme de API precum autentificare defectă sau expunere excesivă de date. Greșeli de configurare cloud - bucket-uri publice, roluri IAM prea permisive. Sisteme nepatchuite și protocoale slabe.

### Industrii pe care le cunoaștem bine

Gaming - considerații anti-cheat, securitatea conturilor, protecția economiei in-game. Travel - conformitate PCI, securitatea sistemelor de rezervări, integrări API. Healthcare - conformitate HIPAA, protecție PHI, logging de audit. Finanțe - pregătire SOC 2, securitatea tranzacțiilor, prevenirea fraudei.' WHERE service_id = 2 AND locale = 'ro';

-- Big Data & Analytics
UPDATE service_translations SET long_description = '## Transformăm datele în decizii

Datele brute care stau într-o bază de date sunt inutile. Te ajutăm să le transformi în insight-uri care schimbă modul în care operezi.

### Ce construim

Dashboard-uri custom cu vizibilitate în timp real asupra metricilor care contează pentru afacerea ta. Nu template-uri generice - dashboard-uri proiectate în jurul KPI-urilor tale specifice și a modului în care echipa ta lucrează de fapt.

Pipeline-uri de date care colectează, transformă și încarcă date din surse multiple. Gestionăm streaming, procesare batch și abordări hibride în funcție de ce ai nevoie.

Analiză predictivă când cazul de business există. Modele de machine learning care ajută la anticiparea tendințelor, identificarea riscurilor și optimizarea operațiunilor. Ne concentrăm pe modele interpretabile - nu cutii negre în care nimeni nu are încredere.

Raportare self-service ca echipa ta să-și poată răspunde singură la întrebări. Punem bazele ca să nu depinzi de ingineri pentru fiecare raport.

### Cum abordăm

Începem cu deciziile pe care încerci să le iei. Ce s-ar schimba dacă ai avea informații perfecte? Lucrăm înapoi de la rezultate de business la cerințe de date.

Livrăm dashboard-uri funcționale devreme. Începi să primești valoare imediat în timp ce noi extindem capabilitățile. Fără proiecte de șase luni care livrează totul la final.

Petrecem timp pe calitatea datelor pentru că analytics-ul e la fel de bun ca datele de bază. Validare, governance, monitorizare.

### Unelte

Vizualizare: Grafana, Metabase, Apache Superset, dashboard-uri custom D3.js când ai nevoie de ceva specific.

Procesare: Apache Spark, Apache Kafka, dbt, Airflow.

Stocare: PostgreSQL, ClickHouse, BigQuery, Snowflake - depinde de volumul și pattern-urile tale de query.

### Cazuri de utilizare construite

Funneluri de conversie e-commerce și calcule de customer lifetime value. Analytics de utilizare SaaS și predicție churn. Monitorizare operațiuni și analiză costuri. Atribuire campanii marketing și analiză teste A/B.

### De ce noi

Suntem ingineri în primul rând. Înțelegem cum se generează datele, de unde vin problemele de calitate și cum să construim sisteme care scalează. Nu facem doar grafice - construim infrastructură de date fiabilă.' WHERE service_id = 3 AND locale = 'ro';

-- QA & Testing Services
UPDATE service_translations SET long_description = '## Găsim bug-uri înainte ca utilizatorii tăi să le găsească

Testare manuală, testare automată, testare de performanță - orice e nevoie să livrezi cu încredere.

### Ce facem

Testare exploratorie de către ingineri QA experimentați care gândesc ca utilizatorii. Găsim cazurile limită pe care testele automate le ratează.

Automatizare teste cu Selenium, Cypress sau Playwright pentru web. Appium pentru mobile. Construim suite de teste care rulează fiabil și oferă feedback rapid - nu teste instabile care sunt ignorate.

Load testing cu JMeter, k6 sau Gatling. Identificăm blocajele înainte să devină căderi. Vei ști exact cum se comportă sistemul tău la 10x traficul curent.

Testare API pentru REST și GraphQL. Testare de contract, testare de integrare, testare de securitate pentru servicii backend.

Acoperire OWASP Top 10 integrată în procesul tău de testare. Prindem vulnerabilități comune în timpul dezvoltării, nu după ce ești în producție.

### Cum lucrăm

Analizăm aplicația ta pentru a identifica căile critice, zonele cu risc ridicat și prioritățile de testare. Nu totul are nevoie de același nivel de acoperire.

Creăm cazuri de test care acoperă cerințe funcționale, cazuri limită și scenarii reale de utilizator. Teste care oferă valoare reală, nu doar numere de acoperire.

Testarea se întâmplă continuu, nu doar înainte de release-uri. Ne integrăm cu pipeline-ul tău CI/CD.

Rapoartele de bug includ pași de reproducere, evaluare severitate și sugestii de fix. Fără descrieri vagi care pierd timpul dezvoltatorilor.

### Unelte

Automatizare web: Selenium, Cypress, Playwright, Puppeteer
Mobile: Appium, XCTest, Espresso
Performanță: JMeter, k6, Gatling, Locust
API-uri: Postman, REST Assured, Karate
CI/CD: GitHub Actions, GitLab CI, Jenkins

### Când ne sună clienții

Înainte de lansări de produs pentru a asigura calitatea. În timpul proiectelor de migrare pentru a verifica că nimic nu se strică. Pentru suport QA continuu alături de echipa lor de dezvoltare. Pentru a construi testare automatizată de la zero. Pentru a repara un proces de testare care nu funcționează.

### Livrabile

Planuri de test și documentație cazuri de test. Suite de teste automatizate cu documentație de mentenanță. Benchmark-uri de performanță și recomandări. Rapoarte de bug cu rating-uri de severitate. Dashboard-uri de metrici testare.' WHERE service_id = 4 AND locale = 'ro';

-- AI & Machine Learning
UPDATE service_translations SET long_description = '## AI care funcționează în producție

Construim sisteme de machine learning care livrează valoare - nu demo-uri impresionante care se destramă când încerci să le deploy-ezi.

### Ce construim

Clasificare text, analiză sentiment, extracție entități, înțelegere documente. Procesare text nestructurat la scară.

Clasificare imagini, detecție obiecte, OCR, sisteme de inspecție vizuală. De la control calitate pe linii de producție la procesare documente.

Motoare de recomandare care învață din comportamentul utilizatorilor. Recomandări produse, sugestii conținut, prețuri dinamice.

Prognoză, detecție anomalii, scoring risc. Modele care te ajută să anticipezi problemele înainte să se întâmple.

### Abordarea noastră

Nu orice problemă are nevoie de AI. Începem prin a înțelege ce încerci să realizezi și dacă machine learning e de fapt abordarea potrivită. Uneori un motor de reguli e mai bun.

Modelele ML sunt la fel de bune ca datele de antrenament. Evaluăm ce date ai, ce ai nevoie și cum să gestionezi lacunele înainte să scriem cod.

Construim modele simple întâi, validăm că funcționează, apoi creștem complexitatea dacă e nevoie. Vezi rezultate devreme și poți corecta cursul.

Un model nu e util până nu e deploy-at. Ne ocupăm de ingineria necesară ca ML să funcționeze fiabil în producție - monitorizare, pipeline-uri de re-antrenament, detecție drift.

### Stack tehnic

Framework-uri: PyTorch, TensorFlow, scikit-learn, Hugging Face
MLOps: MLflow, Kubeflow, pipeline-uri custom de deployment
Infrastructură: Clustere GPU, AWS SageMaker, Google Vertex AI
LLM-uri: Fine-tuning, sisteme RAG, prompt engineering

### Cazuri de utilizare livrate

Chatboți serviciu clienți și clasificare tichete. Extracție facturi și analiză contracte. Inspecție vizuală pentru defecte de fabricație. Recomandări produse pentru e-commerce. Prognoză cerere și optimizare inventar.

### Ce ne diferențiază

Suntem pragmatici cu AI. Nu vom recomanda deep learning când logistic regression e suficient. Ne concentrăm pe soluții care sunt mentenabile, explicabile și care chiar mișcă metricile tale de business.' WHERE service_id = 5 AND locale = 'ro';

-- Web Applications
UPDATE service_translations SET long_description = '## Aplicații web care funcționează sub presiune

De la unelte interne la platforme pentru clienți, construim aplicații web care performează și scalează.

### Ce construim

Aplicații single page cu React și Next.js. Rapide, responsive, optimizate pentru browsere moderne.

Aplicații web progresive care funcționează offline, trimit notificări push și se simt native. Reach-ul web-ului cu capabilități de aplicație.

Panouri admin și unelte interne care fac echipa ta mai productivă. Construim interfețe care sunt rapide de folosit, nu doar rapide de construit.

Produse SaaS cu autentificare, facturare și infrastructura pentru a scala. Am construit produse care servesc mii de utilizatori concurenți.

E-commerce custom cu gestionare inventar și fluxuri checkout. Integrate cu procesatori de plăți și servicii de livrare.

### Stack tehnologic

Frontend: React, Next.js, TypeScript, Tailwind CSS. State management cu Zustand sau React Query. Testare cu Playwright și Jest.

Backend: Node.js, Python, PHP (Laravel). PostgreSQL, MySQL, MongoDB. Redis pentru caching și cozi. API-uri GraphQL sau REST.

Infrastructură: Cloudflare Workers, AWS, Vercel. Docker și Kubernetes când e nevoie. CI/CD cu GitHub Actions.

### Cum lucrăm

Începem prin a înțelege cerințele, nevoile utilizatorilor și constrângerile. Apoi wireframe-uri, prototipuri și arhitectură tehnică.

Dezvoltarea se întâmplă în sprint-uri iterative cu demo-uri regulate. Vezi progres săptămânal, nu lunar.

Testare automatizată, review de securitate și optimizare performanță înainte de lansare.

Setup CI/CD, monitorizare și documentație. Apoi mentenanță continuă și dezvoltare feature-uri dacă ai nevoie.

### Ce primești

Cod curat, mentenabil cu documentație. Pipeline-uri de deployment automatizate. Setup monitorizare și alertare. Optimizare performanță. Best practices de securitate integrate. Transfer de cunoștințe ca echipa ta să poată menține.' WHERE service_id = 6 AND locale = 'ro';

-- Mobile Applications
UPDATE service_translations SET long_description = '## Aplicații mobile native

Construim aplicații native reale - Swift pentru iOS, Kotlin pentru Android. Echipa noastră mobile are 10+ ani la Nagarro și Enea AB, construind aplicații folosite de milioane.

### De ce nativ

Aplicațiile native sunt mai rapide. Fără bridge JavaScript, fără compromis. Utilizatorii tăi simt diferența, mai ales pe dispozitive mai vechi.

Acces complet la capabilitățile iOS și Android. Cameră, senzori, date de sănătate, plăți - orice oferă platforma, putem folosi.

Aplicațiile native respectă convențiile platformei. Utilizatorii iOS primesc o experiență iOS. Utilizatorii Android primesc o experiență Android. Asta contează mai mult decât realizează majoritatea.

Actualizările platformei nu îți strică aplicația. Nu aștepți după o echipă de framework să suporte ultimele feature-uri OS.

### Ce construim

Aplicații consumer care trebuie să fie rapide și fiabile. Feature-uri sociale, redare media, suport offline.

Aplicații enterprise - unelte interne, aplicații field service, produse B2B. Securitate, integrare MDM, cerințe corporate.

Aplicații companion IoT cu conectivitate Bluetooth și gestionare dispozitive. Am construit aplicații pentru dispozitive medicale, senzori industriali și electronice consumer.

Experiențe native de shopping cu checkout fluid, notificări push și personalizare.

### Cum lucrăm

Definim feature-uri, creăm wireframe-uri și planificăm journey-ul utilizatorului. Considerăm ambele platforme de la început.

Dezvoltare iOS și Android în paralel cu pattern-uri de arhitectură comune. Build-uri regulate pentru testare și feedback.

Testare pe dispozitive cu multiple dimensiuni ecran și versiuni OS. Profilare performanță și optimizare memorie.

Ne ocupăm de submiterea în App Store și Play Store, adresăm feedback-ul de review și obținem aprobarea aplicației tale.

Actualizări OS, fix-uri de bug, adăugări de feature-uri. Menținem aplicații ani de zile.

### Capabilități tehnice

iOS: Swift, SwiftUI, UIKit, Core Data, HealthKit, ARKit
Android: Kotlin, Jetpack Compose, Room, WorkManager
Backend: REST, GraphQL, WebSockets, gRPC
Push: Firebase, APNs, soluții custom
Analytics: Firebase Analytics, Mixpanel, tracking custom

### Industrii

Aplicații healthcare (conforme HIPAA). IoT industrial (date senzori în timp real). E-commerce (tranzacții volum mare). Travel (cerințe offline-first). Finanțe (critice pentru securitate).' WHERE service_id = 7 AND locale = 'ro';

-- DevOps & Cloud Infrastructure
UPDATE service_translations SET long_description = '## Infrastructură care scalează

Construim infrastructură cloud pe AWS care gestionează creșterea, rezistă atacurilor și nu te ține treaz noaptea.

### Ce facem

Design și implementare infrastructură AWS. VPC-uri, load balancers, auto-scaling groups, servicii managed. Configurate pentru securitate și eficiență costuri.

Deployment-uri Docker și Kubernetes când ai nevoie. Containerizare, orchestrare, gestionare resurse.

Workflow-uri automatizate de build, test și deployment. GitHub Actions, GitLab CI sau AWS CodePipeline - configurate pentru release-uri rapide și sigure.

Terraform și CloudFormation pentru infrastructură reproductibilă. Fără configurare manuală sau modificări nedocumentate.

Monitorizare cu Prometheus, Grafana și CloudWatch. Alertare care îți spune despre probleme înainte să observe utilizatorii.

### Cum gândim

Fiecare decizie de infrastructură consideră securitatea. Acces cu privilegii minime, criptare at rest și în tranzit, segmentare rețea.

Proiectăm pentru eficiență. Reserved instances, spot instances, right-sizing. Te ajutăm să eviți șocul facturii cloud.

Deployment-uri multi-AZ, failover automat, planificare disaster recovery. Construim pentru scenarii de eșec pentru că se întâmplă.

Fiecare sistem vine cu runbook-uri, diagrame de arhitectură și proceduri operaționale. Echipa ta poate gestiona fără noi.

### Proiecte comune

Migrare cloud de la on-premises la AWS. Adopție Kubernetes pentru aplicații care au nevoie. Implementare CI/CD. Hardening securitate pentru cerințe de conformitate. Reducere costuri în deployment-uri cloud existente. Implementare disaster recovery.

### Tehnologii

Cloud: AWS (principal), GCP, Cloudflare
Containere: Docker, Kubernetes, ECS, EKS
IaC: Terraform, CloudFormation, Pulumi
CI/CD: GitHub Actions, GitLab CI, ArgoCD
Monitorizare: Prometheus, Grafana, CloudWatch, Datadog
Securitate: AWS IAM, Vault, SOPS, security scanning

### Livrabile

Documentație arhitectură cu diagrame. Repositories Infrastructure as Code. Dashboard-uri monitorizare și alertare. Runbook-uri pentru operațiuni comune. Review și recomandări securitate. Analiză și optimizare costuri.' WHERE service_id = 8 AND locale = 'ro';

-- Backend, APIs & Integrations
UPDATE service_translations SET long_description = '## Sisteme backend care funcționează

Construim sisteme server-side care alimentează aplicații. API-uri, microservicii, baze de date, integrări - proiectate pentru fiabilitate și performanță.

### Ce construim

API-uri RESTful pe care echipele frontend și mobile le adoră. Autentificare corectă, rate limiting, error handling, documentație.

Servicii GraphQL când clienții au nevoie de flexibilitate. Design schemă, resolvere, optimizare performanță.

Microservicii când monoliții trebuie sparți. Granițe de serviciu, comunicare inter-servicii, gestionarea complexității.

Integrări third-party. Procesatori plăți, CRM-uri, ERP-uri, furnizori livrare - conectăm sistemul tău la servicii externe.

Procesare background. Cozi de job-uri, task-uri programate, procesare event-driven. Sisteme care gestionează munca fiabil fără să blocheze request-urile utilizatorilor.

### Cum lucrăm

Proiectăm API-uri înainte să le implementăm. Contracte clare, pattern-uri consistente, documentație de la început.

Autentificare, autorizare, validare input, rate limiting integrate din prima zi. Nu adăugate ulterior.

Optimizare query-uri baze de date, strategii de caching, connection pooling. Măsurăm și optimizăm înainte să apară probleme.

Logging, metrici și tracing care te ajută să înțelegi ce se întâmplă în producție. Debugging-ul nu ar trebui să fie ghicitori.

### Tehnologii

Limbaje: Node.js (Express, Fastify, NestJS), Python (FastAPI, Django), PHP (Laravel), Go pentru servicii critice pentru performanță.

Baze de date: PostgreSQL, MySQL pentru relațional. MongoDB, DynamoDB pentru documente. Redis pentru caching și cozi. Elasticsearch pentru căutare.

Cozi de mesaje: RabbitMQ, AWS SQS, Redis Streams, Kafka.

Unelte API: Documentație OpenAPI/Swagger, GraphQL cu Apollo, gRPC pentru servicii interne.

### Integrări comune

Procesare plăți: Stripe, PayPal, Adyen, metode locale de plată.
Autentificare: Provideri OAuth, SSO, identity management.
Comunicare: Email (SendGrid, SES), SMS (Twilio), notificări push.
Stocare: S3, Cloudflare R2, integrare CDN.
Analytics: Segment, Mixpanel, tracking custom de evenimente.

### Livrabile

API-uri bine documentate cu specificații OpenAPI. Teste de integrare și medii de test. Configurații deployment și CI/CD. Monitorizare și alertare. Benchmark-uri performanță. Documentație review securitate.' WHERE service_id = 9 AND locale = 'ro';

-- Database Design & Management
UPDATE service_translations SET long_description = '## Baze de date care rămân rapide

Datele sunt fundația aplicației tale. Proiectăm scheme, optimizăm query-uri și construim arhitecturi de date care gestionează creșterea.

### Ce facem

Modelare date care reflectă domeniul tău de business. Structuri normalizate pentru integritate, denormalizate unde performanța o cere.

Query-uri lente identificate și reparate. Strategii de indexare, rescrieri query, analiză plan execuție. Facem bazele de date rapide.

Mutare între sisteme sau versiuni de baze de date fără pierdere de date. Migrări care nu necesită downtime extins.

Când bazele de date single-server nu sunt suficiente - read replicas, setup-uri master-master, sharding orizontal.

Backup-uri automatizate, point-in-time recovery, testare disaster recovery. Datele tale supraviețuiesc defecțiunilor hardware și erorilor umane.

### Tehnologii baze de date

Relațional: PostgreSQL (recomandarea noastră default), MySQL/MariaDB, Amazon RDS și Aurora.

Document: MongoDB, Amazon DynamoDB, Couchbase.

Căutare și analytics: Elasticsearch, ClickHouse, TimescaleDB.

Caching: Redis, Memcached.

### Cum gândim

Începem cu pattern-urile de acces. Cum vor fi scrise datele tale? Cum vor fi citite? Răspunsurile determină designul schemei și alegerile tehnologice.

Nu ghicim problemele de performanță. Măsurăm timpii query-urilor, analizăm planurile de execuție și reparăm blocajele reale.

Ce funcționează la 1.000 de rânduri poate eșua la 1.000.000. Proiectăm cu trajectoria ta de creștere în minte.

Nu folosim feature-uri complexe decât dacă sunt necesare. Schemele simple sunt mai ușor de înțeles, menținut și optimizat.

### Proiecte comune

Optimizare performanță - reparare query-uri lente și blocaje baze de date. Redesign schemă pentru baze de date care au crescut organic. Migrare tehnologie - MySQL la PostgreSQL, SQL la NoSQL. Scalare cu read replicas, connection pooling, layere de caching. Modelare date pentru aplicații noi. Conformitate - audit logging, criptare, controale acces.

### Livrabile

Diagrame entity-relationship și documentație schemă. Analiză query și recomandări optimizare. Script-uri migrare și proceduri rollback. Dashboard-uri monitorizare pentru sănătatea bazei de date. Runbook-uri backup și recovery. Benchmark-uri și baseline-uri performanță.' WHERE service_id = 10 AND locale = 'ro';
