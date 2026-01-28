-- German translations for FAQ items

-- Security FAQs
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'security-pentest-frequency'), 'de',
'Wie oft sollten wir Penetrationstests durchführen?',
'Mindestens einmal im Jahr, plus nach größeren Änderungen an Ihrer Anwendung oder Infrastruktur. Wenn Sie Zahlungen, Gesundheitsdaten oder Finanzinformationen verarbeiten, ist vierteljährlich besser. Und immer vor einem großen Launch - Sie wollen nicht von Ihren Nutzern über Schwachstellen erfahren.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'security-pentest-duration'), 'de',
'Wie lange dauert ein Penetrationstest?',
'Die meisten Webanwendungstests dauern 1-2 Wochen. Eine einfache API kann in wenigen Tagen fertig sein. Vollständige Infrastrukturtests können 3-4 Wochen dauern. Wir geben Ihnen einen konkreten Zeitplan während des Scopings, sobald wir verstehen, was wir testen.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'security-compliance'), 'de',
'Können Sie uns bei der SOC 2 oder ISO 27001 Zertifizierung helfen?',
'Ja. Wir helfen Unternehmen bei der Vorbereitung auf Compliance-Audits - Lücken identifizieren, Kontrollen implementieren, Praktiken dokumentieren. Wir haben Teams durch SOC 2, ISO 27001, HIPAA und DSGVO begleitet. Der Prozess ist weniger schmerzhaft, wenn jemand hilft, der es schon gemacht hat.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'security-cloud-audit'), 'de',
'Was deckt ein Cloud-Sicherheitsaudit ab?',
'IAM-Konfigurationen, Netzwerksicherheit, Verschlüsselungseinstellungen, Logging, Monitoring, Datenschutz und wie Sie im Vergleich zu CIS-Benchmarks abschneiden. Sie erhalten eine priorisierte Liste, was zu beheben ist und wie.');

-- Web Development FAQs
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'web-timeline'), 'de',
'Wie lange dauert es, eine Webanwendung zu bauen?',
'Ein einfaches MVP: 6-8 Wochen. Ein vollständiges SaaS-Produkt mit Auth, Abrechnung und echten Features: 3-6 Monate. Enterprise-Anwendungen mit komplexen Integrationen: länger. Wir können eine realistische Schätzung geben, sobald wir verstehen, was Sie bauen.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'web-technology-choice'), 'de',
'Warum nutzen Sie hauptsächlich React und Next.js?',
'React hat das größte Ökosystem, die besten Tools und die meisten Entwickler, die es kennen. Next.js fügt Server-Side Rendering, API-Routen und Performance-Optimierungen hinzu, die selbst zu bauen Monate dauern würde. Für die meisten Projekte ist es die richtige Wahl.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'web-maintenance'), 'de',
'Bieten Sie laufende Wartung nach dem Launch an?',
'Ja. Wir bieten Wartungspakete - Sicherheitsupdates, Bugfixes, Performance-Monitoring, neue Features. Viele Kunden starten mit einem Entwicklungsprojekt und behalten uns für die laufende Arbeit.');

-- Mobile Development FAQs
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'mobile-native-vs-cross'), 'de',
'Warum native Entwicklung statt React Native oder Flutter?',
'Native Apps sind schneller und haben vollen Zugriff auf Plattform-Features. Cross-Platform-Frameworks fügen Komplexität hinzu, und Sie schreiben am Ende oft sowieso nativen Code für fortgeschrittene Funktionen. Wenn Ihre App hochwertig wirken soll, lohnt sich nativ.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'mobile-timeline'), 'de',
'Wie lange dauert die Entwicklung einer mobilen App?',
'Eine einfache App für eine Plattform: 2-3 Monate. iOS und Android mit gemeinsamem Backend: 4-6 Monate. Apps mit Offline-Support, Echtzeit-Features oder Hardware-Integration dauern länger. Komplexität bestimmt den Zeitplan mehr als die Anzahl der Features.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'mobile-app-store'), 'de',
'Übernehmen Sie die App Store und Play Store Einreichung?',
'Ja. Wir bereiten Assets vor, wickeln die Einreichung ab, reagieren auf Review-Feedback und nehmen alle Änderungen vor, die Apple oder Google verlangen. Wir haben genug Erfahrung, um zu wissen, was Ablehnungen auslöst und wie man sie vermeidet.');

-- DevOps FAQs
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'devops-cloud-choice'), 'de',
'Welchen Cloud-Anbieter empfehlen Sie?',
'AWS für die meisten Dinge - die meisten Services, die beste Dokumentation. Wir nutzen auch GCP und Cloudflare Workers, wenn sie besser passen. Die richtige Antwort hängt davon ab, was Sie bauen, welche Compliance Sie brauchen und was Ihr Team bereits kennt.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'devops-kubernetes'), 'de',
'Brauchen wir Kubernetes?',
'Wahrscheinlich nicht. Kubernetes fügt operativen Overhead hinzu, den die meisten Projekte nicht brauchen. ECS, Cloud Run oder gut konfigurierte EC2-Instanzen funktionieren für die meisten Workloads gut. Wir empfehlen Kubernetes nur, wenn die Anforderungen die Komplexität wirklich rechtfertigen.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'devops-cost'), 'de',
'Wie können wir unsere Cloud-Kosten reduzieren?',
'Instanzen richtig dimensionieren, Reserved oder Spot Instances nutzen wo möglich, Auto-Scaling einrichten, Datentransfer optimieren und Ungenutztes löschen. Wir finden typischerweise 20-40% Einsparungen, wenn wir bestehende AWS-Setups auditieren.');

-- Consulting FAQs
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'consulting-engagement'), 'de',
'Wie laufen Beratungsengagements typischerweise ab?',
'Normalerweise beginnt es mit 1-2 Wochen Discovery, um Ihre Situation zu verstehen. Dann Empfehlungen, Dokumentation und oft praktische Hilfe bei der Umsetzung von Änderungen. Manche Engagements sind Projekte mit festem Umfang, andere werden zu laufenden Beratungsbeziehungen.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'consulting-deliverables'), 'de',
'Welche Liefergegenstände erhalten wir aus einem Beratungsengagement?',
'Architekturdokumentation, Technologieempfehlungen mit Begründung, Implementierungs-Roadmaps, manchmal funktionierende Prototypen. Alles dokumentiert, damit Ihr Team eigenständig weitermachen kann.');

-- QA FAQs
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'qa-automation-worth'), 'de',
'Lohnt sich die Investition in Testautomatisierung?',
'Wenn Sie die App aktiv entwickeln und langfristig warten wollen, ja. Automatisierte Tests fangen Regressionen ab, ermöglichen angstfreies Refactoring und beschleunigen Releases. Die meisten aktiven Projekte sehen positiven ROI innerhalb von 6-12 Monaten.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'qa-integration'), 'de',
'Können Sie sich in unser bestehendes Entwicklungsteam integrieren?',
'Ja. Wir können an Ihren Sprints teilnehmen, bei Standups dabei sein, Ihre Tools nutzen. Viele Kunden mögen dieses Modell - wir sind praktisch eine Erweiterung ihres Teams statt ein separater Dienstleister.');
