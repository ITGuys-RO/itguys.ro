-- Convert KeyVision PRO to a full case study with content in all 6 locales

UPDATE projects SET is_case_study = 1, duration = '3 months', completed_at = '2016-10' WHERE slug = 'keyvision-pro';

UPDATE project_translations SET
  slug = 'keyvision-pro',
  content = '## Background

Law firms across Europe were struggling with fragmented practice management — time tracking in spreadsheets, invoicing in separate accounting software, case files in shared folders, and court dates on wall calendars. KeyVision PRO set out to unify these workflows into a single cloud-based platform purpose-built for the legal profession. The system needed to handle the full spectrum from solo practitioners managing a few dozen active matters to large multi-team firms with hundreds of concurrent cases.

Data security was paramount. Legal professionals handle highly confidential client information subject to attorney-client privilege and data protection regulations. Any practice management platform had to meet strict security requirements while remaining accessible and responsive for daily use. The system also needed to accommodate the billing complexity inherent to legal work — hourly rates that vary by attorney and matter type, fixed-fee arrangements, retainer management, and expense tracking.

## Technical Approach

We built the backend on PHP with the Laravel framework, leveraging its expressive ORM for the complex relational data model that legal practice management demands. Laravel''s authentication and authorization system provided the foundation for the granular role-based access controls that firms required — partners seeing everything, associates seeing their assigned matters, and support staff seeing only what their role permitted.

AngularJS powered the frontend single-page application, delivering a responsive, desktop-class experience for the daily workflows that legal professionals depend on. The component architecture allowed us to build reusable UI elements — time entry widgets, matter selectors, and client lookups — that appeared consistently across all modules.

MySQL stored the relational data with careful schema design to handle multi-tenant data isolation, while Redis provided the caching layer for frequently accessed data such as active timesheets, recent matter lookups, and session state. Each firm''s data was logically separated, with row-level security ensuring no cross-tenant data leakage. AWS provided the hosting infrastructure with encrypted storage and automated backups. Jenkins handled the CI/CD pipeline, running automated tests and deploying to AWS on each merge.

## Implementation Details

The time tracking module was central to the platform, since accurate time capture directly impacts firm revenue. We built both a manual timesheet interface and a running timer that attorneys could start and stop as they worked. Time entries captured the attorney, matter, activity type, narrative description, and duration, with configurable rounding rules. The system flagged potential issues — unusually long entries, entries outside business hours, or entries that exceeded matter budgets — for review before billing.

The billing engine transformed time entries and expenses into professional invoices. Each firm could configure their invoice templates, payment terms, and billing schedules. The system handled split billing for matters with multiple responsible parties, progress billing for phased engagements, and trust account management for retainer-based work. Integration with accounting systems ensured financial data stayed synchronized.

Case management provided a structured view of each matter''s lifecycle. Attorneys could track deadlines, associate documents, log communications, and monitor status through a kanban-style board or traditional list view. Court hearing tracking pulled calendar data into a centralized schedule, with automated reminders sent via email to all attorneys assigned to a hearing. Conflict checking scanned the client database when new matters were opened, flagging potential conflicts of interest.

Performance dashboards gave firm management visibility into key metrics — billable utilization rates, realization rates, work-in-progress aging, and revenue by practice area. Partners could drill down from firm-wide views to individual attorney performance. Custom report builders let firms create their own analytics views without requiring technical assistance.

SSL encryption protected all data in transit, while AES-256 encryption secured data at rest. Two-factor authentication was available for all users, with firms able to enforce it as a policy. Comprehensive audit logging tracked every data access and modification for compliance purposes.

## Key Outcomes

KeyVision PRO now serves law firms ranging from solo practitioners to large multi-team practices across Europe. Firms report significant reductions in administrative overhead — automated billing workflows replaced manual invoice preparation, and the centralized case management eliminated time spent searching through scattered files and emails. The time tracking improvements alone increased billable capture rates, directly improving firm revenue. The platform''s security posture and compliance features gave firms confidence to move their practice management to the cloud, often for the first time.',
  meta_title = 'KeyVision PRO Legal Practice Management Case Study | ITGuys',
  meta_description = 'How we built a cloud-based legal practice management platform with Laravel 5.4, AngularJS, MySQL, and Redis — serving law firms across Europe.'
WHERE project_id = (SELECT id FROM projects WHERE slug = 'keyvision-pro') AND locale = 'en';

UPDATE project_translations SET
  slug = 'keyvision-pro',
  content = '## Context

Firmele de avocatură din Europa se luptau cu managementul fragmentat al practicii — pontaje în foi de calcul, facturare în software separat de contabilitate, dosare de cazuri în foldere partajate și termene de judecată pe calendare de perete. KeyVision PRO și-a propus să unifice aceste fluxuri de lucru într-o singură platformă cloud concepută special pentru profesia juridică. Sistemul trebuia să acopere de la practicieni individuali cu câteva zeci de dosare active la firme mari cu sute de cazuri concurente.

Securitatea datelor era primordială. Profesioniștii juridici gestionează informații extrem de confidențiale ale clienților, supuse privilegiului avocat-client și reglementărilor de protecție a datelor. Platforma trebuia să îndeplinească cerințe stricte de securitate rămânând accesibilă pentru utilizarea zilnică. Sistemul trebuia să acomodeze și complexitatea facturării specifice muncii juridice — tarife orare diferite pe avocat și tip de dosar, aranjamente cu onorariu fix și gestionarea avansurilor.

## Abordare Tehnică

Am construit backend-ul pe PHP cu framework-ul Laravel, valorificând ORM-ul expresiv pentru modelul complex de date relaționale. Sistemul de autentificare și autorizare al Laravel a furnizat fundația pentru controalele granulare de acces bazate pe roluri — partenerii vedeau totul, asociații vedeau dosarele asignate, iar personalul de suport vedea doar ce permitea rolul lor.

AngularJS a alimentat aplicația frontend single-page, oferind o experiență responsivă de nivel desktop. Arhitectura de componente a permis construirea de elemente UI reutilizabile — widgeturi de pontaj, selectoare de dosare și căutări de clienți.

MySQL a stocat datele relaționale cu un design atent al schemei pentru izolarea multi-tenant, iar Redis a furnizat stratul de caching pentru date frecvent accesate precum pontajele active, căutările recente de dosare și starea sesiunilor. AWS a furnizat infrastructura de hosting cu stocare criptată și backup-uri automate. Jenkins a gestionat pipeline-ul CI/CD, rulând teste automate și deployând pe AWS la fiecare merge.

## Detalii de Implementare

Modulul de pontaj era central, deoarece captura precisă a timpului impactează direct veniturile firmei. Am construit atât o interfață manuală de pontaj, cât și un cronometru pe care avocații îl puteau porni și opri. Sistemul semnala probleme potențiale — intrări neobișnuit de lungi sau care depășeau bugetele dosarului.

Motorul de facturare transforma pontajele și cheltuielile în facturi profesionale. Fiecare firmă putea configura șabloanele de factură, termenii de plată și programul de facturare. Sistemul gestiona facturare împărțită, facturare progresivă și managementul conturilor de avans.

Managementul cazurilor oferea o viziune structurată a ciclului de viață al fiecărui dosar. Avocații puteau urmări termene, asocia documente și monitoriza starea. Urmărirea audierilor centraliza calendarul cu remindere automate. Verificarea conflictelor de interese scana baza de date la deschiderea dosarelor noi.

Dashboard-urile de performanță ofereau managementului vizibilitate asupra metricilor cheie — rate de utilizare facturabilă, rate de realizare și venituri pe arii de practică.

Criptarea SSL proteja toate datele în tranzit, iar criptarea AES-256 securiza datele în repaus. Autentificarea cu doi factori era disponibilă pentru toți utilizatorii.

## Rezultate Cheie

KeyVision PRO servește acum firme de avocatură de la practicieni individuali la practici mari multi-echipă din toată Europa. Firmele raportează reduceri semnificative ale costurilor administrative. Îmbunătățirile de pontaj singure au crescut ratele de captare a timpului facturabil, îmbunătățind direct veniturile firmei.',
  meta_title = 'Studiu de Caz KeyVision PRO — Management Practică Juridică | ITGuys',
  meta_description = 'Cum am construit o platformă cloud de management al practicii juridice cu Laravel, Angular și MySQL — servind firme de avocatură din toată Europa.'
WHERE project_id = (SELECT id FROM projects WHERE slug = 'keyvision-pro') AND locale = 'ro';

UPDATE project_translations SET
  slug = 'keyvision-pro',
  content = '## Contexte

Les cabinets d''avocats à travers l''Europe luttaient avec une gestion de cabinet fragmentée — suivi du temps dans des tableurs, facturation dans un logiciel comptable séparé, dossiers dans des répertoires partagés et audiences sur des calendriers muraux. KeyVision PRO s''est donné pour objectif d''unifier ces flux de travail en une seule plateforme cloud conçue pour la profession juridique. Le système devait couvrir du praticien individuel au grand cabinet multi-équipes avec des centaines de dossiers simultanés.

La sécurité des données était primordiale. Les professionnels du droit gèrent des informations hautement confidentielles soumises au secret professionnel et aux réglementations de protection des données. La plateforme devait répondre à des exigences de sécurité strictes tout en restant accessible au quotidien. Le système devait aussi gérer la complexité de la facturation juridique — tarifs horaires variables, forfaits et gestion des provisions.

## Approche Technique

Nous avons construit le backend en PHP avec le framework Laravel, exploitant son ORM expressif pour le modèle de données relationnelles complexe. Le système d''authentification de Laravel fournissait la base pour les contrôles d''accès granulaires basés sur les rôles.

AngularJS alimentait l''application frontend monopage, offrant une expérience réactive de niveau bureau. L''architecture par composants permettait des éléments UI réutilisables — widgets de saisie de temps, sélecteurs de dossiers et recherche de clients.

MySQL stockait les données avec une isolation multi-tenant soigneusement conçue, tandis que Redis fournissait la couche de cache pour les données fréquemment consultées telles que les feuilles de temps actives, les recherches récentes de dossiers et l''état des sessions. AWS fournissait l''hébergement avec stockage chiffré et sauvegardes automatisées. Jenkins gérait le pipeline CI/CD, exécutant les tests automatisés et déployant sur AWS à chaque merge.

## Détails d''Implémentation

Le module de suivi du temps était central, car la capture précise du temps impacte directement les revenus. Nous avons construit une interface de feuille de temps manuelle et un chronomètre actif. Le système signalait les problèmes potentiels — entrées inhabituellement longues ou dépassant les budgets de dossier.

Le moteur de facturation transformait les entrées de temps et frais en factures professionnelles. Chaque cabinet configurait ses modèles, conditions de paiement et échéanciers. Le système gérait la facturation partagée, progressive et les comptes de provision.

La gestion des dossiers offrait une vue structurée du cycle de vie de chaque affaire. Les avocats pouvaient suivre les échéances, associer des documents et surveiller le statut. Le suivi des audiences centralisait le calendrier avec des rappels automatiques. La vérification des conflits d''intérêts analysait la base clients à l''ouverture de nouveaux dossiers.

Les tableaux de bord de performance donnaient aux dirigeants une visibilité sur les métriques clés — taux d''utilisation facturable, taux de réalisation et revenus par domaine de pratique.

Le chiffrement SSL protégeait les données en transit, le chiffrement AES-256 sécurisait les données au repos. L''authentification à deux facteurs était disponible pour tous les utilisateurs.

## Résultats Clés

KeyVision PRO sert désormais des cabinets allant du praticien individuel aux grands cabinets multi-équipes à travers l''Europe. Les cabinets rapportent des réductions significatives des frais administratifs. Les améliorations du suivi du temps ont directement augmenté les revenus des cabinets.',
  meta_title = 'Étude de Cas KeyVision PRO — Gestion de Cabinet Juridique | ITGuys',
  meta_description = 'Comment nous avons construit une plateforme cloud de gestion de cabinet juridique avec Laravel, Angular et MySQL — au service des cabinets à travers l''Europe.'
WHERE project_id = (SELECT id FROM projects WHERE slug = 'keyvision-pro') AND locale = 'fr';

UPDATE project_translations SET
  slug = 'keyvision-pro',
  content = '## Hintergrund

Anwaltskanzleien in ganz Europa kämpften mit fragmentiertem Kanzleimanagement — Zeiterfassung in Tabellen, Abrechnung in separater Buchhaltungssoftware, Akten in gemeinsamen Ordnern und Gerichtstermine an Wandkalendern. KeyVision PRO setzte sich zum Ziel, diese Workflows in einer einzigen cloudbasierten Plattform für die Rechtsbranche zu vereinen. Das System musste von Einzelanwälten bis zu großen Multi-Team-Kanzleien mit hunderten gleichzeitigen Fällen abdecken.

Datensicherheit war entscheidend. Juristen verarbeiten hochvertrauliche Mandanteninformationen unter Anwaltsgeheimnis und Datenschutzvorschriften. Die Plattform musste strenge Sicherheitsanforderungen erfüllen und gleichzeitig alltagstauglich bleiben. Das System musste auch die Abrechnungskomplexität der Rechtsarbeit bewältigen — unterschiedliche Stundensätze, Pauschalen und Vorschussverwaltung.

## Technischer Ansatz

Wir bauten das Backend mit PHP und dem Laravel-Framework und nutzten dessen ausdrucksstarkes ORM für das komplexe relationale Datenmodell. Laravels Authentifizierungssystem lieferte die Grundlage für granulare rollenbasierte Zugriffskontrollen — Partner sahen alles, Associates ihre zugewiesenen Mandate, Assistenten nur rollenrelevante Daten.

AngularJS trieb die Frontend-Single-Page-Application an und lieferte eine responsive, Desktop-Class-Erfahrung. Die Komponentenarchitektur ermöglichte wiederverwendbare UI-Elemente — Zeiterfassungs-Widgets, Mandatsauswahl und Mandantensuche.

MySQL speicherte die Daten mit sorgfältigem Schema-Design für Multi-Tenant-Datenisolierung, während Redis die Caching-Schicht für häufig abgerufene Daten wie aktive Stundenzettel, kürzliche Mandatssuchen und Sitzungszustände bereitstellte. AWS stellte die Hosting-Infrastruktur mit verschlüsselter Speicherung und automatisierten Backups bereit. Jenkins verwaltete die CI/CD-Pipeline mit automatisierten Tests und Deployment auf AWS bei jedem Merge.

## Implementierungsdetails

Das Zeiterfassungsmodul war zentral, da präzise Zeiterfassung den Kanzleiumsatz direkt beeinflusst. Wir bauten eine manuelle Timesheet-Oberfläche und einen laufenden Timer. Das System markierte potenzielle Probleme — ungewöhnlich lange Einträge oder Budgetüberschreitungen.

Die Abrechnungsengine verwandelte Zeiteinträge und Auslagen in professionelle Rechnungen. Jede Kanzlei konnte Rechnungsvorlagen, Zahlungsbedingungen und Abrechnungszeitpläne konfigurieren. Das System verwaltete geteilte Abrechnung, Fortschrittsabrechnung und Vorschusskonten.

Das Fallmanagement bot eine strukturierte Sicht auf den Lebenszyklus jedes Mandats. Anwälte konnten Fristen verfolgen, Dokumente zuordnen und den Status überwachen. Die Gerichtstermim-Verfolgung zentralisierte den Kalender mit automatischen Erinnerungen. Die Konfliktprüfung durchsuchte die Mandantendatenbank bei neuen Mandaten.

Performance-Dashboards gaben dem Management Einblick in Schlüsselkennzahlen — abrechenbare Auslastungsraten, Realisierungsraten und Umsatz nach Praxisbereich.

SSL-Verschlüsselung schützte alle Daten im Transit, AES-256-Verschlüsselung sicherte ruhende Daten. Zwei-Faktor-Authentifizierung war für alle Nutzer verfügbar.

## Zentrale Ergebnisse

KeyVision PRO bedient nun Kanzleien von Einzelanwälten bis zu großen Multi-Team-Praxen in ganz Europa. Kanzleien berichten von erheblichen Reduzierungen des Verwaltungsaufwands. Die Zeiterfassungsverbesserungen allein steigerten die abrechenbare Erfassungsrate und damit direkt den Kanzleiumsatz.',
  meta_title = 'KeyVision PRO Fallstudie — Juristische Kanzleimanagement-Plattform | ITGuys',
  meta_description = 'Wie wir eine cloudbasierte Kanzleimanagement-Plattform mit Laravel, Angular und MySQL bauten — für Kanzleien von Einzelanwälten bis Großkanzleien in Europa.'
WHERE project_id = (SELECT id FROM projects WHERE slug = 'keyvision-pro') AND locale = 'de';

UPDATE project_translations SET
  slug = 'keyvision-pro',
  content = '## Contesto

Gli studi legali in tutta Europa faticavano con una gestione frammentata dello studio — time tracking in fogli di calcolo, fatturazione in software contabile separato, fascicoli in cartelle condivise e udienze su calendari a parete. KeyVision PRO si è proposta di unificare questi flussi di lavoro in un''unica piattaforma cloud progettata per la professione legale. Il sistema doveva coprire dal professionista singolo allo studio multi-team con centinaia di casi contemporanei.

La sicurezza dei dati era fondamentale. I professionisti legali gestiscono informazioni altamente riservate dei clienti soggette al segreto professionale e alle normative sulla protezione dei dati. La piattaforma doveva soddisfare requisiti di sicurezza rigorosi rimanendo accessibile per l''uso quotidiano. Il sistema doveva anche gestire la complessità della fatturazione legale — tariffe orarie variabili, compensi fissi e gestione degli acconti.

## Approccio Tecnico

Abbiamo costruito il backend in PHP con il framework Laravel, sfruttando il suo ORM espressivo per il modello dati relazionale complesso. Il sistema di autenticazione di Laravel forniva la base per i controlli di accesso granulari basati sui ruoli.

AngularJS alimentava l''applicazione frontend single-page, offrendo un''esperienza responsive di livello desktop. L''architettura a componenti permetteva elementi UI riutilizzabili — widget di time entry, selettori di pratiche e ricerca clienti.

MySQL archiviava i dati con isolamento multi-tenant accuratamente progettato, mentre Redis forniva il layer di caching per dati frequentemente acceduti come timesheet attivi, ricerche recenti di pratiche e stato delle sessioni. AWS forniva l''infrastruttura con storage crittografato e backup automatici. Jenkins gestiva la pipeline CI/CD, eseguendo test automatizzati e deployando su AWS a ogni merge.

## Dettagli di Implementazione

Il modulo di time tracking era centrale, poiché la cattura precisa del tempo impatta direttamente i ricavi dello studio. Abbiamo costruito sia un''interfaccia timesheet manuale che un timer attivo. Il sistema segnalava problemi potenziali — inserimenti insolitamente lunghi o superamenti di budget.

Il motore di fatturazione trasformava i time entry e le spese in fatture professionali. Ogni studio poteva configurare i propri template, termini di pagamento e calendario di fatturazione. Il sistema gestiva fatturazione suddivisa, progressiva e conti fiduciari.

La gestione dei casi forniva una vista strutturata del ciclo di vita di ogni pratica. Gli avvocati potevano tracciare scadenze, associare documenti e monitorare lo stato. Il tracking delle udienze centralizzava il calendario con promemoria automatici. Il controllo dei conflitti di interesse analizzava il database clienti all''apertura di nuove pratiche.

Le dashboard di performance davano al management visibilità sulle metriche chiave — tassi di utilizzo fatturabile, tassi di realizzazione e ricavi per area di pratica.

La crittografia SSL proteggeva i dati in transito, la crittografia AES-256 proteggeva i dati a riposo. L''autenticazione a due fattori era disponibile per tutti gli utenti.

## Risultati Chiave

KeyVision PRO ora serve studi legali da professionisti singoli a grandi studi multi-team in tutta Europa. Gli studi riportano riduzioni significative delle spese amministrative. I miglioramenti nel time tracking hanno aumentato i tassi di cattura fatturabile, migliorando direttamente i ricavi degli studi.',
  meta_title = 'Caso Studio KeyVision PRO — Gestione Studio Legale | ITGuys',
  meta_description = 'Come abbiamo costruito una piattaforma cloud di gestione dello studio legale con Laravel, Angular e MySQL — al servizio degli studi legali in tutta Europa.'
WHERE project_id = (SELECT id FROM projects WHERE slug = 'keyvision-pro') AND locale = 'it';

UPDATE project_translations SET
  slug = 'keyvision-pro',
  content = '## Contexto

Los bufetes de abogados en toda Europa luchaban con una gestión de práctica fragmentada — seguimiento de tiempo en hojas de cálculo, facturación en software contable separado, expedientes en carpetas compartidas y fechas de audiencia en calendarios de pared. KeyVision PRO se propuso unificar estos flujos de trabajo en una única plataforma cloud diseñada para la profesión legal. El sistema necesitaba cubrir desde profesionales individuales hasta grandes bufetes multi-equipo con cientos de casos simultáneos.

La seguridad de datos era primordial. Los profesionales legales manejan información altamente confidencial sujeta al secreto profesional y regulaciones de protección de datos. La plataforma debía cumplir requisitos estrictos de seguridad manteniéndose accesible para el uso diario. El sistema también necesitaba manejar la complejidad de la facturación legal — tarifas horarias variables, acuerdos de honorario fijo y gestión de anticipos.

## Enfoque Técnico

Construimos el backend en PHP con el framework Laravel, aprovechando su ORM expresivo para el modelo de datos relacionales complejo. El sistema de autenticación de Laravel proporcionó la base para los controles de acceso granulares basados en roles.

AngularJS impulsaba la aplicación frontend single-page, entregando una experiencia responsive de nivel escritorio. La arquitectura de componentes permitió elementos UI reutilizables — widgets de registro de tiempo, selectores de asuntos y búsqueda de clientes.

MySQL almacenaba los datos con aislamiento multi-tenant cuidadosamente diseñado, mientras que Redis proporcionaba la capa de caché para datos frecuentemente accedidos como hojas de tiempo activas, búsquedas recientes de asuntos y estado de sesiones. AWS proporcionaba la infraestructura con almacenamiento encriptado y respaldos automáticos. Jenkins gestionaba el pipeline CI/CD, ejecutando pruebas automatizadas y desplegando en AWS en cada merge.

## Detalles de Implementación

El módulo de seguimiento de tiempo era central, ya que la captura precisa del tiempo impacta directamente los ingresos del bufete. Construimos tanto una interfaz de hoja de tiempo manual como un temporizador activo. El sistema señalaba problemas potenciales — registros inusualmente largos o que excedían presupuestos.

El motor de facturación transformaba los registros de tiempo y gastos en facturas profesionales. Cada bufete podía configurar sus plantillas, términos de pago y calendarios de facturación. El sistema manejaba facturación compartida, progresiva y cuentas de anticipo.

La gestión de casos proporcionaba una vista estructurada del ciclo de vida de cada asunto. Los abogados podían rastrear plazos, asociar documentos y monitorear el estado. El seguimiento de audiencias centralizaba el calendario con recordatorios automáticos. La verificación de conflictos de interés escaneaba la base de datos al abrir nuevos asuntos.

Los dashboards de rendimiento daban a la gerencia visibilidad sobre métricas clave — tasas de utilización facturable, tasas de realización e ingresos por área de práctica.

El cifrado SSL protegía los datos en tránsito, el cifrado AES-256 aseguraba los datos en reposo. La autenticación de dos factores estaba disponible para todos los usuarios.

## Resultados Clave

KeyVision PRO ahora sirve a bufetes que van desde profesionales individuales hasta grandes prácticas multi-equipo en toda Europa. Los bufetes reportan reducciones significativas en gastos administrativos. Las mejoras en el seguimiento de tiempo por sí solas aumentaron las tasas de captura facturable, mejorando directamente los ingresos del bufete.',
  meta_title = 'Caso de Estudio KeyVision PRO — Gestión de Práctica Legal | ITGuys',
  meta_description = 'Cómo construimos una plataforma cloud de gestión de práctica legal con Laravel, Angular y MySQL — sirviendo bufetes de abogados en toda Europa.'
WHERE project_id = (SELECT id FROM projects WHERE slug = 'keyvision-pro') AND locale = 'es';
