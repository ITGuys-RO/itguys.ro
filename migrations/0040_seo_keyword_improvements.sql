-- SEO Keyword Improvements Migration
-- Updates service titles and descriptions for better keyword targeting
-- Adds targeted FAQ items for "software development", "mobile development", "cybersecurity"

-- Update Security Services -> Cybersecurity Services (ID: 2)
UPDATE service_translations
SET
  title = 'Cybersecurity Services',
  description = 'Enterprise cybersecurity services from Electronic Arts and TUI veterans. We don''t just build software — we know how to break it. Penetration testing, security audits, and vulnerability assessments.'
WHERE service_id = 2 AND locale = 'en';

UPDATE service_translations
SET
  title = 'Servicii de Securitate Cibernetică',
  description = 'Servicii de securitate cibernetică enterprise de la veterani Electronic Arts și TUI. Nu doar construim software — știm cum să-l spargem. Teste de penetrare, audituri de securitate și evaluări de vulnerabilitate.'
WHERE service_id = 2 AND locale = 'ro';

UPDATE service_translations
SET
  title = 'Services de Cybersécurité',
  description = 'Services de cybersécurité enterprise par des vétérans d''Electronic Arts et TUI. Nous ne faisons pas que construire des logiciels — nous savons comment les casser. Tests de pénétration, audits de sécurité et évaluations de vulnérabilités.'
WHERE service_id = 2 AND locale = 'fr';

UPDATE service_translations
SET
  title = 'Cybersicherheitsdienste',
  description = 'Enterprise-Cybersicherheitsdienste von Electronic Arts- und TUI-Veteranen. Wir bauen nicht nur Software — wir wissen, wie man sie knackt. Penetrationstests, Sicherheitsaudits und Schwachstellenbewertungen.'
WHERE service_id = 2 AND locale = 'de';

UPDATE service_translations
SET
  title = 'Servizi di Cybersicurezza',
  description = 'Servizi di cybersicurezza enterprise da veterani di Electronic Arts e TUI. Non costruiamo solo software — sappiamo come violarlo. Penetration testing, audit di sicurezza e valutazioni delle vulnerabilità.'
WHERE service_id = 2 AND locale = 'it';

UPDATE service_translations
SET
  title = 'Servicios de Ciberseguridad',
  description = 'Servicios de ciberseguridad enterprise de veteranos de Electronic Arts y TUI. No solo construimos software — sabemos cómo romperlo. Pruebas de penetración, auditorías de seguridad y evaluaciones de vulnerabilidades.'
WHERE service_id = 2 AND locale = 'es';

-- Update Mobile Applications -> Mobile App Development (ID: 7)
UPDATE service_translations
SET
  title = 'Mobile App Development',
  description = 'Native mobile development for iOS and Android by engineers with 10+ years at Nagarro and Enea AB. Real native performance, not cross-platform compromises.'
WHERE service_id = 7 AND locale = 'en';

UPDATE service_translations
SET
  title = 'Dezvoltare Aplicații Mobile',
  description = 'Dezvoltare mobile nativă pentru iOS și Android de ingineri cu peste 10 ani la Nagarro și Enea AB. Performanță nativă reală, fără compromisuri cross-platform.'
WHERE service_id = 7 AND locale = 'ro';

UPDATE service_translations
SET
  title = 'Développement d''Applications Mobiles',
  description = 'Développement mobile natif pour iOS et Android par des ingénieurs avec plus de 10 ans chez Nagarro et Enea AB. Vraies performances natives, pas de compromis cross-platform.'
WHERE service_id = 7 AND locale = 'fr';

UPDATE service_translations
SET
  title = 'Mobile-App-Entwicklung',
  description = 'Native Mobile-Entwicklung für iOS und Android von Ingenieuren mit über 10 Jahren bei Nagarro und Enea AB. Echte native Performance, keine Cross-Platform-Kompromisse.'
WHERE service_id = 7 AND locale = 'de';

UPDATE service_translations
SET
  title = 'Sviluppo App Mobile',
  description = 'Sviluppo mobile nativo per iOS e Android da ingegneri con oltre 10 anni in Nagarro ed Enea AB. Prestazioni native reali, nessun compromesso cross-platform.'
WHERE service_id = 7 AND locale = 'it';

UPDATE service_translations
SET
  title = 'Desarrollo de Aplicaciones Móviles',
  description = 'Desarrollo móvil nativo para iOS y Android por ingenieros con más de 10 años en Nagarro y Enea AB. Rendimiento nativo real, sin compromisos cross-platform.'
WHERE service_id = 7 AND locale = 'es';

-- Add SEO-targeted FAQ items

-- Software Development FAQs
INSERT INTO faq_items (slug, category, sort_order, is_active) VALUES
('software-development-company-selection', 'development', 100, 1),
('custom-vs-off-the-shelf-software', 'development', 101, 1),
('software-development-process', 'development', 102, 1);

-- Get the IDs for the new FAQ items
INSERT INTO faq_translations (faq_id, locale, question, answer)
SELECT id, 'en',
  'How do I choose a software development company?',
  'Look for a company with proven experience in your industry, clear communication practices, and a transparent development process. Ask about their team''s background, review their portfolio, and request references. At ITGuys, our team includes veterans from Electronic Arts, TUI, and Nagarro — companies where quality and security are non-negotiable.'
FROM faq_items WHERE slug = 'software-development-company-selection';

INSERT INTO faq_translations (faq_id, locale, question, answer)
SELECT id, 'ro',
  'Cum aleg o companie de dezvoltare software?',
  'Caută o companie cu experiență dovedită în industria ta, practici de comunicare clare și un proces de dezvoltare transparent. Întreabă despre experiența echipei, verifică portofoliul și cere referințe. La ITGuys, echipa noastră include veterani de la Electronic Arts, TUI și Nagarro — companii unde calitatea și securitatea sunt non-negociabile.'
FROM faq_items WHERE slug = 'software-development-company-selection';

INSERT INTO faq_translations (faq_id, locale, question, answer)
SELECT id, 'en',
  'What''s the difference between custom software development and off-the-shelf solutions?',
  'Custom software development creates solutions tailored exactly to your business processes, while off-the-shelf software offers generic functionality. Custom solutions provide competitive advantages, better integration with existing systems, and can scale with your business. The upfront investment is higher, but you avoid ongoing licensing costs and limitations.'
FROM faq_items WHERE slug = 'custom-vs-off-the-shelf-software';

INSERT INTO faq_translations (faq_id, locale, question, answer)
SELECT id, 'ro',
  'Care este diferența între dezvoltarea software personalizat și soluțiile off-the-shelf?',
  'Dezvoltarea software personalizat creează soluții adaptate exact proceselor tale de afaceri, în timp ce software-ul off-the-shelf oferă funcționalități generice. Soluțiile personalizate oferă avantaje competitive, integrare mai bună cu sistemele existente și pot scala cu afacerea ta. Investiția inițială este mai mare, dar eviți costurile de licențiere și limitările continue.'
FROM faq_items WHERE slug = 'custom-vs-off-the-shelf-software';

INSERT INTO faq_translations (faq_id, locale, question, answer)
SELECT id, 'en',
  'What does your software development process look like?',
  'We follow an iterative approach: discovery and requirements gathering, architecture design, development sprints with regular demos, thorough testing, and deployment. Security is integrated throughout — not bolted on at the end. We maintain clear communication with weekly updates and involve you in key decisions.'
FROM faq_items WHERE slug = 'software-development-process';

INSERT INTO faq_translations (faq_id, locale, question, answer)
SELECT id, 'ro',
  'Cum arată procesul vostru de dezvoltare software?',
  'Urmăm o abordare iterativă: descoperire și colectare cerințe, proiectare arhitectură, sprinturi de dezvoltare cu demo-uri regulate, testare riguroasă și deployment. Securitatea este integrată pe tot parcursul — nu adăugată la final. Menținem comunicare clară cu actualizări săptămânale și te implicăm în deciziile cheie.'
FROM faq_items WHERE slug = 'software-development-process';

-- Mobile Development FAQs
INSERT INTO faq_items (slug, category, sort_order, is_active) VALUES
('native-vs-cross-platform-mobile', 'mobile', 100, 1),
('mobile-development-timeline', 'mobile', 101, 1),
('ios-android-mobile-development', 'mobile', 102, 1);

INSERT INTO faq_translations (faq_id, locale, question, answer)
SELECT id, 'en',
  'What''s the difference between native and cross-platform mobile development?',
  'Native mobile development builds separate apps for iOS (Swift) and Android (Kotlin), offering the best performance, full platform feature access, and optimal user experience. Cross-platform frameworks like React Native or Flutter use shared code but often compromise on performance and native feel. We specialize in native development for apps where quality matters.'
FROM faq_items WHERE slug = 'native-vs-cross-platform-mobile';

INSERT INTO faq_translations (faq_id, locale, question, answer)
SELECT id, 'ro',
  'Care este diferența între dezvoltarea mobile nativă și cross-platform?',
  'Dezvoltarea mobile nativă construiește aplicații separate pentru iOS (Swift) și Android (Kotlin), oferind cea mai bună performanță, acces complet la funcționalitățile platformei și experiență optimă pentru utilizator. Framework-urile cross-platform precum React Native sau Flutter folosesc cod comun, dar adesea compromit performanța și aspectul nativ. Noi ne specializăm în dezvoltare nativă pentru aplicații unde calitatea contează.'
FROM faq_items WHERE slug = 'native-vs-cross-platform-mobile';

INSERT INTO faq_translations (faq_id, locale, question, answer)
SELECT id, 'en',
  'How long does mobile app development typically take?',
  'A typical mobile app takes 3-6 months from concept to launch, depending on complexity. Simple apps with basic features might take 2-3 months, while complex apps with custom backends, integrations, and advanced features can take 6-12 months. We provide realistic timelines during our initial consultation.'
FROM faq_items WHERE slug = 'mobile-development-timeline';

INSERT INTO faq_translations (faq_id, locale, question, answer)
SELECT id, 'ro',
  'Cât durează de obicei dezvoltarea unei aplicații mobile?',
  'O aplicație mobilă tipică durează 3-6 luni de la concept la lansare, în funcție de complexitate. Aplicațiile simple cu funcționalități de bază pot dura 2-3 luni, în timp ce aplicațiile complexe cu backend-uri personalizate, integrări și funcționalități avansate pot dura 6-12 luni. Oferim termene realiste în consultația inițială.'
FROM faq_items WHERE slug = 'mobile-development-timeline';

INSERT INTO faq_translations (faq_id, locale, question, answer)
SELECT id, 'en',
  'Do you offer both iOS and Android mobile development?',
  'Yes, we offer native mobile development for both iOS and Android. Our mobile engineer has over 10 years of experience at Nagarro and Enea AB, building apps for IoT, healthcare, and e-commerce. We can develop for one platform first and expand to the other, or build both simultaneously.'
FROM faq_items WHERE slug = 'ios-android-mobile-development';

INSERT INTO faq_translations (faq_id, locale, question, answer)
SELECT id, 'ro',
  'Oferiți dezvoltare mobilă atât pentru iOS cât și pentru Android?',
  'Da, oferim dezvoltare mobilă nativă atât pentru iOS cât și pentru Android. Inginerul nostru mobile are peste 10 ani de experiență la Nagarro și Enea AB, construind aplicații pentru IoT, sănătate și e-commerce. Putem dezvolta pentru o platformă întâi și extinde la cealaltă, sau construi ambele simultan.'
FROM faq_items WHERE slug = 'ios-android-mobile-development';

-- Cybersecurity FAQs
INSERT INTO faq_items (slug, category, sort_order, is_active) VALUES
('cybersecurity-services-offered', 'security', 100, 1),
('cybersecurity-assessment-frequency', 'security', 101, 1),
('cybersecurity-vs-it-security', 'security', 102, 1);

INSERT INTO faq_translations (faq_id, locale, question, answer)
SELECT id, 'en',
  'What cybersecurity services do you offer?',
  'We provide comprehensive cybersecurity services including penetration testing, security audits, vulnerability assessments, cloud security reviews, and DDoS protection configuration. Our team includes security professionals who performed penetration testing at Electronic Arts and built DDoS protection systems at TUI.'
FROM faq_items WHERE slug = 'cybersecurity-services-offered';

INSERT INTO faq_translations (faq_id, locale, question, answer)
SELECT id, 'ro',
  'Ce servicii de securitate cibernetică oferiți?',
  'Oferim servicii complete de securitate cibernetică incluzând teste de penetrare, audituri de securitate, evaluări de vulnerabilitate, verificări de securitate cloud și configurare protecție DDoS. Echipa noastră include profesioniști în securitate care au efectuat teste de penetrare la Electronic Arts și au construit sisteme de protecție DDoS la TUI.'
FROM faq_items WHERE slug = 'cybersecurity-services-offered';

INSERT INTO faq_translations (faq_id, locale, question, answer)
SELECT id, 'en',
  'How often should we perform cybersecurity assessments?',
  'We recommend annual penetration testing at minimum, with quarterly vulnerability scans. However, you should also test after major application changes, infrastructure updates, or when handling new types of sensitive data. Continuous monitoring is ideal for organizations with high-value assets or regulatory requirements.'
FROM faq_items WHERE slug = 'cybersecurity-assessment-frequency';

INSERT INTO faq_translations (faq_id, locale, question, answer)
SELECT id, 'ro',
  'Cât de des ar trebui să efectuăm evaluări de securitate cibernetică?',
  'Recomandăm teste de penetrare anuale ca minim, cu scanări trimestriale de vulnerabilități. Cu toate acestea, ar trebui să testați și după modificări majore ale aplicațiilor, actualizări de infrastructură sau când gestionați tipuri noi de date sensibile. Monitorizarea continuă este ideală pentru organizații cu active de valoare ridicată sau cerințe reglementare.'
FROM faq_items WHERE slug = 'cybersecurity-assessment-frequency';

INSERT INTO faq_translations (faq_id, locale, question, answer)
SELECT id, 'en',
  'What''s the difference between cybersecurity and IT security?',
  'Cybersecurity specifically focuses on protecting systems, networks, and data from digital attacks, while IT security is a broader term that includes physical security of hardware and facilities. Cybersecurity covers threat detection, incident response, penetration testing, and securing applications against hackers. We focus on cybersecurity — protecting your digital assets from real-world threats.'
FROM faq_items WHERE slug = 'cybersecurity-vs-it-security';

INSERT INTO faq_translations (faq_id, locale, question, answer)
SELECT id, 'ro',
  'Care este diferența între securitatea cibernetică și securitatea IT?',
  'Securitatea cibernetică se concentrează specific pe protejarea sistemelor, rețelelor și datelor de atacuri digitale, în timp ce securitatea IT este un termen mai larg care include securitatea fizică a hardware-ului și facilităților. Securitatea cibernetică acoperă detectarea amenințărilor, răspunsul la incidente, testele de penetrare și securizarea aplicațiilor împotriva hackerilor. Noi ne concentrăm pe securitatea cibernetică — protejarea activelor tale digitale de amenințări reale.'
FROM faq_items WHERE slug = 'cybersecurity-vs-it-security';
