-- Convert XtendLive to a full case study with content in all 6 locales

UPDATE projects SET is_case_study = 1, duration = '4 years', completed_at = '2025-01' WHERE slug = 'xtendlive';

UPDATE project_translations SET
  slug = 'xtendlive',
  content = '## Background

Most virtual event platforms in 2020 were glorified webinars. A speaker talked, attendees watched, and everyone left wondering why they didn''t just send a recording. XtendLive wanted something different: 3D venues where people could actually walk around, visit exhibition booths, bump into each other in a hallway, and attend sessions, all inside a browser.

The idea was to recreate what makes physical conferences work. Not just the talks, but the wandering, the booth visits, the unplanned conversations. The platform needed to handle thousands of people in the same space at once, stream live video, and run on a normal laptop without installing anything.

## Technical approach

React handled the frontend, paired with WebGL for the 3D rendering. We layered standard UI components (chat panels, session lists, attendee info) on top of the 3D environment so the interface felt familiar even though you were navigating a virtual space.

Node.js ran the backend and managed WebSocket connections for everything happening in real time: people moving through the venue, chat messages, poll responses, session state changes. With thousands of concurrent users, the event-driven model was the only sensible choice.

Video streaming ran on WebRTC. Keynotes used an SFU architecture to fan out to large audiences, while one-on-one meetings in networking areas used direct peer connections. Adaptive bitrate kept playback smooth across varying connection speeds.

On the infrastructure side, AWS handled everything. EC2 for compute, CloudFront for distributing 3D assets and video, S3 for storage. PostgreSQL was the primary database for user sessions, venue configs, exhibition data, and analytics.

## Implementation details

The venue builder let organizers lay out their conference in 3D: place exhibition booths, set up session rooms, brand the common areas, add networking lounges. Each element linked to actual content. Booths had company info and downloadable materials. Session rooms connected to live or pre-recorded streams. Networking areas opened spontaneous video calls between attendees.

Navigation used simple point-and-click controls with a minimap for larger venues. Getting this to run well on mid-range hardware took real work. We used level-of-detail rendering so distant objects loaded at lower fidelity, lazy-loaded assets as people moved through the space, and compressed textures aggressively. Everything ran in the browser with no plugins.

The engagement engine processed thousands of interactions at once across the 3D space. People visited booths, grabbed virtual brochures, answered live polls during sessions, and exchanged contact details through virtual business cards. Chat worked at two levels: venue-wide announcements and proximity-based conversations that only reached people in the same area.

We ran this project for four years, so the DevOps setup had to be solid. Infrastructure as code, automated scaling for traffic spikes during big events, and monitoring that covered both the application layer and 3D rendering performance.

## Outcomes

The platform ran virtual conferences and exhibitions for organizations worldwide from 2020 through early 2025. The 3D format changed how people behaved at events. Attendees actually explored exhibition areas and spent time networking, much closer to physical event patterns than what you see on flat webinar platforms. Exhibitors got something they couldn''t get elsewhere: a spatial way to show products and talk to qualified leads, rather than hoping someone clicks a link in a chat sidebar.',
  meta_title = 'XtendLive 3D Virtual Conference Platform Case Study | ITGuys',
  meta_description = 'How we built immersive 3D virtual venues for online conferences with React, Node.js, and WebRTC — powering exhibitions and events over a 4-year engagement.'
WHERE project_id = (SELECT id FROM projects WHERE slug = 'xtendlive') AND locale = 'en';

UPDATE project_translations SET
  slug = 'xtendlive',
  content = '## Context

Majoritatea platformelor de evenimente virtuale din 2020 erau, de fapt, niște webinarii puțin mai aranjate. Un speaker vorbea, participanții se uitau, și toată lumea pleca întrebându-se de ce n-au trimis pur și simplu o înregistrare. XtendLive își dorea altceva: spații 3D în care oamenii să se poată plimba, să viziteze standuri de expoziție, să dea peste cineva pe hol și să participe la sesiuni — totul direct din browser.

Ideea era să recreeze ceea ce face conferințele fizice să funcționeze. Nu doar prezentările, ci și explorarea, vizitele la standuri, conversațiile neplanificate. Platforma trebuia să susțină mii de oameni în același spațiu simultan, să transmită video live și să ruleze pe un laptop obișnuit fără să instalezi nimic.

## Abordare tehnică

React a gestionat frontend-ul, împreună cu WebGL pentru randarea 3D. Am suprapus componente UI standard (panouri de chat, liste de sesiuni, informații despre participanți) peste mediul 3D, astfel încât interfața să pară familiară chiar dacă navigai printr-un spațiu virtual.

Node.js rula backend-ul și gestiona conexiunile WebSocket pentru tot ce se întâmpla în timp real: oameni care se deplasau prin spațiu, mesaje de chat, răspunsuri la sondaje, schimbări de stare ale sesiunilor. Cu mii de utilizatori simultani, modelul event-driven era singura alegere logică.

Streaming-ul video rula pe WebRTC. Keynote-urile foloseau o arhitectură SFU pentru distribuția către audiențe mari, în timp ce întâlnirile unu-la-unu din zonele de networking foloseau conexiuni peer directe. Bitrate-ul adaptiv menținea redarea fluidă indiferent de viteza conexiunii.

Pe partea de infrastructură, AWS gestiona totul. EC2 pentru procesare, CloudFront pentru distribuirea asset-urilor 3D și video, S3 pentru stocare. PostgreSQL era baza de date principală pentru sesiuni utilizatori, configurări de spații, date despre expoziție și analiză.

## Detalii de implementare

Constructorul de spații le permitea organizatorilor să-și configureze conferința în 3D: plasarea standurilor de expoziție, amenajarea sălilor de sesiuni, brandarea zonelor comune, adăugarea lounge-urilor de networking. Fiecare element era legat de conținut real. Standurile aveau informații despre companie și materiale descărcabile. Sălile de sesiuni se conectau la stream-uri live sau pre-înregistrate. Zonele de networking deschideau apeluri video spontane între participanți.

Navigarea folosea controale simple de tip point-and-click cu o minimapă pentru spațiile mai mari. Să facem asta să ruleze bine pe hardware mid-range a cerut muncă reală. Am folosit randare level-of-detail pentru ca obiectele la distanță să se încarce la fidelitate mai mică, am încărcat asset-urile lazy pe măsură ce oamenii se deplasau prin spațiu și am comprimat texturile agresiv. Totul rula în browser fără plugin-uri.

Motorul de engagement procesa mii de interacțiuni simultan în spațiul 3D. Oamenii vizitau standuri, luau broșuri virtuale, răspundeau la sondaje live în timpul sesiunilor și schimbau date de contact prin cărți de vizită virtuale. Chatul funcționa pe două nivele: anunțuri la nivel de spațiu și conversații bazate pe proximitate care ajungeau doar la oamenii din aceeași zonă.

Am lucrat la acest proiect patru ani, așa că setup-ul DevOps trebuia să fie solid. Infrastructură ca și cod, scalare automată pentru vârfurile de trafic din timpul evenimentelor mari și monitorizare care acoperea atât layer-ul aplicației, cât și performanța randării 3D.

## Rezultate

Platforma a susținut conferințe și expoziții virtuale pentru organizații din toată lumea din 2020 până la începutul lui 2025. Formatul 3D a schimbat modul în care oamenii se comportau la evenimente. Participanții chiar explorau zonele de expoziție și petreceau timp la networking — mult mai aproape de tiparele evenimentelor fizice decât ce vezi pe platformele plate de webinar. Expozanții obțineau ceva ce nu găseau în altă parte: un mod spațial de a-și prezenta produsele și de a vorbi cu lead-uri calificate, în loc să spere că cineva dă click pe un link din sidebar-ul de chat.',
  meta_title = 'Studiu de caz XtendLive — Platformă 3D pentru conferințe virtuale | ITGuys',
  meta_description = 'Cum am construit spații virtuale 3D imersive pentru conferințe online cu React, Node.js și WebRTC — expoziții și evenimente de-a lungul a 4 ani.'
WHERE project_id = (SELECT id FROM projects WHERE slug = 'xtendlive') AND locale = 'ro';

UPDATE project_translations SET
  slug = 'xtendlive',
  content = '## Contexte

La plupart des plateformes d''événements virtuels en 2020 n''étaient que des webinaires un peu améliorés. Un intervenant parlait, les participants regardaient, et tout le monde repartait en se demandant pourquoi on n''avait pas simplement envoyé un enregistrement. XtendLive voulait autre chose : des espaces 3D où les gens pouvaient se promener, visiter des stands d''exposition, croiser quelqu''un dans un couloir et assister à des sessions — le tout dans un navigateur.

L''idée était de recréer ce qui fait fonctionner les conférences physiques. Pas seulement les présentations, mais aussi la déambulation, les visites de stands, les conversations imprévues. La plateforme devait accueillir des milliers de personnes dans le même espace simultanément, diffuser de la vidéo en direct et tourner sur un ordinateur portable classique sans rien installer.

## Approche technique

React gérait le frontend, associé à WebGL pour le rendu 3D. Nous avons superposé des composants UI standards (panneaux de chat, listes de sessions, infos participants) sur l''environnement 3D pour que l''interface reste familière même quand on naviguait dans un espace virtuel.

Node.js faisait tourner le backend et gérait les connexions WebSocket pour tout ce qui se passait en temps réel : les déplacements dans l''espace, les messages de chat, les réponses aux sondages, les changements d''état des sessions. Avec des milliers d''utilisateurs simultanés, le modèle événementiel était le seul choix sensé.

Le streaming vidéo passait par WebRTC. Les keynotes utilisaient une architecture SFU pour diffuser vers de larges audiences, tandis que les rencontres individuelles dans les zones de networking utilisaient des connexions peer directes. Le débit adaptatif maintenait une lecture fluide quelle que soit la vitesse de connexion.

Côté infrastructure, AWS gérait tout. EC2 pour le calcul, CloudFront pour la distribution des assets 3D et de la vidéo, S3 pour le stockage. PostgreSQL était la base de données principale pour les sessions utilisateurs, les configurations d''espaces, les données d''exposition et les analytics.

## Détails d''implémentation

Le constructeur d''espaces permettait aux organisateurs de configurer leur conférence en 3D : placer des stands d''exposition, aménager des salles de session, personnaliser les espaces communs, ajouter des lounges de networking. Chaque élément était relié à du contenu réel. Les stands contenaient des informations sur l''entreprise et des documents téléchargeables. Les salles de session se connectaient à des flux en direct ou pré-enregistrés. Les zones de networking ouvraient des appels vidéo spontanés entre participants.

La navigation utilisait des contrôles simples de type pointer-cliquer avec une minicarte pour les grands espaces. Faire tourner tout ça correctement sur du matériel milieu de gamme a demandé un vrai travail. Nous avons utilisé du rendu par niveaux de détail pour que les objets distants se chargent à moindre fidélité, du chargement différé des assets au fur et à mesure que les gens se déplaçaient, et une compression agressive des textures. Tout tournait dans le navigateur sans plugin.

Le moteur d''engagement traitait des milliers d''interactions simultanément dans l''espace 3D. Les gens visitaient des stands, récupéraient des brochures virtuelles, répondaient à des sondages en direct pendant les sessions et échangeaient leurs coordonnées via des cartes de visite virtuelles. Le chat fonctionnait à deux niveaux : annonces à l''échelle de l''espace et conversations de proximité qui n''atteignaient que les personnes dans la même zone.

Nous avons travaillé sur ce projet pendant quatre ans, donc le setup DevOps devait être solide. Infrastructure as code, mise à l''échelle automatique pour les pics de trafic lors des grands événements, et monitoring couvrant à la fois la couche applicative et les performances du rendu 3D.

## Résultats

La plateforme a fait tourner des conférences et expositions virtuelles pour des organisations du monde entier de 2020 à début 2025. Le format 3D a changé le comportement des gens lors des événements. Les participants exploraient vraiment les zones d''exposition et passaient du temps à networker — bien plus proche des comportements des événements physiques que ce qu''on voit sur les plateformes de webinaire classiques. Les exposants obtenaient quelque chose qu''ils ne trouvaient nulle part ailleurs : une façon spatiale de présenter leurs produits et de parler à des prospects qualifiés, au lieu d''espérer que quelqu''un clique sur un lien dans une barre latérale de chat.',
  meta_title = 'Étude de cas XtendLive — Plateforme 3D de conférences virtuelles | ITGuys',
  meta_description = 'Comment nous avons construit des espaces virtuels 3D immersifs pour des conférences en ligne avec React, Node.js et WebRTC — expositions et événements sur 4 ans.'
WHERE project_id = (SELECT id FROM projects WHERE slug = 'xtendlive') AND locale = 'fr';

UPDATE project_translations SET
  slug = 'xtendlive',
  content = '## Hintergrund

Die meisten virtuellen Event-Plattformen 2020 waren im Grunde aufgehübschte Webinare. Ein Speaker redete, die Teilnehmer schauten zu, und am Ende fragten sich alle, warum man nicht einfach eine Aufzeichnung geschickt hat. XtendLive wollte etwas anderes: 3D-Räume, in denen man tatsächlich herumlaufen, Ausstellungsstände besuchen, jemandem auf dem Flur begegnen und an Sessions teilnehmen konnte — alles direkt im Browser.

Die Idee war, das nachzubilden, was physische Konferenzen ausmacht. Nicht nur die Vorträge, sondern auch das Herumschlendern, die Standbesuche, die ungeplanten Gespräche. Die Plattform musste tausende Menschen gleichzeitig im selben Raum unterstützen, Live-Video streamen und auf einem normalen Laptop laufen, ohne dass man etwas installieren muss.

## Technischer Ansatz

React übernahm das Frontend, zusammen mit WebGL für das 3D-Rendering. Wir legten Standard-UI-Komponenten (Chat-Panels, Session-Listen, Teilnehmerinfos) über die 3D-Umgebung, sodass sich die Oberfläche vertraut anfühlte, obwohl man durch einen virtuellen Raum navigierte.

Node.js lief im Backend und verwaltete die WebSocket-Verbindungen für alles, was in Echtzeit passierte: Bewegungen durch den Raum, Chat-Nachrichten, Umfrage-Antworten, Session-Statusänderungen. Bei tausenden gleichzeitigen Nutzern war das ereignisgesteuerte Modell die einzig sinnvolle Wahl.

Video-Streaming lief über WebRTC. Keynotes nutzten eine SFU-Architektur zur Verteilung an große Zuschauermengen, während Einzelgespräche in den Networking-Bereichen direkte Peer-Verbindungen verwendeten. Adaptive Bitrate hielt die Wiedergabe bei unterschiedlichen Verbindungsgeschwindigkeiten flüssig.

Auf der Infrastrukturseite übernahm AWS alles. EC2 für Compute, CloudFront für die Verteilung von 3D-Assets und Video, S3 für Speicherung. PostgreSQL war die primäre Datenbank für Benutzersessions, Raumkonfigurationen, Ausstellungsdaten und Analytics.

## Implementierungsdetails

Der Raum-Builder ließ Organisatoren ihre Konferenz in 3D gestalten: Ausstellungsstände platzieren, Session-Räume einrichten, Gemeinschaftsbereiche branden, Networking-Lounges hinzufügen. Jedes Element war mit echtem Inhalt verknüpft. Stände hatten Firmeninformationen und herunterladbare Materialien. Session-Räume waren mit Live- oder aufgezeichneten Streams verbunden. Networking-Bereiche öffneten spontane Videoanrufe zwischen Teilnehmern.

Die Navigation nutzte einfache Point-and-Click-Steuerung mit einer Minimap für größere Räume. Das auf Mittelklasse-Hardware flüssig zum Laufen zu bringen, war echte Arbeit. Wir verwendeten Level-of-Detail-Rendering, damit entfernte Objekte mit geringerer Treue geladen wurden, luden Assets lazy nach, während sich die Leute durch den Raum bewegten, und komprimierten Texturen aggressiv. Alles lief im Browser ohne Plugins.

Die Engagement-Engine verarbeitete tausende Interaktionen gleichzeitig im 3D-Raum. Leute besuchten Stände, nahmen virtuelle Broschüren mit, beantworteten Live-Umfragen während Sessions und tauschten Kontaktdaten über virtuelle Visitenkarten aus. Der Chat funktionierte auf zwei Ebenen: raumweite Ankündigungen und proximitybasierte Gespräche, die nur Personen in der gleichen Zone erreichten.

Wir haben vier Jahre an diesem Projekt gearbeitet, also musste das DevOps-Setup solide sein. Infrastructure as Code, automatische Skalierung bei Traffic-Spitzen während großer Events und Monitoring, das sowohl die Anwendungsschicht als auch die 3D-Rendering-Performance abdeckte.

## Ergebnisse

Die Plattform betrieb von 2020 bis Anfang 2025 virtuelle Konferenzen und Ausstellungen für Organisationen weltweit. Das 3D-Format veränderte, wie sich Menschen bei Events verhielten. Teilnehmer erkundeten tatsächlich die Ausstellungsbereiche und verbrachten Zeit beim Networking — viel näher an physischen Event-Mustern als das, was man auf flachen Webinar-Plattformen sieht. Aussteller bekamen etwas, das sie anderswo nicht fanden: eine räumliche Möglichkeit, Produkte zu zeigen und mit qualifizierten Leads zu sprechen, statt darauf zu hoffen, dass jemand auf einen Link in einer Chat-Seitenleiste klickt.',
  meta_title = 'XtendLive Fallstudie — 3D-Plattform für virtuelle Konferenzen | ITGuys',
  meta_description = 'Wie wir immersive virtuelle 3D-Räume für Online-Konferenzen mit React, Node.js und WebRTC gebaut haben — Ausstellungen und Events über 4 Jahre.'
WHERE project_id = (SELECT id FROM projects WHERE slug = 'xtendlive') AND locale = 'de';

UPDATE project_translations SET
  slug = 'xtendlive',
  content = '## Contesto

La maggior parte delle piattaforme per eventi virtuali nel 2020 erano webinar leggermente migliorati. Uno speaker parlava, i partecipanti guardavano, e alla fine tutti si chiedevano perché non avessero semplicemente inviato una registrazione. XtendLive voleva qualcosa di diverso: spazi 3D dove le persone potessero davvero camminare, visitare stand espositivi, incontrare qualcuno in un corridoio e partecipare a sessioni — tutto direttamente nel browser.

L''idea era ricreare ciò che fa funzionare le conferenze fisiche. Non solo le presentazioni, ma anche il girovagare, le visite agli stand, le conversazioni impreviste. La piattaforma doveva gestire migliaia di persone nello stesso spazio contemporaneamente, trasmettere video in diretta e funzionare su un portatile normale senza installare nulla.

## Approccio tecnico

React gestiva il frontend, abbinato a WebGL per il rendering 3D. Abbiamo sovrapposto componenti UI standard (pannelli chat, liste sessioni, info partecipanti) all''ambiente 3D, così l''interfaccia risultava familiare anche navigando in uno spazio virtuale.

Node.js faceva girare il backend e gestiva le connessioni WebSocket per tutto ciò che accadeva in tempo reale: persone che si spostavano nello spazio, messaggi di chat, risposte ai sondaggi, cambiamenti di stato delle sessioni. Con migliaia di utenti simultanei, il modello event-driven era l''unica scelta sensata.

Lo streaming video girava su WebRTC. I keynote usavano un''architettura SFU per distribuire a grandi audience, mentre gli incontri uno-a-uno nelle aree networking usavano connessioni peer dirette. Il bitrate adattivo manteneva la riproduzione fluida con velocità di connessione variabili.

Sul fronte infrastruttura, AWS gestiva tutto. EC2 per il calcolo, CloudFront per la distribuzione degli asset 3D e del video, S3 per lo storage. PostgreSQL era il database primario per sessioni utente, configurazioni degli spazi, dati espositivi e analytics.

## Dettagli di implementazione

Il costruttore di spazi permetteva agli organizzatori di configurare la propria conferenza in 3D: posizionare stand espositivi, allestire sale sessioni, brandizzare le aree comuni, aggiungere lounge di networking. Ogni elemento era collegato a contenuti reali. Gli stand avevano informazioni aziendali e materiali scaricabili. Le sale sessioni si collegavano a stream live o pre-registrati. Le aree networking aprivano videochiamate spontanee tra i partecipanti.

La navigazione usava controlli semplici point-and-click con una minimappa per gli spazi più grandi. Far funzionare tutto bene su hardware di fascia media ha richiesto un lavoro serio. Abbiamo usato rendering level-of-detail per caricare gli oggetti lontani a fedeltà inferiore, caricamento lazy degli asset man mano che le persone si spostavano nello spazio e compressione aggressiva delle texture. Tutto girava nel browser senza plugin.

Il motore di engagement elaborava migliaia di interazioni contemporaneamente nello spazio 3D. Le persone visitavano stand, prendevano brochure virtuali, rispondevano a sondaggi live durante le sessioni e scambiavano contatti tramite biglietti da visita virtuali. La chat funzionava su due livelli: annunci a livello di spazio e conversazioni basate sulla prossimità che raggiungevano solo le persone nella stessa area.

Abbiamo lavorato a questo progetto per quattro anni, quindi il setup DevOps doveva essere solido. Infrastructure as code, scaling automatico per i picchi di traffico durante i grandi eventi e monitoraggio che copriva sia il livello applicativo che le performance del rendering 3D.

## Risultati

La piattaforma ha gestito conferenze ed esposizioni virtuali per organizzazioni di tutto il mondo dal 2020 fino all''inizio del 2025. Il formato 3D ha cambiato il modo in cui le persone si comportavano agli eventi. I partecipanti esploravano davvero le aree espositive e dedicavano tempo al networking — molto più vicino ai pattern degli eventi fisici rispetto a ciò che si vede sulle piattaforme webinar tradizionali. Gli espositori ottenevano qualcosa che non trovavano altrove: un modo spaziale di mostrare i prodotti e parlare con lead qualificati, invece di sperare che qualcuno cliccasse un link nella sidebar della chat.',
  meta_title = 'Caso studio XtendLive — Piattaforma 3D per conferenze virtuali | ITGuys',
  meta_description = 'Come abbiamo costruito spazi virtuali 3D immersivi per conferenze online con React, Node.js e WebRTC — esposizioni ed eventi nell''arco di 4 anni.'
WHERE project_id = (SELECT id FROM projects WHERE slug = 'xtendlive') AND locale = 'it';

UPDATE project_translations SET
  slug = 'xtendlive',
  content = '## Contexto

La mayoría de las plataformas de eventos virtuales en 2020 eran webinars disfrazados. Un ponente hablaba, los asistentes miraban, y todos se iban preguntándose por qué no habían enviado simplemente una grabación. XtendLive quería algo diferente: espacios 3D donde la gente pudiera pasear, visitar stands de exposición, cruzarse con alguien en un pasillo y asistir a sesiones — todo dentro del navegador.

La idea era recrear lo que hace que las conferencias presenciales funcionen. No solo las charlas, sino también el deambular, las visitas a stands, las conversaciones no planeadas. La plataforma necesitaba manejar miles de personas en el mismo espacio a la vez, transmitir video en directo y funcionar en un portátil normal sin instalar nada.

## Enfoque técnico

React se encargó del frontend, junto con WebGL para el renderizado 3D. Superpusimos componentes UI estándar (paneles de chat, listas de sesiones, info de asistentes) sobre el entorno 3D para que la interfaz resultara familiar aunque estuvieras navegando por un espacio virtual.

Node.js corría en el backend y gestionaba las conexiones WebSocket para todo lo que ocurría en tiempo real: personas moviéndose por el espacio, mensajes de chat, respuestas a encuestas, cambios de estado de las sesiones. Con miles de usuarios simultáneos, el modelo event-driven era la única opción sensata.

El streaming de video funcionaba con WebRTC. Las keynotes usaban una arquitectura SFU para distribuir a audiencias grandes, mientras que las reuniones uno a uno en las áreas de networking usaban conexiones peer directas. El bitrate adaptativo mantenía la reproducción fluida con distintas velocidades de conexión.

En el lado de infraestructura, AWS se encargaba de todo. EC2 para cómputo, CloudFront para distribuir assets 3D y video, S3 para almacenamiento. PostgreSQL era la base de datos principal para sesiones de usuario, configuraciones de espacios, datos de exposición y analytics.

## Detalles de implementación

El constructor de espacios permitía a los organizadores montar su conferencia en 3D: colocar stands de exposición, preparar salas de sesiones, personalizar las áreas comunes, añadir lounges de networking. Cada elemento estaba vinculado a contenido real. Los stands tenían información de empresa y materiales descargables. Las salas de sesiones se conectaban a streams en directo o pregrabados. Las áreas de networking abrían videollamadas espontáneas entre asistentes.

La navegación usaba controles simples de apuntar y hacer clic con un minimapa para los espacios más grandes. Conseguir que esto funcionara bien en hardware de gama media requirió trabajo de verdad. Usamos renderizado por nivel de detalle para que los objetos distantes se cargaran con menor fidelidad, carga lazy de assets a medida que la gente se movía por el espacio y compresión agresiva de texturas. Todo funcionaba en el navegador sin plugins.

El motor de engagement procesaba miles de interacciones a la vez en el espacio 3D. La gente visitaba stands, cogía folletos virtuales, respondía encuestas en directo durante las sesiones e intercambiaba datos de contacto a través de tarjetas de visita virtuales. El chat funcionaba en dos niveles: anuncios a nivel de espacio y conversaciones por proximidad que solo llegaban a las personas en la misma zona.

Trabajamos en este proyecto durante cuatro años, así que el setup de DevOps tenía que ser sólido. Infraestructura como código, escalado automático para picos de tráfico durante eventos grandes y monitorización que cubría tanto la capa de aplicación como el rendimiento del renderizado 3D.

## Resultados

La plataforma gestionó conferencias y exposiciones virtuales para organizaciones de todo el mundo desde 2020 hasta principios de 2025. El formato 3D cambió cómo se comportaba la gente en los eventos. Los asistentes realmente exploraban las áreas de exposición y dedicaban tiempo al networking — mucho más cercano a los patrones de eventos presenciales que lo que se ve en plataformas de webinar planas. Los expositores conseguían algo que no encontraban en otro sitio: una forma espacial de mostrar productos y hablar con leads cualificados, en lugar de esperar que alguien hiciera clic en un enlace en la barra lateral del chat.',
  meta_title = 'Caso de estudio XtendLive — Plataforma 3D de conferencias virtuales | ITGuys',
  meta_description = 'Cómo construimos espacios virtuales 3D inmersivos para conferencias online con React, Node.js y WebRTC — exposiciones y eventos a lo largo de 4 años.'
WHERE project_id = (SELECT id FROM projects WHERE slug = 'xtendlive') AND locale = 'es';
