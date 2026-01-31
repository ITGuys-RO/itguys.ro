-- Convert KeyVision PRO to a full case study with content in all 6 locales

UPDATE projects SET is_case_study = 1, duration = '3 months', completed_at = '2016-10' WHERE slug = 'keyvision-pro';

UPDATE project_translations SET
  slug = 'keyvision-pro',
  content = '## Background

Law firms across Europe were struggling with fragmented practice management. They tracked time in spreadsheets, handled invoicing in separate accounting software, stored case files in shared folders, and kept court dates on wall calendars. KeyVision PRO set out to unify these workflows into a single cloud-based platform built for the legal profession. The system needed to handle everything from solo practitioners managing a few dozen active matters to large multi-team firms with hundreds of concurrent cases.

Data security mattered. Legal professionals handle confidential client information subject to attorney-client privilege and data protection regulations. Any practice management platform had to meet strict security requirements while remaining accessible and responsive for daily use. The system also needed to accommodate the billing complexity of legal work: hourly rates that vary by attorney and matter type, fixed-fee arrangements, retainer management, and expense tracking.

## Technical approach

We built the backend on PHP with the Laravel framework, using its ORM for the complex relational data model that legal practice management requires. Laravel''s authentication and authorization system provided the foundation for the role-based access controls that firms needed. Partners could see everything, associates saw their assigned matters, and support staff saw only what their role permitted.

AngularJS powered the frontend single-page application, creating a responsive, desktop-class experience for the daily workflows that legal professionals depend on. The component architecture let us build reusable UI elements like time entry widgets, matter selectors, and client lookups that appeared consistently across all modules.

MySQL stored the relational data with careful schema design to handle multi-tenant data isolation. Redis provided the caching layer for frequently accessed data such as active timesheets, recent matter lookups, and session state. Each firm''s data was logically separated, with row-level security to prevent cross-tenant data leakage. AWS provided the hosting infrastructure with encrypted storage and automated backups. Jenkins handled the CI/CD pipeline, running automated tests and deploying to AWS on each merge.

## Implementation details

The time tracking module was central to the platform, since accurate time capture directly impacts firm revenue. We built both a manual timesheet interface and a running timer that attorneys could start and stop as they worked. Time entries captured the attorney, matter, activity type, narrative description, and duration, with configurable rounding rules. The system flagged potential issues like unusually long entries, entries outside business hours, or entries that exceeded matter budgets for review before billing.

The billing engine transformed time entries and expenses into professional invoices. Each firm could configure their invoice templates, payment terms, and billing schedules. The system handled split billing for matters with multiple responsible parties, progress billing for phased engagements, and trust account management for retainer-based work. Integration with accounting systems kept financial data synchronized.

Case management provided a structured view of each matter''s lifecycle. Attorneys could track deadlines, associate documents, log communications, and monitor status through a kanban-style board or traditional list view. Court hearing tracking pulled calendar data into a centralized schedule, with automated reminders sent via email to all attorneys assigned to a hearing. Conflict checking scanned the client database when new matters were opened and flagged potential conflicts of interest.

Performance dashboards gave firm management visibility into key metrics: billable utilization rates, realization rates, work-in-progress aging, and revenue by practice area. Partners could drill down from firm-wide views to individual attorney performance. Custom report builders let firms create their own analytics views without technical assistance.

SSL encryption protected all data in transit, while AES-256 encryption secured data at rest. Two-factor authentication was available for all users. Firms could enforce it as a policy. Audit logging tracked every data access and modification for compliance purposes.

## Outcomes

KeyVision PRO now serves law firms ranging from solo practitioners to large multi-team practices across Europe. Automated billing workflows replaced manual invoice preparation. The centralized case management eliminated time spent searching through scattered files and emails. Time tracking improvements increased billable capture rates, which meant more revenue actually got billed and collected. The platform''s security features allowed firms to move their practice management to the cloud, often for the first time.',
  meta_title = 'KeyVision PRO Legal Practice Management Case Study | ITGuys',
  meta_description = 'How we built a cloud-based legal practice management platform with Laravel 5.4, AngularJS, MySQL, and Redis — serving law firms across Europe.'
WHERE project_id = (SELECT id FROM projects WHERE slug = 'keyvision-pro') AND locale = 'en';

UPDATE project_translations SET
  slug = 'keyvision-pro',
  content = '## Context

Firmele de avocatură din toată Europa se confruntau cu un management fragmentat al practicii. Pontajele se țineau în foi de calcul, facturarea se făcea în software separat de contabilitate, dosarele de cazuri se stocau în foldere partajate, iar termenele de judecată se notau pe calendare de perete. KeyVision PRO și-a propus să unifice toate aceste fluxuri de lucru într-o singură platformă cloud concepută pentru profesia juridică. Sistemul trebuia să funcționeze atât pentru practicieni individuali care gestionau câteva zeci de dosare active, cât și pentru firme mari cu echipe multiple și sute de cazuri în desfășurare simultan.

Securitatea datelor conta enorm. Profesioniștii din domeniul juridic lucrează cu informații confidențiale ale clienților, protejate de privilegiul avocat-client și de reglementările privind protecția datelor. Orice platformă de management al practicii trebuia să îndeplinească cerințe stricte de securitate, rămânând în același timp accesibilă și rapidă pentru utilizarea zilnică. Sistemul trebuia să gestioneze și complexitatea facturării specifice muncii juridice: tarife orare diferite în funcție de avocat și tipul dosarului, aranjamente cu onorariu fix, managementul avansurilor și urmărirea cheltuielilor.

## Abordare tehnică

Am construit backend-ul pe PHP cu framework-ul Laravel, folosind ORM-ul acestuia pentru modelul complex de date relaționale pe care managementul unei practici juridice îl necesită. Sistemul de autentificare și autorizare al Laravel a oferit fundația pentru controalele de acces bazate pe roluri de care firmele aveau nevoie. Partenerii puteau vedea totul, asociații vedeau doar dosarele asignate, iar personalul de suport vedea doar ce permitea rolul lor.

AngularJS a alimentat aplicația frontend single-page, creând o experiență responsivă, de nivel desktop, pentru fluxurile de lucru zilnice pe care profesioniștii juridici se bazează. Arhitectura de componente ne-a permis să construim elemente UI reutilizabile precum widgeturi de pontaj, selectoare de dosare și căutări de clienți, care apăreau consistent în toate modulele.

MySQL a stocat datele relaționale cu un design atent al schemei pentru a gestiona izolarea datelor multi-tenant. Redis a furnizat stratul de caching pentru datele accesate frecvent — pontaje active, căutări recente de dosare și starea sesiunilor. Datele fiecărei firme erau separate logic, cu securitate la nivel de rând pentru a preveni scurgerea de date între clienți. AWS a furnizat infrastructura de hosting cu stocare criptată și backup-uri automate. Jenkins a gestionat pipeline-ul CI/CD, rulând teste automate și deployând pe AWS la fiecare merge.

## Detalii de implementare

Modulul de pontaj era central pentru platformă, deoarece captura precisă a timpului impactează direct veniturile firmei. Am construit atât o interfață manuală de pontaj, cât și un cronometru pe care avocații îl puteau porni și opri pe măsură ce lucrau. Intrările de pontaj capturau avocatul, dosarul, tipul de activitate, descrierea narativă și durata, cu reguli configurabile de rotunjire. Sistemul semnala probleme potențiale precum intrări neobișnuit de lungi, intrări în afara orelor de program sau intrări care depășeau bugetele dosarelor, pentru verificare înainte de facturare.

Motorul de facturare transforma pontajele și cheltuielile în facturi profesionale. Fiecare firmă putea configura șabloanele de factură, termenii de plată și programul de facturare. Sistemul gestiona facturarea împărțită pentru dosarele cu mai mulți responsabili, facturarea progresivă pentru angajamente etapizate și managementul conturilor de avans pentru lucrul pe bază de retenție. Integrarea cu sistemele contabile menținea datele financiare sincronizate.

Managementul cazurilor oferea o viziune structurată a ciclului de viață al fiecărui dosar. Avocații puteau urmări termene, asocia documente, înregistra comunicări și monitoriza starea prin intermediul unui board în stil kanban sau al unei vizualizări tradiționale de tip listă. Urmărirea audierilor aducea datele calendaristice într-un program centralizat, cu remindere automate trimise prin email tuturor avocaților asignați unei audieri. Verificarea conflictelor de interese scana baza de date cu clienți la deschiderea dosarelor noi și semnala potențialele conflicte.

Dashboard-urile de performanță ofereau managementului firmei vizibilitate asupra metricilor cheie: rate de utilizare facturabilă, rate de realizare, vechimea lucrărilor în curs și venituri pe arii de practică. Partenerii puteau naviga de la vizualizări la nivel de firmă până la performanța individuală a fiecărui avocat. Generatoarele de rapoarte personalizate permiteau firmelor să își creeze propriile vizualizări analitice fără asistență tehnică.

Criptarea SSL proteja toate datele în tranzit, iar criptarea AES-256 securiza datele în repaus. Autentificarea cu doi factori era disponibilă pentru toți utilizatorii. Firmele o puteau impune ca politică. Jurnalizarea auditului urmărea fiecare acces și modificare de date în scopuri de conformitate.

## Rezultate

KeyVision PRO servește acum firme de avocatură de la practicieni individuali la practici mari multi-echipă din toată Europa. Fluxurile automate de facturare au înlocuit pregătirea manuală a facturilor. Managementul centralizat al cazurilor a eliminat timpul pierdut căutând prin fișiere și emailuri împrăștiate. Îmbunătățirile de pontaj au crescut ratele de captare a timpului facturabil, ceea ce a însemnat mai multe venituri efectiv facturate și colectate. Funcționalitățile de securitate ale platformei au permis firmelor să își mute managementul practicii în cloud, adesea pentru prima dată.',
  meta_title = 'Studiu de Caz KeyVision PRO — Management Practică Juridică | ITGuys',
  meta_description = 'Cum am construit o platformă cloud de management al practicii juridice cu Laravel 5.4, AngularJS, MySQL și Redis — servind firme de avocatură din toată Europa.'
WHERE project_id = (SELECT id FROM projects WHERE slug = 'keyvision-pro') AND locale = 'ro';

UPDATE project_translations SET
  slug = 'keyvision-pro',
  content = '## Contexte

Les cabinets d''avocats à travers l''Europe faisaient face à une gestion de cabinet fragmentée. Ils suivaient le temps dans des tableurs, géraient la facturation dans un logiciel comptable séparé, stockaient les dossiers dans des répertoires partagés et notaient les dates d''audience sur des calendriers muraux. KeyVision PRO s''est donné pour mission d''unifier ces flux de travail en une seule plateforme cloud conçue pour la profession juridique. Le système devait convenir aussi bien aux praticiens individuels gérant quelques dizaines de dossiers actifs qu''aux grands cabinets multi-équipes avec des centaines d''affaires simultanées.

La sécurité des données était essentielle. Les professionnels du droit manipulent des informations confidentielles de leurs clients, soumises au secret professionnel et aux réglementations de protection des données. Toute plateforme de gestion de cabinet devait répondre à des exigences de sécurité strictes tout en restant accessible et réactive au quotidien. Le système devait également gérer la complexité de la facturation juridique : des tarifs horaires variables selon l''avocat et le type de dossier, des arrangements à forfait, la gestion des provisions et le suivi des frais.

## Approche technique

Nous avons construit le backend en PHP avec le framework Laravel, en utilisant son ORM pour le modèle de données relationnelles complexe que la gestion d''un cabinet juridique exige. Le système d''authentification et d''autorisation de Laravel fournissait la base pour les contrôles d''accès basés sur les rôles dont les cabinets avaient besoin. Les associés principaux pouvaient tout voir, les collaborateurs voyaient leurs dossiers assignés, et le personnel de support ne voyait que ce que son rôle autorisait.

AngularJS alimentait l''application frontend monopage, créant une expérience réactive de niveau bureau pour les flux de travail quotidiens sur lesquels les professionnels du droit comptent. L''architecture par composants nous a permis de construire des éléments UI réutilisables comme des widgets de saisie de temps, des sélecteurs de dossiers et des recherches de clients, présents de manière cohérente dans tous les modules.

MySQL stockait les données relationnelles avec une conception de schéma soignée pour gérer l''isolation des données multi-tenant. Redis fournissait la couche de cache pour les données fréquemment consultées — feuilles de temps actives, recherches récentes de dossiers et état des sessions. Les données de chaque cabinet étaient logiquement séparées, avec une sécurité au niveau des lignes pour empêcher toute fuite de données entre clients. AWS fournissait l''infrastructure d''hébergement avec un stockage chiffré et des sauvegardes automatisées. Jenkins gérait le pipeline CI/CD, exécutant les tests automatisés et déployant sur AWS à chaque merge.

## Détails d''implémentation

Le module de suivi du temps était au cœur de la plateforme, car la capture précise du temps impacte directement le chiffre d''affaires du cabinet. Nous avons construit à la fois une interface de feuille de temps manuelle et un chronomètre que les avocats pouvaient démarrer et arrêter au fil de leur travail. Les entrées de temps capturaient l''avocat, le dossier, le type d''activité, la description narrative et la durée, avec des règles d''arrondi configurables. Le système signalait les problèmes potentiels comme les entrées anormalement longues, les entrées en dehors des heures de bureau ou celles dépassant les budgets de dossier, pour vérification avant facturation.

Le moteur de facturation transformait les entrées de temps et les frais en factures professionnelles. Chaque cabinet pouvait configurer ses modèles de facture, ses conditions de paiement et ses calendriers de facturation. Le système gérait la facturation partagée pour les dossiers à plusieurs responsables, la facturation progressive pour les missions par étapes et la gestion des comptes de provision pour le travail sur acompte. L''intégration avec les systèmes comptables maintenait les données financières synchronisées.

La gestion des dossiers offrait une vue structurée du cycle de vie de chaque affaire. Les avocats pouvaient suivre les échéances, associer des documents, consigner les communications et surveiller le statut via un tableau kanban ou une vue liste traditionnelle. Le suivi des audiences intégrait les données calendaires dans un planning centralisé, avec des rappels automatiques envoyés par email à tous les avocats assignés à une audience. La vérification des conflits d''intérêts analysait la base clients à l''ouverture de nouveaux dossiers et signalait les conflits potentiels.

Les tableaux de bord de performance donnaient à la direction du cabinet une visibilité sur les métriques clés : taux d''utilisation facturable, taux de réalisation, ancienneté des travaux en cours et revenus par domaine de pratique. Les associés principaux pouvaient naviguer des vues globales du cabinet jusqu''à la performance individuelle de chaque avocat. Des générateurs de rapports personnalisés permettaient aux cabinets de créer leurs propres vues analytiques sans assistance technique.

Le chiffrement SSL protégeait toutes les données en transit, tandis que le chiffrement AES-256 sécurisait les données au repos. L''authentification à deux facteurs était disponible pour tous les utilisateurs. Les cabinets pouvaient l''imposer comme politique. La journalisation d''audit traçait chaque accès et modification de données à des fins de conformité.

## Résultats

KeyVision PRO sert désormais des cabinets allant du praticien individuel aux grands cabinets multi-équipes à travers l''Europe. Les flux de facturation automatisés ont remplacé la préparation manuelle des factures. La gestion centralisée des dossiers a éliminé le temps passé à chercher dans des fichiers et emails éparpillés. Les améliorations du suivi du temps ont augmenté les taux de capture facturable, ce qui signifie davantage de revenus effectivement facturés et encaissés. Les fonctionnalités de sécurité de la plateforme ont permis aux cabinets de migrer leur gestion de cabinet vers le cloud, souvent pour la première fois.',
  meta_title = 'Étude de Cas KeyVision PRO — Gestion de Cabinet Juridique | ITGuys',
  meta_description = 'Comment nous avons construit une plateforme cloud de gestion de cabinet juridique avec Laravel 5.4, AngularJS, MySQL et Redis — au service des cabinets d''avocats à travers l''Europe.'
WHERE project_id = (SELECT id FROM projects WHERE slug = 'keyvision-pro') AND locale = 'fr';

UPDATE project_translations SET
  slug = 'keyvision-pro',
  content = '## Hintergrund

Anwaltskanzleien in ganz Europa hatten mit fragmentiertem Kanzleimanagement zu kämpfen. Die Zeiterfassung lief über Tabellen, die Abrechnung über separate Buchhaltungssoftware, Fallakten lagen in gemeinsamen Ordnern und Gerichtstermine standen an Wandkalendern. KeyVision PRO machte es sich zur Aufgabe, diese Arbeitsabläufe in einer einzigen cloudbasierten Plattform für die Rechtsbranche zu vereinen. Das System musste sowohl für Einzelanwälte mit wenigen Dutzend aktiven Mandaten als auch für große Multi-Team-Kanzleien mit Hunderten gleichzeitiger Fälle funktionieren.

Datensicherheit war entscheidend. Juristen arbeiten mit vertraulichen Mandanteninformationen, die dem Anwaltsgeheimnis und den Datenschutzvorschriften unterliegen. Jede Kanzleimanagement-Plattform musste strenge Sicherheitsanforderungen erfüllen und gleichzeitig für den täglichen Gebrauch zugänglich und reaktionsschnell bleiben. Das System musste zudem die Abrechnungskomplexität juristischer Arbeit abbilden: Stundensätze, die je nach Anwalt und Mandatstyp variieren, Pauschalvereinbarungen, Vorschussverwaltung und Spesenerfassung.

## Technischer Ansatz

Wir bauten das Backend mit PHP und dem Laravel-Framework und nutzten dessen ORM für das komplexe relationale Datenmodell, das Kanzleimanagement erfordert. Laravels Authentifizierungs- und Autorisierungssystem bildete die Grundlage für die rollenbasierten Zugriffskontrollen, die Kanzleien benötigten. Partner konnten alles einsehen, Associates sahen ihre zugewiesenen Mandate, und Assistenzkräfte sahen nur, was ihre Rolle erlaubte.

AngularJS trieb die Frontend-Single-Page-Application an und schuf eine responsive Desktop-Class-Erfahrung für die täglichen Arbeitsabläufe, auf die Juristen angewiesen sind. Die Komponentenarchitektur ermöglichte es uns, wiederverwendbare UI-Elemente wie Zeiterfassungs-Widgets, Mandatsauswahl und Mandantensuche zu bauen, die einheitlich in allen Modulen erschienen.

MySQL speicherte die relationalen Daten mit sorgfältigem Schema-Design für die Multi-Tenant-Datenisolierung. Redis stellte die Caching-Schicht für häufig abgerufene Daten bereit — aktive Stundenzettel, kürzliche Mandatssuchen und Sitzungszustände. Die Daten jeder Kanzlei waren logisch getrennt, mit Sicherheit auf Zeilenebene, um mandantenübergreifende Datenlecks zu verhindern. AWS stellte die Hosting-Infrastruktur mit verschlüsselter Speicherung und automatisierten Backups bereit. Jenkins verwaltete die CI/CD-Pipeline, führte automatisierte Tests aus und deployte bei jedem Merge auf AWS.

## Implementierungsdetails

Das Zeiterfassungsmodul stand im Mittelpunkt der Plattform, da präzise Zeiterfassung den Kanzleiumsatz direkt beeinflusst. Wir bauten sowohl eine manuelle Timesheet-Oberfläche als auch einen laufenden Timer, den Anwälte während der Arbeit starten und stoppen konnten. Zeiteinträge erfassten den Anwalt, das Mandat, den Aktivitätstyp, die narrative Beschreibung und die Dauer, mit konfigurierbaren Rundungsregeln. Das System markierte potenzielle Probleme wie ungewöhnlich lange Einträge, Einträge außerhalb der Geschäftszeiten oder solche, die Mandatsbudgets überschritten, zur Überprüfung vor der Abrechnung.

Die Abrechnungsengine verwandelte Zeiteinträge und Auslagen in professionelle Rechnungen. Jede Kanzlei konnte ihre Rechnungsvorlagen, Zahlungsbedingungen und Abrechnungszeitpläne konfigurieren. Das System beherrschte geteilte Abrechnung für Mandate mit mehreren Verantwortlichen, Fortschrittsabrechnung für phasenbasierte Engagements und Vorschusskontenverwaltung für retainerbasierte Arbeit. Die Integration mit Buchhaltungssystemen hielt die Finanzdaten synchron.

Das Fallmanagement bot eine strukturierte Sicht auf den Lebenszyklus jedes Mandats. Anwälte konnten Fristen verfolgen, Dokumente zuordnen, Kommunikation protokollieren und den Status über ein Kanban-Board oder eine traditionelle Listenansicht überwachen. Die Gerichtsterminverfolgung bündelte Kalenderdaten in einem zentralen Zeitplan, mit automatischen Erinnerungen per E-Mail an alle einer Verhandlung zugewiesenen Anwälte. Die Konfliktprüfung durchsuchte die Mandantendatenbank bei neuen Mandaten und markierte potenzielle Interessenkonflikte.

Performance-Dashboards gaben dem Kanzleimanagement Einblick in Schlüsselkennzahlen: abrechenbare Auslastungsraten, Realisierungsraten, Alter der laufenden Arbeiten und Umsatz nach Praxisbereich. Partner konnten von kanzleiweiten Übersichten bis zur individuellen Anwaltsleistung navigieren. Benutzerdefinierte Berichtsgeneratoren ermöglichten es Kanzleien, eigene Analyseansichten ohne technische Unterstützung zu erstellen.

SSL-Verschlüsselung schützte alle Daten im Transit, während AES-256-Verschlüsselung die ruhenden Daten sicherte. Zwei-Faktor-Authentifizierung war für alle Nutzer verfügbar. Kanzleien konnten sie als Richtlinie durchsetzen. Audit-Logging verfolgte jeden Datenzugriff und jede Änderung zu Compliance-Zwecken.

## Ergebnisse

KeyVision PRO bedient heute Kanzleien von Einzelanwälten bis zu großen Multi-Team-Praxen in ganz Europa. Automatisierte Abrechnungsworkflows ersetzten die manuelle Rechnungsvorbereitung. Das zentralisierte Fallmanagement eliminierte die Zeit, die mit dem Durchsuchen verstreuter Dateien und E-Mails verbracht wurde. Verbesserungen in der Zeiterfassung steigerten die abrechenbare Erfassungsrate, was bedeutete, dass mehr Umsatz tatsächlich abgerechnet und eingezogen wurde. Die Sicherheitsfunktionen der Plattform ermöglichten es Kanzleien, ihr Kanzleimanagement in die Cloud zu verlagern — oft zum allerersten Mal.',
  meta_title = 'KeyVision PRO Fallstudie — Juristische Kanzleimanagement-Plattform | ITGuys',
  meta_description = 'Wie wir eine cloudbasierte Kanzleimanagement-Plattform mit Laravel 5.4, AngularJS, MySQL und Redis bauten — im Einsatz bei Kanzleien in ganz Europa.'
WHERE project_id = (SELECT id FROM projects WHERE slug = 'keyvision-pro') AND locale = 'de';

UPDATE project_translations SET
  slug = 'keyvision-pro',
  content = '## Contesto

Gli studi legali in tutta Europa facevano i conti con una gestione frammentata dello studio. Il time tracking avveniva nei fogli di calcolo, la fatturazione in un software contabile separato, i fascicoli erano archiviati in cartelle condivise e le date delle udienze annotate su calendari a parete. KeyVision PRO si è proposta di unificare questi flussi di lavoro in un''unica piattaforma cloud pensata per la professione legale. Il sistema doveva funzionare sia per professionisti singoli con qualche decina di pratiche attive, sia per grandi studi multi-team con centinaia di casi in corso simultaneamente.

La sicurezza dei dati era fondamentale. I professionisti legali gestiscono informazioni riservate dei clienti protette dal segreto professionale e dalle normative sulla protezione dei dati. Qualsiasi piattaforma di gestione dello studio doveva soddisfare requisiti di sicurezza rigorosi, rimanendo al contempo accessibile e reattiva per l''uso quotidiano. Il sistema doveva inoltre gestire la complessità della fatturazione legale: tariffe orarie che variano per avvocato e tipo di pratica, accordi a compenso fisso, gestione degli acconti e tracciamento delle spese.

## Approccio tecnico

Abbiamo costruito il backend in PHP con il framework Laravel, utilizzando il suo ORM per il modello dati relazionale complesso che la gestione di uno studio legale richiede. Il sistema di autenticazione e autorizzazione di Laravel ha fornito la base per i controlli di accesso basati sui ruoli di cui gli studi avevano bisogno. I soci potevano vedere tutto, gli associati vedevano le pratiche assegnate e il personale di supporto vedeva solo ciò che il proprio ruolo consentiva.

AngularJS alimentava l''applicazione frontend single-page, creando un''esperienza responsive di livello desktop per i flussi di lavoro quotidiani su cui i professionisti legali fanno affidamento. L''architettura a componenti ci ha permesso di costruire elementi UI riutilizzabili come widget di time entry, selettori di pratiche e ricerca clienti, presenti in modo coerente in tutti i moduli.

MySQL archiviava i dati relazionali con una progettazione attenta dello schema per gestire l''isolamento multi-tenant dei dati. Redis forniva il layer di caching per i dati più consultati — timesheet attivi, ricerche recenti di pratiche e stato delle sessioni. I dati di ogni studio erano separati logicamente, con sicurezza a livello di riga per prevenire fughe di dati tra i tenant. AWS forniva l''infrastruttura di hosting con storage crittografato e backup automatici. Jenkins gestiva la pipeline CI/CD, eseguendo test automatizzati e deployando su AWS a ogni merge.

## Dettagli di implementazione

Il modulo di time tracking era il cuore della piattaforma, poiché la cattura precisa del tempo impatta direttamente i ricavi dello studio. Abbiamo costruito sia un''interfaccia timesheet manuale che un timer che gli avvocati potevano avviare e fermare durante il lavoro. Le voci di tempo registravano l''avvocato, la pratica, il tipo di attività, la descrizione narrativa e la durata, con regole di arrotondamento configurabili. Il sistema segnalava problemi potenziali come inserimenti insolitamente lunghi, inserimenti fuori orario di lavoro o inserimenti che superavano i budget delle pratiche, per la revisione prima della fatturazione.

Il motore di fatturazione trasformava le voci di tempo e le spese in fatture professionali. Ogni studio poteva configurare i propri template di fattura, termini di pagamento e calendari di fatturazione. Il sistema gestiva la fatturazione suddivisa per pratiche con più responsabili, la fatturazione progressiva per incarichi a fasi e la gestione dei conti fiduciari per il lavoro su acconto. L''integrazione con i sistemi contabili manteneva i dati finanziari sincronizzati.

La gestione dei casi offriva una vista strutturata del ciclo di vita di ogni pratica. Gli avvocati potevano tracciare le scadenze, associare documenti, registrare le comunicazioni e monitorare lo stato attraverso una board in stile kanban o una vista elenco tradizionale. Il tracking delle udienze convogliava i dati del calendario in una programmazione centralizzata, con promemoria automatici inviati via email a tutti gli avvocati assegnati a un''udienza. Il controllo dei conflitti di interesse analizzava il database clienti all''apertura di nuove pratiche e segnalava i potenziali conflitti.

Le dashboard di performance davano al management dello studio visibilità sulle metriche chiave: tassi di utilizzo fatturabile, tassi di realizzazione, anzianità del lavoro in corso e ricavi per area di pratica. I soci potevano navigare dalle viste a livello di studio fino alla performance individuale di ogni avvocato. I generatori di report personalizzati permettevano agli studi di creare le proprie viste analitiche senza assistenza tecnica.

La crittografia SSL proteggeva tutti i dati in transito, mentre la crittografia AES-256 metteva in sicurezza i dati a riposo. L''autenticazione a due fattori era disponibile per tutti gli utenti. Gli studi potevano imporla come policy. L''audit logging tracciava ogni accesso e modifica dei dati per finalità di conformità.

## Risultati

KeyVision PRO serve oggi studi legali che vanno dal professionista singolo ai grandi studi multi-team in tutta Europa. I flussi di fatturazione automatizzati hanno sostituito la preparazione manuale delle fatture. La gestione centralizzata dei casi ha eliminato il tempo speso a cercare tra file ed email sparsi. I miglioramenti nel time tracking hanno aumentato i tassi di cattura fatturabile, il che significa che più ricavi sono stati effettivamente fatturati e incassati. Le funzionalità di sicurezza della piattaforma hanno permesso agli studi di spostare la gestione dello studio nel cloud, spesso per la prima volta.',
  meta_title = 'Caso Studio KeyVision PRO — Gestione Studio Legale | ITGuys',
  meta_description = 'Come abbiamo costruito una piattaforma cloud di gestione dello studio legale con Laravel 5.4, AngularJS, MySQL e Redis — al servizio degli studi legali in tutta Europa.'
WHERE project_id = (SELECT id FROM projects WHERE slug = 'keyvision-pro') AND locale = 'it';

UPDATE project_translations SET
  slug = 'keyvision-pro',
  content = '## Contexto

Los bufetes de abogados en toda Europa lidiaban con una gestión de práctica fragmentada. Registraban el tiempo en hojas de cálculo, gestionaban la facturación en software contable separado, almacenaban los expedientes en carpetas compartidas y anotaban las fechas de audiencia en calendarios de pared. KeyVision PRO se propuso unificar estos flujos de trabajo en una única plataforma cloud diseñada para la profesión legal. El sistema debía funcionar tanto para profesionales individuales que gestionaban unas pocas decenas de asuntos activos como para grandes bufetes multi-equipo con cientos de casos en curso simultáneamente.

La seguridad de los datos era crucial. Los profesionales legales manejan información confidencial de sus clientes sujeta al secreto profesional y a las regulaciones de protección de datos. Cualquier plataforma de gestión de práctica debía cumplir requisitos estrictos de seguridad sin dejar de ser accesible y ágil para el uso diario. El sistema también necesitaba acomodar la complejidad de la facturación legal: tarifas horarias que varían según el abogado y el tipo de asunto, acuerdos de honorario fijo, gestión de anticipos y seguimiento de gastos.

## Enfoque técnico

Construimos el backend en PHP con el framework Laravel, utilizando su ORM para el modelo de datos relacionales complejo que la gestión de una práctica legal requiere. El sistema de autenticación y autorización de Laravel proporcionó la base para los controles de acceso basados en roles que los bufetes necesitaban. Los socios podían ver todo, los asociados veían sus asuntos asignados y el personal de apoyo veía solo lo que su rol permitía.

AngularJS impulsaba la aplicación frontend single-page, creando una experiencia responsive de nivel escritorio para los flujos de trabajo diarios de los que dependen los profesionales legales. La arquitectura de componentes nos permitió construir elementos UI reutilizables como widgets de registro de tiempo, selectores de asuntos y búsquedas de clientes, que aparecían de forma consistente en todos los módulos.

MySQL almacenaba los datos relacionales con un diseño de esquema cuidadoso para gestionar el aislamiento de datos multi-tenant. Redis proporcionaba la capa de caché para los datos de acceso frecuente — hojas de tiempo activas, búsquedas recientes de asuntos y estado de sesiones. Los datos de cada bufete estaban separados lógicamente, con seguridad a nivel de fila para prevenir fugas de datos entre clientes. AWS proporcionaba la infraestructura de hosting con almacenamiento encriptado y respaldos automatizados. Jenkins gestionaba el pipeline CI/CD, ejecutando pruebas automatizadas y desplegando en AWS en cada merge.

## Detalles de implementación

El módulo de seguimiento de tiempo era central en la plataforma, ya que la captura precisa del tiempo impacta directamente los ingresos del bufete. Construimos tanto una interfaz de hoja de tiempo manual como un temporizador que los abogados podían iniciar y detener mientras trabajaban. Los registros de tiempo capturaban el abogado, el asunto, el tipo de actividad, la descripción narrativa y la duración, con reglas de redondeo configurables. El sistema señalaba problemas potenciales como registros inusualmente largos, registros fuera del horario laboral o registros que excedían los presupuestos de los asuntos, para revisión antes de la facturación.

El motor de facturación transformaba los registros de tiempo y gastos en facturas profesionales. Cada bufete podía configurar sus plantillas de factura, términos de pago y calendarios de facturación. El sistema manejaba facturación compartida para asuntos con múltiples responsables, facturación progresiva para compromisos por fases y gestión de cuentas de anticipo para trabajo basado en retención. La integración con sistemas contables mantenía los datos financieros sincronizados.

La gestión de casos proporcionaba una vista estructurada del ciclo de vida de cada asunto. Los abogados podían rastrear plazos, asociar documentos, registrar comunicaciones y monitorear el estado a través de un tablero estilo kanban o una vista de lista tradicional. El seguimiento de audiencias integraba los datos del calendario en una programación centralizada, con recordatorios automáticos enviados por email a todos los abogados asignados a una audiencia. La verificación de conflictos de interés escaneaba la base de datos de clientes al abrir nuevos asuntos y señalaba los conflictos potenciales.

Los dashboards de rendimiento daban a la dirección del bufete visibilidad sobre las métricas clave: tasas de utilización facturable, tasas de realización, antigüedad del trabajo en curso e ingresos por área de práctica. Los socios podían navegar desde las vistas a nivel de bufete hasta el rendimiento individual de cada abogado. Los generadores de informes personalizados permitían a los bufetes crear sus propias vistas analíticas sin asistencia técnica.

El cifrado SSL protegía todos los datos en tránsito, mientras que el cifrado AES-256 aseguraba los datos en reposo. La autenticación de dos factores estaba disponible para todos los usuarios. Los bufetes podían imponerla como política. El registro de auditoría rastreaba cada acceso y modificación de datos con fines de cumplimiento normativo.

## Resultados

KeyVision PRO sirve ahora a bufetes que van desde profesionales individuales hasta grandes prácticas multi-equipo en toda Europa. Los flujos de facturación automatizados reemplazaron la preparación manual de facturas. La gestión centralizada de casos eliminó el tiempo dedicado a buscar entre archivos y correos dispersos. Las mejoras en el seguimiento de tiempo aumentaron las tasas de captura facturable, lo que significó más ingresos efectivamente facturados y cobrados. Las funcionalidades de seguridad de la plataforma permitieron a los bufetes trasladar su gestión de práctica a la nube, a menudo por primera vez.',
  meta_title = 'Caso de Estudio KeyVision PRO — Gestión de Práctica Legal | ITGuys',
  meta_description = 'Cómo construimos una plataforma cloud de gestión de práctica legal con Laravel 5.4, AngularJS, MySQL y Redis — sirviendo bufetes de abogados en toda Europa.'
WHERE project_id = (SELECT id FROM projects WHERE slug = 'keyvision-pro') AND locale = 'es';
