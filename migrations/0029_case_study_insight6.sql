-- Convert Insight6 to a full case study with content in all 6 locales

UPDATE projects SET is_case_study = 1, duration = '7 months', completed_at = '2021-09' WHERE slug = 'insight6';

UPDATE project_translations SET
  slug = 'insight6',
  content = '## Background

Insight6 is a leading UK customer experience agency specializing in mystery shopping evaluations across retail, hospitality, healthcare, and legal sectors. With a network of over 800 mystery shoppers conducting thousands of evaluations monthly, their legacy platform was struggling to keep pace. Reports took too long to generate, the mobile experience was poor for field evaluators, and clients lacked real-time visibility into their results.

The company needed a modern platform that could handle the full evaluation lifecycle — from assignment and data collection through analysis and client delivery — while maintaining the 48-hour turnaround guarantee that differentiated them in the market. The system also needed to support newer evaluation formats including video, phone, and live chat assessments.

## Technical Approach

We built the platform on PHP with the Laravel framework, leveraging its robust ORM, queue system, and authentication scaffolding to accelerate development. Vue.js powered the frontend, providing a reactive interface for both the evaluator mobile app and the client portal.

MySQL served as the primary database, with carefully designed indexes to support the complex reporting queries that aggregated thousands of evaluations across multiple dimensions — location, time period, evaluation type, and performance metrics. AWS hosted the infrastructure, with auto-scaling groups to handle the spike in evaluation submissions that typically occurred on weekends and holidays.

## Implementation Details

The evaluator-facing application was built as a progressive web app optimized for mobile use in the field. Evaluators could complete assessment forms offline and sync when connectivity returned — critical for in-store evaluations where network coverage was unreliable. GPS verification confirmed evaluators were physically present at the assessed location.

The workflow engine automated the entire evaluation pipeline. When a client requested an evaluation cycle, the system matched available shoppers based on demographics, location, and experience. Completed evaluations passed through automated quality checks before routing to human reviewers, and approved results were immediately available in the client portal.

The client dashboard provided real-time access to evaluation results with drill-down capabilities. Clients could compare performance across locations, track trends over time, and benchmark against industry averages. Custom report templates allowed each client to focus on the metrics most relevant to their business.

We integrated video evaluation capabilities that let mystery shoppers record interactions discreetly. The platform processed and securely stored video alongside structured evaluation data, giving clients a complete picture of the customer experience. Phone and chat evaluations followed a similar pattern with call recording and transcript analysis.

## Key Outcomes

The modernized platform now processes over 23,000 mystery shops annually for more than 500 UK brands. The automated workflow reduced the average report delivery time from 48 hours to under 24 hours. Evaluator satisfaction improved significantly with the mobile-first approach, leading to a 30% increase in completed evaluations per shopper. Clients gained actionable insights through the real-time dashboard, with many reporting measurable improvements in customer experience scores within the first quarter of adoption.',
  meta_title = 'Insight6 Mystery Shopping Platform Case Study | ITGuys',
  meta_description = 'How we modernized a mystery shopping platform processing 23,000+ annual evaluations for 500+ UK brands with Laravel, Vue.js, and automated workflows.'
WHERE project_id = (SELECT id FROM projects WHERE slug = 'insight6') AND locale = 'en';

UPDATE project_translations SET
  slug = 'insight6',
  content = '## Context

Insight6 este o agenție lider de customer experience din Regatul Unit, specializată în evaluări de tip mystery shopping în retail, hospitality, sănătate și sectorul juridic. Cu o rețea de peste 800 de mystery shopperi care efectuau mii de evaluări lunar, platforma lor veche nu mai ținea pasul. Rapoartele durau prea mult, experiența mobilă era slabă pentru evaluatorii din teren, iar clienții nu aveau vizibilitate în timp real asupra rezultatelor.

Compania avea nevoie de o platformă modernă care să gestioneze întregul ciclu de viață al evaluărilor — de la atribuire și colectare de date prin analiză și livrare către client — menținând garanția de livrare în 48 de ore care îi diferenția pe piață. Sistemul trebuia să suporte și formate noi de evaluare, inclusiv video, telefon și chat live.

## Abordare Tehnică

Am construit platforma pe PHP cu framework-ul Laravel, valorificând ORM-ul robust, sistemul de cozi și scaffold-ul de autentificare pentru a accelera dezvoltarea. Vue.js a alimentat frontend-ul, oferind o interfață reactivă atât pentru aplicația mobilă a evaluatorilor, cât și pentru portalul clienților.

MySQL a servit ca bază de date principală, cu indexuri atent proiectate pentru interogările complexe de raportare care agregau mii de evaluări pe multiple dimensiuni — locație, perioadă, tip de evaluare și metrici de performanță. AWS a găzduit infrastructura, cu grupuri de auto-scaling pentru a gestiona vârfurile de trimiteri în weekenduri și sărbători.

## Detalii de Implementare

Aplicația pentru evaluatori a fost construită ca o aplicație web progresivă optimizată pentru utilizarea mobilă în teren. Evaluatorii puteau completa formulare offline și sincroniza la revenirea conectivității — critic pentru evaluările din magazine unde acoperirea rețelei era nesigură. Verificarea GPS confirma prezența fizică la locația evaluată.

Motorul de workflow a automatizat întregul pipeline. Când un client solicita un ciclu de evaluare, sistemul asocia shopperii disponibili pe baza demografiei, locației și experienței. Evaluările completate treceau prin verificări automate de calitate înainte de rutarea către revieweri umani, iar rezultatele aprobate erau imediat disponibile în portalul clientului.

Dashboard-ul clientului oferea acces în timp real la rezultate cu capabilități de drill-down. Clienții puteau compara performanța între locații, urmări tendințe și realiza benchmarking față de mediile din industrie.

Am integrat capabilități de evaluare video care permiteau mystery shopperilor să înregistreze interacțiuni discret. Platforma procesa și stoca securizat materialul video alături de datele structurate de evaluare. Evaluările telefonice și prin chat urmau un model similar cu înregistrări și analiză de transcrieri.

## Rezultate Cheie

Platforma modernizată procesează acum peste 23.000 de mystery shops anual pentru peste 500 de branduri din UK. Workflow-ul automatizat a redus timpul mediu de livrare a rapoartelor de la 48 la sub 24 de ore. Satisfacția evaluatorilor s-a îmbunătățit semnificativ cu abordarea mobile-first, ducând la o creștere de 30% a evaluărilor completate per shopper.',
  meta_title = 'Studiu de Caz Insight6 — Platformă Mystery Shopping | ITGuys',
  meta_description = 'Cum am modernizat o platformă de mystery shopping care procesează peste 23.000 de evaluări anuale pentru 500+ branduri din UK cu Laravel, Vue.js și workflow-uri automate.'
WHERE project_id = (SELECT id FROM projects WHERE slug = 'insight6') AND locale = 'ro';

UPDATE project_translations SET
  slug = 'insight6',
  content = '## Contexte

Insight6 est une agence leader d''expérience client au Royaume-Uni, spécialisée dans les évaluations de clients mystères dans les secteurs du commerce de détail, de l''hôtellerie, de la santé et du juridique. Avec un réseau de plus de 800 clients mystères réalisant des milliers d''évaluations mensuelles, leur plateforme existante ne suivait plus le rythme. Les rapports prenaient trop de temps, l''expérience mobile était médiocre pour les évaluateurs terrain, et les clients manquaient de visibilité en temps réel sur leurs résultats.

L''entreprise avait besoin d''une plateforme moderne gérant l''ensemble du cycle d''évaluation — de l''attribution à la livraison client, en passant par la collecte et l''analyse — tout en maintenant la garantie de livraison en 48 heures. Le système devait aussi supporter de nouveaux formats d''évaluation incluant vidéo, téléphone et chat en direct.

## Approche Technique

Nous avons construit la plateforme en PHP avec le framework Laravel, tirant parti de son ORM robuste, de son système de files d''attente et de l''authentification intégrée. Vue.js alimentait le frontend avec une interface réactive pour l''application mobile des évaluateurs et le portail client.

MySQL servait de base de données principale, avec des index soigneusement conçus pour les requêtes de reporting complexes agrégeant des milliers d''évaluations sur plusieurs dimensions — emplacement, période, type d''évaluation et métriques de performance. AWS hébergeait l''infrastructure avec auto-scaling pour les pics de soumissions.

## Détails d''Implémentation

L''application évaluateurs a été conçue comme une application web progressive optimisée pour l''usage mobile terrain. Les évaluateurs pouvaient compléter les formulaires hors ligne et synchroniser au retour de la connectivité — essentiel pour les évaluations en magasin. La vérification GPS confirmait la présence physique sur le lieu évalué.

Le moteur de workflow automatisait l''ensemble du pipeline. À la demande d''un cycle d''évaluation, le système associait les clients mystères disponibles selon leur profil démographique, localisation et expérience. Les évaluations complétées passaient par des contrôles qualité automatiques avant révision humaine, et les résultats approuvés étaient immédiatement accessibles dans le portail.

Le tableau de bord client offrait un accès en temps réel aux résultats avec des capacités d''exploration détaillée. Les clients pouvaient comparer les performances entre sites, suivre les tendances et se comparer aux moyennes du secteur.

Nous avons intégré des évaluations vidéo permettant aux clients mystères d''enregistrer discrètement les interactions. La plateforme traitait et stockait les vidéos de manière sécurisée. Les évaluations téléphoniques et chat suivaient un modèle similaire avec enregistrement et analyse de transcriptions.

## Résultats Clés

La plateforme modernisée traite désormais plus de 23 000 visites mystères annuellement pour plus de 500 marques britanniques. Le workflow automatisé a réduit le délai de livraison moyen de 48 à moins de 24 heures. La satisfaction des évaluateurs s''est nettement améliorée avec l''approche mobile-first, entraînant une hausse de 30 % des évaluations complétées par client mystère.',
  meta_title = 'Étude de Cas Insight6 — Plateforme de Mystery Shopping | ITGuys',
  meta_description = 'Comment nous avons modernisé une plateforme de mystery shopping traitant plus de 23 000 évaluations annuelles pour 500+ marques britanniques avec Laravel et Vue.js.'
WHERE project_id = (SELECT id FROM projects WHERE slug = 'insight6') AND locale = 'fr';

UPDATE project_translations SET
  slug = 'insight6',
  content = '## Hintergrund

Insight6 ist eine führende britische Customer-Experience-Agentur, spezialisiert auf Mystery-Shopping-Bewertungen in Einzelhandel, Gastgewerbe, Gesundheitswesen und Rechtssektor. Mit einem Netzwerk von über 800 Mystery Shoppern, die monatlich tausende Bewertungen durchführten, konnte die alte Plattform nicht mehr Schritt halten. Berichte dauerten zu lange, die mobile Erfahrung war schlecht für Feldevaluatoren, und Kunden fehlte die Echtzeit-Sichtbarkeit ihrer Ergebnisse.

Das Unternehmen brauchte eine moderne Plattform für den gesamten Bewertungslebenszyklus — von der Zuweisung über Datenerfassung und Analyse bis zur Kundenlieferung — bei Beibehaltung der 48-Stunden-Liefergarantie. Neue Bewertungsformate wie Video, Telefon und Live-Chat mussten ebenfalls unterstützt werden.

## Technischer Ansatz

Wir bauten die Plattform mit PHP und dem Laravel-Framework und nutzten dessen robustes ORM, Queue-System und Authentifizierungs-Scaffolding. Vue.js trieb das Frontend an und lieferte eine reaktive Oberfläche für die Evaluator-App und das Kundenportal.

MySQL diente als primäre Datenbank mit sorgfältig entworfenen Indizes für komplexe Reporting-Abfragen über tausende Bewertungen hinweg — nach Standort, Zeitraum, Bewertungstyp und Leistungskennzahlen. AWS hostete die Infrastruktur mit Auto-Scaling-Gruppen für Lastspitzen an Wochenenden und Feiertagen.

## Implementierungsdetails

Die Evaluator-Anwendung wurde als Progressive Web App für mobile Feldnutzung optimiert. Evaluatoren konnten Formulare offline ausfüllen und bei Wiederherstellung der Verbindung synchronisieren — entscheidend für In-Store-Bewertungen mit unzuverlässiger Netzabdeckung. GPS-Verifikation bestätigte die physische Anwesenheit am bewerteten Standort.

Die Workflow-Engine automatisierte die gesamte Pipeline. Bei Anforderung eines Bewertungszyklus ordnete das System verfügbare Shopper nach Demografie, Standort und Erfahrung zu. Abgeschlossene Bewertungen durchliefen automatische Qualitätsprüfungen vor der menschlichen Überprüfung, und genehmigte Ergebnisse waren sofort im Kundenportal verfügbar.

Das Kunden-Dashboard bot Echtzeitzugriff auf Ergebnisse mit Drill-down-Funktionen. Kunden konnten Standort-Leistung vergleichen, Trends verfolgen und sich mit Branchendurchschnitten benchmarken.

Wir integrierten Video-Bewertungsfunktionen, die Mystery Shoppern diskrete Aufnahmen ermöglichten. Die Plattform verarbeitete und speicherte Videos sicher neben strukturierten Bewertungsdaten. Telefon- und Chat-Bewertungen folgten einem ähnlichen Muster.

## Zentrale Ergebnisse

Die modernisierte Plattform verarbeitet jetzt jährlich über 23.000 Mystery Shops für mehr als 500 britische Marken. Der automatisierte Workflow reduzierte die durchschnittliche Berichtslieferzeit von 48 auf unter 24 Stunden. Die Evaluator-Zufriedenheit verbesserte sich deutlich durch den Mobile-First-Ansatz, was zu 30 % mehr abgeschlossenen Bewertungen pro Shopper führte.',
  meta_title = 'Insight6 Fallstudie — Mystery-Shopping-Plattform | ITGuys',
  meta_description = 'Wie wir eine Mystery-Shopping-Plattform modernisierten, die jährlich über 23.000 Bewertungen für 500+ britische Marken mit Laravel und Vue.js verarbeitet.'
WHERE project_id = (SELECT id FROM projects WHERE slug = 'insight6') AND locale = 'de';

UPDATE project_translations SET
  slug = 'insight6',
  content = '## Contesto

Insight6 è un''agenzia leader nel Regno Unito per la customer experience, specializzata in valutazioni mystery shopping nei settori retail, hospitality, sanità e legale. Con una rete di oltre 800 mystery shopper che effettuavano migliaia di valutazioni mensili, la loro piattaforma legacy non riusciva più a tenere il passo. I report richiedevano troppo tempo, l''esperienza mobile era scadente per i valutatori sul campo, e i clienti non avevano visibilità in tempo reale sui risultati.

L''azienda necessitava di una piattaforma moderna per l''intero ciclo di valutazione — dall''assegnazione alla consegna al cliente, passando per raccolta dati e analisi — mantenendo la garanzia di consegna in 48 ore. Il sistema doveva supportare anche formati di valutazione più recenti tra cui video, telefono e chat dal vivo.

## Approccio Tecnico

Abbiamo costruito la piattaforma in PHP con il framework Laravel, sfruttando il suo robusto ORM, il sistema di code e lo scaffolding di autenticazione. Vue.js alimentava il frontend con un''interfaccia reattiva sia per l''app mobile dei valutatori che per il portale clienti.

MySQL fungeva da database primario, con indici progettati attentamente per le query di reporting complesse che aggregavano migliaia di valutazioni su più dimensioni — località, periodo, tipo di valutazione e metriche di performance. AWS ospitava l''infrastruttura con gruppi di auto-scaling per i picchi di invii.

## Dettagli di Implementazione

L''applicazione per i valutatori è stata costruita come progressive web app ottimizzata per l''uso mobile sul campo. I valutatori potevano completare i formulari offline e sincronizzare al ritorno della connettività — critico per le valutazioni in negozio. La verifica GPS confermava la presenza fisica presso la località valutata.

Il motore di workflow automatizzava l''intera pipeline. Alla richiesta di un ciclo di valutazione, il sistema abbinava gli shopper disponibili in base a demografia, posizione ed esperienza. Le valutazioni completate passavano attraverso controlli qualità automatici prima della revisione umana, e i risultati approvati erano immediatamente disponibili nel portale.

La dashboard clienti forniva accesso in tempo reale ai risultati con capacità di drill-down. I clienti potevano confrontare le performance tra sedi, tracciare tendenze e fare benchmarking con le medie di settore.

Abbiamo integrato funzionalità di valutazione video che permettevano ai mystery shopper di registrare interazioni in modo discreto. La piattaforma elaborava e archiviava i video in sicurezza. Le valutazioni telefoniche e via chat seguivano uno schema simile.

## Risultati Chiave

La piattaforma modernizzata elabora ora oltre 23.000 mystery shop all''anno per più di 500 marchi britannici. Il workflow automatizzato ha ridotto il tempo medio di consegna dei report da 48 a meno di 24 ore. La soddisfazione dei valutatori è migliorata significativamente con l''approccio mobile-first, portando a un aumento del 30% delle valutazioni completate per shopper.',
  meta_title = 'Caso Studio Insight6 — Piattaforma Mystery Shopping | ITGuys',
  meta_description = 'Come abbiamo modernizzato una piattaforma di mystery shopping che elabora oltre 23.000 valutazioni annuali per 500+ marchi britannici con Laravel e Vue.js.'
WHERE project_id = (SELECT id FROM projects WHERE slug = 'insight6') AND locale = 'it';

UPDATE project_translations SET
  slug = 'insight6',
  content = '## Contexto

Insight6 es una agencia líder de experiencia del cliente en el Reino Unido, especializada en evaluaciones de mystery shopping en los sectores de retail, hostelería, salud y legal. Con una red de más de 800 mystery shoppers realizando miles de evaluaciones mensuales, su plataforma legacy ya no daba abasto. Los reportes tardaban demasiado, la experiencia móvil era deficiente para los evaluadores de campo, y los clientes carecían de visibilidad en tiempo real sobre sus resultados.

La empresa necesitaba una plataforma moderna para todo el ciclo de evaluación — desde la asignación y recolección de datos hasta el análisis y la entrega al cliente — manteniendo la garantía de entrega en 48 horas. El sistema también debía soportar formatos de evaluación más recientes incluyendo video, teléfono y chat en vivo.

## Enfoque Técnico

Construimos la plataforma en PHP con el framework Laravel, aprovechando su robusto ORM, sistema de colas y scaffolding de autenticación. Vue.js impulsaba el frontend con una interfaz reactiva tanto para la app móvil de evaluadores como para el portal de clientes.

MySQL sirvió como base de datos principal, con índices cuidadosamente diseñados para las consultas complejas de reportes que agregaban miles de evaluaciones en múltiples dimensiones — ubicación, período, tipo de evaluación y métricas de rendimiento. AWS alojaba la infraestructura con grupos de auto-scaling para los picos de envíos.

## Detalles de Implementación

La aplicación para evaluadores se construyó como una progressive web app optimizada para uso móvil en campo. Los evaluadores podían completar formularios offline y sincronizar al recuperar conectividad — crítico para evaluaciones en tienda. La verificación GPS confirmaba la presencia física en la ubicación evaluada.

El motor de workflow automatizó todo el pipeline. Al solicitar un ciclo de evaluación, el sistema asignaba shoppers disponibles según demografía, ubicación y experiencia. Las evaluaciones completadas pasaban por controles de calidad automáticos antes de la revisión humana, y los resultados aprobados estaban inmediatamente disponibles en el portal.

El dashboard de clientes proporcionaba acceso en tiempo real a resultados con capacidades de drill-down. Los clientes podían comparar rendimiento entre ubicaciones, rastrear tendencias y hacer benchmarking contra promedios de la industria.

Integramos capacidades de evaluación por video que permitían a los mystery shoppers grabar interacciones discretamente. La plataforma procesaba y almacenaba los videos de forma segura. Las evaluaciones telefónicas y por chat seguían un patrón similar.

## Resultados Clave

La plataforma modernizada procesa ahora más de 23.000 mystery shops anuales para más de 500 marcas británicas. El workflow automatizado redujo el tiempo promedio de entrega de reportes de 48 a menos de 24 horas. La satisfacción de los evaluadores mejoró significativamente con el enfoque mobile-first, logrando un aumento del 30% en evaluaciones completadas por shopper.',
  meta_title = 'Caso de Estudio Insight6 — Plataforma de Mystery Shopping | ITGuys',
  meta_description = 'Cómo modernizamos una plataforma de mystery shopping que procesa más de 23.000 evaluaciones anuales para 500+ marcas británicas con Laravel y Vue.js.'
WHERE project_id = (SELECT id FROM projects WHERE slug = 'insight6') AND locale = 'es';
