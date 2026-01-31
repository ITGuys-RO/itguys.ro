-- Convert Insight6 to a full case study with content in all 6 locales

UPDATE projects SET is_case_study = 1, duration = '7 months', completed_at = '2021-09' WHERE slug = 'insight6';

UPDATE project_translations SET
  slug = 'insight6',
  content = '## Background

Insight6 is a UK customer experience agency that runs mystery shopping evaluations across retail, hospitality, healthcare, and legal sectors. With a network of over 800 mystery shoppers conducting thousands of evaluations monthly, their old platform was struggling to keep up. Reports took too long to generate, the mobile experience was poor for field evaluators, and clients lacked real-time visibility into their results.

The company needed a modern platform that could handle the full evaluation lifecycle, from assignment and data collection through analysis and client delivery, while maintaining the 48-hour turnaround guarantee that set them apart. The system also needed to support newer evaluation formats including video, phone, and live chat assessments.

## Technical approach

We built the platform on PHP with the Laravel framework, using its ORM, queue system, and authentication scaffolding to accelerate development. Vue.js powered the frontend, providing a reactive interface for both the evaluator mobile app and the client portal.

MySQL was the primary database, with carefully designed indexes to support the complex reporting queries that aggregated thousands of evaluations across multiple dimensions: location, time period, evaluation type, and performance metrics. AWS hosted the infrastructure, with auto-scaling groups to handle the spike in evaluation submissions that typically occurred on weekends and holidays.

## Implementation details

The evaluator-facing application was a progressive web app optimized for mobile use in the field. Evaluators could complete assessment forms offline and sync when connectivity returned. This was necessary for in-store evaluations where network coverage was unreliable. GPS verification confirmed evaluators were physically present at the assessed location.

The workflow engine automated the entire evaluation pipeline. When a client requested an evaluation cycle, the system matched available shoppers based on demographics, location, and experience. Completed evaluations passed through automated quality checks before routing to human reviewers. Approved results were immediately available in the client portal.

The client dashboard provided real-time access to evaluation results with drill-down capabilities. Clients could compare performance across locations, track trends over time, and benchmark against industry averages. Custom report templates allowed each client to focus on the metrics most relevant to their business.

We integrated video evaluation capabilities that let mystery shoppers record interactions discreetly. The platform processed and securely stored video alongside structured evaluation data, giving clients a complete picture of the customer experience. Phone and chat evaluations followed a similar pattern with call recording and transcript analysis.

## Outcomes

The platform now processes over 23,000 mystery shops annually for more than 500 UK brands. The automated workflow reduced the average report delivery time from 48 hours to under 24 hours. Evaluator satisfaction improved with the mobile-first approach, and completed evaluations per shopper increased by 30%. Clients gained real-time insights through the dashboard. Many reported measurable improvements in customer experience scores within the first quarter of adoption.',
  meta_title = 'Insight6 Mystery Shopping Platform Case Study | ITGuys',
  meta_description = 'How we modernized a mystery shopping platform processing 23,000+ annual evaluations for 500+ UK brands with Laravel, Vue.js, and automated workflows.'
WHERE project_id = (SELECT id FROM projects WHERE slug = 'insight6') AND locale = 'en';

UPDATE project_translations SET slug = 'insight6', content = '## Context

Insight6 e o agenție de customer experience din Regatul Unit care organizează evaluări de tip mystery shopping în retail, hospitality, sănătate și domeniul juridic. Au o rețea de peste 800 de mystery shopperi care fac mii de evaluări în fiecare lună, iar platforma lor veche începuse să cedeze. Rapoartele se generau prea lent, experiența pe mobil era proastă pentru evaluatorii din teren, iar clienții nu puteau vedea rezultatele în timp real.

Aveau nevoie de o platformă modernă care să acopere tot ciclul de viață al unei evaluări — de la atribuire și colectarea datelor, prin analiză, până la livrarea către client — păstrând garanția de 48 de ore care îi diferenția de concurență. Sistemul trebuia să suporte și formate mai noi de evaluare, inclusiv video, telefon și chat live.

## Abordare tehnică

Am construit platforma pe PHP cu Laravel, folosindu-i ORM-ul, sistemul de cozi și scaffolding-ul de autentificare ca să accelerăm dezvoltarea. Vue.js a alimentat frontend-ul, oferind o interfață reactivă atât pentru aplicația mobilă a evaluatorilor, cât și pentru portalul clienților.

MySQL a fost baza de date principală, cu indexuri gândite atent pentru interogările complexe de raportare care agregau mii de evaluări pe mai multe dimensiuni: locație, perioadă, tip de evaluare și metrici de performanță. Infrastructura a rulat pe AWS, cu grupuri de auto-scaling pentru vârfurile de trimiteri care apăreau de obicei în weekenduri și sărbători.

## Detalii de implementare

Aplicația pentru evaluatori a fost o progressive web app optimizată pentru utilizare pe mobil în teren. Evaluatorii puteau completa formularele offline și să sincronizeze când revenea conexiunea. Asta era necesar pentru evaluările din magazine, unde acoperirea rețelei era nesigură. Verificarea GPS confirma că evaluatorul era fizic prezent la locația respectivă.

Motorul de workflow a automatizat tot pipeline-ul de evaluare. Când un client solicita un ciclu de evaluare, sistemul asocia shopperii disponibili pe baza demografiei, locației și experienței. Evaluările completate treceau prin verificări automate de calitate înainte să ajungă la revieweri umani. Rezultatele aprobate erau imediat disponibile în portalul clientului.

Dashboard-ul clientului oferea acces în timp real la rezultate, cu posibilitatea de drill-down. Clienții puteau compara performanța între locații, urmări tendințe în timp și face benchmarking față de mediile din industrie. Template-urile de rapoarte personalizate permiteau fiecărui client să se concentreze pe metricile relevante pentru business-ul lor.

Am integrat capabilități de evaluare video care le permiteau mystery shopperilor să înregistreze interacțiuni în mod discret. Platforma procesa și stoca în siguranță materialele video alături de datele structurate de evaluare, oferind clienților o imagine completă a experienței clientului. Evaluările telefonice și prin chat au urmat un model similar, cu înregistrare a apelurilor și analiză de transcrieri.

## Rezultate

Platforma procesează acum peste 23.000 de mystery shops anual pentru mai mult de 500 de branduri din UK. Workflow-ul automatizat a redus timpul mediu de livrare a rapoartelor de la 48 de ore la sub 24. Satisfacția evaluatorilor a crescut datorită abordării mobile-first, iar numărul de evaluări completate per shopper a urcat cu 30%. Clienții au obținut acces la insights în timp real prin dashboard. Mulți au raportat îmbunătățiri măsurabile ale scorurilor de customer experience în primul trimestru de utilizare.',
  meta_title = 'Studiu de caz Insight6 — Platformă Mystery Shopping | ITGuys',
  meta_description = 'Cum am modernizat o platformă de mystery shopping care procesează peste 23.000 de evaluări anuale pentru 500+ branduri din UK cu Laravel, Vue.js și workflow-uri automate.'
WHERE project_id = (SELECT id FROM projects WHERE slug = 'insight6') AND locale = 'ro';

UPDATE project_translations SET slug = 'insight6', content = '## Contexte

Insight6 est une agence de customer experience britannique qui réalise des évaluations de clients mystères dans le retail, l''hôtellerie, la santé et le secteur juridique. Avec un réseau de plus de 800 clients mystères qui effectuaient des milliers d''évaluations par mois, leur ancienne plateforme n''arrivait plus à suivre. Les rapports prenaient trop de temps à générer, l''expérience mobile était mauvaise pour les évaluateurs terrain, et les clients n''avaient aucune visibilité en temps réel sur leurs résultats.

L''entreprise avait besoin d''une plateforme moderne capable de gérer tout le cycle de vie d''une évaluation — de l''attribution et la collecte de données jusqu''à l''analyse et la livraison client — tout en maintenant la garantie de livraison en 48 heures qui les distinguait. Le système devait aussi prendre en charge des formats d''évaluation plus récents, notamment la vidéo, le téléphone et le chat en direct.

## Approche technique

On a construit la plateforme en PHP avec Laravel, en s''appuyant sur son ORM, son système de files d''attente et son scaffolding d''authentification pour accélérer le développement. Vue.js alimentait le frontend, offrant une interface réactive aussi bien pour l''application mobile des évaluateurs que pour le portail client.

MySQL était la base de données principale, avec des index soigneusement conçus pour les requêtes de reporting complexes qui agrégeaient des milliers d''évaluations sur plusieurs dimensions : emplacement, période, type d''évaluation et métriques de performance. AWS hébergeait l''infrastructure, avec des groupes d''auto-scaling pour absorber les pics de soumissions typiques des week-ends et jours fériés.

## Détails d''implémentation

L''application côté évaluateurs était une progressive web app optimisée pour l''usage mobile sur le terrain. Les évaluateurs pouvaient remplir les formulaires d''évaluation hors ligne et synchroniser quand la connexion revenait. C''était indispensable pour les évaluations en magasin où la couverture réseau n''était pas fiable. La vérification GPS confirmait que l''évaluateur était physiquement présent sur le lieu évalué.

Le moteur de workflow automatisait toute la chaîne d''évaluation. Quand un client demandait un cycle d''évaluation, le système associait les clients mystères disponibles selon leur profil démographique, leur localisation et leur expérience. Les évaluations terminées passaient par des contrôles qualité automatiques avant d''être envoyées aux réviseurs humains. Les résultats approuvés étaient immédiatement accessibles dans le portail client.

Le tableau de bord client offrait un accès en temps réel aux résultats avec des fonctions de drill-down. Les clients pouvaient comparer les performances entre sites, suivre les tendances dans le temps et se comparer aux moyennes du secteur. Des modèles de rapports personnalisés permettaient à chaque client de se concentrer sur les métriques les plus pertinentes pour son activité.

On a intégré des fonctionnalités d''évaluation vidéo qui permettaient aux clients mystères d''enregistrer les interactions discrètement. La plateforme traitait et stockait les vidéos de manière sécurisée aux côtés des données d''évaluation structurées, donnant aux clients une image complète de l''expérience client. Les évaluations téléphoniques et par chat suivaient un modèle similaire avec enregistrement d''appels et analyse de transcriptions.

## Résultats

La plateforme traite désormais plus de 23 000 mystery shops par an pour plus de 500 marques britanniques. Le workflow automatisé a réduit le délai moyen de livraison des rapports de 48 heures à moins de 24. La satisfaction des évaluateurs s''est améliorée grâce à l''approche mobile-first, et le nombre d''évaluations complétées par client mystère a augmenté de 30 %. Les clients ont obtenu des insights en temps réel via le tableau de bord. Beaucoup ont rapporté des améliorations mesurables de leurs scores d''expérience client dès le premier trimestre d''utilisation.',
  meta_title = 'Étude de cas Insight6 — Plateforme Mystery Shopping | ITGuys',
  meta_description = 'Comment nous avons modernisé une plateforme de mystery shopping traitant plus de 23 000 évaluations annuelles pour 500+ marques britanniques avec Laravel, Vue.js et des workflows automatisés.'
WHERE project_id = (SELECT id FROM projects WHERE slug = 'insight6') AND locale = 'fr';

UPDATE project_translations SET slug = 'insight6', content = '## Hintergrund

Insight6 ist eine britische Customer-Experience-Agentur, die Mystery-Shopping-Bewertungen in den Bereichen Einzelhandel, Gastgewerbe, Gesundheitswesen und Recht durchführt. Mit einem Netzwerk von über 800 Mystery Shoppern, die monatlich tausende Bewertungen machten, kam die alte Plattform nicht mehr mit. Berichte brauchten zu lange, das mobile Erlebnis war schlecht für die Evaluatoren im Feld, und den Kunden fehlte jegliche Echtzeit-Einsicht in ihre Ergebnisse.

Das Unternehmen brauchte eine moderne Plattform, die den gesamten Bewertungslebenszyklus abdeckt — von der Zuweisung und Datenerfassung über die Analyse bis zur Kundenlieferung — und dabei die 48-Stunden-Liefergarantie beibehält, die sie von der Konkurrenz abhob. Das System musste außerdem neuere Bewertungsformate unterstützen, darunter Video-, Telefon- und Live-Chat-Bewertungen.

## Technischer Ansatz

Wir haben die Plattform mit PHP und dem Laravel-Framework gebaut und dessen ORM, Queue-System und Authentifizierungs-Scaffolding genutzt, um die Entwicklung zu beschleunigen. Vue.js trieb das Frontend an und lieferte eine reaktive Oberfläche sowohl für die mobile Evaluator-App als auch für das Kundenportal.

MySQL war die primäre Datenbank, mit sorgfältig entworfenen Indizes für die komplexen Reporting-Abfragen, die tausende Bewertungen über mehrere Dimensionen aggregierten: Standort, Zeitraum, Bewertungstyp und Leistungskennzahlen. AWS hostete die Infrastruktur mit Auto-Scaling-Gruppen für die Lastspitzen bei Einreichungen, die typischerweise an Wochenenden und Feiertagen auftraten.

## Implementierungsdetails

Die Evaluator-Anwendung war eine Progressive Web App, optimiert für den mobilen Einsatz im Feld. Evaluatoren konnten Bewertungsformulare offline ausfüllen und synchronisieren, sobald die Verbindung zurückkam. Das war nötig für Bewertungen in Geschäften, wo die Netzabdeckung unzuverlässig war. GPS-Verifikation bestätigte, dass der Evaluator physisch am bewerteten Standort war.

Die Workflow-Engine automatisierte die gesamte Bewertungspipeline. Wenn ein Kunde einen Bewertungszyklus anforderte, ordnete das System verfügbare Shopper nach Demografie, Standort und Erfahrung zu. Abgeschlossene Bewertungen durchliefen automatische Qualitätsprüfungen, bevor sie an menschliche Prüfer weitergeleitet wurden. Freigegebene Ergebnisse waren sofort im Kundenportal verfügbar.

Das Kunden-Dashboard bot Echtzeitzugriff auf Bewertungsergebnisse mit Drill-down-Möglichkeiten. Kunden konnten die Leistung über Standorte hinweg vergleichen, Trends im Zeitverlauf verfolgen und sich mit Branchendurchschnitten messen. Individuelle Berichtsvorlagen ermöglichten es jedem Kunden, sich auf die für sein Geschäft relevantesten Kennzahlen zu konzentrieren.

Wir haben Video-Bewertungsfunktionen integriert, mit denen Mystery Shopper Interaktionen diskret aufnehmen konnten. Die Plattform verarbeitete und speicherte Videos sicher neben den strukturierten Bewertungsdaten und gab Kunden so ein vollständiges Bild der Kundenerfahrung. Telefon- und Chat-Bewertungen folgten einem ähnlichen Muster mit Anrufaufzeichnung und Transkriptanalyse.

## Ergebnisse

Die Plattform verarbeitet jetzt über 23.000 Mystery Shops jährlich für mehr als 500 britische Marken. Der automatisierte Workflow reduzierte die durchschnittliche Berichtslieferzeit von 48 auf unter 24 Stunden. Die Zufriedenheit der Evaluatoren stieg durch den Mobile-First-Ansatz, und die abgeschlossenen Bewertungen pro Shopper nahmen um 30 % zu. Kunden erhielten Echtzeit-Einblicke über das Dashboard. Viele berichteten von messbaren Verbesserungen ihrer Customer-Experience-Scores bereits im ersten Quartal der Nutzung.',
  meta_title = 'Insight6 Fallstudie — Mystery-Shopping-Plattform | ITGuys',
  meta_description = 'Wie wir eine Mystery-Shopping-Plattform modernisiert haben, die jährlich über 23.000 Bewertungen für 500+ britische Marken mit Laravel, Vue.js und automatisierten Workflows verarbeitet.'
WHERE project_id = (SELECT id FROM projects WHERE slug = 'insight6') AND locale = 'de';

UPDATE project_translations SET slug = 'insight6', content = '## Contesto

Insight6 è un''agenzia britannica di customer experience che gestisce valutazioni di mystery shopping nei settori retail, hospitality, sanità e legale. Con una rete di oltre 800 mystery shopper che svolgevano migliaia di valutazioni al mese, la loro vecchia piattaforma non riusciva più a stare al passo. I report impiegavano troppo tempo, l''esperienza mobile era scadente per i valutatori sul campo, e i clienti non avevano visibilità in tempo reale sui risultati.

L''azienda aveva bisogno di una piattaforma moderna in grado di gestire l''intero ciclo di vita della valutazione — dall''assegnazione e raccolta dati, attraverso l''analisi, fino alla consegna al cliente — mantenendo la garanzia di consegna in 48 ore che li distingueva. Il sistema doveva anche supportare formati di valutazione più recenti, tra cui video, telefono e chat dal vivo.

## Approccio tecnico

Abbiamo costruito la piattaforma in PHP con il framework Laravel, sfruttandone l''ORM, il sistema di code e lo scaffolding di autenticazione per accelerare lo sviluppo. Vue.js alimentava il frontend, offrendo un''interfaccia reattiva sia per l''app mobile dei valutatori che per il portale clienti.

MySQL era il database principale, con indici progettati con cura per supportare le query di reporting complesse che aggregavano migliaia di valutazioni su più dimensioni: località, periodo, tipo di valutazione e metriche di performance. AWS ospitava l''infrastruttura, con gruppi di auto-scaling per gestire i picchi di invii tipici dei fine settimana e delle festività.

## Dettagli di implementazione

L''applicazione per i valutatori era una progressive web app ottimizzata per l''uso mobile sul campo. I valutatori potevano compilare i moduli di valutazione offline e sincronizzare quando tornava la connessione. Era necessario per le valutazioni nei negozi, dove la copertura di rete non era affidabile. La verifica GPS confermava che il valutatore fosse fisicamente presente nella sede valutata.

Il motore di workflow automatizzava l''intera pipeline di valutazione. Quando un cliente richiedeva un ciclo di valutazione, il sistema abbinava gli shopper disponibili in base a dati demografici, posizione ed esperienza. Le valutazioni completate passavano attraverso controlli di qualità automatici prima di essere inviate ai revisori umani. I risultati approvati erano immediatamente disponibili nel portale clienti.

La dashboard clienti offriva accesso in tempo reale ai risultati con funzionalità di drill-down. I clienti potevano confrontare le performance tra le sedi, monitorare i trend nel tempo e fare benchmarking rispetto alle medie di settore. Template di report personalizzati permettevano a ogni cliente di concentrarsi sulle metriche più rilevanti per il proprio business.

Abbiamo integrato funzionalità di valutazione video che permettevano ai mystery shopper di registrare le interazioni in modo discreto. La piattaforma elaborava e archiviava i video in sicurezza insieme ai dati strutturati di valutazione, offrendo ai clienti un quadro completo dell''esperienza cliente. Le valutazioni telefoniche e via chat seguivano uno schema simile con registrazione delle chiamate e analisi delle trascrizioni.

## Risultati

La piattaforma elabora ora oltre 23.000 mystery shop all''anno per più di 500 marchi britannici. Il workflow automatizzato ha ridotto il tempo medio di consegna dei report da 48 ore a meno di 24. La soddisfazione dei valutatori è migliorata con l''approccio mobile-first, e le valutazioni completate per shopper sono aumentate del 30%. I clienti hanno ottenuto insights in tempo reale tramite la dashboard. Molti hanno riportato miglioramenti misurabili nei punteggi di customer experience già nel primo trimestre di utilizzo.',
  meta_title = 'Caso studio Insight6 — Piattaforma Mystery Shopping | ITGuys',
  meta_description = 'Come abbiamo modernizzato una piattaforma di mystery shopping che elabora oltre 23.000 valutazioni annuali per 500+ marchi britannici con Laravel, Vue.js e workflow automatizzati.'
WHERE project_id = (SELECT id FROM projects WHERE slug = 'insight6') AND locale = 'it';

UPDATE project_translations SET slug = 'insight6', content = '## Contexto

Insight6 es una agencia británica de experiencia del cliente que realiza evaluaciones de mystery shopping en los sectores de retail, hostelería, salud y legal. Con una red de más de 800 mystery shoppers haciendo miles de evaluaciones al mes, su vieja plataforma ya no daba abasto. Los reportes tardaban demasiado en generarse, la experiencia móvil era pobre para los evaluadores de campo, y los clientes no tenían visibilidad en tiempo real sobre sus resultados.

La empresa necesitaba una plataforma moderna capaz de manejar todo el ciclo de vida de la evaluación — desde la asignación y recolección de datos, pasando por el análisis, hasta la entrega al cliente — manteniendo la garantía de entrega en 48 horas que los diferenciaba. El sistema también debía soportar formatos de evaluación más nuevos, incluyendo video, teléfono y chat en vivo.

## Enfoque técnico

Construimos la plataforma en PHP con el framework Laravel, usando su ORM, sistema de colas y scaffolding de autenticación para acelerar el desarrollo. Vue.js impulsaba el frontend, proporcionando una interfaz reactiva tanto para la app móvil de evaluadores como para el portal de clientes.

MySQL fue la base de datos principal, con índices cuidadosamente diseñados para soportar las consultas complejas de reportes que agregaban miles de evaluaciones en múltiples dimensiones: ubicación, período, tipo de evaluación y métricas de rendimiento. AWS alojaba la infraestructura, con grupos de auto-scaling para manejar los picos de envíos que típicamente ocurrían en fines de semana y festivos.

## Detalles de implementación

La aplicación para evaluadores era una progressive web app optimizada para uso móvil en campo. Los evaluadores podían completar los formularios de evaluación offline y sincronizar cuando volvía la conexión. Era necesario para las evaluaciones en tienda, donde la cobertura de red no era confiable. La verificación GPS confirmaba que el evaluador estaba físicamente presente en la ubicación evaluada.

El motor de workflow automatizó todo el pipeline de evaluación. Cuando un cliente solicitaba un ciclo de evaluación, el sistema asignaba shoppers disponibles según demografía, ubicación y experiencia. Las evaluaciones completadas pasaban por controles de calidad automáticos antes de ser enviadas a revisores humanos. Los resultados aprobados estaban inmediatamente disponibles en el portal del cliente.

El dashboard de clientes proporcionaba acceso en tiempo real a los resultados con capacidades de drill-down. Los clientes podían comparar el rendimiento entre ubicaciones, rastrear tendencias en el tiempo y hacer benchmarking contra promedios de la industria. Plantillas de reportes personalizadas permitían a cada cliente enfocarse en las métricas más relevantes para su negocio.

Integramos capacidades de evaluación por video que permitían a los mystery shoppers grabar interacciones de forma discreta. La plataforma procesaba y almacenaba los videos de manera segura junto con los datos estructurados de evaluación, dando a los clientes una imagen completa de la experiencia del cliente. Las evaluaciones telefónicas y por chat seguían un patrón similar con grabación de llamadas y análisis de transcripciones.

## Resultados

La plataforma ahora procesa más de 23.000 mystery shops al año para más de 500 marcas británicas. El workflow automatizado redujo el tiempo promedio de entrega de reportes de 48 horas a menos de 24. La satisfacción de los evaluadores mejoró con el enfoque mobile-first, y las evaluaciones completadas por shopper aumentaron un 30%. Los clientes obtuvieron insights en tiempo real a través del dashboard. Muchos reportaron mejoras medibles en sus puntuaciones de experiencia del cliente en el primer trimestre de adopción.',
  meta_title = 'Caso de estudio Insight6 — Plataforma de Mystery Shopping | ITGuys',
  meta_description = 'Cómo modernizamos una plataforma de mystery shopping que procesa más de 23.000 evaluaciones anuales para 500+ marcas británicas con Laravel, Vue.js y workflows automatizados.'
WHERE project_id = (SELECT id FROM projects WHERE slug = 'insight6') AND locale = 'es';
