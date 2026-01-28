-- Romanian translations for FAQ items

-- Security FAQs
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'security-pentest-frequency'), 'ro',
'Cât de des ar trebui să facem teste de penetrare?',
'Minimum o dată pe an, plus după orice schimbări majore la aplicație sau infrastructură. Dacă gestionezi plăți, date medicale sau informații financiare, trimestrial e mai bine. Și întotdeauna înainte de un lansare mare - nu vrei să afli despre vulnerabilități de la utilizatori.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'security-pentest-duration'), 'ro',
'Cât durează un test de penetrare?',
'Majoritatea testelor de aplicații web durează 1-2 săptămâni. Un API simplu poate fi gata în câteva zile. Testele complete de infrastructură pot dura 3-4 săptămâni. Îți vom da un timeline specific în faza de scoping odată ce înțelegem ce testăm.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'security-compliance'), 'ro',
'Ne puteți ajuta să obținem conformitate SOC 2 sau ISO 27001?',
'Da. Ajutăm companiile să se pregătească pentru audituri de conformitate - identificăm lacune, implementăm controale, documentăm practici. Am ghidat echipe prin SOC 2, ISO 27001, HIPAA și GDPR. Procesul e mai puțin dureros când cineva care a mai făcut asta te ajută.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'security-cloud-audit'), 'ro',
'Ce acoperă un audit de securitate cloud?',
'Configurații IAM, securitate rețea, setări de criptare, logging, monitoring, protecția datelor și cum te situezi față de benchmark-urile CIS. Primești o listă prioritizată cu ce să repari și cum.');

-- Web Development FAQs
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'web-timeline'), 'ro',
'Cât durează să construiești o aplicație web?',
'Un MVP simplu: 6-8 săptămâni. Un produs SaaS complet cu autentificare, facturare și funcționalități reale: 3-6 luni. Aplicații enterprise cu integrări complexe: mai mult. Putem da o estimare reală odată ce înțelegem ce construiești.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'web-technology-choice'), 'ro',
'De ce folosiți în principal React și Next.js?',
'React are cel mai mare ecosistem, cele mai bune unelte și cei mai mulți developeri care îl cunosc. Next.js adaugă server-side rendering, rute API și optimizări de performanță care ar dura luni să le construiești singur. Pentru majoritatea proiectelor, e alegerea corectă.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'web-maintenance'), 'ro',
'Oferiți mentenanță continuă după lansare?',
'Da. Oferim pachete de mentenanță - actualizări de securitate, fix-uri de bug-uri, monitorizare performanță, funcționalități noi. Mulți clienți încep cu un proiect de construcție și ne păstrează pentru lucru continuu.');

-- Mobile Development FAQs
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'mobile-native-vs-cross'), 'ro',
'De ce dezvoltare nativă în loc de React Native sau Flutter?',
'Aplicațiile native sunt mai rapide și au acces complet la funcțiile platformei. Framework-urile cross-platform adaugă complexitate și adesea ajungi să scrii cod nativ oricum pentru orice avansat. Dacă aplicația ta trebuie să se simtă premium, nativ merită.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'mobile-timeline'), 'ro',
'Cât durează dezvoltarea unei aplicații mobile?',
'O aplicație simplă pentru o platformă: 2-3 luni. Atât iOS cât și Android cu backend comun: 4-6 luni. Aplicații cu suport offline, funcții în timp real sau integrare hardware durează mai mult. Complexitatea determină timeline-ul mai mult decât numărul de funcționalități.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'mobile-app-store'), 'ro',
'Vă ocupați de submiterea în App Store și Play Store?',
'Da. Pregătim asset-urile, gestionăm submiterea, răspundem la feedback-ul de review și facem orice modificări cer Apple sau Google. Am trecut prin proces de suficiente ori să știm ce declanșează respingeri și cum să le evităm.');

-- DevOps FAQs
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'devops-cloud-choice'), 'ro',
'Ce furnizor cloud recomandați?',
'AWS pentru majoritatea lucrurilor - cele mai multe servicii, cea mai bună documentație. Folosim și GCP și Cloudflare Workers când se potrivesc mai bine. Răspunsul corect depinde de ce construiești, ce conformitate ai nevoie și ce știe deja echipa ta.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'devops-kubernetes'), 'ro',
'Avem nevoie de Kubernetes?',
'Probabil nu. Kubernetes adaugă overhead operațional de care majoritatea proiectelor nu au nevoie. ECS, Cloud Run sau instanțe EC2 bine configurate funcționează bine pentru majoritatea workload-urilor. Recomandăm Kubernetes doar când cerințele chiar justifică complexitatea.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'devops-cost'), 'ro',
'Cum putem reduce costurile cloud?',
'Dimensionează corect instanțele, folosește reserved sau spot instances unde poți, configurează auto-scaling, optimizează transferul de date și șterge ce nu folosești. De obicei găsim economii de 20-40% când audităm setup-uri AWS existente.');

-- Consulting FAQs
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'consulting-engagement'), 'ro',
'Cum funcționează de obicei angajamentele de consultanță?',
'De obicei începe cu 1-2 săptămâni de discovery pentru a înțelege situația ta. Apoi recomandări, documentație și adesea ajutor practic la implementarea schimbărilor. Unele angajamente sunt proiecte cu scop fix, altele devin relații de advisory continuu.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'consulting-deliverables'), 'ro',
'Ce livrabile primim dintr-un angajament de consultanță?',
'Documentație de arhitectură, recomandări tehnologice cu argumentare, roadmap-uri de implementare, uneori prototipuri funcționale. Totul documentat ca echipa ta să poată continua independent.');

-- QA FAQs
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'qa-automation-worth'), 'ro',
'Merită investiția în automatizarea testelor?',
'Dacă dezvolți activ aplicația și planifici să o menții pe termen lung, da. Testele automate prind regresii, te lasă să refactorizezi fără frică și accelerează release-urile. Majoritatea proiectelor active văd ROI pozitiv în 6-12 luni.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'qa-integration'), 'ro',
'Vă puteți integra cu echipa noastră de dezvoltare existentă?',
'Da. Putem să ne alăturăm sprint-urilor tale, să participăm la standup-uri, să folosim uneltele tale. Multor clienți le place acest model - suntem practic o extensie a echipei lor în loc de un vendor separat.');
