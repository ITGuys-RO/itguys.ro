-- Italian translations for FAQ items

-- Security FAQs
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'security-pentest-frequency'), 'it',
'Con quale frequenza dovremmo fare test di penetrazione?',
'Minimo una volta all''anno, più dopo qualsiasi cambiamento importante all''applicazione o infrastruttura. Se gestite pagamenti, dati sanitari o informazioni finanziarie, trimestrale è meglio. E sempre prima di un lancio importante - non volete scoprire le vulnerabilità dai vostri utenti.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'security-pentest-duration'), 'it',
'Quanto dura un test di penetrazione?',
'La maggior parte dei test di applicazioni web richiede 1-2 settimane. Un''API semplice può essere fatta in pochi giorni. I test completi dell''infrastruttura possono richiedere 3-4 settimane. Vi daremo una timeline specifica durante lo scoping una volta capito cosa stiamo testando.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'security-compliance'), 'it',
'Potete aiutarci a ottenere la conformità SOC 2 o ISO 27001?',
'Sì. Aiutiamo le aziende a prepararsi per gli audit di conformità - identificare lacune, implementare controlli, documentare pratiche. Abbiamo guidato team attraverso SOC 2, ISO 27001, HIPAA e GDPR. Il processo è meno doloroso quando qualcuno che l''ha già fatto vi aiuta.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'security-cloud-audit'), 'it',
'Cosa copre un audit di sicurezza cloud?',
'Configurazioni IAM, sicurezza di rete, impostazioni di crittografia, logging, monitoring, protezione dati e come vi posizionate rispetto ai benchmark CIS. Ricevete una lista prioritizzata di cosa sistemare e come.');

-- Web Development FAQs
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'web-timeline'), 'it',
'Quanto tempo ci vuole per costruire un''applicazione web?',
'Un MVP semplice: 6-8 settimane. Un prodotto SaaS completo con auth, fatturazione e funzionalità reali: 3-6 mesi. Applicazioni enterprise con integrazioni complesse: di più. Possiamo dare una stima reale una volta capito cosa state costruendo.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'web-technology-choice'), 'it',
'Perché usate principalmente React e Next.js?',
'React ha l''ecosistema più grande, i migliori strumenti e il maggior numero di sviluppatori che lo conoscono. Next.js aggiunge server-side rendering, route API e ottimizzazioni di performance che richiederebbero mesi per costruirle da soli. Per la maggior parte dei progetti, è la scelta giusta.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'web-maintenance'), 'it',
'Offrite manutenzione continua dopo il lancio?',
'Sì. Offriamo pacchetti di manutenzione - aggiornamenti di sicurezza, fix di bug, monitoring delle performance, nuove funzionalità. Molti clienti iniziano con un progetto di sviluppo e ci tengono per il lavoro continuo.');

-- Mobile Development FAQs
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'mobile-native-vs-cross'), 'it',
'Perché sviluppo nativo invece di React Native o Flutter?',
'Le app native sono più veloci e hanno accesso completo alle funzionalità della piattaforma. I framework cross-platform aggiungono complessità, e spesso finite per scrivere codice nativo comunque per le funzioni avanzate. Se la vostra app deve sembrare premium, il nativo vale la pena.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'mobile-timeline'), 'it',
'Quanto tempo richiede lo sviluppo di un''app mobile?',
'Un''app semplice per una piattaforma: 2-3 mesi. Sia iOS che Android con backend condiviso: 4-6 mesi. App con supporto offline, funzionalità real-time o integrazione hardware richiedono più tempo. La complessità determina la timeline più del numero di funzionalità.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'mobile-app-store'), 'it',
'Gestite la submission su App Store e Play Store?',
'Sì. Prepariamo gli asset, gestiamo la submission, rispondiamo al feedback di review e facciamo qualsiasi modifica richiesta da Apple o Google. Abbiamo abbastanza esperienza per sapere cosa scatena i rifiuti e come evitarli.');

-- DevOps FAQs
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'devops-cloud-choice'), 'it',
'Quale provider cloud raccomandate?',
'AWS per la maggior parte delle cose - più servizi, migliore documentazione. Usiamo anche GCP e Cloudflare Workers quando si adattano meglio. La risposta giusta dipende da cosa state costruendo, di quale conformità avete bisogno e cosa il vostro team già conosce.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'devops-kubernetes'), 'it',
'Abbiamo bisogno di Kubernetes?',
'Probabilmente no. Kubernetes aggiunge overhead operativo di cui la maggior parte dei progetti non ha bisogno. ECS, Cloud Run o istanze EC2 ben configurate funzionano bene per la maggior parte dei workload. Raccomandiamo Kubernetes solo quando i requisiti giustificano davvero la complessità.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'devops-cost'), 'it',
'Come possiamo ridurre i nostri costi cloud?',
'Dimensionate correttamente le istanze, usate reserved o spot instance dove potete, configurate l''auto-scaling, ottimizzate il trasferimento dati e cancellate quello che non usate. Tipicamente troviamo risparmi del 20-40% quando auditiamo setup AWS esistenti.');

-- Consulting FAQs
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'consulting-engagement'), 'it',
'Come funzionano tipicamente gli ingaggi di consulenza?',
'Di solito inizia con 1-2 settimane di discovery per capire la vostra situazione. Poi raccomandazioni, documentazione e spesso aiuto pratico nell''implementare i cambiamenti. Alcuni ingaggi sono progetti a scope fisso, altri diventano relazioni di advisory continuative.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'consulting-deliverables'), 'it',
'Quali deliverable riceviamo da un ingaggio di consulenza?',
'Documentazione di architettura, raccomandazioni tecnologiche con motivazioni, roadmap di implementazione, a volte prototipi funzionanti. Tutto documentato così il vostro team può procedere in autonomia.');

-- QA FAQs
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'qa-automation-worth'), 'it',
'Vale la pena investire nell''automazione dei test?',
'Se state sviluppando attivamente l''app e pianificate di mantenerla a lungo termine, sì. I test automatizzati catturano le regressioni, vi permettono di fare refactoring senza paura e accelerano i release. La maggior parte dei progetti attivi vede ROI positivo in 6-12 mesi.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'qa-integration'), 'it',
'Potete integrarvi con il nostro team di sviluppo esistente?',
'Sì. Possiamo unirci ai vostri sprint, partecipare agli standup, usare i vostri strumenti. A molti clienti piace questo modello - siamo praticamente un''estensione del loro team invece di un vendor separato.');
