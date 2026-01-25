-- Fix missing diacritics in translations
-- The original seed file had ASCII characters instead of proper Unicode diacritics

-- ============================================================
-- TEAM MEMBER TRANSLATIONS
-- ============================================================

-- Romanian (ro)
UPDATE team_member_translations SET
  name = 'Cătălin Teodorescu',
  role = 'Fondator & Inginer Principal',
  bio = 'Peste 15 ani de experiență în dezvoltare software și securitate cibernetică. Anterior la TUI, Electronic Arts și Team Extension AG. Specializat în arhitectură securizată, DevOps și securitatea aplicațiilor web.'
WHERE team_member_id = 1 AND locale = 'ro';

UPDATE team_member_translations SET
  role = 'Dezvoltator Mobile Senior',
  bio = 'Peste 10 ani de experiență în dezvoltarea aplicațiilor native iOS și Android. Anterior la Nagarro și Enea AB. Expert în arhitectură mobilă, integrații IoT și pipeline-uri CI/CD. Master în Securitate Informatică la Universitatea Politehnica din București.'
WHERE team_member_id = 2 AND locale = 'ro';

-- French (fr)
UPDATE team_member_translations SET
  role = 'Fondateur & Ingénieur Principal',
  bio = 'Plus de 15 ans d''expérience en développement logiciel et cybersécurité. Anciennement chez TUI, Electronic Arts et Team Extension AG. Spécialisé en architecture sécurisée, DevOps et sécurité des applications web.'
WHERE team_member_id = 1 AND locale = 'fr';

UPDATE team_member_translations SET
  role = 'Développeur Mobile Senior',
  bio = 'Plus de 10 ans d''expérience dans le développement d''applications natives iOS et Android. Anciennement chez Nagarro et Enea AB. Expert en architecture mobile, intégrations IoT et pipelines CI/CD. Master en Sécurité Informatique de l''Université Politehnica de Bucarest.'
WHERE team_member_id = 2 AND locale = 'fr';

-- German (de)
UPDATE team_member_translations SET
  role = 'Gründer & Leitender Ingenieur',
  bio = 'Über 15 Jahre Erfahrung in Softwareentwicklung und Cybersicherheit. Zuvor bei TUI, Electronic Arts und Team Extension AG. Spezialisiert auf sichere Architektur, DevOps und Webanwendungssicherheit.'
WHERE team_member_id = 1 AND locale = 'de';

UPDATE team_member_translations SET
  bio = 'Über 10 Jahre Erfahrung in der Entwicklung nativer iOS- und Android-Apps. Zuvor bei Nagarro und Enea AB. Experte für mobile Architektur, IoT-Integrationen und CI/CD-Pipelines. Master in Informationssicherheit an der Politehnica-Universität Bukarest.'
WHERE team_member_id = 2 AND locale = 'de';

-- Italian (it)
UPDATE team_member_translations SET
  bio = 'Oltre 15 anni di esperienza nello sviluppo software e nella sicurezza informatica. In precedenza presso TUI, Electronic Arts e Team Extension AG. Specializzato in architettura sicura, DevOps e sicurezza delle applicazioni web.'
WHERE team_member_id = 1 AND locale = 'it';

UPDATE team_member_translations SET
  bio = 'Oltre 10 anni di esperienza nello sviluppo di app native iOS e Android. In precedenza presso Nagarro ed Enea AB. Esperto in architettura mobile, integrazioni IoT e pipeline CI/CD. Master in Sicurezza Informatica presso l''Università Politehnica di Bucarest.'
WHERE team_member_id = 2 AND locale = 'it';

-- Spanish (es)
UPDATE team_member_translations SET
  bio = 'Más de 15 años de experiencia en desarrollo de software y ciberseguridad. Anteriormente en TUI, Electronic Arts y Team Extension AG. Especializado en arquitectura segura, DevOps y seguridad de aplicaciones web.'
WHERE team_member_id = 1 AND locale = 'es';

UPDATE team_member_translations SET
  bio = 'Más de 10 años desarrollando aplicaciones nativas iOS y Android. Anteriormente en Nagarro y Enea AB. Experto en arquitectura móvil, integraciones IoT y pipelines CI/CD. Master en Seguridad Informática de la Universidad Politehnica de Bucarest.'
WHERE team_member_id = 2 AND locale = 'es';

-- ============================================================
-- COMPANY TRANSLATIONS
-- ============================================================

-- Romanian (ro)
UPDATE company_translations SET
  description = 'Securitate web pentru una dintre cele mai mari companii de turism din lume'
WHERE company_id = 1 AND locale = 'ro';

UPDATE company_translations SET
  description = 'Testare de securitate pentru aplicații web și platforme de gaming'
WHERE company_id = 2 AND locale = 'ro';

UPDATE company_translations SET
  description = 'Peste 5 ani de arhitectură mobilă și dezvoltare de aplicații native'
WHERE company_id = 3 AND locale = 'ro';

UPDATE company_translations SET
  description = 'Dezvoltare IoT și SDK nativ pentru dispozitive conectate'
WHERE company_id = 4 AND locale = 'ro';

-- French (fr)
UPDATE company_translations SET
  description = 'Sécurité web pour l''une des plus grandes entreprises de voyage au monde'
WHERE company_id = 1 AND locale = 'fr';

UPDATE company_translations SET
  description = 'Tests de sécurité pour applications web et plateformes de jeux'
WHERE company_id = 2 AND locale = 'fr';

UPDATE company_translations SET
  description = 'Plus de 5 ans d''architecture mobile et développement d''applications natives'
WHERE company_id = 3 AND locale = 'fr';

UPDATE company_translations SET
  description = 'Développement IoT et SDK natif pour appareils connectés'
WHERE company_id = 4 AND locale = 'fr';

-- German (de)
UPDATE company_translations SET
  description = 'Web-Sicherheit für eines der größten Reiseunternehmen der Welt'
WHERE company_id = 1 AND locale = 'de';

UPDATE company_translations SET
  description = 'Sicherheitstests für Webanwendungen und Gaming-Plattformen'
WHERE company_id = 2 AND locale = 'de';

UPDATE company_translations SET
  description = 'Über 5 Jahre mobile Architektur und native App-Entwicklung'
WHERE company_id = 3 AND locale = 'de';

UPDATE company_translations SET
  description = 'IoT- und native SDK-Entwicklung für vernetzte Geräte'
WHERE company_id = 4 AND locale = 'de';

-- Italian (it)
UPDATE company_translations SET
  description = 'Sicurezza web per una delle più grandi aziende di viaggi al mondo'
WHERE company_id = 1 AND locale = 'it';

UPDATE company_translations SET
  description = 'Test di sicurezza per applicazioni web e piattaforme di gaming'
WHERE company_id = 2 AND locale = 'it';

UPDATE company_translations SET
  description = 'Oltre 5 anni di architettura mobile e sviluppo di app native'
WHERE company_id = 3 AND locale = 'it';

UPDATE company_translations SET
  description = 'Sviluppo IoT e SDK nativo per dispositivi connessi'
WHERE company_id = 4 AND locale = 'it';

-- Spanish (es)
UPDATE company_translations SET
  description = 'Seguridad web para una de las mayores empresas de viajes del mundo'
WHERE company_id = 1 AND locale = 'es';

UPDATE company_translations SET
  description = 'Pruebas de seguridad para aplicaciones web y plataformas de juegos'
WHERE company_id = 2 AND locale = 'es';

UPDATE company_translations SET
  description = 'Más de 5 años de arquitectura móvil y desarrollo de aplicaciones nativas'
WHERE company_id = 3 AND locale = 'es';

UPDATE company_translations SET
  description = 'Desarrollo IoT y SDK nativo para dispositivos conectados'
WHERE company_id = 4 AND locale = 'es';

-- ============================================================
-- PROJECT TRANSLATIONS
-- ============================================================

-- Romanian (ro)
UPDATE project_translations SET
  industry = 'Evenimente & Media',
  challenge = 'Construirea unei platforme de evenimente virtuale suficient de puternică pentru conferințe enterprise, dar suficient de simplă pentru a fi folosită de oricine. Platforma trebuia să gestioneze streaming live la scară largă, interacțiune în timp real și analize detaliate.',
  solution = 'Am dezvoltat un sistem scalabil de gestionare a evenimentelor cu instrumente intuitive de creare, funcții interactive de engagement și un dashboard complet de analize. Ne-am concentrat pe fiabilitate și ușurință în utilizare fără a sacrifica capabilitățile.',
  result = 'Platforma alimentează acum evenimente virtuale pentru organizații din întreaga lume.'
WHERE project_id = 1 AND locale = 'ro';

UPDATE project_translations SET
  industry = 'Experiența Clienților',
  challenge = 'O agenție lider de mystery shopping din UK avea nevoie să-și modernizeze platforma pentru a gestiona mii de evaluări lunare în retail, hospitality, sănătate și sectorul legal. Sistemul trebuia să coordoneze peste 800 de mystery shopperi și să livreze feedback în 48 de ore.',
  solution = 'Am construit un sistem complet de gestionare a evaluărilor cu colectare de date prietenoasă pentru mobil, rutare automatizată a workflow-ului și un portal pentru clienți cu acces în timp real la rezultate. Am integrat evaluări video, telefon și chat.',
  result = 'Sistemul procesează peste 23.000 de mystery shops anual pentru peste 500 de branduri din UK.'
WHERE project_id = 2 AND locale = 'ro';

UPDATE project_translations SET
  industry = 'Audio & Muzică',
  challenge = 'Crearea unui plugin de streaming audio de calitate profesională care permite producătorilor muzicali și inginerilor audio să transmită audio de înaltă calitate din DAW-ul lor către clienți oriunde în lume. Necesită suport pentru până la 128 canale de audio lossless cu latență minimă.',
  solution = 'Am dezvoltat un plugin cross-platform (VST, AU, AAX) cu streaming adaptiv, suportând de la AAC comprimat la PCM lossless 32-bit la 192kHz. Am construit aplicații receptor pentru web, iOS și Android pentru ca clienții să poată asculta fără a instala software.',
  result = 'Instrument standard în industrie folosit de profesioniști audio și studiouri la nivel global.'
WHERE project_id = 3 AND locale = 'ro';

UPDATE project_translations SET
  industry = 'Mediu',
  challenge = 'Organizația lider mondial în certificarea pădurilor avea nevoie de instrumente digitale pentru a-și susține misiunea de protejare a pădurilor la nivel global. Erau necesare sisteme pentru gestionarea certificărilor, trasabilitatea lanțului de aprovizionare și coordonarea părților interesate din mai multe țări.',
  solution = 'Am contribuit la dezvoltarea sistemelor de certificare și trasabilitate care ajută la verificarea practicilor forestiere sustenabile în lanțurile de aprovizionare globale. Am implementat gestionarea securizată a datelor pentru informații sensibile de conformitate.',
  result = 'Susținem misiunea FSC de a proteja pădurile prin certificare de încredere.'
WHERE project_id = 4 AND locale = 'ro';

UPDATE project_translations SET
  challenge = 'O platformă de afiliere poker operând din 2004 cu peste 250.000 de membri avea nevoie să-și scaleze sistemele de tracking rakeback și plăți, integrând cu zeci de camere de poker și site-uri de gaming. Securitatea și urmărirea financiară precisă erau critice.',
  solution = 'Am construit sisteme robuste de tracking și plăți capabile să gestioneze volume mari de tranzacții. Am implementat integrări securizate cu multiple platforme de gaming și calcule automate de plăți. Am adăugat funcții de comunitate inclusiv turnee freeroll și clasamente.',
  result = 'Platforma a distribuit peste 190 milioane dolari în rakeback membrilor din 2004.'
WHERE project_id = 5 AND locale = 'ro';

UPDATE project_translations SET
  challenge = 'Firmele de avocatură aveau nevoie de o soluție completă de management al practicii bazată pe cloud, acoperind înregistrarea timpului, facturare, gestionarea cazurilor și raportare financiară. Sistemul trebuia să gestioneze date sensibile ale clienților cu cerințe stricte de securitate.',
  solution = 'Am dezvoltat o platformă completă de management al practicii juridice cu pontaje integrate, facturare automatizată, urmărirea audierilor și dashboarduri de performanță. Am implementat criptare SSL și controale de acces bazate pe roluri pentru protecția datelor.',
  result = 'Servim firme de avocatură de la practicieni individuali la practici mari multi-echipă din toată Europa.'
WHERE project_id = 6 AND locale = 'ro';

-- French (fr)
UPDATE project_translations SET
  industry = 'Événements & Médias',
  challenge = 'Construire une plateforme d''événements virtuels assez puissante pour les conférences d''entreprise mais assez simple pour être utilisée par tous. La plateforme devait gérer le streaming en direct à grande échelle, l''engagement en temps réel et des analyses détaillées.',
  solution = 'Nous avons développé un système de gestion d''événements évolutif avec des outils de création intuitifs, des fonctionnalités d''engagement interactives et un tableau de bord analytique complet. L''accent a été mis sur la fiabilité et la facilité d''utilisation.',
  result = 'La plateforme alimente maintenant des événements virtuels pour des organisations du monde entier.'
WHERE project_id = 1 AND locale = 'fr';

UPDATE project_translations SET
  industry = 'Expérience Client',
  challenge = 'Une agence leader de clients mystères au Royaume-Uni devait moderniser sa plateforme pour gérer des milliers d''évaluations mensuelles dans le commerce de détail, l''hôtellerie, la santé et le secteur juridique. Le système devait coordonner plus de 800 clients mystères et livrer des retours dans les 48 heures.',
  solution = 'Nous avons construit un système complet de gestion des évaluations avec une collecte de données adaptée aux mobiles, un routage automatisé des workflows et un portail client pour un accès en temps réel aux résultats. Intégration des évaluations vidéo, téléphoniques et chat.',
  result = 'Le système traite plus de 23 000 visites mystères par an pour plus de 500 marques britanniques.'
WHERE project_id = 2 AND locale = 'fr';

UPDATE project_translations SET
  industry = 'Audio & Musique',
  challenge = 'Créer un plugin de streaming audio de qualité professionnelle permettant aux producteurs de musique et ingénieurs audio de diffuser de l''audio haute qualité depuis leur DAW vers des clients n''importe où dans le monde. Support nécessaire pour jusqu''à 128 canaux audio sans perte avec une latence minimale.',
  solution = 'Nous avons développé un plugin multiplateforme (VST, AU, AAX) avec streaming à débit adaptatif, supportant du AAC compressé au PCM sans perte 32 bits à 192kHz. Applications récepteur construites pour web, iOS et Android.',
  result = 'Outil standard de l''industrie utilisé par les professionnels audio et studios dans le monde entier.'
WHERE project_id = 3 AND locale = 'fr';

UPDATE project_translations SET
  industry = 'Environnement',
  challenge = 'L''organisation leader mondial de certification forestière avait besoin d''outils numériques pour soutenir sa mission de protection des forêts. Systèmes nécessaires pour la gestion des certifications, la traçabilité de la chaîne d''approvisionnement et la coordination des parties prenantes.',
  solution = 'Nous avons contribué au développement de systèmes de certification et de traçabilité qui aident à vérifier les pratiques forestières durables dans les chaînes d''approvisionnement mondiales. Gestion sécurisée des données pour les informations de conformité sensibles.',
  result = 'Soutenir la mission du FSC de protéger les forêts grâce à une certification de confiance.'
WHERE project_id = 4 AND locale = 'fr';

UPDATE project_translations SET
  challenge = 'Une plateforme d''affiliation poker opérant depuis 2004 avec plus de 250 000 membres devait faire évoluer ses systèmes de suivi de rakeback et de paiement tout en s''intégrant avec des dizaines de salles de poker. La sécurité et le suivi financier précis étaient critiques.',
  solution = 'Nous avons construit des systèmes de suivi et de paiement robustes capables de gérer des volumes de transactions élevés. Intégrations sécurisées avec plusieurs plateformes de jeux et calculs de paiement automatisés. Fonctionnalités communautaires ajoutées.',
  result = 'La plateforme a distribué plus de 190 millions de dollars en rakeback aux membres depuis 2004.'
WHERE project_id = 5 AND locale = 'fr';

UPDATE project_translations SET
  challenge = 'Les cabinets d''avocats avaient besoin d''une solution complète de gestion de cabinet basée sur le cloud couvrant le suivi du temps, la facturation, la gestion des dossiers et les rapports financiers. Le système devait gérer des données clients sensibles avec des exigences de sécurité strictes.',
  solution = 'Nous avons développé une plateforme complète de gestion de cabinet juridique avec feuilles de temps intégrées, facturation automatisée, suivi des audiences et tableaux de bord de performance. Chiffrement SSL et contrôles d''accès basés sur les rôles.',
  result = 'Au service des cabinets d''avocats des praticiens indépendants aux grands cabinets multi-équipes à travers l''Europe.'
WHERE project_id = 6 AND locale = 'fr';

-- German (de)
UPDATE project_translations SET
  industry = 'Events & Medien',
  challenge = 'Aufbau einer virtuellen Event-Plattform, die leistungsstark genug für Unternehmenskonferenzen ist, aber einfach genug für jeden zu bedienen. Die Plattform musste großangelegtes Live-Streaming, Echtzeit-Engagement und detaillierte Analysen bewältigen.',
  solution = 'Wir entwickelten ein skalierbares Event-Management-System mit intuitiven Erstellungstools, interaktiven Engagement-Funktionen und einem umfassenden Analyse-Dashboard. Fokus auf Zuverlässigkeit und Benutzerfreundlichkeit ohne Kompromisse bei den Funktionen.',
  result = 'Die Plattform betreibt jetzt virtuelle Events für Organisationen weltweit.'
WHERE project_id = 1 AND locale = 'de';

UPDATE project_translations SET
  industry = 'Kundenerlebnis',
  challenge = 'Eine führende britische Mystery-Shopping-Agentur musste ihre Plattform modernisieren, um tausende monatliche Bewertungen in Einzelhandel, Gastgewerbe, Gesundheitswesen und Rechtssektor zu bewältigen. Das System musste über 800 Mystery Shopper koordinieren.',
  solution = 'Wir bauten ein umfassendes Bewertungsmanagementsystem mit mobilfreundlicher Datenerfassung, automatisiertem Workflow-Routing und einem Kundenportal für Echtzeitzugriff auf Ergebnisse. Video-, Telefon- und Chat-Bewertungen integriert.',
  result = 'Das System verarbeitet jährlich über 23.000 Mystery Shops für mehr als 500 britische Marken.'
WHERE project_id = 2 AND locale = 'de';

UPDATE project_translations SET
  industry = 'Audio & Musik',
  challenge = 'Erstellung eines professionellen Audio-Streaming-Plugins, das Musikproduzenten und Toningenieuren ermöglicht, hochwertige Audio von ihrer DAW an Kunden überall auf der Welt zu streamen. Unterstützung für bis zu 128 Kanäle verlustfreies Audio mit minimaler Latenz erforderlich.',
  solution = 'Wir entwickelten ein plattformübergreifendes Plugin (VST, AU, AAX) mit adaptivem Bitrate-Streaming, von komprimiertem AAC bis verlustfreiem 32-Bit PCM bei 192kHz. Empfänger-Apps für Web, iOS und Android erstellt.',
  result = 'Branchenstandard-Tool, das von Audio-Profis und Studios weltweit genutzt wird.'
WHERE project_id = 3 AND locale = 'de';

UPDATE project_translations SET
  industry = 'Umwelt',
  challenge = 'Die weltweit führende Waldzertifizierungsorganisation benötigte digitale Tools zur Unterstützung ihrer Mission zum globalen Waldschutz. Systeme für Zertifizierungsmanagement, Lieferkettenrückverfolgbarkeit und Stakeholder-Koordination erforderlich.',
  solution = 'Wir trugen zur Entwicklung von Zertifizierungs- und Rückverfolgbarkeitssystemen bei, die nachhaltige Forstwirtschaftspraktiken in globalen Lieferketten verifizieren. Sichere Datenhandhabung für sensible Compliance-Informationen implementiert.',
  result = 'Unterstützung der FSC-Mission zum Waldschutz durch vertrauenswürdige Zertifizierung.'
WHERE project_id = 4 AND locale = 'de';

UPDATE project_translations SET
  challenge = 'Eine Poker-Affiliate-Plattform, die seit 2004 mit über 250.000 Mitgliedern operiert, musste ihre Rakeback-Tracking- und Auszahlungssysteme skalieren und sich mit Dutzenden von Pokerräumen integrieren. Sicherheit und genaue Finanzverfolgung waren kritisch.',
  solution = 'Wir bauten robuste Tracking- und Zahlungssysteme, die hohe Transaktionsvolumen bewältigen können. Sichere Integrationen mit mehreren Gaming-Plattformen und automatisierte Auszahlungsberechnungen implementiert. Community-Funktionen hinzugefügt.',
  result = 'Die Plattform hat seit 2004 über 190 Millionen Dollar an Rakeback an Mitglieder ausgeschüttet.'
WHERE project_id = 5 AND locale = 'de';

UPDATE project_translations SET
  challenge = 'Anwaltskanzleien benötigten eine umfassende cloudbasierte Kanzleimanagement-Lösung für Zeiterfassung, Abrechnung, Fallmanagement und Finanzberichterstattung. Das System musste sensible Mandantendaten mit strengen Sicherheitsanforderungen handhaben.',
  solution = 'Wir entwickelten eine vollständige juristische Kanzleimanagement-Plattform mit integrierten Stundenzetteln, automatisierter Rechnungsstellung, Gerichtsverhandlungsverfolgung und Performance-Dashboards. SSL-Verschlüsselung und rollenbasierte Zugriffskontrollen.',
  result = 'Wir bedienen Anwaltskanzleien von Einzelpraktikern bis zu großen Multi-Team-Kanzleien in ganz Europa.'
WHERE project_id = 6 AND locale = 'de';

-- Italian (it)
UPDATE project_translations SET
  industry = 'Eventi & Media',
  challenge = 'Costruire una piattaforma per eventi virtuali abbastanza potente per conferenze aziendali ma abbastanza semplice da usare per chiunque. La piattaforma doveva gestire streaming live su larga scala, coinvolgimento in tempo reale e analisi dettagliate.',
  solution = 'Abbiamo sviluppato un sistema scalabile di gestione eventi con strumenti intuitivi di creazione, funzionalità di coinvolgimento interattivo e una dashboard analitica completa. Focus su affidabilità e facilità d''uso senza sacrificare le capacità.',
  result = 'La piattaforma ora alimenta eventi virtuali per organizzazioni in tutto il mondo.'
WHERE project_id = 1 AND locale = 'it';

UPDATE project_translations SET
  challenge = 'Un''agenzia leader di mystery shopping nel Regno Unito doveva modernizzare la propria piattaforma per gestire migliaia di valutazioni mensili in retail, hospitality, sanità e settore legale. Il sistema doveva coordinare oltre 800 mystery shopper.',
  solution = 'Abbiamo costruito un sistema completo di gestione delle valutazioni con raccolta dati mobile-friendly, routing automatizzato del workflow e un portale clienti per l''accesso in tempo reale ai risultati. Integrate valutazioni video, telefono e chat.',
  result = 'Il sistema elabora oltre 23.000 mystery shop all''anno per oltre 500 marchi britannici.'
WHERE project_id = 2 AND locale = 'it';

UPDATE project_translations SET
  industry = 'Audio & Musica',
  challenge = 'Creare un plugin di streaming audio di qualità professionale che permetta a produttori musicali e ingegneri audio di trasmettere audio di alta qualità dalla loro DAW a clienti ovunque nel mondo. Necessario supporto fino a 128 canali audio lossless con latenza minima.',
  solution = 'Abbiamo sviluppato un plugin cross-platform (VST, AU, AAX) con streaming a bitrate adattivo, supportando da AAC compresso a PCM lossless 32-bit a 192kHz. App ricevitore costruite per web, iOS e Android.',
  result = 'Strumento standard del settore usato da professionisti audio e studi in tutto il mondo.'
WHERE project_id = 3 AND locale = 'it';

UPDATE project_translations SET
  industry = 'Ambiente',
  challenge = 'L''organizzazione leader mondiale nella certificazione forestale aveva bisogno di strumenti digitali per supportare la sua missione di protezione delle foreste. Necessari sistemi per la gestione delle certificazioni, tracciabilità della supply chain e coordinamento stakeholder.',
  solution = 'Abbiamo contribuito allo sviluppo di sistemi di certificazione e tracciabilità che aiutano a verificare pratiche forestali sostenibili nelle supply chain globali. Implementata gestione sicura dei dati per informazioni di conformità sensibili.',
  result = 'Supportiamo la missione FSC di proteggere le foreste attraverso certificazioni affidabili.'
WHERE project_id = 4 AND locale = 'it';

UPDATE project_translations SET
  challenge = 'Una piattaforma di affiliazione poker operante dal 2004 con oltre 250.000 membri doveva scalare i propri sistemi di tracking rakeback e pagamenti integrandosi con dozzine di poker room. Sicurezza e tracking finanziario accurato erano critici.',
  solution = 'Abbiamo costruito sistemi robusti di tracking e pagamento capaci di gestire alti volumi di transazioni. Implementate integrazioni sicure con multiple piattaforme di gaming e calcoli automatici dei pagamenti. Aggiunte funzionalità community.',
  result = 'La piattaforma ha distribuito oltre 190 milioni di dollari in rakeback ai membri dal 2004.'
WHERE project_id = 5 AND locale = 'it';

UPDATE project_translations SET
  challenge = 'Gli studi legali avevano bisogno di una soluzione completa di gestione dello studio basata su cloud che coprisse time tracking, fatturazione, gestione casi e reportistica finanziaria. Il sistema doveva gestire dati sensibili dei clienti con requisiti di sicurezza rigorosi.',
  solution = 'Abbiamo sviluppato una piattaforma completa di gestione dello studio legale con timesheet integrati, fatturazione automatizzata, tracking delle udienze e dashboard delle performance. Implementata crittografia SSL e controlli di accesso basati sui ruoli.',
  result = 'Serviamo studi legali da professionisti singoli a grandi studi multi-team in tutta Europa.'
WHERE project_id = 6 AND locale = 'it';

-- Spanish (es)
UPDATE project_translations SET
  industry = 'Eventos y Medios',
  challenge = 'Construir una plataforma de eventos virtuales lo suficientemente potente para conferencias empresariales pero lo suficientemente simple para que cualquiera la use. La plataforma necesitaba manejar streaming en vivo a gran escala, engagement en tiempo real y analíticas detalladas.',
  solution = 'Desarrollamos un sistema escalable de gestión de eventos con herramientas intuitivas de creación, funciones de engagement interactivo y un dashboard analítico completo. Enfoque en fiabilidad y facilidad de uso sin sacrificar capacidades.',
  result = 'La plataforma ahora impulsa eventos virtuales para organizaciones en todo el mundo.'
WHERE project_id = 1 AND locale = 'es';

UPDATE project_translations SET
  industry = 'Experiencia del Cliente',
  challenge = 'Una agencia líder de mystery shopping en UK necesitaba modernizar su plataforma para manejar miles de evaluaciones mensuales en retail, hostelería, salud y sector legal. El sistema debía coordinar más de 800 mystery shoppers y entregar feedback en 48 horas.',
  solution = 'Construimos un sistema integral de gestión de evaluaciones con recolección de datos mobile-friendly, enrutamiento automatizado de workflows y un portal de clientes para acceso en tiempo real a resultados. Integradas evaluaciones de video, teléfono y chat.',
  result = 'El sistema procesa más de 23.000 mystery shops anualmente para más de 500 marcas británicas.'
WHERE project_id = 2 AND locale = 'es';

UPDATE project_translations SET
  industry = 'Audio y Música',
  challenge = 'Crear un plugin de streaming de audio de calidad profesional que permita a productores musicales e ingenieros de audio transmitir audio de alta calidad desde su DAW a clientes en cualquier parte del mundo. Soporte requerido para hasta 128 canales de audio lossless con latencia mínima.',
  solution = 'Desarrollamos un plugin multiplataforma (VST, AU, AAX) con streaming de bitrate adaptativo, soportando desde AAC comprimido hasta PCM lossless de 32 bits a 192kHz. Apps receptoras construidas para web, iOS y Android.',
  result = 'Herramienta estándar de la industria usada por profesionales de audio y estudios globalmente.'
WHERE project_id = 3 AND locale = 'es';

UPDATE project_translations SET
  industry = 'Medio Ambiente',
  challenge = 'La organización líder mundial de certificación forestal necesitaba herramientas digitales para apoyar su misión de proteger los bosques globalmente. Se requerían sistemas para gestión de certificaciones, trazabilidad de la cadena de suministro y coordinación de stakeholders.',
  solution = 'Contribuimos al desarrollo de sistemas de certificación y trazabilidad que ayudan a verificar prácticas forestales sostenibles en cadenas de suministro globales. Implementado manejo seguro de datos para información sensible de cumplimiento.',
  result = 'Apoyando la misión de FSC de proteger los bosques a través de certificación confiable.'
WHERE project_id = 4 AND locale = 'es';

UPDATE project_translations SET
  challenge = 'Una plataforma de afiliados de poker operando desde 2004 con más de 250.000 miembros necesitaba escalar sus sistemas de tracking de rakeback y pagos mientras se integraba con docenas de salas de poker. La seguridad y el seguimiento financiero preciso eran críticos.',
  solution = 'Construimos sistemas robustos de tracking y pagos capaces de manejar altos volúmenes de transacciones. Implementamos integraciones seguras con múltiples plataformas de gaming y cálculos automatizados de pagos. Añadidas funciones de comunidad.',
  result = 'La plataforma ha distribuido más de 190 millones de dólares en rakeback a miembros desde 2004.'
WHERE project_id = 5 AND locale = 'es';

UPDATE project_translations SET
  challenge = 'Los bufetes de abogados necesitaban una solución integral de gestión de práctica basada en la nube que cubriera seguimiento de tiempo, facturación, gestión de casos y reportes financieros. El sistema debía manejar datos sensibles de clientes con requisitos estrictos de seguridad.',
  solution = 'Desarrollamos una plataforma completa de gestión de práctica legal con hojas de tiempo integradas, facturación automatizada, seguimiento de audiencias y dashboards de rendimiento. Implementada encriptación SSL y controles de acceso basados en roles.',
  result = 'Sirviendo bufetes de abogados desde profesionales individuales hasta grandes prácticas multi-equipo en toda Europa.'
WHERE project_id = 6 AND locale = 'es';

-- ============================================================
-- SERVICE TRANSLATIONS (Professional Services: 1-4)
-- ============================================================

-- Romanian (ro)
UPDATE service_translations SET
  title = 'Consultanță Tehnică',
  description = 'Ghidare expertizată în decizii de arhitectură, alegeri tehnologice și strategii de dezvoltare.',
  details = 'Uneori ai nevoie de o a doua opinie sau de ghidare expertizată înainte de a te angaja într-o direcție. Oferim servicii de consultanță pentru a te ajuta să iei decizii informate despre stack-ul tehnologic, arhitectură și abordarea de dezvoltare.'
WHERE service_id = 1 AND locale = 'ro';

UPDATE service_translations SET
  title = 'Servicii de Securitate',
  description = 'Cu experiență la Electronic Arts și TUI, nu doar construim software. Știm cum să-l spargem. Această perspectivă modelează tot ce creăm.',
  details = 'Dacă utilizatorii nu au încredere în securitatea ta, nu vor rămâne. Protejarea sistemelor și datelor tale este fundația pe care se construiește totul.',
  note = 'Putem lucra ca echipă de securitate independentă sau alături de dezvoltarea ta, lucrează cu noi!'
WHERE service_id = 2 AND locale = 'ro';

UPDATE service_translations SET
  title = 'Big Data & Analytics',
  description = 'Transformă datele brute în ceva util. Dashboarduri personalizate, metrici și analize care te ajută să iei decizii.',
  details = 'Nu poți îmbunătăți ceea ce nu măsori. Configurăm analize care îți arată ce se întâmplă cu utilizatorii, sistemul și afacerea ta.'
WHERE service_id = 3 AND locale = 'ro';

UPDATE service_translations SET
  title = 'Servicii QA & Testare',
  description = 'Ne asigurăm că software-ul tău funcționează cu adevărat. Testare manuală și automatizată care găsește probleme înainte ca utilizatorii tăi să le descopere.',
  details = 'Abordarea noastră de testare acoperă funcționalitate, performanță, securitate și experiența utilizatorului. Folosim instrumente standard din industrie precum Selenium, Appium și JMeter pentru a detecta probleme înainte să ajungă la utilizatori.'
WHERE service_id = 4 AND locale = 'ro';

-- French (fr)
UPDATE service_translations SET
  title = 'Conseil Technique',
  description = 'Conseils d''experts sur les décisions d''architecture, les choix technologiques et les stratégies de développement.',
  details = 'Parfois, vous avez besoin d''un deuxième avis ou de conseils d''experts avant de vous engager dans une direction. Nous offrons des services de conseil pour vous aider à prendre des décisions éclairées sur votre stack technologique, votre architecture et votre approche de développement.'
WHERE service_id = 1 AND locale = 'fr';

UPDATE service_translations SET
  title = 'Services de Sécurité',
  description = 'Avec une expérience chez Electronic Arts et TUI, nous ne construisons pas seulement des logiciels. Nous savons comment les casser. Cette perspective façonne tout ce que nous créons.',
  details = 'Si vos utilisateurs ne font pas confiance à votre sécurité, ils ne resteront pas. Protéger vos systèmes et vos données est la base sur laquelle tout le reste est construit.',
  note = 'Nous pouvons travailler comme équipe de sécurité indépendante ou aux côtés de votre développement, travaillez avec nous!'
WHERE service_id = 2 AND locale = 'fr';

UPDATE service_translations SET
  title = 'Big Data & Analytique',
  description = 'Transformez les données brutes en quelque chose d''utile. Tableaux de bord personnalisés, métriques et analyses qui vous aident à prendre des décisions.',
  details = 'Vous ne pouvez pas améliorer ce que vous ne mesurez pas. Nous mettons en place des analyses qui vous montrent ce qui se passe avec vos utilisateurs, votre système et votre entreprise.'
WHERE service_id = 3 AND locale = 'fr';

UPDATE service_translations SET
  title = 'Services QA & Tests',
  description = 'Nous nous assurons que votre logiciel fonctionne vraiment. Tests manuels et automatisés qui détectent les problèmes avant vos utilisateurs.',
  details = 'Notre approche de test couvre la fonctionnalité, la performance, la sécurité et l''expérience utilisateur. Nous utilisons des outils standard de l''industrie comme Selenium, Appium et JMeter pour détecter les problèmes avant qu''ils n''atteignent vos utilisateurs.'
WHERE service_id = 4 AND locale = 'fr';

-- German (de)
UPDATE service_translations SET
  title = 'Technische Beratung',
  description = 'Expertenberatung zu Architekturentscheidungen, Technologieauswahl und Entwicklungsstrategien.',
  details = 'Manchmal brauchen Sie eine zweite Meinung oder Expertenberatung, bevor Sie sich für eine Richtung entscheiden. Wir bieten Beratungsdienste, um Ihnen zu helfen, fundierte Entscheidungen über Ihren Technologie-Stack, Ihre Architektur und Ihren Entwicklungsansatz zu treffen.'
WHERE service_id = 1 AND locale = 'de';

UPDATE service_translations SET
  title = 'Sicherheitsdienste',
  description = 'Mit Erfahrung bei Electronic Arts und TUI bauen wir nicht nur Software. Wir wissen, wie man sie knackt. Diese Perspektive prägt alles, was wir schaffen.',
  details = 'Wenn Ihre Benutzer Ihrer Sicherheit nicht vertrauen, bleiben sie nicht. Der Schutz Ihrer Systeme und Daten ist das Fundament, auf dem alles andere aufgebaut ist.',
  note = 'Wir können als eigenständiges Sicherheitsteam oder neben Ihrer Entwicklung arbeiten, arbeiten Sie mit uns!'
WHERE service_id = 2 AND locale = 'de';

UPDATE service_translations SET
  title = 'Big Data & Analytics',
  description = 'Verwandeln Sie Rohdaten in etwas Nützliches. Individuelle Dashboards, Metriken und Analysen, die Ihnen bei Entscheidungen helfen.',
  details = 'Sie können nicht verbessern, was Sie nicht messen. Wir richten Analysen ein, die Ihnen zeigen, was mit Ihren Benutzern, Ihrem System und Ihrem Unternehmen passiert.'
WHERE service_id = 3 AND locale = 'de';

UPDATE service_translations SET
  title = 'QA & Testdienste',
  description = 'Wir stellen sicher, dass Ihre Software tatsächlich funktioniert. Manuelle und automatisierte Tests, die Probleme erkennen, bevor Ihre Benutzer es tun.',
  details = 'Unser Testansatz umfasst Funktionalität, Leistung, Sicherheit und Benutzererfahrung. Wir verwenden branchenübliche Tools wie Selenium, Appium und JMeter, um Probleme zu erkennen, bevor sie Ihre Benutzer erreichen.'
WHERE service_id = 4 AND locale = 'de';

-- Italian (it)
UPDATE service_translations SET
  title = 'Consulenza Tecnica',
  description = 'Guida esperta su decisioni architetturali, scelte tecnologiche e strategie di sviluppo.',
  details = 'A volte hai bisogno di un secondo parere o di una guida esperta prima di impegnarti in una direzione. Offriamo servizi di consulenza per aiutarti a prendere decisioni informate sul tuo stack tecnologico, architettura e approccio di sviluppo.'
WHERE service_id = 1 AND locale = 'it';

UPDATE service_translations SET
  title = 'Servizi di Sicurezza',
  description = 'Con esperienza presso Electronic Arts e TUI, non costruiamo solo software. Sappiamo come violarlo. Questa prospettiva plasma tutto ciò che creiamo.',
  details = 'Se i tuoi utenti non si fidano della tua sicurezza, non rimarranno. Proteggere i tuoi sistemi e dati è la base su cui tutto il resto è costruito.',
  note = 'Possiamo lavorare come team di sicurezza indipendente o insieme al tuo sviluppo, lavora con noi!'
WHERE service_id = 2 AND locale = 'it';

UPDATE service_translations SET
  title = 'Big Data & Analytics',
  description = 'Trasforma i dati grezzi in qualcosa di utile. Dashboard personalizzate, metriche e analisi che ti aiutano a prendere decisioni.',
  details = 'Non puoi migliorare ciò che non misuri. Configuriamo analisi che ti mostrano cosa sta succedendo con i tuoi utenti, il tuo sistema e la tua azienda.'
WHERE service_id = 3 AND locale = 'it';

UPDATE service_translations SET
  title = 'Servizi QA & Testing',
  description = 'Ci assicuriamo che il tuo software funzioni davvero. Test manuali e automatizzati che individuano i problemi prima che lo facciano i tuoi utenti.',
  details = 'Il nostro approccio di testing copre funzionalità, prestazioni, sicurezza ed esperienza utente. Utilizziamo strumenti standard del settore come Selenium, Appium e JMeter per rilevare problemi prima che raggiungano i tuoi utenti.'
WHERE service_id = 4 AND locale = 'it';

-- Spanish (es)
UPDATE service_translations SET
  title = 'Consultoría Técnica',
  description = 'Orientación experta en decisiones de arquitectura, elecciones tecnológicas y estrategias de desarrollo.',
  details = 'A veces necesitas una segunda opinión o orientación experta antes de comprometerte con una dirección. Ofrecemos servicios de consultoría para ayudarte a tomar decisiones informadas sobre tu stack tecnológico, arquitectura y enfoque de desarrollo.'
WHERE service_id = 1 AND locale = 'es';

UPDATE service_translations SET
  title = 'Servicios de Seguridad',
  description = 'Con experiencia en Electronic Arts y TUI, no solo construimos software. Sabemos cómo romperlo. Esa perspectiva moldea todo lo que creamos.',
  details = 'Si tus usuarios no confían en tu seguridad, no se quedarán. Proteger tus sistemas y datos es la base sobre la que se construye todo lo demás.',
  note = 'Podemos trabajar como equipo de seguridad independiente o junto a tu desarrollo, ¡trabaja con nosotros!'
WHERE service_id = 2 AND locale = 'es';

UPDATE service_translations SET
  title = 'Big Data & Analytics',
  description = 'Convierte datos brutos en algo útil. Dashboards personalizados, métricas y analíticas que te ayudan a tomar decisiones.',
  details = 'No puedes mejorar lo que no mides. Configuramos analíticas que te muestran qué está pasando con tus usuarios, tu sistema y tu negocio.'
WHERE service_id = 3 AND locale = 'es';

UPDATE service_translations SET
  title = 'Servicios de QA y Testing',
  description = 'Nos aseguramos de que tu software realmente funcione. Testing manual y automatizado que detecta problemas antes que tus usuarios.',
  details = 'Nuestro enfoque de testing cubre funcionalidad, rendimiento, seguridad y experiencia de usuario. Usamos herramientas estándar de la industria como Selenium, Appium y JMeter para detectar problemas antes de que lleguen a tus usuarios.'
WHERE service_id = 4 AND locale = 'es';

-- ============================================================
-- SERVICE TRANSLATIONS (Development Services: 5-10)
-- ============================================================

-- Romanian (ro)
UPDATE service_translations SET
  title = 'AI & Machine Learning',
  description = 'De la procesarea limbajului natural la viziune computerizată, construim sisteme care învață și se adaptează. Transformă datele în ceva util.',
  details = 'Construim soluții AI personalizate folosind TensorFlow, PyTorch și Scikit-learn. Modele predictive, chatboți cu NLP, recunoaștere de imagini. Ne concentrăm pe AI care rezolvă probleme reale, nu demo-uri.'
WHERE service_id = 5 AND locale = 'ro';

UPDATE service_translations SET
  title = 'Aplicații Web',
  description = 'De la dashboarduri interne la platforme pentru clienți. SPA-uri, PWA-uri, panouri admin, produse SaaS. Orice au nevoie utilizatorii tăi.',
  details = 'Lucrăm cu Laravel, Symfony, Drupal, WordPress, CraftCMS și framework-uri JavaScript moderne. Alegem bazat pe cerințele tale, nu pe preferințele noastre. Ai nevoie de SEO? Renderizare server-side. Interactivitate mare? Un SPA modern. Nevoi simple? Poate deloc framework.'
WHERE service_id = 6 AND locale = 'ro';

UPDATE service_translations SET
  title = 'Aplicații Mobile',
  description = 'Aplicații native iOS și Android construite de ingineri cu peste 10 ani la Nagarro și Enea AB. Nu compromisuri cross-platform, performanță nativă reală.',
  details = 'Ne specializăm în dezvoltare nativă pentru că unele aplicații o cer. Integrări IoT, wearables, sisteme de plăți, aplicații de sănătate. Când performanța și integrarea platformei contează, construim nativ. Ne ocupăm și de publicarea în app store, pipeline-uri CI/CD și mentenanță continuă.'
WHERE service_id = 7 AND locale = 'ro';

UPDATE service_translations SET
  title = 'DevOps & Infrastructură Cloud',
  description = 'Deploymenturi containerizate, pipeline-uri CI/CD și arhitectură cloud pe AWS. Construim infrastructură care scalează și rămâne securizată.',
  details = 'Docker, Kubernetes, Terraform, CircleCI, GitHub Actions. Configurăm deploymenturi automatizate, monitorizare și infrastructură ca cod pentru ca echipa ta să poată livra cu încredere.'
WHERE service_id = 8 AND locale = 'ro';

UPDATE service_translations SET
  title = 'Backend, API-uri & Integrări',
  description = 'Motorul din spatele aplicației tale. API-uri RESTful, microservicii, optimizare baze de date și integrări third-party.',
  details = 'MySQL, PostgreSQL, Elastic Search pentru query-uri complexe. Ne ocupăm de modernizarea sistemelor legacy, integrări de sistem și module standalone pentru produse mai mari. Dacă ai o provocare tehnică specifică, suntem bucuroși să ne apucăm.'
WHERE service_id = 9 AND locale = 'ro';

UPDATE service_translations SET
  title = 'Design & Management Baze de Date',
  description = 'SQL, NoSQL, modelare date și administrare. Proiectăm baze de date care scalează și rămân rapide.',
  details = 'De la design de schemă la optimizare de performanță, ne ocupăm de stratul de date. MySQL, PostgreSQL, MongoDB, Redis. Alegem bazat pe pattern-urile tale de acces, nu pe preferințele noastre. Administrare baze de date, migrări și disaster recovery incluse.'
WHERE service_id = 10 AND locale = 'ro';

-- French (fr)
UPDATE service_translations SET
  title = 'IA & Machine Learning',
  description = 'Du traitement du langage naturel à la vision par ordinateur, nous construisons des systèmes qui apprennent et s''adaptent. Transformez les données en quelque chose d''utile.',
  details = 'Nous construisons des solutions IA personnalisées utilisant TensorFlow, PyTorch et Scikit-learn. Modèles prédictifs, chatbots avec NLP, reconnaissance d''images. Nous nous concentrons sur l''IA qui résout de vrais problèmes, pas des démos.'
WHERE service_id = 5 AND locale = 'fr';

UPDATE service_translations SET
  title = 'Applications Web',
  description = 'Des tableaux de bord internes aux plateformes clients. SPAs, PWAs, panneaux d''administration, produits SaaS. Tout ce dont vos utilisateurs ont besoin.',
  details = 'Nous travaillons avec Laravel, Symfony, Drupal, WordPress, CraftCMS et les frameworks JavaScript modernes. Nous choisissons en fonction de vos besoins, pas de nos préférences. Besoin de SEO? Rendu côté serveur. Forte interactivité? Un SPA moderne. Besoins simples? Peut-être pas de framework du tout.'
WHERE service_id = 6 AND locale = 'fr';

UPDATE service_translations SET
  title = 'Applications Mobiles',
  description = 'Applications natives iOS et Android construites par des ingénieurs avec plus de 10 ans chez Nagarro et Enea AB. Pas de compromis cross-platform, de vraies performances natives.',
  details = 'Nous nous spécialisons dans le développement natif car certaines applications l''exigent. Intégrations IoT, wearables, systèmes de paiement, applications de santé. Quand la performance et l''intégration de la plateforme comptent, nous construisons natif. Nous gérons aussi la publication sur les app stores, les pipelines CI/CD et la maintenance continue.'
WHERE service_id = 7 AND locale = 'fr';

UPDATE service_translations SET
  title = 'DevOps & Infrastructure Cloud',
  description = 'Déploiements containerisés, pipelines CI/CD et architecture cloud sur AWS. Nous construisons une infrastructure qui évolue et reste sécurisée.',
  details = 'Docker, Kubernetes, Terraform, CircleCI, GitHub Actions. Nous mettons en place des déploiements automatisés, de la surveillance et de l''infrastructure en tant que code pour que votre équipe puisse livrer en toute confiance.'
WHERE service_id = 8 AND locale = 'fr';

UPDATE service_translations SET
  title = 'Backend, APIs & Intégrations',
  description = 'Le moteur derrière votre application. APIs RESTful, microservices, optimisation de base de données et intégrations tierces.',
  details = 'MySQL, PostgreSQL, Elastic Search pour les requêtes complexes. Nous gérons la modernisation des systèmes legacy, les intégrations système et les modules autonomes pour les plus gros produits. Si vous avez un défi technique spécifique, nous sommes heureux de nous y plonger.'
WHERE service_id = 9 AND locale = 'fr';

UPDATE service_translations SET
  title = 'Conception & Gestion de Bases de Données',
  description = 'SQL, NoSQL, modélisation de données et administration. Nous concevons des bases de données qui évoluent et restent rapides.',
  details = 'De la conception de schéma à l''optimisation des performances, nous gérons la couche de données. MySQL, PostgreSQL, MongoDB, Redis. Nous choisissons en fonction de vos modèles d''accès, pas de nos préférences. Administration de bases de données, migrations et reprise après sinistre incluses.'
WHERE service_id = 10 AND locale = 'fr';

-- German (de)
UPDATE service_translations SET
  title = 'KI & Machine Learning',
  description = 'Von der Verarbeitung natürlicher Sprache bis zur Computer Vision bauen wir Systeme, die lernen und sich anpassen. Verwandeln Sie Daten in etwas Nützliches.',
  details = 'Wir bauen kundenspezifische KI-Lösungen mit TensorFlow, PyTorch und Scikit-learn. Prädiktive Modelle, Chatbots mit NLP, Bilderkennung. Wir konzentrieren uns auf KI, die echte Probleme löst, nicht Demos.'
WHERE service_id = 5 AND locale = 'de';

UPDATE service_translations SET
  title = 'Webanwendungen',
  description = 'Von internen Dashboards bis zu kundenorientierten Plattformen. SPAs, PWAs, Admin-Panels, SaaS-Produkte. Was auch immer Ihre Benutzer brauchen.',
  details = 'Wir arbeiten mit Laravel, Symfony, Drupal, WordPress, CraftCMS und modernen JavaScript-Frameworks. Wir wählen basierend auf Ihren Anforderungen, nicht unseren Vorlieben. SEO benötigt? Server-seitiges Rendering. Hohe Interaktivität? Ein modernes SPA. Einfache Bedürfnisse? Vielleicht überhaupt kein Framework.'
WHERE service_id = 6 AND locale = 'de';

UPDATE service_translations SET
  title = 'Mobile Anwendungen',
  description = 'Native iOS- und Android-Apps von Ingenieuren mit über 10 Jahren Erfahrung bei Nagarro und Enea AB. Keine Cross-Platform-Kompromisse, echte native Leistung.',
  details = 'Wir spezialisieren uns auf native Entwicklung, weil manche Apps es verlangen. IoT-Integrationen, Wearables, Zahlungssysteme, Gesundheits-Apps. Wenn Leistung und Plattformintegration wichtig sind, bauen wir nativ. Wir kümmern uns auch um App-Store-Veröffentlichung, CI/CD-Pipelines und laufende Wartung.'
WHERE service_id = 7 AND locale = 'de';

UPDATE service_translations SET
  title = 'DevOps & Cloud-Infrastruktur',
  description = 'Containerisierte Deployments, CI/CD-Pipelines und Cloud-Architektur auf AWS. Wir bauen Infrastruktur, die skaliert und sicher bleibt.',
  details = 'Docker, Kubernetes, Terraform, CircleCI, GitHub Actions. Wir richten automatisierte Deployments, Monitoring und Infrastructure as Code ein, damit Ihr Team mit Zuversicht ausliefern kann.'
WHERE service_id = 8 AND locale = 'de';

UPDATE service_translations SET
  title = 'Backend, APIs & Integrationen',
  description = 'Der Motor hinter Ihrer Anwendung. RESTful APIs, Microservices, Datenbankoptimierung und Drittanbieter-Integrationen.',
  details = 'MySQL, PostgreSQL, Elastic Search für komplexe Abfragen. Wir kümmern uns um Legacy-Modernisierung, Systemintegrationen und eigenständige Module für größere Produkte. Wenn Sie eine spezifische technische Herausforderung haben, graben wir uns gerne rein.'
WHERE service_id = 9 AND locale = 'de';

UPDATE service_translations SET
  title = 'Datenbankdesign & -verwaltung',
  description = 'SQL, NoSQL, Datenmodellierung und Administration. Wir entwerfen Datenbanken, die skalieren und schnell bleiben.',
  details = 'Von Schema-Design bis Leistungsoptimierung kümmern wir uns um die Datenschicht. MySQL, PostgreSQL, MongoDB, Redis. Wir wählen basierend auf Ihren Zugriffsmustern, nicht unseren Vorlieben. Datenbankadministration, Migrationen und Disaster Recovery inklusive.'
WHERE service_id = 10 AND locale = 'de';

-- Italian (it)
UPDATE service_translations SET
  title = 'AI & Machine Learning',
  description = 'Dall''elaborazione del linguaggio naturale alla computer vision, costruiamo sistemi che imparano e si adattano. Trasforma i dati in qualcosa di utile.',
  details = 'Costruiamo soluzioni AI personalizzate usando TensorFlow, PyTorch e Scikit-learn. Modelli predittivi, chatbot con NLP, riconoscimento immagini. Ci concentriamo su AI che risolve problemi reali, non demo.'
WHERE service_id = 5 AND locale = 'it';

UPDATE service_translations SET
  title = 'Applicazioni Web',
  description = 'Da dashboard interni a piattaforme per clienti. SPA, PWA, pannelli admin, prodotti SaaS. Qualsiasi cosa di cui i tuoi utenti hanno bisogno.',
  details = 'Lavoriamo con Laravel, Symfony, Drupal, WordPress, CraftCMS e framework JavaScript moderni. Scegliamo in base alle tue esigenze, non alle nostre preferenze. Hai bisogno di SEO? Rendering lato server. Alta interattività? Una SPA moderna. Esigenze semplici? Forse nessun framework.'
WHERE service_id = 6 AND locale = 'it';

UPDATE service_translations SET
  title = 'Applicazioni Mobile',
  description = 'App native iOS e Android costruite da ingegneri con oltre 10 anni presso Nagarro ed Enea AB. Non compromessi cross-platform, prestazioni native reali.',
  details = 'Ci specializziamo nello sviluppo nativo perché alcune app lo richiedono. Integrazioni IoT, wearables, sistemi di pagamento, app sanitarie. Quando prestazioni e integrazione della piattaforma contano, costruiamo nativo. Gestiamo anche la pubblicazione sugli app store, pipeline CI/CD e manutenzione continua.'
WHERE service_id = 7 AND locale = 'it';

UPDATE service_translations SET
  title = 'DevOps & Infrastruttura Cloud',
  description = 'Deployment containerizzati, pipeline CI/CD e architettura cloud su AWS. Costruiamo infrastrutture che scalano e rimangono sicure.',
  details = 'Docker, Kubernetes, Terraform, CircleCI, GitHub Actions. Configuriamo deployment automatizzati, monitoraggio e infrastructure as code così il tuo team può distribuire con fiducia.'
WHERE service_id = 8 AND locale = 'it';

UPDATE service_translations SET
  title = 'Backend, API & Integrazioni',
  description = 'Il motore dietro la tua applicazione. API RESTful, microservizi, ottimizzazione database e integrazioni di terze parti.',
  details = 'MySQL, PostgreSQL, Elastic Search per query complesse. Gestiamo modernizzazione di sistemi legacy, integrazioni di sistema e moduli standalone per prodotti più grandi. Se hai una sfida tecnica specifica, siamo felici di approfondire.'
WHERE service_id = 9 AND locale = 'it';

UPDATE service_translations SET
  title = 'Progettazione & Gestione Database',
  description = 'SQL, NoSQL, modellazione dati e amministrazione. Progettiamo database che scalano e rimangono veloci.',
  details = 'Dalla progettazione dello schema all''ottimizzazione delle prestazioni, gestiamo il livello dati. MySQL, PostgreSQL, MongoDB, Redis. Scegliamo in base ai tuoi pattern di accesso, non alle nostre preferenze. Amministrazione database, migrazioni e disaster recovery inclusi.'
WHERE service_id = 10 AND locale = 'it';

-- Spanish (es)
UPDATE service_translations SET
  title = 'IA & Machine Learning',
  description = 'Desde procesamiento de lenguaje natural hasta visión por computadora, construimos sistemas que aprenden y se adaptan. Convierte datos en algo útil.',
  details = 'Construimos soluciones de IA personalizadas usando TensorFlow, PyTorch y Scikit-learn. Modelos predictivos, chatbots con NLP, reconocimiento de imágenes. Nos enfocamos en IA que resuelve problemas reales, no demos.'
WHERE service_id = 5 AND locale = 'es';

UPDATE service_translations SET
  title = 'Aplicaciones Web',
  description = 'Desde dashboards internos hasta plataformas para clientes. SPAs, PWAs, paneles de administración, productos SaaS. Lo que tus usuarios necesiten.',
  details = 'Trabajamos con Laravel, Symfony, Drupal, WordPress, CraftCMS y frameworks JavaScript modernos. Elegimos basándonos en tus requisitos, no en nuestras preferencias. ¿Necesitas SEO? Renderizado del lado del servidor. ¿Alta interactividad? Una SPA moderna. ¿Necesidades simples? Quizás ningún framework.'
WHERE service_id = 6 AND locale = 'es';

UPDATE service_translations SET
  title = 'Aplicaciones Móviles',
  description = 'Apps nativas iOS y Android construidas por ingenieros con más de 10 años en Nagarro y Enea AB. Sin compromisos cross-platform, rendimiento nativo real.',
  details = 'Nos especializamos en desarrollo nativo porque algunas apps lo exigen. Integraciones IoT, wearables, sistemas de pago, apps de salud. Cuando el rendimiento y la integración de plataforma importan, construimos nativo. También manejamos publicación en app stores, pipelines CI/CD y mantenimiento continuo.'
WHERE service_id = 7 AND locale = 'es';

UPDATE service_translations SET
  title = 'DevOps & Infraestructura Cloud',
  description = 'Deployments containerizados, pipelines CI/CD y arquitectura cloud en AWS. Construimos infraestructura que escala y permanece segura.',
  details = 'Docker, Kubernetes, Terraform, CircleCI, GitHub Actions. Configuramos deployments automatizados, monitoreo e infraestructura como código para que tu equipo pueda entregar con confianza.'
WHERE service_id = 8 AND locale = 'es';

UPDATE service_translations SET
  title = 'Backend, APIs e Integraciones',
  description = 'El motor detrás de tu aplicación. APIs RESTful, microservicios, optimización de bases de datos e integraciones de terceros.',
  details = 'MySQL, PostgreSQL, Elastic Search para consultas complejas. Manejamos modernización de sistemas legacy, integraciones de sistemas y módulos independientes para productos más grandes. Si tienes un desafío técnico específico, estaremos encantados de profundizar.'
WHERE service_id = 9 AND locale = 'es';

UPDATE service_translations SET
  title = 'Diseño y Gestión de Bases de Datos',
  description = 'SQL, NoSQL, modelado de datos y administración. Diseñamos bases de datos que escalan y permanecen rápidas.',
  details = 'Desde diseño de esquemas hasta optimización de rendimiento, manejamos la capa de datos. MySQL, PostgreSQL, MongoDB, Redis. Elegimos basándonos en tus patrones de acceso, no en nuestras preferencias. Administración de bases de datos, migraciones y recuperación ante desastres incluidos.'
WHERE service_id = 10 AND locale = 'es';

-- ============================================================
-- SUBSERVICE TRANSLATIONS (Professional Services: 1-18)
-- ============================================================

-- Romanian (ro)
UPDATE subservice_translations SET
  title = 'Revizuire Arhitectură',
  description = 'Evaluarea arhitecturii tale actuale cu recomandări pentru scalabilitate, securitate și mentenabilitate.'
WHERE subservice_id = 1 AND locale = 'ro';

UPDATE subservice_translations SET
  title = 'Selecție Tehnologie',
  description = 'Ghidare imparțială în alegerea tehnologiilor potrivite pentru cerințele și constrângerile tale specifice.'
WHERE subservice_id = 2 AND locale = 'ro';

UPDATE subservice_translations SET
  title = 'Revizuire Cod',
  description = 'Revizuire expertă a bazei tale de cod concentrată pe best practices, vulnerabilități de securitate și probleme de performanță.'
WHERE subservice_id = 3 AND locale = 'ro';

UPDATE subservice_translations SET
  title = 'Strategie DevSecOps',
  description = 'Integrarea securității în procesul tău de dezvoltare. Shifting left fără a încetini.'
WHERE subservice_id = 4 AND locale = 'ro';

UPDATE subservice_translations SET
  title = 'Testare de Penetrare',
  description = 'Testare manuală și automatizată de vulnerabilități pentru aplicații web, API-uri și infrastructură. Aceleași tehnici pe care le-am folosit la EA, acum pentru aplicațiile tale.'
WHERE subservice_id = 5 AND locale = 'ro';

UPDATE subservice_translations SET
  title = 'Audituri de Securitate',
  description = 'Revizuiri de cod și evaluări de arhitectură pentru a găsi vulnerabilități înainte ca atacatorii să o facă. Am revizuit binare de jocuri și platforme enterprise.'
WHERE subservice_id = 6 AND locale = 'ro';

UPDATE subservice_translations SET
  title = 'Securitate Cloud',
  description = 'Revizuiri de configurație AWS, politici IAM, segmentare rețea, gestionare secrete. Lucrurile plictisitoare care previn breșele.'
WHERE subservice_id = 7 AND locale = 'ro';

UPDATE subservice_translations SET
  title = 'Protecție DDoS & Bot',
  description = 'Implementare și acordare Akamai și Cloudflare. Credential stuffing, scraping, DDoS, prevenire account takeover. Certificat Akamai.'
WHERE subservice_id = 8 AND locale = 'ro';

UPDATE subservice_translations SET
  title = 'Răspuns la Incidente',
  description = 'Evaluare rapidă, izolare și recuperare când apar breșele. Analiză post-incident și consolidare securitate.'
WHERE subservice_id = 9 AND locale = 'ro';

UPDATE subservice_translations SET
  title = 'Implementare Zero Trust',
  description = 'Autentificare multi-factor, controale de acces și monitorizare continuă. Fiecare utilizator și dispozitiv verificat înainte de acordarea accesului.'
WHERE subservice_id = 10 AND locale = 'ro';

UPDATE subservice_translations SET
  title = 'Design Dashboard',
  description = 'Date prezentate în grafice și vizualizări pe care oricine le poate înțelege. Numere care spun o poveste.'
WHERE subservice_id = 11 AND locale = 'ro';

UPDATE subservice_translations SET
  title = 'Urmărire Performanță',
  description = 'Urmărire precisă cu metricile potrivite pentru situația ta. Fără date de gunoi.'
WHERE subservice_id = 12 AND locale = 'ro';

UPDATE subservice_translations SET
  title = 'Analiză Competitivă',
  description = 'Vezi cum se comportă utilizatorii, ce preferă și cum te compari cu competitorii.'
WHERE subservice_id = 13 AND locale = 'ro';

UPDATE subservice_translations SET
  title = 'Monitorizare în Timp Real',
  description = 'Date live când ai nevoie, chiar la volum mare.'
WHERE subservice_id = 14 AND locale = 'ro';

UPDATE subservice_translations SET
  title = 'Testare Manuală',
  description = 'Testare hands-on care prinde probleme UX, cazuri limită și scenarii din lumea reală pe care testele automate le pierd.'
WHERE subservice_id = 15 AND locale = 'ro';

UPDATE subservice_translations SET
  title = 'Testare Automatizată',
  description = 'Selenium, Appium și suite de teste personalizate pentru testare de regresie rapidă și repetabilă între build-uri.'
WHERE subservice_id = 16 AND locale = 'ro';

UPDATE subservice_translations SET
  title = 'Testare de Performanță',
  description = 'Testare de încărcare, testare de stres și identificare bottleneck. Cunoaște-ți limitele înainte ca utilizatorii să le găsească.'
WHERE subservice_id = 17 AND locale = 'ro';

UPDATE subservice_translations SET
  title = 'Testare de Securitate',
  description = 'Scanare de vulnerabilități, testare de penetrare și evaluare de risc integrate în ciclul tău de dezvoltare.'
WHERE subservice_id = 18 AND locale = 'ro';

-- French (fr)
UPDATE subservice_translations SET
  title = 'Revue d''Architecture',
  description = 'Évaluation de votre architecture actuelle avec des recommandations pour la scalabilité, la sécurité et la maintenabilité.'
WHERE subservice_id = 1 AND locale = 'fr';

UPDATE subservice_translations SET
  title = 'Sélection de Technologies',
  description = 'Conseils impartiaux sur le choix des bonnes technologies pour vos besoins et contraintes spécifiques.'
WHERE subservice_id = 2 AND locale = 'fr';

UPDATE subservice_translations SET
  title = 'Revue de Code',
  description = 'Revue experte de votre base de code axée sur les meilleures pratiques, les vulnérabilités de sécurité et les problèmes de performance.'
WHERE subservice_id = 3 AND locale = 'fr';

UPDATE subservice_translations SET
  title = 'Stratégie DevSecOps',
  description = 'Intégration de la sécurité dans votre processus de développement. Shifting left sans ralentir.'
WHERE subservice_id = 4 AND locale = 'fr';

UPDATE subservice_translations SET
  title = 'Tests de Pénétration',
  description = 'Tests de vulnérabilité manuels et automatisés sur les applications web, APIs et infrastructure. Les mêmes techniques utilisées chez EA, maintenant pour vos applications.'
WHERE subservice_id = 5 AND locale = 'fr';

UPDATE subservice_translations SET
  title = 'Audits de Sécurité',
  description = 'Revues de code et évaluations d''architecture pour trouver les vulnérabilités avant les attaquants. Nous avons examiné des binaires de jeux et des plateformes entreprise.'
WHERE subservice_id = 6 AND locale = 'fr';

UPDATE subservice_translations SET
  title = 'Sécurité Cloud',
  description = 'Revues de configuration AWS, politiques IAM, segmentation réseau, gestion des secrets. Les choses ennuyeuses qui préviennent les violations.'
WHERE subservice_id = 7 AND locale = 'fr';

UPDATE subservice_translations SET
  title = 'Protection DDoS & Bot',
  description = 'Implémentation et réglage des défenses Akamai et Cloudflare. Credential stuffing, scraping, DDoS, prévention de prise de compte. Certifié Akamai.'
WHERE subservice_id = 8 AND locale = 'fr';

UPDATE subservice_translations SET
  title = 'Réponse aux Incidents',
  description = 'Évaluation rapide, confinement et récupération lors de violations. Analyse post-incident et renforcement de la sécurité.'
WHERE subservice_id = 9 AND locale = 'fr';

UPDATE subservice_translations SET
  title = 'Implémentation Zero Trust',
  description = 'Authentification multi-facteurs, contrôles d''accès et surveillance continue. Chaque utilisateur et appareil vérifié avant l''accès.'
WHERE subservice_id = 10 AND locale = 'fr';

UPDATE subservice_translations SET
  title = 'Conception de Tableaux de Bord',
  description = 'Données présentées dans des graphiques et visualisations que tout le monde peut comprendre. Des chiffres qui racontent une histoire.'
WHERE subservice_id = 11 AND locale = 'fr';

UPDATE subservice_translations SET
  title = 'Suivi de Performance',
  description = 'Suivi précis avec les bonnes métriques pour votre situation. Pas de données poubelles.'
WHERE subservice_id = 12 AND locale = 'fr';

UPDATE subservice_translations SET
  title = 'Analyse Concurrentielle',
  description = 'Voyez comment les utilisateurs se comportent, ce qu''ils préfèrent et comment vous vous comparez aux concurrents.'
WHERE subservice_id = 13 AND locale = 'fr';

UPDATE subservice_translations SET
  title = 'Surveillance en Temps Réel',
  description = 'Données en direct quand vous en avez besoin, même à haut volume.'
WHERE subservice_id = 14 AND locale = 'fr';

UPDATE subservice_translations SET
  title = 'Tests Manuels',
  description = 'Tests pratiques qui détectent les problèmes UX, les cas limites et les scénarios réels que les tests automatisés manquent.'
WHERE subservice_id = 15 AND locale = 'fr';

UPDATE subservice_translations SET
  title = 'Tests Automatisés',
  description = 'Selenium, Appium et suites de tests personnalisées pour des tests de régression rapides et répétables entre les builds.'
WHERE subservice_id = 16 AND locale = 'fr';

UPDATE subservice_translations SET
  title = 'Tests de Performance',
  description = 'Tests de charge, tests de stress et identification des goulots d''étranglement. Connaissez vos limites avant que vos utilisateurs ne les trouvent.'
WHERE subservice_id = 17 AND locale = 'fr';

UPDATE subservice_translations SET
  title = 'Tests de Sécurité',
  description = 'Analyse de vulnérabilités, tests de pénétration et évaluation des risques intégrés à votre cycle de développement.'
WHERE subservice_id = 18 AND locale = 'fr';

-- German (de)
UPDATE subservice_translations SET
  title = 'Architektur-Review',
  description = 'Bewertung Ihrer aktuellen Architektur mit Empfehlungen für Skalierbarkeit, Sicherheit und Wartbarkeit.'
WHERE subservice_id = 1 AND locale = 'de';

UPDATE subservice_translations SET
  title = 'Technologieauswahl',
  description = 'Unvoreingenommene Beratung bei der Auswahl der richtigen Technologien für Ihre spezifischen Anforderungen und Einschränkungen.'
WHERE subservice_id = 2 AND locale = 'de';

UPDATE subservice_translations SET
  title = 'Code-Review',
  description = 'Experten-Review Ihrer Codebasis mit Fokus auf Best Practices, Sicherheitslücken und Performance-Probleme.'
WHERE subservice_id = 3 AND locale = 'de';

UPDATE subservice_translations SET
  title = 'DevSecOps-Strategie',
  description = 'Integration von Sicherheit in Ihren Entwicklungsprozess. Shifting left ohne zu verlangsamen.'
WHERE subservice_id = 4 AND locale = 'de';

UPDATE subservice_translations SET
  title = 'Penetrationstests',
  description = 'Manuelle und automatisierte Schwachstellentests für Webanwendungen, APIs und Infrastruktur. Die gleichen Techniken, die wir bei EA verwendet haben, jetzt für Ihre Anwendungen.'
WHERE subservice_id = 5 AND locale = 'de';

UPDATE subservice_translations SET
  title = 'Sicherheitsaudits',
  description = 'Code-Reviews und Architekturbewertungen, um Schwachstellen zu finden, bevor Angreifer es tun. Wir haben Spiel-Binaries und Enterprise-Plattformen überprüft.'
WHERE subservice_id = 6 AND locale = 'de';

UPDATE subservice_translations SET
  title = 'Cloud-Sicherheit',
  description = 'AWS-Konfigurationsprüfungen, IAM-Richtlinien, Netzwerksegmentierung, Secrets-Management. Die langweiligen Dinge, die Verletzungen verhindern.'
WHERE subservice_id = 7 AND locale = 'de';

UPDATE subservice_translations SET
  title = 'DDoS- & Bot-Schutz',
  description = 'Implementierung und Tuning von Akamai- und Cloudflare-Abwehrmaßnahmen. Credential Stuffing, Scraping, DDoS, Konto-Übernahme-Prävention. Akamai-zertifiziert.'
WHERE subservice_id = 8 AND locale = 'de';

UPDATE subservice_translations SET
  title = 'Incident Response',
  description = 'Schnelle Bewertung, Eindämmung und Wiederherstellung bei Sicherheitsverletzungen. Post-Incident-Analyse und Sicherheitshärtung.'
WHERE subservice_id = 9 AND locale = 'de';

UPDATE subservice_translations SET
  title = 'Zero-Trust-Implementierung',
  description = 'Multi-Faktor-Authentifizierung, Zugriffskontrollen und kontinuierliche Überwachung. Jeder Benutzer und jedes Gerät wird vor dem Zugriff verifiziert.'
WHERE subservice_id = 10 AND locale = 'de';

UPDATE subservice_translations SET
  title = 'Dashboard-Design',
  description = 'Daten präsentiert in Diagrammen und Visualisierungen, die jeder verstehen kann. Zahlen, die eine Geschichte erzählen.'
WHERE subservice_id = 11 AND locale = 'de';

UPDATE subservice_translations SET
  title = 'Performance-Tracking',
  description = 'Präzises Tracking mit den richtigen Metriken für Ihre Situation. Keine Mülldaten.'
WHERE subservice_id = 12 AND locale = 'de';

UPDATE subservice_translations SET
  title = 'Wettbewerbsanalyse',
  description = 'Sehen Sie, wie sich Benutzer verhalten, was sie bevorzugen und wie Sie im Vergleich zu Wettbewerbern abschneiden.'
WHERE subservice_id = 13 AND locale = 'de';

UPDATE subservice_translations SET
  title = 'Echtzeit-Überwachung',
  description = 'Live-Daten, wenn Sie sie brauchen, auch bei hohem Volumen.'
WHERE subservice_id = 14 AND locale = 'de';

UPDATE subservice_translations SET
  title = 'Manuelles Testen',
  description = 'Praktisches Testen, das UX-Probleme, Grenzfälle und reale Szenarien erkennt, die automatisierte Tests übersehen.'
WHERE subservice_id = 15 AND locale = 'de';

UPDATE subservice_translations SET
  title = 'Automatisiertes Testen',
  description = 'Selenium, Appium und kundenspezifische Testsuiten für schnelle, wiederholbare Regressionstests über Builds hinweg.'
WHERE subservice_id = 16 AND locale = 'de';

UPDATE subservice_translations SET
  title = 'Performance-Tests',
  description = 'Lasttests, Stresstests und Engpass-Identifikation. Kennen Sie Ihre Grenzen, bevor Ihre Benutzer sie finden.'
WHERE subservice_id = 17 AND locale = 'de';

UPDATE subservice_translations SET
  title = 'Sicherheitstests',
  description = 'Schwachstellenscanning, Penetrationstests und Risikobewertung in Ihren Entwicklungszyklus integriert.'
WHERE subservice_id = 18 AND locale = 'de';

-- Italian (it)
UPDATE subservice_translations SET
  title = 'Revisione Architettura',
  description = 'Valutazione della tua architettura attuale con raccomandazioni per scalabilità, sicurezza e manutenibilità.'
WHERE subservice_id = 1 AND locale = 'it';

UPDATE subservice_translations SET
  title = 'Selezione Tecnologie',
  description = 'Guida imparziale nella scelta delle tecnologie giuste per i tuoi requisiti e vincoli specifici.'
WHERE subservice_id = 2 AND locale = 'it';

UPDATE subservice_translations SET
  title = 'Revisione Codice',
  description = 'Revisione esperta della tua codebase focalizzata su best practice, vulnerabilità di sicurezza e problemi di performance.'
WHERE subservice_id = 3 AND locale = 'it';

UPDATE subservice_translations SET
  title = 'Strategia DevSecOps',
  description = 'Integrazione della sicurezza nel tuo processo di sviluppo. Shifting left senza rallentare.'
WHERE subservice_id = 4 AND locale = 'it';

UPDATE subservice_translations SET
  title = 'Penetration Testing',
  description = 'Test di vulnerabilità manuali e automatizzati su applicazioni web, API e infrastruttura. Le stesse tecniche usate in EA, ora per le tue applicazioni.'
WHERE subservice_id = 5 AND locale = 'it';

UPDATE subservice_translations SET
  title = 'Audit di Sicurezza',
  description = 'Revisioni del codice e valutazioni dell''architettura per trovare vulnerabilità prima degli attaccanti. Abbiamo revisionato binari di giochi e piattaforme enterprise.'
WHERE subservice_id = 6 AND locale = 'it';

UPDATE subservice_translations SET
  title = 'Sicurezza Cloud',
  description = 'Revisioni configurazione AWS, policy IAM, segmentazione rete, gestione secrets. Le cose noiose che prevengono le violazioni.'
WHERE subservice_id = 7 AND locale = 'it';

UPDATE subservice_translations SET
  title = 'Protezione DDoS & Bot',
  description = 'Implementazione e tuning delle difese Akamai e Cloudflare. Credential stuffing, scraping, DDoS, prevenzione account takeover. Certificato Akamai.'
WHERE subservice_id = 8 AND locale = 'it';

UPDATE subservice_translations SET
  title = 'Risposta agli Incidenti',
  description = 'Valutazione rapida, contenimento e recupero quando si verificano violazioni. Analisi post-incidente e hardening della sicurezza.'
WHERE subservice_id = 9 AND locale = 'it';

UPDATE subservice_translations SET
  title = 'Implementazione Zero Trust',
  description = 'Autenticazione multi-fattore, controlli di accesso e monitoraggio continuo. Ogni utente e dispositivo verificato prima dell''accesso.'
WHERE subservice_id = 10 AND locale = 'it';

UPDATE subservice_translations SET
  title = 'Design Dashboard',
  description = 'Dati presentati in grafici e visualizzazioni che chiunque può capire. Numeri che raccontano una storia.'
WHERE subservice_id = 11 AND locale = 'it';

UPDATE subservice_translations SET
  title = 'Tracking Prestazioni',
  description = 'Tracking accurato con le metriche giuste per la tua situazione. Niente dati spazzatura.'
WHERE subservice_id = 12 AND locale = 'it';

UPDATE subservice_translations SET
  title = 'Analisi Competitiva',
  description = 'Vedi come si comportano gli utenti, cosa preferiscono e come ti confronti con i concorrenti.'
WHERE subservice_id = 13 AND locale = 'it';

UPDATE subservice_translations SET
  title = 'Monitoraggio in Tempo Reale',
  description = 'Dati live quando ne hai bisogno, anche ad alto volume.'
WHERE subservice_id = 14 AND locale = 'it';

UPDATE subservice_translations SET
  title = 'Testing Manuale',
  description = 'Testing pratico che individua problemi UX, casi limite e scenari reali che i test automatizzati perdono.'
WHERE subservice_id = 15 AND locale = 'it';

UPDATE subservice_translations SET
  title = 'Testing Automatizzato',
  description = 'Selenium, Appium e suite di test personalizzate per test di regressione veloci e ripetibili tra le build.'
WHERE subservice_id = 16 AND locale = 'it';

UPDATE subservice_translations SET
  title = 'Testing Prestazioni',
  description = 'Load testing, stress testing e identificazione dei colli di bottiglia. Conosci i tuoi limiti prima che li trovino i tuoi utenti.'
WHERE subservice_id = 17 AND locale = 'it';

UPDATE subservice_translations SET
  title = 'Testing Sicurezza',
  description = 'Scansione vulnerabilità, penetration testing e valutazione del rischio integrati nel tuo ciclo di sviluppo.'
WHERE subservice_id = 18 AND locale = 'it';

-- Spanish (es)
UPDATE subservice_translations SET
  title = 'Revisión de Arquitectura',
  description = 'Evaluación de tu arquitectura actual con recomendaciones para escalabilidad, seguridad y mantenibilidad.'
WHERE subservice_id = 1 AND locale = 'es';

UPDATE subservice_translations SET
  title = 'Selección de Tecnología',
  description = 'Orientación imparcial para elegir las tecnologías adecuadas para tus requisitos y restricciones específicas.'
WHERE subservice_id = 2 AND locale = 'es';

UPDATE subservice_translations SET
  title = 'Revisión de Código',
  description = 'Revisión experta de tu código enfocada en mejores prácticas, vulnerabilidades de seguridad y problemas de rendimiento.'
WHERE subservice_id = 3 AND locale = 'es';

UPDATE subservice_translations SET
  title = 'Estrategia DevSecOps',
  description = 'Integrando seguridad en tu proceso de desarrollo. Shifting left sin ralentizar.'
WHERE subservice_id = 4 AND locale = 'es';

UPDATE subservice_translations SET
  title = 'Pruebas de Penetración',
  description = 'Pruebas de vulnerabilidad manuales y automatizadas en aplicaciones web, APIs e infraestructura. Las mismas técnicas que usamos en EA, ahora para tus aplicaciones.'
WHERE subservice_id = 5 AND locale = 'es';

UPDATE subservice_translations SET
  title = 'Auditorías de Seguridad',
  description = 'Revisiones de código y evaluaciones de arquitectura para encontrar vulnerabilidades antes que los atacantes. Hemos revisado binarios de juegos y plataformas enterprise.'
WHERE subservice_id = 6 AND locale = 'es';

UPDATE subservice_translations SET
  title = 'Seguridad Cloud',
  description = 'Revisiones de configuración AWS, políticas IAM, segmentación de red, gestión de secretos. Las cosas aburridas que previenen violaciones.'
WHERE subservice_id = 7 AND locale = 'es';

UPDATE subservice_translations SET
  title = 'Protección DDoS & Bot',
  description = 'Implementación y ajuste de defensas Akamai y Cloudflare. Credential stuffing, scraping, DDoS, prevención de robo de cuentas. Certificado Akamai.'
WHERE subservice_id = 8 AND locale = 'es';

UPDATE subservice_translations SET
  title = 'Respuesta a Incidentes',
  description = 'Evaluación rápida, contención y recuperación cuando ocurren violaciones. Análisis post-incidente y fortalecimiento de seguridad.'
WHERE subservice_id = 9 AND locale = 'es';

UPDATE subservice_translations SET
  title = 'Implementación Zero Trust',
  description = 'Autenticación multi-factor, controles de acceso y monitoreo continuo. Cada usuario y dispositivo verificado antes de otorgar acceso.'
WHERE subservice_id = 10 AND locale = 'es';

UPDATE subservice_translations SET
  title = 'Diseño de Dashboards',
  description = 'Datos presentados en gráficos y visualizaciones que cualquiera puede entender. Números que cuentan una historia.'
WHERE subservice_id = 11 AND locale = 'es';

UPDATE subservice_translations SET
  title = 'Seguimiento de Rendimiento',
  description = 'Seguimiento preciso con las métricas correctas para tu situación. Sin datos basura.'
WHERE subservice_id = 12 AND locale = 'es';

UPDATE subservice_translations SET
  title = 'Análisis Competitivo',
  description = 'Ve cómo se comportan los usuarios, qué prefieren y cómo te comparas con los competidores.'
WHERE subservice_id = 13 AND locale = 'es';

UPDATE subservice_translations SET
  title = 'Monitoreo en Tiempo Real',
  description = 'Datos en vivo cuando los necesitas, incluso a alto volumen.'
WHERE subservice_id = 14 AND locale = 'es';

UPDATE subservice_translations SET
  title = 'Testing Manual',
  description = 'Testing práctico que detecta problemas de UX, casos límite y escenarios del mundo real que los tests automatizados pierden.'
WHERE subservice_id = 15 AND locale = 'es';

UPDATE subservice_translations SET
  title = 'Testing Automatizado',
  description = 'Selenium, Appium y suites de tests personalizadas para testing de regresión rápido y repetible entre builds.'
WHERE subservice_id = 16 AND locale = 'es';

UPDATE subservice_translations SET
  title = 'Testing de Rendimiento',
  description = 'Load testing, stress testing e identificación de cuellos de botella. Conoce tus límites antes de que tus usuarios los encuentren.'
WHERE subservice_id = 17 AND locale = 'es';

UPDATE subservice_translations SET
  title = 'Testing de Seguridad',
  description = 'Escaneo de vulnerabilidades, pruebas de penetración y evaluación de riesgos integrados en tu ciclo de desarrollo.'
WHERE subservice_id = 18 AND locale = 'es';

-- ============================================================
-- SUBSERVICE TRANSLATIONS (Development Services: 19-30)
-- ============================================================

-- Romanian (ro)
UPDATE subservice_translations SET
  title = 'Procesarea Limbajului Natural',
  description = 'Chatboți, analiză de sentiment, clasificare text și traducere automată. Fă aplicațiile tale să înțeleagă și să răspundă limbajului uman.'
WHERE subservice_id = 19 AND locale = 'ro';

UPDATE subservice_translations SET
  title = 'Computer Vision',
  description = 'Recunoaștere de imagini, detecție de obiecte și analiză video. De la controlul calității la monitorizarea securității.'
WHERE subservice_id = 20 AND locale = 'ro';

UPDATE subservice_translations SET
  title = 'Deep Learning',
  description = 'Rețele neuronale pentru recunoaștere complexă de pattern-uri. Când algoritmii tradiționali nu sunt suficienți.'
WHERE subservice_id = 21 AND locale = 'ro';

UPDATE subservice_translations SET
  title = 'Analize Predictive',
  description = 'Modele de machine learning care prognozează tendințe, detectează anomalii și optimizează decizii bazate pe date istorice.'
WHERE subservice_id = 22 AND locale = 'ro';

UPDATE subservice_translations SET
  title = 'iOS & Android Nativ',
  description = 'Aplicații cu adevărat native cu integrare completă a platformei. Nu React Native sau Flutter. Când aplicația ta trebuie să se simtă ca acasă pe dispozitiv.'
WHERE subservice_id = 23 AND locale = 'ro';

UPDATE subservice_translations SET
  title = 'IoT & Wearables',
  description = 'Aplicații pentru dispozitive conectate, integrări Fitbit și SDK-uri hardware. Experiență în livrarea produselor IoT la Enea AB.'
WHERE subservice_id = 24 AND locale = 'ro';

UPDATE subservice_translations SET
  title = 'Plăți & E-commerce',
  description = 'Stripe, Shopify și integrări de plăți personalizate. Tranzacții securizate care respectă cerințele de conformitate.'
WHERE subservice_id = 25 AND locale = 'ro';

UPDATE subservice_translations SET
  title = 'Sănătate & Farma',
  description = 'Aplicații pentru industria veterinară, nutriție și farmaceutică. Înțelegerea cerințelor de reglementare și sensibilitatea datelor.'
WHERE subservice_id = 26 AND locale = 'ro';

UPDATE subservice_translations SET
  title = 'Baze de Date SQL',
  description = 'Design, optimizare și management de baze de date relaționale. MySQL, PostgreSQL și soluții enterprise.'
WHERE subservice_id = 27 AND locale = 'ro';

UPDATE subservice_translations SET
  title = 'Soluții NoSQL',
  description = 'Document stores, baze de date key-value și graph databases pentru date de mare viteză și nestructurate.'
WHERE subservice_id = 28 AND locale = 'ro';

UPDATE subservice_translations SET
  title = 'Modelare Date',
  description = 'Design de schemă care suportă query-urile tale și scalează cu creșterea ta. Punând fundația corectă.'
WHERE subservice_id = 29 AND locale = 'ro';

UPDATE subservice_translations SET
  title = 'Administrare Baze de Date',
  description = 'Strategii de backup, tuning de performanță, securizare și planificare disaster recovery.'
WHERE subservice_id = 30 AND locale = 'ro';

-- French (fr)
UPDATE subservice_translations SET
  title = 'Traitement du Langage Naturel',
  description = 'Chatbots, analyse de sentiment, classification de texte et traduction automatique. Faites comprendre et répondre vos applications au langage humain.'
WHERE subservice_id = 19 AND locale = 'fr';

UPDATE subservice_translations SET
  title = 'Vision par Ordinateur',
  description = 'Reconnaissance d''images, détection d''objets et analyse vidéo. Du contrôle qualité à la surveillance de sécurité.'
WHERE subservice_id = 20 AND locale = 'fr';

UPDATE subservice_translations SET
  title = 'Deep Learning',
  description = 'Réseaux de neurones pour la reconnaissance de patterns complexes. Quand les algorithmes traditionnels ne suffisent pas.'
WHERE subservice_id = 21 AND locale = 'fr';

UPDATE subservice_translations SET
  title = 'Analytique Prédictive',
  description = 'Modèles de machine learning qui prévoient les tendances, détectent les anomalies et optimisent les décisions basées sur les données historiques.'
WHERE subservice_id = 22 AND locale = 'fr';

UPDATE subservice_translations SET
  title = 'iOS & Android Natif',
  description = 'De vraies applications natives avec intégration complète de la plateforme. Pas React Native ou Flutter. Quand votre application doit se sentir chez elle sur l''appareil.'
WHERE subservice_id = 23 AND locale = 'fr';

UPDATE subservice_translations SET
  title = 'IoT & Wearables',
  description = 'Applications pour appareils connectés, intégrations Fitbit et SDKs matériels. Expérience dans la livraison de produits IoT chez Enea AB.'
WHERE subservice_id = 24 AND locale = 'fr';

UPDATE subservice_translations SET
  title = 'Paiement & E-commerce',
  description = 'Stripe, Shopify et intégrations de paiement personnalisées. Transactions sécurisées conformes aux exigences.'
WHERE subservice_id = 25 AND locale = 'fr';

UPDATE subservice_translations SET
  title = 'Santé & Pharma',
  description = 'Applications pour les industries vétérinaire, nutrition et pharmaceutique. Compréhension des exigences réglementaires et de la sensibilité des données.'
WHERE subservice_id = 26 AND locale = 'fr';

UPDATE subservice_translations SET
  title = 'Bases de Données SQL',
  description = 'Conception, optimisation et gestion de bases de données relationnelles. MySQL, PostgreSQL et solutions entreprise.'
WHERE subservice_id = 27 AND locale = 'fr';

UPDATE subservice_translations SET
  title = 'Solutions NoSQL',
  description = 'Bases documentaires, bases clé-valeur et bases graphes pour données haute vélocité et non structurées.'
WHERE subservice_id = 28 AND locale = 'fr';

UPDATE subservice_translations SET
  title = 'Modélisation de Données',
  description = 'Conception de schéma qui supporte vos requêtes et évolue avec votre croissance. Poser les bonnes fondations.'
WHERE subservice_id = 29 AND locale = 'fr';

UPDATE subservice_translations SET
  title = 'Administration de Bases de Données',
  description = 'Stratégies de sauvegarde, optimisation des performances, renforcement de la sécurité et planification de reprise après sinistre.'
WHERE subservice_id = 30 AND locale = 'fr';

-- German (de)
UPDATE subservice_translations SET
  title = 'Natürliche Sprachverarbeitung',
  description = 'Chatbots, Sentiment-Analyse, Textklassifizierung und maschinelle Übersetzung. Lassen Sie Ihre Anwendungen menschliche Sprache verstehen und darauf reagieren.'
WHERE subservice_id = 19 AND locale = 'de';

UPDATE subservice_translations SET
  title = 'Computer Vision',
  description = 'Bilderkennung, Objekterkennung und Videoanalyse. Von der Qualitätskontrolle bis zur Sicherheitsüberwachung.'
WHERE subservice_id = 20 AND locale = 'de';

UPDATE subservice_translations SET
  title = 'Deep Learning',
  description = 'Neuronale Netze für komplexe Mustererkennung. Wenn traditionelle Algorithmen nicht ausreichen.'
WHERE subservice_id = 21 AND locale = 'de';

UPDATE subservice_translations SET
  title = 'Prädiktive Analytik',
  description = 'Machine-Learning-Modelle, die Trends vorhersagen, Anomalien erkennen und Entscheidungen basierend auf historischen Daten optimieren.'
WHERE subservice_id = 22 AND locale = 'de';

UPDATE subservice_translations SET
  title = 'Natives iOS & Android',
  description = 'Echte native Apps mit vollständiger Plattformintegration. Nicht React Native oder Flutter. Wenn sich Ihre App auf dem Gerät heimisch anfühlen muss.'
WHERE subservice_id = 23 AND locale = 'de';

UPDATE subservice_translations SET
  title = 'IoT & Wearables',
  description = 'Apps für vernetzte Geräte, Fitbit-Integrationen und Hardware-SDKs. Erfahrung in der Lieferung von IoT-Produkten bei Enea AB.'
WHERE subservice_id = 24 AND locale = 'de';

UPDATE subservice_translations SET
  title = 'Zahlung & E-Commerce',
  description = 'Stripe, Shopify und kundenspezifische Zahlungsintegrationen. Sichere Transaktionen, die Compliance-Anforderungen erfüllen.'
WHERE subservice_id = 25 AND locale = 'de';

UPDATE subservice_translations SET
  title = 'Gesundheit & Pharma',
  description = 'Apps für Veterinär-, Ernährungs- und Pharmaindustrie. Verständnis für regulatorische Anforderungen und Datensensibilität.'
WHERE subservice_id = 26 AND locale = 'de';

UPDATE subservice_translations SET
  title = 'SQL-Datenbanken',
  description = 'Design, Optimierung und Verwaltung relationaler Datenbanken. MySQL, PostgreSQL und Enterprise-Lösungen.'
WHERE subservice_id = 27 AND locale = 'de';

UPDATE subservice_translations SET
  title = 'NoSQL-Lösungen',
  description = 'Dokumentenspeicher, Key-Value-Datenbanken und Graph-Datenbanken für hochgeschwindigkeits- und unstrukturierte Daten.'
WHERE subservice_id = 28 AND locale = 'de';

UPDATE subservice_translations SET
  title = 'Datenmodellierung',
  description = 'Schema-Design, das Ihre Abfragen unterstützt und mit Ihrem Wachstum skaliert. Das Fundament richtig legen.'
WHERE subservice_id = 29 AND locale = 'de';

UPDATE subservice_translations SET
  title = 'Datenbankadministration',
  description = 'Backup-Strategien, Performance-Tuning, Sicherheitshärtung und Disaster-Recovery-Planung.'
WHERE subservice_id = 30 AND locale = 'de';

-- Italian (it)
UPDATE subservice_translations SET
  title = 'Elaborazione del Linguaggio Naturale',
  description = 'Chatbot, analisi del sentiment, classificazione del testo e traduzione automatica. Fai capire e rispondere le tue applicazioni al linguaggio umano.'
WHERE subservice_id = 19 AND locale = 'it';

UPDATE subservice_translations SET
  title = 'Computer Vision',
  description = 'Riconoscimento immagini, rilevamento oggetti e analisi video. Dal controllo qualità al monitoraggio della sicurezza.'
WHERE subservice_id = 20 AND locale = 'it';

UPDATE subservice_translations SET
  title = 'Deep Learning',
  description = 'Reti neurali per il riconoscimento di pattern complessi. Quando gli algoritmi tradizionali non bastano.'
WHERE subservice_id = 21 AND locale = 'it';

UPDATE subservice_translations SET
  title = 'Analisi Predittiva',
  description = 'Modelli di machine learning che prevedono tendenze, rilevano anomalie e ottimizzano decisioni basate su dati storici.'
WHERE subservice_id = 22 AND locale = 'it';

UPDATE subservice_translations SET
  title = 'iOS & Android Nativo',
  description = 'App veramente native con integrazione completa della piattaforma. Non React Native o Flutter. Quando la tua app deve sentirsi a casa sul dispositivo.'
WHERE subservice_id = 23 AND locale = 'it';

UPDATE subservice_translations SET
  title = 'IoT & Wearables',
  description = 'App per dispositivi connessi, integrazioni Fitbit e SDK hardware. Esperienza nella consegna di prodotti IoT presso Enea AB.'
WHERE subservice_id = 24 AND locale = 'it';

UPDATE subservice_translations SET
  title = 'Pagamenti & E-commerce',
  description = 'Stripe, Shopify e integrazioni di pagamento personalizzate. Transazioni sicure che soddisfano i requisiti di conformità.'
WHERE subservice_id = 25 AND locale = 'it';

UPDATE subservice_translations SET
  title = 'Sanità & Farmaceutica',
  description = 'App per industrie veterinaria, nutrizione e farmaceutica. Comprensione dei requisiti normativi e della sensibilità dei dati.'
WHERE subservice_id = 26 AND locale = 'it';

UPDATE subservice_translations SET
  title = 'Database SQL',
  description = 'Progettazione, ottimizzazione e gestione di database relazionali. MySQL, PostgreSQL e soluzioni enterprise.'
WHERE subservice_id = 27 AND locale = 'it';

UPDATE subservice_translations SET
  title = 'Soluzioni NoSQL',
  description = 'Document store, database key-value e graph database per dati ad alta velocità e non strutturati.'
WHERE subservice_id = 28 AND locale = 'it';

UPDATE subservice_translations SET
  title = 'Modellazione Dati',
  description = 'Progettazione di schema che supporta le tue query e scala con la tua crescita. Mettere le basi giuste.'
WHERE subservice_id = 29 AND locale = 'it';

UPDATE subservice_translations SET
  title = 'Amministrazione Database',
  description = 'Strategie di backup, tuning delle prestazioni, hardening della sicurezza e pianificazione del disaster recovery.'
WHERE subservice_id = 30 AND locale = 'it';

-- Spanish (es)
UPDATE subservice_translations SET
  title = 'Procesamiento de Lenguaje Natural',
  description = 'Chatbots, análisis de sentimiento, clasificación de texto y traducción automática. Haz que tus aplicaciones entiendan y respondan al lenguaje humano.'
WHERE subservice_id = 19 AND locale = 'es';

UPDATE subservice_translations SET
  title = 'Visión por Computadora',
  description = 'Reconocimiento de imágenes, detección de objetos y análisis de video. Desde control de calidad hasta monitoreo de seguridad.'
WHERE subservice_id = 20 AND locale = 'es';

UPDATE subservice_translations SET
  title = 'Deep Learning',
  description = 'Redes neuronales para reconocimiento de patrones complejos. Cuando los algoritmos tradicionales no son suficientes.'
WHERE subservice_id = 21 AND locale = 'es';

UPDATE subservice_translations SET
  title = 'Analítica Predictiva',
  description = 'Modelos de machine learning que pronostican tendencias, detectan anomalías y optimizan decisiones basadas en datos históricos.'
WHERE subservice_id = 22 AND locale = 'es';

UPDATE subservice_translations SET
  title = 'iOS & Android Nativo',
  description = 'Apps verdaderamente nativas con integración completa de plataforma. No React Native ni Flutter. Cuando tu app necesita sentirse en casa en el dispositivo.'
WHERE subservice_id = 23 AND locale = 'es';

UPDATE subservice_translations SET
  title = 'IoT & Wearables',
  description = 'Apps para dispositivos conectados, integraciones Fitbit y SDKs de hardware. Experiencia entregando productos IoT en Enea AB.'
WHERE subservice_id = 24 AND locale = 'es';

UPDATE subservice_translations SET
  title = 'Pagos & E-commerce',
  description = 'Stripe, Shopify e integraciones de pago personalizadas. Transacciones seguras que cumplen requisitos de cumplimiento.'
WHERE subservice_id = 25 AND locale = 'es';

UPDATE subservice_translations SET
  title = 'Salud & Farmacéutica',
  description = 'Apps para industrias veterinaria, nutrición y farmacéutica. Comprensión de requisitos regulatorios y sensibilidad de datos.'
WHERE subservice_id = 26 AND locale = 'es';

UPDATE subservice_translations SET
  title = 'Bases de Datos SQL',
  description = 'Diseño, optimización y gestión de bases de datos relacionales. MySQL, PostgreSQL y soluciones enterprise.'
WHERE subservice_id = 27 AND locale = 'es';

UPDATE subservice_translations SET
  title = 'Soluciones NoSQL',
  description = 'Document stores, bases de datos key-value y bases de datos de grafos para datos de alta velocidad y no estructurados.'
WHERE subservice_id = 28 AND locale = 'es';

UPDATE subservice_translations SET
  title = 'Modelado de Datos',
  description = 'Diseño de esquema que soporta tus consultas y escala con tu crecimiento. Estableciendo la base correcta.'
WHERE subservice_id = 29 AND locale = 'es';

UPDATE subservice_translations SET
  title = 'Administración de Bases de Datos',
  description = 'Estrategias de respaldo, ajuste de rendimiento, fortalecimiento de seguridad y planificación de recuperación ante desastres.'
WHERE subservice_id = 30 AND locale = 'es';
