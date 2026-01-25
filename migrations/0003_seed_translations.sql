-- Seed translations for all locales (ro, fr, de, it, es)
-- English translations already exist in 0002_seed_data.sql
-- Uses INSERT OR IGNORE to be idempotent (safe to run multiple times)

-- ============================================================
-- TEAM MEMBER TRANSLATIONS
-- ============================================================

-- Romanian (ro)
INSERT OR IGNORE INTO team_member_translations (team_member_id, locale, name, role, bio) VALUES
  (1, 'ro', 'Catalin Teodorescu', 'Fondator & Inginer Principal', 'Peste 15 ani de experienta in dezvoltare software si securitate cibernetica. Anterior la TUI, Electronic Arts si Team Extension AG. Specializat in arhitectura securizata, DevOps si securitatea aplicatiilor web.'),
  (2, 'ro', 'Cristian-Marian Mincu', 'Dezvoltator Mobile Senior', 'Peste 10 ani de experienta in dezvoltarea aplicatiilor native iOS si Android. Anterior la Nagarro si Enea AB. Expert in arhitectura mobila, integratii IoT si pipeline-uri CI/CD. Master in Securitate Informatica la Universitatea Politehnica din Bucuresti.');

-- French (fr)
INSERT OR IGNORE INTO team_member_translations (team_member_id, locale, name, role, bio) VALUES
  (1, 'fr', 'Catalin Teodorescu', 'Fondateur & Ingenieur Principal', 'Plus de 15 ans d''experience en developpement logiciel et cybersecurite. Anciennement chez TUI, Electronic Arts et Team Extension AG. Specialise en architecture securisee, DevOps et securite des applications web.'),
  (2, 'fr', 'Cristian-Marian Mincu', 'Developpeur Mobile Senior', 'Plus de 10 ans d''experience dans le developpement d''applications natives iOS et Android. Anciennement chez Nagarro et Enea AB. Expert en architecture mobile, integrations IoT et pipelines CI/CD. Master en Securite Informatique de l''Universite Politehnica de Bucarest.');

-- German (de)
INSERT OR IGNORE INTO team_member_translations (team_member_id, locale, name, role, bio) VALUES
  (1, 'de', 'Catalin Teodorescu', 'Grunder & Leitender Ingenieur', 'Uber 15 Jahre Erfahrung in Softwareentwicklung und Cybersicherheit. Zuvor bei TUI, Electronic Arts und Team Extension AG. Spezialisiert auf sichere Architektur, DevOps und Webanwendungssicherheit.'),
  (2, 'de', 'Cristian-Marian Mincu', 'Senior Mobile-Entwickler', 'Uber 10 Jahre Erfahrung in der Entwicklung nativer iOS- und Android-Apps. Zuvor bei Nagarro und Enea AB. Experte fur mobile Architektur, IoT-Integrationen und CI/CD-Pipelines. Master in Informationssicherheit an der Politehnica-Universitat Bukarest.');

-- Italian (it)
INSERT OR IGNORE INTO team_member_translations (team_member_id, locale, name, role, bio) VALUES
  (1, 'it', 'Catalin Teodorescu', 'Fondatore & Ingegnere Principale', 'Oltre 15 anni di esperienza nello sviluppo software e nella sicurezza informatica. In precedenza presso TUI, Electronic Arts e Team Extension AG. Specializzato in architettura sicura, DevOps e sicurezza delle applicazioni web.'),
  (2, 'it', 'Cristian-Marian Mincu', 'Sviluppatore Mobile Senior', 'Oltre 10 anni di esperienza nello sviluppo di app native iOS e Android. In precedenza presso Nagarro ed Enea AB. Esperto in architettura mobile, integrazioni IoT e pipeline CI/CD. Master in Sicurezza Informatica presso l''Universita Politehnica di Bucarest.');

-- Spanish (es)
INSERT OR IGNORE INTO team_member_translations (team_member_id, locale, name, role, bio) VALUES
  (1, 'es', 'Catalin Teodorescu', 'Fundador e Ingeniero Principal', 'Mas de 15 anos de experiencia en desarrollo de software y ciberseguridad. Anteriormente en TUI, Electronic Arts y Team Extension AG. Especializado en arquitectura segura, DevOps y seguridad de aplicaciones web.'),
  (2, 'es', 'Cristian-Marian Mincu', 'Desarrollador Mobile Senior', 'Mas de 10 anos desarrollando aplicaciones nativas iOS y Android. Anteriormente en Nagarro y Enea AB. Experto en arquitectura movil, integraciones IoT y pipelines CI/CD. Master en Seguridad Informatica de la Universidad Politehnica de Bucarest.');

-- ============================================================
-- COMPANY TRANSLATIONS
-- ============================================================

-- Romanian (ro)
INSERT OR IGNORE INTO company_translations (company_id, locale, name, description) VALUES
  (1, 'ro', 'TUI', 'Securitate web pentru una dintre cele mai mari companii de turism din lume'),
  (2, 'ro', 'Electronic Arts', 'Testare de securitate pentru aplicatii web si platforme de gaming'),
  (3, 'ro', 'Nagarro', 'Peste 5 ani de arhitectura mobila si dezvoltare de aplicatii native'),
  (4, 'ro', 'Enea AB', 'Dezvoltare IoT si SDK nativ pentru dispozitive conectate');

-- French (fr)
INSERT OR IGNORE INTO company_translations (company_id, locale, name, description) VALUES
  (1, 'fr', 'TUI', 'Securite web pour l''une des plus grandes entreprises de voyage au monde'),
  (2, 'fr', 'Electronic Arts', 'Tests de securite pour applications web et plateformes de jeux'),
  (3, 'fr', 'Nagarro', 'Plus de 5 ans d''architecture mobile et developpement d''applications natives'),
  (4, 'fr', 'Enea AB', 'Developpement IoT et SDK natif pour appareils connectes');

-- German (de)
INSERT OR IGNORE INTO company_translations (company_id, locale, name, description) VALUES
  (1, 'de', 'TUI', 'Web-Sicherheit fur eines der grossten Reiseunternehmen der Welt'),
  (2, 'de', 'Electronic Arts', 'Sicherheitstests fur Webanwendungen und Gaming-Plattformen'),
  (3, 'de', 'Nagarro', 'Uber 5 Jahre mobile Architektur und native App-Entwicklung'),
  (4, 'de', 'Enea AB', 'IoT- und native SDK-Entwicklung fur vernetzte Gerate');

-- Italian (it)
INSERT OR IGNORE INTO company_translations (company_id, locale, name, description) VALUES
  (1, 'it', 'TUI', 'Sicurezza web per una delle piu grandi aziende di viaggi al mondo'),
  (2, 'it', 'Electronic Arts', 'Test di sicurezza per applicazioni web e piattaforme di gaming'),
  (3, 'it', 'Nagarro', 'Oltre 5 anni di architettura mobile e sviluppo di app native'),
  (4, 'it', 'Enea AB', 'Sviluppo IoT e SDK nativo per dispositivi connessi');

-- Spanish (es)
INSERT OR IGNORE INTO company_translations (company_id, locale, name, description) VALUES
  (1, 'es', 'TUI', 'Seguridad web para una de las mayores empresas de viajes del mundo'),
  (2, 'es', 'Electronic Arts', 'Pruebas de seguridad para aplicaciones web y plataformas de juegos'),
  (3, 'es', 'Nagarro', 'Mas de 5 anos de arquitectura movil y desarrollo de aplicaciones nativas'),
  (4, 'es', 'Enea AB', 'Desarrollo IoT y SDK nativo para dispositivos conectados');

-- ============================================================
-- PROJECT TRANSLATIONS
-- ============================================================

-- Romanian (ro)
INSERT OR IGNORE INTO project_translations (project_id, locale, name, client_type, industry, challenge, solution, result) VALUES
  (1, 'ro', 'XtendLive', 'Enterprise', 'Evenimente & Media',
    'Construirea unei platforme de evenimente virtuale suficient de puternica pentru conferinte enterprise, dar suficient de simpla pentru a fi folosita de oricine. Platforma trebuia sa gestioneze streaming live la scara larga, interactiune in timp real si analize detaliate.',
    'Am dezvoltat un sistem scalabil de gestionare a evenimentelor cu instrumente intuitive de creare, functii interactive de engagement si un dashboard complet de analize. Ne-am concentrat pe fiabilitate si usurinta in utilizare fara a sacrifica capabilitatile.',
    'Platforma alimenteaza acum evenimente virtuale pentru organizatii din intreaga lume.'),
  (2, 'ro', 'Insight6', 'Enterprise', 'Experienta Clientilor',
    'O agentie leader de mystery shopping din UK avea nevoie sa-si modernizeze platforma pentru a gestiona mii de evaluari lunare in retail, hospitality, sanatate si sectorul legal. Sistemul trebuia sa coordoneze peste 800 de mystery shopperi si sa livreze feedback in 48 de ore.',
    'Am construit un sistem complet de gestionare a evaluarilor cu colectare de date prietenoasa pentru mobil, rutare automatizata a workflow-ului si un portal pentru clienti cu acces in timp real la rezultate. Am integrat evaluari video, telefon si chat.',
    'Sistemul proceseaza peste 23.000 de mystery shops anual pentru peste 500 de branduri din UK.'),
  (3, 'ro', 'AudioMovers ListenTo', 'Companie Produs', 'Audio & Muzica',
    'Crearea unui plugin de streaming audio de calitate profesionala care permite producatorilor muzicali si inginerilor audio sa transmita audio de inalta calitate din DAW-ul lor catre clienti oriunde in lume. Necesita suport pentru pana la 128 canale de audio lossless cu latenta minima.',
    'Am dezvoltat un plugin cross-platform (VST, AU, AAX) cu streaming adaptiv, suportand de la AAC comprimat la PCM lossless 32-bit la 192kHz. Am construit aplicatii receptor pentru web, iOS si Android pentru ca clientii sa poata asculta fara a instala software.',
    'Instrument standard in industrie folosit de profesionisti audio si studiouri la nivel global.'),
  (4, 'ro', 'FSC (Forest Stewardship Council)', 'Non-Profit', 'Mediu',
    'Organizatia lider mondial in certificarea padurilor avea nevoie de instrumente digitale pentru a-si sustine misiunea de protejare a padurilor la nivel global. Erau necesare sisteme pentru gestionarea certificarilor, trasabilitatea lantului de aprovizionare si coordonarea partilor interesate din mai multe tari.',
    'Am contribuit la dezvoltarea sistemelor de certificare si trasabilitate care ajuta la verificarea practicilor forestiere sustenabile in lanturile de aprovizionare globale. Am implementat gestionarea securizata a datelor pentru informatii sensibile de conformitate.',
    'Sustinem misiunea FSC de a proteja padurile prin certificare de incredere.'),
  (5, 'ro', 'RakeTheRake', 'Enterprise', 'iGaming',
    'O platforma de afiliere poker operand din 2004 cu peste 250.000 de membri avea nevoie sa-si scaleze sistemele de tracking rakeback si plati, integrand cu zeci de camere de poker si site-uri de gaming. Securitatea si urmarirea financiara precisa erau critice.',
    'Am construit sisteme robuste de tracking si plati capabile sa gestioneze volume mari de tranzactii. Am implementat integratii securizate cu multiple platforme de gaming si calcule automate de plati. Am adaugat functii de comunitate inclusiv turnee freeroll si clasamente.',
    'Platforma a distribuit peste 190 milioane dolari in rakeback membrilor din 2004.'),
  (6, 'ro', 'KeyVision PRO', 'Companie Produs', 'Legal Tech',
    'Firmele de avocatura aveau nevoie de o solutie completa de management al practicii bazata pe cloud, acoperind inregistrarea timpului, facturare, gestionarea cazurilor si raportare financiara. Sistemul trebuia sa gestioneze date sensibile ale clientilor cu cerinte stricte de securitate.',
    'Am dezvoltat o platforma completa de management al practicii juridice cu pontaje integrate, facturare automatizata, urmarirea audierilor si dashboarduri de performanta. Am implementat criptare SSL si controale de acces bazate pe roluri pentru protectia datelor.',
    'Servim firme de avocatura de la practicieni individuali la practici mari multi-echipa din toata Europa.');

-- French (fr)
INSERT OR IGNORE INTO project_translations (project_id, locale, name, client_type, industry, challenge, solution, result) VALUES
  (1, 'fr', 'XtendLive', 'Enterprise', 'Evenements & Medias',
    'Construire une plateforme d''evenements virtuels assez puissante pour les conferences d''entreprise mais assez simple pour etre utilisee par tous. La plateforme devait gerer le streaming en direct a grande echelle, l''engagement en temps reel et des analyses detaillees.',
    'Nous avons developpe un systeme de gestion d''evenements evolutif avec des outils de creation intuitifs, des fonctionnalites d''engagement interactives et un tableau de bord analytique complet. L''accent a ete mis sur la fiabilite et la facilite d''utilisation.',
    'La plateforme alimente maintenant des evenements virtuels pour des organisations du monde entier.'),
  (2, 'fr', 'Insight6', 'Enterprise', 'Experience Client',
    'Une agence leader de clients mysteres au Royaume-Uni devait moderniser sa plateforme pour gerer des milliers d''evaluations mensuelles dans le commerce de detail, l''hotellerie, la sante et le secteur juridique. Le systeme devait coordonner plus de 800 clients mysteres et livrer des retours dans les 48 heures.',
    'Nous avons construit un systeme complet de gestion des evaluations avec une collecte de donnees adaptee aux mobiles, un routage automatise des workflows et un portail client pour un acces en temps reel aux resultats. Integration des evaluations video, telephoniques et chat.',
    'Le systeme traite plus de 23 000 visites mysteres par an pour plus de 500 marques britanniques.'),
  (3, 'fr', 'AudioMovers ListenTo', 'Entreprise Produit', 'Audio & Musique',
    'Creer un plugin de streaming audio de qualite professionnelle permettant aux producteurs de musique et ingenieurs audio de diffuser de l''audio haute qualite depuis leur DAW vers des clients n''importe ou dans le monde. Support necessaire pour jusqu''a 128 canaux audio sans perte avec une latence minimale.',
    'Nous avons developpe un plugin multiplateforme (VST, AU, AAX) avec streaming a debit adaptatif, supportant du AAC compresse au PCM sans perte 32 bits a 192kHz. Applications recepteur construites pour web, iOS et Android.',
    'Outil standard de l''industrie utilise par les professionnels audio et studios dans le monde entier.'),
  (4, 'fr', 'FSC (Forest Stewardship Council)', 'Non-Profit', 'Environnement',
    'L''organisation leader mondial de certification forestiere avait besoin d''outils numeriques pour soutenir sa mission de protection des forets. Systemes necessaires pour la gestion des certifications, la tracabilite de la chaine d''approvisionnement et la coordination des parties prenantes.',
    'Nous avons contribue au developpement de systemes de certification et de tracabilite qui aident a verifier les pratiques forestieres durables dans les chaines d''approvisionnement mondiales. Gestion securisee des donnees pour les informations de conformite sensibles.',
    'Soutenir la mission du FSC de proteger les forets grace a une certification de confiance.'),
  (5, 'fr', 'RakeTheRake', 'Enterprise', 'iGaming',
    'Une plateforme d''affiliation poker operant depuis 2004 avec plus de 250 000 membres devait faire evoluer ses systemes de suivi de rakeback et de paiement tout en s''integrant avec des dizaines de salles de poker. La securite et le suivi financier precis etaient critiques.',
    'Nous avons construit des systemes de suivi et de paiement robustes capables de gerer des volumes de transactions eleves. Integrations securisees avec plusieurs plateformes de jeux et calculs de paiement automatises. Fonctionnalites communautaires ajoutees.',
    'La plateforme a distribue plus de 190 millions de dollars en rakeback aux membres depuis 2004.'),
  (6, 'fr', 'KeyVision PRO', 'Entreprise Produit', 'Legal Tech',
    'Les cabinets d''avocats avaient besoin d''une solution complete de gestion de cabinet basee sur le cloud couvrant le suivi du temps, la facturation, la gestion des dossiers et les rapports financiers. Le systeme devait gerer des donnees clients sensibles avec des exigences de securite strictes.',
    'Nous avons developpe une plateforme complete de gestion de cabinet juridique avec feuilles de temps integrees, facturation automatisee, suivi des audiences et tableaux de bord de performance. Chiffrement SSL et controles d''acces bases sur les roles.',
    'Au service des cabinets d''avocats des praticiens independants aux grands cabinets multi-equipes a travers l''Europe.');

-- German (de)
INSERT OR IGNORE INTO project_translations (project_id, locale, name, client_type, industry, challenge, solution, result) VALUES
  (1, 'de', 'XtendLive', 'Enterprise', 'Events & Medien',
    'Aufbau einer virtuellen Event-Plattform, die leistungsstark genug fur Unternehmenskonferenzen ist, aber einfach genug fur jeden zu bedienen. Die Plattform musste grossangelegtes Live-Streaming, Echtzeit-Engagement und detaillierte Analysen bewaltigen.',
    'Wir entwickelten ein skalierbares Event-Management-System mit intuitiven Erstellungstools, interaktiven Engagement-Funktionen und einem umfassenden Analyse-Dashboard. Fokus auf Zuverlassigkeit und Benutzerfreundlichkeit ohne Kompromisse bei den Funktionen.',
    'Die Plattform betreibt jetzt virtuelle Events fur Organisationen weltweit.'),
  (2, 'de', 'Insight6', 'Enterprise', 'Kundenerlebnis',
    'Eine fuhrende britische Mystery-Shopping-Agentur musste ihre Plattform modernisieren, um tausende monatliche Bewertungen in Einzelhandel, Gastgewerbe, Gesundheitswesen und Rechtssektor zu bewaltigen. Das System musste uber 800 Mystery Shopper koordinieren.',
    'Wir bauten ein umfassendes Bewertungsmanagementsystem mit mobilfreundlicher Datenerfassung, automatisiertem Workflow-Routing und einem Kundenportal fur Echtzeitzugriff auf Ergebnisse. Video-, Telefon- und Chat-Bewertungen integriert.',
    'Das System verarbeitet jahrlich uber 23.000 Mystery Shops fur mehr als 500 britische Marken.'),
  (3, 'de', 'AudioMovers ListenTo', 'Produktunternehmen', 'Audio & Musik',
    'Erstellung eines professionellen Audio-Streaming-Plugins, das Musikproduzenten und Toningenieuren ermoglicht, hochwertige Audio von ihrer DAW an Kunden uberall auf der Welt zu streamen. Unterstutzung fur bis zu 128 Kanale verlustfreies Audio mit minimaler Latenz erforderlich.',
    'Wir entwickelten ein plattformubergreifendes Plugin (VST, AU, AAX) mit adaptivem Bitrate-Streaming, von komprimiertem AAC bis verlustfreiem 32-Bit PCM bei 192kHz. Empfanger-Apps fur Web, iOS und Android erstellt.',
    'Branchenstandard-Tool, das von Audio-Profis und Studios weltweit genutzt wird.'),
  (4, 'de', 'FSC (Forest Stewardship Council)', 'Non-Profit', 'Umwelt',
    'Die weltweit fuhrende Waldzertifizierungsorganisation benotigte digitale Tools zur Unterstutzung ihrer Mission zum globalen Waldschutz. Systeme fur Zertifizierungsmanagement, Lieferkettenruckverfolgbarkeit und Stakeholder-Koordination erforderlich.',
    'Wir trugen zur Entwicklung von Zertifizierungs- und Ruckverfolgbarkeitssystemen bei, die nachhaltige Forstwirtschaftspraktiken in globalen Lieferketten verifizieren. Sichere Datenhandhabung fur sensible Compliance-Informationen implementiert.',
    'Unterstutzung der FSC-Mission zum Waldschutz durch vertrauenswurdige Zertifizierung.'),
  (5, 'de', 'RakeTheRake', 'Enterprise', 'iGaming',
    'Eine Poker-Affiliate-Plattform, die seit 2004 mit uber 250.000 Mitgliedern operiert, musste ihre Rakeback-Tracking- und Auszahlungssysteme skalieren und sich mit Dutzenden von Pokerraumen integrieren. Sicherheit und genaue Finanzverfolgung waren kritisch.',
    'Wir bauten robuste Tracking- und Zahlungssysteme, die hohe Transaktionsvolumen bewaltigen konnen. Sichere Integrationen mit mehreren Gaming-Plattformen und automatisierte Auszahlungsberechnungen implementiert. Community-Funktionen hinzugefugt.',
    'Die Plattform hat seit 2004 uber 190 Millionen Dollar an Rakeback an Mitglieder ausgeschuttet.'),
  (6, 'de', 'KeyVision PRO', 'Produktunternehmen', 'Legal Tech',
    'Anwaltskanzleien benotigten eine umfassende cloudbasierte Kanzleimanagement-Losung fur Zeiterfassung, Abrechnung, Fallmanagement und Finanzberichterstattung. Das System musste sensible Mandantendaten mit strengen Sicherheitsanforderungen handhaben.',
    'Wir entwickelten eine vollstandige juristische Kanzleimanagement-Plattform mit integrierten Stundenzetteln, automatisierter Rechnungsstellung, Gerichtsverhandlungsverfolgung und Performance-Dashboards. SSL-Verschlusselung und rollenbasierte Zugriffskontrollen.',
    'Wir bedienen Anwaltskanzleien von Einzelpraktikern bis zu grossen Multi-Team-Kanzleien in ganz Europa.');

-- Italian (it)
INSERT OR IGNORE INTO project_translations (project_id, locale, name, client_type, industry, challenge, solution, result) VALUES
  (1, 'it', 'XtendLive', 'Enterprise', 'Eventi & Media',
    'Costruire una piattaforma per eventi virtuali abbastanza potente per conferenze aziendali ma abbastanza semplice da usare per chiunque. La piattaforma doveva gestire streaming live su larga scala, coinvolgimento in tempo reale e analisi dettagliate.',
    'Abbiamo sviluppato un sistema scalabile di gestione eventi con strumenti intuitivi di creazione, funzionalita di coinvolgimento interattivo e una dashboard analitica completa. Focus su affidabilita e facilita d''uso senza sacrificare le capacita.',
    'La piattaforma ora alimenta eventi virtuali per organizzazioni in tutto il mondo.'),
  (2, 'it', 'Insight6', 'Enterprise', 'Customer Experience',
    'Un''agenzia leader di mystery shopping nel Regno Unito doveva modernizzare la propria piattaforma per gestire migliaia di valutazioni mensili in retail, hospitality, sanita e settore legale. Il sistema doveva coordinare oltre 800 mystery shopper.',
    'Abbiamo costruito un sistema completo di gestione delle valutazioni con raccolta dati mobile-friendly, routing automatizzato del workflow e un portale clienti per l''accesso in tempo reale ai risultati. Integrate valutazioni video, telefono e chat.',
    'Il sistema elabora oltre 23.000 mystery shop all''anno per oltre 500 marchi britannici.'),
  (3, 'it', 'AudioMovers ListenTo', 'Azienda Prodotto', 'Audio & Musica',
    'Creare un plugin di streaming audio di qualita professionale che permetta a produttori musicali e ingegneri audio di trasmettere audio di alta qualita dalla loro DAW a clienti ovunque nel mondo. Necessario supporto fino a 128 canali audio lossless con latenza minima.',
    'Abbiamo sviluppato un plugin cross-platform (VST, AU, AAX) con streaming a bitrate adattivo, supportando da AAC compresso a PCM lossless 32-bit a 192kHz. App ricevitore costruite per web, iOS e Android.',
    'Strumento standard del settore usato da professionisti audio e studi in tutto il mondo.'),
  (4, 'it', 'FSC (Forest Stewardship Council)', 'Non-Profit', 'Ambiente',
    'L''organizzazione leader mondiale nella certificazione forestale aveva bisogno di strumenti digitali per supportare la sua missione di protezione delle foreste. Necessari sistemi per la gestione delle certificazioni, tracciabilita della supply chain e coordinamento stakeholder.',
    'Abbiamo contribuito allo sviluppo di sistemi di certificazione e tracciabilita che aiutano a verificare pratiche forestali sostenibili nelle supply chain globali. Implementata gestione sicura dei dati per informazioni di conformita sensibili.',
    'Supportiamo la missione FSC di proteggere le foreste attraverso certificazioni affidabili.'),
  (5, 'it', 'RakeTheRake', 'Enterprise', 'iGaming',
    'Una piattaforma di affiliazione poker operante dal 2004 con oltre 250.000 membri doveva scalare i propri sistemi di tracking rakeback e pagamenti integrandosi con dozzine di poker room. Sicurezza e tracking finanziario accurato erano critici.',
    'Abbiamo costruito sistemi robusti di tracking e pagamento capaci di gestire alti volumi di transazioni. Implementate integrazioni sicure con multiple piattaforme di gaming e calcoli automatici dei pagamenti. Aggiunte funzionalita community.',
    'La piattaforma ha distribuito oltre 190 milioni di dollari in rakeback ai membri dal 2004.'),
  (6, 'it', 'KeyVision PRO', 'Azienda Prodotto', 'Legal Tech',
    'Gli studi legali avevano bisogno di una soluzione completa di gestione dello studio basata su cloud che coprisse time tracking, fatturazione, gestione casi e reportistica finanziaria. Il sistema doveva gestire dati sensibili dei clienti con requisiti di sicurezza rigorosi.',
    'Abbiamo sviluppato una piattaforma completa di gestione dello studio legale con timesheet integrati, fatturazione automatizzata, tracking delle udienze e dashboard delle performance. Implementata crittografia SSL e controlli di accesso basati sui ruoli.',
    'Serviamo studi legali da professionisti singoli a grandi studi multi-team in tutta Europa.');

-- Spanish (es)
INSERT OR IGNORE INTO project_translations (project_id, locale, name, client_type, industry, challenge, solution, result) VALUES
  (1, 'es', 'XtendLive', 'Enterprise', 'Eventos y Medios',
    'Construir una plataforma de eventos virtuales lo suficientemente potente para conferencias empresariales pero lo suficientemente simple para que cualquiera la use. La plataforma necesitaba manejar streaming en vivo a gran escala, engagement en tiempo real y analiticas detalladas.',
    'Desarrollamos un sistema escalable de gestion de eventos con herramientas intuitivas de creacion, funciones de engagement interactivo y un dashboard analitico completo. Enfoque en fiabilidad y facilidad de uso sin sacrificar capacidades.',
    'La plataforma ahora impulsa eventos virtuales para organizaciones en todo el mundo.'),
  (2, 'es', 'Insight6', 'Enterprise', 'Experiencia del Cliente',
    'Una agencia lider de mystery shopping en UK necesitaba modernizar su plataforma para manejar miles de evaluaciones mensuales en retail, hosteleria, salud y sector legal. El sistema debia coordinar mas de 800 mystery shoppers y entregar feedback en 48 horas.',
    'Construimos un sistema integral de gestion de evaluaciones con recoleccion de datos mobile-friendly, enrutamiento automatizado de workflows y un portal de clientes para acceso en tiempo real a resultados. Integradas evaluaciones de video, telefono y chat.',
    'El sistema procesa mas de 23.000 mystery shops anualmente para mas de 500 marcas britanicas.'),
  (3, 'es', 'AudioMovers ListenTo', 'Empresa Producto', 'Audio y Musica',
    'Crear un plugin de streaming de audio de calidad profesional que permita a productores musicales e ingenieros de audio transmitir audio de alta calidad desde su DAW a clientes en cualquier parte del mundo. Soporte requerido para hasta 128 canales de audio lossless con latencia minima.',
    'Desarrollamos un plugin multiplataforma (VST, AU, AAX) con streaming de bitrate adaptativo, soportando desde AAC comprimido hasta PCM lossless de 32 bits a 192kHz. Apps receptoras construidas para web, iOS y Android.',
    'Herramienta estandar de la industria usada por profesionales de audio y estudios globalmente.'),
  (4, 'es', 'FSC (Forest Stewardship Council)', 'Non-Profit', 'Medio Ambiente',
    'La organizacion lider mundial de certificacion forestal necesitaba herramientas digitales para apoyar su mision de proteger los bosques globalmente. Se requerian sistemas para gestion de certificaciones, trazabilidad de la cadena de suministro y coordinacion de stakeholders.',
    'Contribuimos al desarrollo de sistemas de certificacion y trazabilidad que ayudan a verificar practicas forestales sostenibles en cadenas de suministro globales. Implementado manejo seguro de datos para informacion sensible de cumplimiento.',
    'Apoyando la mision de FSC de proteger los bosques a traves de certificacion confiable.'),
  (5, 'es', 'RakeTheRake', 'Enterprise', 'iGaming',
    'Una plataforma de afiliados de poker operando desde 2004 con mas de 250.000 miembros necesitaba escalar sus sistemas de tracking de rakeback y pagos mientras se integraba con docenas de salas de poker. La seguridad y el seguimiento financiero preciso eran criticos.',
    'Construimos sistemas robustos de tracking y pagos capaces de manejar altos volumenes de transacciones. Implementamos integraciones seguras con multiples plataformas de gaming y calculos automatizados de pagos. Anadidas funciones de comunidad.',
    'La plataforma ha distribuido mas de 190 millones de dolares en rakeback a miembros desde 2004.'),
  (6, 'es', 'KeyVision PRO', 'Empresa Producto', 'Legal Tech',
    'Los bufetes de abogados necesitaban una solucion integral de gestion de practica basada en la nube que cubriera seguimiento de tiempo, facturacion, gestion de casos y reportes financieros. El sistema debia manejar datos sensibles de clientes con requisitos estrictos de seguridad.',
    'Desarrollamos una plataforma completa de gestion de practica legal con hojas de tiempo integradas, facturacion automatizada, seguimiento de audiencias y dashboards de rendimiento. Implementada encriptacion SSL y controles de acceso basados en roles.',
    'Sirviendo bufetes de abogados desde profesionales individuales hasta grandes practicas multi-equipo en toda Europa.');

-- ============================================================
-- SERVICE TRANSLATIONS (Professional Services: 1-4)
-- ============================================================

-- Romanian (ro)
INSERT OR IGNORE INTO service_translations (service_id, locale, title, description, details, note) VALUES
  (1, 'ro', 'Consultanta Tehnica',
    'Ghidare expertizata in decizii de arhitectura, alegeri tehnologice si strategii de dezvoltare.',
    'Uneori ai nevoie de o a doua opinie sau de ghidare expertizata inainte de a te angaja intr-o directie. Oferim servicii de consultanta pentru a te ajuta sa iei decizii informate despre stack-ul tehnologic, arhitectura si abordarea de dezvoltare.',
    NULL),
  (2, 'ro', 'Servicii de Securitate',
    'Cu experienta la Electronic Arts si TUI, nu doar construim software. Stim cum sa-l spargem. Aceasta perspectiva modeleaza tot ce cream.',
    'Daca utilizatorii nu au incredere in securitatea ta, nu vor ramane. Protejarea sistemelor si datelor tale este fundatia pe care se construieste totul.',
    'Putem lucra ca echipa de securitate independenta sau alaturi de dezvoltarea ta, lucreaza cu noi!'),
  (3, 'ro', 'Big Data & Analytics',
    'Transforma datele brute in ceva util. Dashboarduri personalizate, metrici si analize care te ajuta sa iei decizii.',
    'Nu poti imbunatati ceea ce nu masori. Configuram analize care iti arata ce se intampla cu utilizatorii, sistemul si afacerea ta.',
    NULL),
  (4, 'ro', 'Servicii QA & Testare',
    'Ne asiguram ca software-ul tau functioneaza cu adevarat. Testare manuala si automatizata care gaseste probleme inainte ca utilizatorii tai sa le descopere.',
    'Abordarea noastra de testare acopera functionalitate, performanta, securitate si experienta utilizatorului. Folosim instrumente standard din industrie precum Selenium, Appium si JMeter pentru a detecta probleme inainte sa ajunga la utilizatori.',
    NULL);

-- French (fr)
INSERT OR IGNORE INTO service_translations (service_id, locale, title, description, details, note) VALUES
  (1, 'fr', 'Conseil Technique',
    'Conseils d''experts sur les decisions d''architecture, les choix technologiques et les strategies de developpement.',
    'Parfois, vous avez besoin d''un deuxieme avis ou de conseils d''experts avant de vous engager dans une direction. Nous offrons des services de conseil pour vous aider a prendre des decisions eclairees sur votre stack technologique, votre architecture et votre approche de developpement.',
    NULL),
  (2, 'fr', 'Services de Securite',
    'Avec une experience chez Electronic Arts et TUI, nous ne construisons pas seulement des logiciels. Nous savons comment les casser. Cette perspective faonne tout ce que nous creons.',
    'Si vos utilisateurs ne font pas confiance a votre securite, ils ne resteront pas. Proteger vos systemes et vos donnees est la base sur laquelle tout le reste est construit.',
    'Nous pouvons travailler comme equipe de securite independante ou aux cotes de votre developpement, travaillez avec nous!'),
  (3, 'fr', 'Big Data & Analytique',
    'Transformez les donnees brutes en quelque chose d''utile. Tableaux de bord personnalises, metriques et analyses qui vous aident a prendre des decisions.',
    'Vous ne pouvez pas ameliorer ce que vous ne mesurez pas. Nous mettons en place des analyses qui vous montrent ce qui se passe avec vos utilisateurs, votre systeme et votre entreprise.',
    NULL),
  (4, 'fr', 'Services QA & Tests',
    'Nous nous assurons que votre logiciel fonctionne vraiment. Tests manuels et automatises qui detectent les problemes avant vos utilisateurs.',
    'Notre approche de test couvre la fonctionnalite, la performance, la securite et l''experience utilisateur. Nous utilisons des outils standard de l''industrie comme Selenium, Appium et JMeter pour detecter les problemes avant qu''ils n''atteignent vos utilisateurs.',
    NULL);

-- German (de)
INSERT OR IGNORE INTO service_translations (service_id, locale, title, description, details, note) VALUES
  (1, 'de', 'Technische Beratung',
    'Expertenberatung zu Architekturentscheidungen, Technologieauswahl und Entwicklungsstrategien.',
    'Manchmal brauchen Sie eine zweite Meinung oder Expertenberatung, bevor Sie sich fur eine Richtung entscheiden. Wir bieten Beratungsdienste, um Ihnen zu helfen, fundierte Entscheidungen uber Ihren Technologie-Stack, Ihre Architektur und Ihren Entwicklungsansatz zu treffen.',
    NULL),
  (2, 'de', 'Sicherheitsdienste',
    'Mit Erfahrung bei Electronic Arts und TUI bauen wir nicht nur Software. Wir wissen, wie man sie knackt. Diese Perspektive pragt alles, was wir schaffen.',
    'Wenn Ihre Benutzer Ihrer Sicherheit nicht vertrauen, bleiben sie nicht. Der Schutz Ihrer Systeme und Daten ist das Fundament, auf dem alles andere aufgebaut ist.',
    'Wir konnen als eigenstandiges Sicherheitsteam oder neben Ihrer Entwicklung arbeiten, arbeiten Sie mit uns!'),
  (3, 'de', 'Big Data & Analytics',
    'Verwandeln Sie Rohdaten in etwas Nutzliches. Individuelle Dashboards, Metriken und Analysen, die Ihnen bei Entscheidungen helfen.',
    'Sie konnen nicht verbessern, was Sie nicht messen. Wir richten Analysen ein, die Ihnen zeigen, was mit Ihren Benutzern, Ihrem System und Ihrem Unternehmen passiert.',
    NULL),
  (4, 'de', 'QA & Testdienste',
    'Wir stellen sicher, dass Ihre Software tatsachlich funktioniert. Manuelle und automatisierte Tests, die Probleme erkennen, bevor Ihre Benutzer es tun.',
    'Unser Testansatz umfasst Funktionalitat, Leistung, Sicherheit und Benutzererfahrung. Wir verwenden branchenubbliche Tools wie Selenium, Appium und JMeter, um Probleme zu erkennen, bevor sie Ihre Benutzer erreichen.',
    NULL);

-- Italian (it)
INSERT OR IGNORE INTO service_translations (service_id, locale, title, description, details, note) VALUES
  (1, 'it', 'Consulenza Tecnica',
    'Guida esperta su decisioni architetturali, scelte tecnologiche e strategie di sviluppo.',
    'A volte hai bisogno di un secondo parere o di una guida esperta prima di impegnarti in una direzione. Offriamo servizi di consulenza per aiutarti a prendere decisioni informate sul tuo stack tecnologico, architettura e approccio di sviluppo.',
    NULL),
  (2, 'it', 'Servizi di Sicurezza',
    'Con esperienza presso Electronic Arts e TUI, non costruiamo solo software. Sappiamo come violarlo. Questa prospettiva plasma tutto cio che creiamo.',
    'Se i tuoi utenti non si fidano della tua sicurezza, non rimarranno. Proteggere i tuoi sistemi e dati e la base su cui tutto il resto e costruito.',
    'Possiamo lavorare come team di sicurezza indipendente o insieme al tuo sviluppo, lavora con noi!'),
  (3, 'it', 'Big Data & Analytics',
    'Trasforma i dati grezzi in qualcosa di utile. Dashboard personalizzate, metriche e analisi che ti aiutano a prendere decisioni.',
    'Non puoi migliorare cio che non misuri. Configuriamo analisi che ti mostrano cosa sta succedendo con i tuoi utenti, il tuo sistema e la tua azienda.',
    NULL),
  (4, 'it', 'Servizi QA & Testing',
    'Ci assicuriamo che il tuo software funzioni davvero. Test manuali e automatizzati che individuano i problemi prima che lo facciano i tuoi utenti.',
    'Il nostro approccio di testing copre funzionalita, prestazioni, sicurezza ed esperienza utente. Utilizziamo strumenti standard del settore come Selenium, Appium e JMeter per rilevare problemi prima che raggiungano i tuoi utenti.',
    NULL);

-- Spanish (es)
INSERT OR IGNORE INTO service_translations (service_id, locale, title, description, details, note) VALUES
  (1, 'es', 'Consultoria Tecnica',
    'Orientacion experta en decisiones de arquitectura, elecciones tecnologicas y estrategias de desarrollo.',
    'A veces necesitas una segunda opinion o orientacion experta antes de comprometerte con una direccion. Ofrecemos servicios de consultoria para ayudarte a tomar decisiones informadas sobre tu stack tecnologico, arquitectura y enfoque de desarrollo.',
    NULL),
  (2, 'es', 'Servicios de Seguridad',
    'Con experiencia en Electronic Arts y TUI, no solo construimos software. Sabemos como romperlo. Esa perspectiva moldea todo lo que creamos.',
    'Si tus usuarios no confian en tu seguridad, no se quedaran. Proteger tus sistemas y datos es la base sobre la que se construye todo lo demas.',
    'Podemos trabajar como equipo de seguridad independiente o junto a tu desarrollo, trabaja con nosotros!'),
  (3, 'es', 'Big Data & Analytics',
    'Convierte datos brutos en algo util. Dashboards personalizados, metricas y analiticas que te ayudan a tomar decisiones.',
    'No puedes mejorar lo que no mides. Configuramos analiticas que te muestran que esta pasando con tus usuarios, tu sistema y tu negocio.',
    NULL),
  (4, 'es', 'Servicios de QA y Testing',
    'Nos aseguramos de que tu software realmente funcione. Testing manual y automatizado que detecta problemas antes que tus usuarios.',
    'Nuestro enfoque de testing cubre funcionalidad, rendimiento, seguridad y experiencia de usuario. Usamos herramientas estandar de la industria como Selenium, Appium y JMeter para detectar problemas antes de que lleguen a tus usuarios.',
    NULL);

-- ============================================================
-- SERVICE TRANSLATIONS (Development Services: 5-10)
-- ============================================================

-- Romanian (ro)
INSERT OR IGNORE INTO service_translations (service_id, locale, title, description, details, note) VALUES
  (5, 'ro', 'AI & Machine Learning',
    'De la procesarea limbajului natural la viziune computerizata, construim sisteme care invata si se adapteaza. Transforma datele in ceva util.',
    'Construim solutii AI personalizate folosind TensorFlow, PyTorch si Scikit-learn. Modele predictive, chatboti cu NLP, recunoastere de imagini. Ne concentram pe AI care rezolva probleme reale, nu demo-uri.',
    NULL),
  (6, 'ro', 'Aplicatii Web',
    'De la dashboarduri interne la platforme pentru clienti. SPA-uri, PWA-uri, panouri admin, produse SaaS. Orice au nevoie utilizatorii tai.',
    'Lucram cu Laravel, Symfony, Drupal, WordPress, CraftCMS si framework-uri JavaScript moderne. Alegem bazat pe cerintele tale, nu pe preferintele noastre. Ai nevoie de SEO? Renderizare server-side. Interactivitate mare? Un SPA modern. Nevoi simple? Poate deloc framework.',
    NULL),
  (7, 'ro', 'Aplicatii Mobile',
    'Aplicatii native iOS si Android construite de ingineri cu peste 10 ani la Nagarro si Enea AB. Nu compromisuri cross-platform, performanta nativa reala.',
    'Ne specializam in dezvoltare nativa pentru ca unele aplicatii o cer. Integratii IoT, wearables, sisteme de plati, aplicatii de sanatate. Cand performanta si integrarea platformei conteaza, construim nativ. Ne ocupam si de publicarea in app store, pipeline-uri CI/CD si mentenanta continua.',
    NULL),
  (8, 'ro', 'DevOps & Infrastructura Cloud',
    'Deploymenturi containerizate, pipeline-uri CI/CD si arhitectura cloud pe AWS. Construim infrastructura care scaleaza si ramane securizata.',
    'Docker, Kubernetes, Terraform, CircleCI, GitHub Actions. Configuram deploymenturi automatizate, monitorizare si infrastructura ca cod pentru ca echipa ta sa poata livra cu incredere.',
    NULL),
  (9, 'ro', 'Backend, API-uri & Integratii',
    'Motorul din spatele aplicatiei tale. API-uri RESTful, microservicii, optimizare baze de date si integratii third-party.',
    'MySQL, PostgreSQL, Elastic Search pentru query-uri complexe. Ne ocupam de modernizarea sistemelor legacy, integratii de sistem si module standalone pentru produse mai mari. Daca ai o provocare tehnica specifica, suntem bucurosi sa ne apucam.',
    NULL),
  (10, 'ro', 'Design & Management Baze de Date',
    'SQL, NoSQL, modelare date si administrare. Proiectam baze de date care scaleaza si raman rapide.',
    'De la design de schema la optimizare de performanta, ne ocupam de stratul de date. MySQL, PostgreSQL, MongoDB, Redis. Alegem bazat pe pattern-urile tale de acces, nu pe preferintele noastre. Administrare baze de date, migratii si disaster recovery incluse.',
    NULL);

-- French (fr)
INSERT OR IGNORE INTO service_translations (service_id, locale, title, description, details, note) VALUES
  (5, 'fr', 'IA & Machine Learning',
    'Du traitement du langage naturel a la vision par ordinateur, nous construisons des systemes qui apprennent et s''adaptent. Transformez les donnees en quelque chose d''utile.',
    'Nous construisons des solutions IA personnalisees utilisant TensorFlow, PyTorch et Scikit-learn. Modeles predictifs, chatbots avec NLP, reconnaissance d''images. Nous nous concentrons sur l''IA qui resout de vrais problemes, pas des demos.',
    NULL),
  (6, 'fr', 'Applications Web',
    'Des tableaux de bord internes aux plateformes clients. SPAs, PWAs, panneaux d''administration, produits SaaS. Tout ce dont vos utilisateurs ont besoin.',
    'Nous travaillons avec Laravel, Symfony, Drupal, WordPress, CraftCMS et les frameworks JavaScript modernes. Nous choisissons en fonction de vos besoins, pas de nos preferences. Besoin de SEO? Rendu cote serveur. Forte interactivite? Un SPA moderne. Besoins simples? Peut-etre pas de framework du tout.',
    NULL),
  (7, 'fr', 'Applications Mobiles',
    'Applications natives iOS et Android construites par des ingenieurs avec plus de 10 ans chez Nagarro et Enea AB. Pas de compromis cross-platform, de vraies performances natives.',
    'Nous nous specialisons dans le developpement natif car certaines applications l''exigent. Integrations IoT, wearables, systemes de paiement, applications de sante. Quand la performance et l''integration de la plateforme comptent, nous construisons natif. Nous gerons aussi la publication sur les app stores, les pipelines CI/CD et la maintenance continue.',
    NULL),
  (8, 'fr', 'DevOps & Infrastructure Cloud',
    'Deployments containerises, pipelines CI/CD et architecture cloud sur AWS. Nous construisons une infrastructure qui evolue et reste securisee.',
    'Docker, Kubernetes, Terraform, CircleCI, GitHub Actions. Nous mettons en place des deployments automatises, de la surveillance et de l''infrastructure en tant que code pour que votre equipe puisse livrer en toute confiance.',
    NULL),
  (9, 'fr', 'Backend, APIs & Integrations',
    'Le moteur derriere votre application. APIs RESTful, microservices, optimisation de base de donnees et integrations tierces.',
    'MySQL, PostgreSQL, Elastic Search pour les requetes complexes. Nous gerons la modernisation des systemes legacy, les integrations systeme et les modules autonomes pour les plus gros produits. Si vous avez un defi technique specifique, nous sommes heureux de nous y plonger.',
    NULL),
  (10, 'fr', 'Conception & Gestion de Bases de Donnees',
    'SQL, NoSQL, modelisation de donnees et administration. Nous concevons des bases de donnees qui evoluent et restent rapides.',
    'De la conception de schema a l''optimisation des performances, nous gerons la couche de donnees. MySQL, PostgreSQL, MongoDB, Redis. Nous choisissons en fonction de vos modeles d''acces, pas de nos preferences. Administration de bases de donnees, migrations et reprise apres sinistre incluses.',
    NULL);

-- German (de)
INSERT OR IGNORE INTO service_translations (service_id, locale, title, description, details, note) VALUES
  (5, 'de', 'KI & Machine Learning',
    'Von der Verarbeitung naturlicher Sprache bis zur Computer Vision bauen wir Systeme, die lernen und sich anpassen. Verwandeln Sie Daten in etwas Nutzliches.',
    'Wir bauen kundenspezifische KI-Losungen mit TensorFlow, PyTorch und Scikit-learn. Pradiktive Modelle, Chatbots mit NLP, Bilderkennung. Wir konzentrieren uns auf KI, die echte Probleme lost, nicht Demos.',
    NULL),
  (6, 'de', 'Webanwendungen',
    'Von internen Dashboards bis zu kundenorientierten Plattformen. SPAs, PWAs, Admin-Panels, SaaS-Produkte. Was auch immer Ihre Benutzer brauchen.',
    'Wir arbeiten mit Laravel, Symfony, Drupal, WordPress, CraftCMS und modernen JavaScript-Frameworks. Wir wahlen basierend auf Ihren Anforderungen, nicht unseren Vorlieben. SEO benotigt? Server-seitiges Rendering. Hohe Interaktivitat? Ein modernes SPA. Einfache Bedurfnisse? Vielleicht uberhaupt kein Framework.',
    NULL),
  (7, 'de', 'Mobile Anwendungen',
    'Native iOS- und Android-Apps von Ingenieuren mit uber 10 Jahren Erfahrung bei Nagarro und Enea AB. Keine Cross-Platform-Kompromisse, echte native Leistung.',
    'Wir spezialisieren uns auf native Entwicklung, weil manche Apps es verlangen. IoT-Integrationen, Wearables, Zahlungssysteme, Gesundheits-Apps. Wenn Leistung und Plattformintegration wichtig sind, bauen wir nativ. Wir kummern uns auch um App-Store-Veroffentlichung, CI/CD-Pipelines und laufende Wartung.',
    NULL),
  (8, 'de', 'DevOps & Cloud-Infrastruktur',
    'Containerisierte Deployments, CI/CD-Pipelines und Cloud-Architektur auf AWS. Wir bauen Infrastruktur, die skaliert und sicher bleibt.',
    'Docker, Kubernetes, Terraform, CircleCI, GitHub Actions. Wir richten automatisierte Deployments, Monitoring und Infrastructure as Code ein, damit Ihr Team mit Zuversicht ausliefern kann.',
    NULL),
  (9, 'de', 'Backend, APIs & Integrationen',
    'Der Motor hinter Ihrer Anwendung. RESTful APIs, Microservices, Datenbankoptimierung und Drittanbieter-Integrationen.',
    'MySQL, PostgreSQL, Elastic Search fur komplexe Abfragen. Wir kummern uns um Legacy-Modernisierung, Systemintegrationen und eigenstandige Module fur grossere Produkte. Wenn Sie eine spezifische technische Herausforderung haben, graben wir uns gerne rein.',
    NULL),
  (10, 'de', 'Datenbankdesign & -verwaltung',
    'SQL, NoSQL, Datenmodellierung und Administration. Wir entwerfen Datenbanken, die skalieren und schnell bleiben.',
    'Von Schema-Design bis Leistungsoptimierung kummern wir uns um die Datenschicht. MySQL, PostgreSQL, MongoDB, Redis. Wir wahlen basierend auf Ihren Zugriffsmustern, nicht unseren Vorlieben. Datenbankadministration, Migrationen und Disaster Recovery inklusive.',
    NULL);

-- Italian (it)
INSERT OR IGNORE INTO service_translations (service_id, locale, title, description, details, note) VALUES
  (5, 'it', 'AI & Machine Learning',
    'Dall''elaborazione del linguaggio naturale alla computer vision, costruiamo sistemi che imparano e si adattano. Trasforma i dati in qualcosa di utile.',
    'Costruiamo soluzioni AI personalizzate usando TensorFlow, PyTorch e Scikit-learn. Modelli predittivi, chatbot con NLP, riconoscimento immagini. Ci concentriamo su AI che risolve problemi reali, non demo.',
    NULL),
  (6, 'it', 'Applicazioni Web',
    'Da dashboard interni a piattaforme per clienti. SPA, PWA, pannelli admin, prodotti SaaS. Qualsiasi cosa di cui i tuoi utenti hanno bisogno.',
    'Lavoriamo con Laravel, Symfony, Drupal, WordPress, CraftCMS e framework JavaScript moderni. Scegliamo in base alle tue esigenze, non alle nostre preferenze. Hai bisogno di SEO? Rendering lato server. Alta interattivita? Una SPA moderna. Esigenze semplici? Forse nessun framework.',
    NULL),
  (7, 'it', 'Applicazioni Mobile',
    'App native iOS e Android costruite da ingegneri con oltre 10 anni presso Nagarro ed Enea AB. Non compromessi cross-platform, prestazioni native reali.',
    'Ci specializziamo nello sviluppo nativo perche alcune app lo richiedono. Integrazioni IoT, wearables, sistemi di pagamento, app sanitarie. Quando prestazioni e integrazione della piattaforma contano, costruiamo nativo. Gestiamo anche la pubblicazione sugli app store, pipeline CI/CD e manutenzione continua.',
    NULL),
  (8, 'it', 'DevOps & Infrastruttura Cloud',
    'Deployment containerizzati, pipeline CI/CD e architettura cloud su AWS. Costruiamo infrastrutture che scalano e rimangono sicure.',
    'Docker, Kubernetes, Terraform, CircleCI, GitHub Actions. Configuriamo deployment automatizzati, monitoraggio e infrastructure as code cosi il tuo team puo distribuire con fiducia.',
    NULL),
  (9, 'it', 'Backend, API & Integrazioni',
    'Il motore dietro la tua applicazione. API RESTful, microservizi, ottimizzazione database e integrazioni di terze parti.',
    'MySQL, PostgreSQL, Elastic Search per query complesse. Gestiamo modernizzazione di sistemi legacy, integrazioni di sistema e moduli standalone per prodotti piu grandi. Se hai una sfida tecnica specifica, siamo felici di approfondire.',
    NULL),
  (10, 'it', 'Progettazione & Gestione Database',
    'SQL, NoSQL, modellazione dati e amministrazione. Progettiamo database che scalano e rimangono veloci.',
    'Dalla progettazione dello schema all''ottimizzazione delle prestazioni, gestiamo il livello dati. MySQL, PostgreSQL, MongoDB, Redis. Scegliamo in base ai tuoi pattern di accesso, non alle nostre preferenze. Amministrazione database, migrazioni e disaster recovery inclusi.',
    NULL);

-- Spanish (es)
INSERT OR IGNORE INTO service_translations (service_id, locale, title, description, details, note) VALUES
  (5, 'es', 'IA & Machine Learning',
    'Desde procesamiento de lenguaje natural hasta vision por computadora, construimos sistemas que aprenden y se adaptan. Convierte datos en algo util.',
    'Construimos soluciones de IA personalizadas usando TensorFlow, PyTorch y Scikit-learn. Modelos predictivos, chatbots con NLP, reconocimiento de imagenes. Nos enfocamos en IA que resuelve problemas reales, no demos.',
    NULL),
  (6, 'es', 'Aplicaciones Web',
    'Desde dashboards internos hasta plataformas para clientes. SPAs, PWAs, paneles de administracion, productos SaaS. Lo que tus usuarios necesiten.',
    'Trabajamos con Laravel, Symfony, Drupal, WordPress, CraftCMS y frameworks JavaScript modernos. Elegimos basandonos en tus requisitos, no en nuestras preferencias. Necesitas SEO? Renderizado del lado del servidor. Alta interactividad? Una SPA moderna. Necesidades simples? Quizas ningun framework.',
    NULL),
  (7, 'es', 'Aplicaciones Moviles',
    'Apps nativas iOS y Android construidas por ingenieros con mas de 10 anos en Nagarro y Enea AB. Sin compromisos cross-platform, rendimiento nativo real.',
    'Nos especializamos en desarrollo nativo porque algunas apps lo exigen. Integraciones IoT, wearables, sistemas de pago, apps de salud. Cuando el rendimiento y la integracion de plataforma importan, construimos nativo. Tambien manejamos publicacion en app stores, pipelines CI/CD y mantenimiento continuo.',
    NULL),
  (8, 'es', 'DevOps & Infraestructura Cloud',
    'Deployments containerizados, pipelines CI/CD y arquitectura cloud en AWS. Construimos infraestructura que escala y permanece segura.',
    'Docker, Kubernetes, Terraform, CircleCI, GitHub Actions. Configuramos deployments automatizados, monitoreo e infraestructura como codigo para que tu equipo pueda entregar con confianza.',
    NULL),
  (9, 'es', 'Backend, APIs e Integraciones',
    'El motor detras de tu aplicacion. APIs RESTful, microservicios, optimizacion de bases de datos e integraciones de terceros.',
    'MySQL, PostgreSQL, Elastic Search para consultas complejas. Manejamos modernizacion de sistemas legacy, integraciones de sistemas y modulos independientes para productos mas grandes. Si tienes un desafio tecnico especifico, estaremos encantados de profundizar.',
    NULL),
  (10, 'es', 'Diseno y Gestion de Bases de Datos',
    'SQL, NoSQL, modelado de datos y administracion. Disenamos bases de datos que escalan y permanecen rapidas.',
    'Desde diseno de esquemas hasta optimizacion de rendimiento, manejamos la capa de datos. MySQL, PostgreSQL, MongoDB, Redis. Elegimos basandonos en tus patrones de acceso, no en nuestras preferencias. Administracion de bases de datos, migraciones y recuperacion ante desastres incluidos.',
    NULL);

-- ============================================================
-- SUBSERVICE TRANSLATIONS (Professional Services: 1-18)
-- ============================================================

-- Romanian (ro)
INSERT OR IGNORE INTO subservice_translations (subservice_id, locale, title, description) VALUES
  -- Consulting subservices (1-4)
  (1, 'ro', 'Revizuire Arhitectura', 'Evaluarea arhitecturii tale actuale cu recomandari pentru scalabilitate, securitate si mentenabilitate.'),
  (2, 'ro', 'Selectie Tehnologie', 'Ghidare impartiala in alegerea tehnologiilor potrivite pentru cerintele si constrangerile tale specifice.'),
  (3, 'ro', 'Revizuire Cod', 'Revizuire experta a bazei tale de cod concentrata pe best practices, vulnerabilitati de securitate si probleme de performanta.'),
  (4, 'ro', 'Strategie DevSecOps', 'Integrarea securitatii in procesul tau de dezvoltare. Shifting left fara a incetini.'),
  -- Security subservices (5-10)
  (5, 'ro', 'Testare de Penetrare', 'Testare manuala si automatizata de vulnerabilitati pentru aplicatii web, API-uri si infrastructura. Aceleasi tehnici pe care le-am folosit la EA, acum pentru aplicatiile tale.'),
  (6, 'ro', 'Audituri de Securitate', 'Revizuiri de cod si evaluari de arhitectura pentru a gasi vulnerabilitati inainte ca atacatorii sa o faca. Am revizuit binare de jocuri si platforme enterprise.'),
  (7, 'ro', 'Securitate Cloud', 'Revizuiri de configuratie AWS, politici IAM, segmentare retea, gestionare secrete. Lucrurile plictisitoare care previn breaches.'),
  (8, 'ro', 'Protectie DDoS & Bot', 'Implementare si acordare Akamai si Cloudflare. Credential stuffing, scraping, DDoS, prevenire account takeover. Certificat Akamai.'),
  (9, 'ro', 'Raspuns la Incidente', 'Evaluare rapida, izolare si recuperare cand apar breaches. Analiza post-incident si consolidare securitate.'),
  (10, 'ro', 'Implementare Zero Trust', 'Autentificare multi-factor, controale de acces si monitorizare continua. Fiecare utilizator si dispozitiv verificat inainte de acordarea accesului.'),
  -- Data Analytics subservices (11-14)
  (11, 'ro', 'Design Dashboard', 'Date prezentate in grafice si vizualizari pe care oricine le poate intelege. Numere care spun o poveste.'),
  (12, 'ro', 'Urmarire Performanta', 'Urmarire precisa cu metricile potrivite pentru situatia ta. Fara date de gunoi.'),
  (13, 'ro', 'Analiza Competitiva', 'Vezi cum se comporta utilizatorii, ce prefera si cum te compari cu competitorii.'),
  (14, 'ro', 'Monitorizare in Timp Real', 'Date live cand ai nevoie, chiar la volum mare.'),
  -- QA Testing subservices (15-18)
  (15, 'ro', 'Testare Manuala', 'Testare hands-on care prinde probleme UX, cazuri limita si scenarii din lumea reala pe care testele automate le pierd.'),
  (16, 'ro', 'Testare Automatizata', 'Selenium, Appium si suite de teste personalizate pentru testare de regresie rapida si repetabila intre build-uri.'),
  (17, 'ro', 'Testare de Performanta', 'Testare de incarcare, testare de stres si identificare bottleneck. Cunoaste-ti limitele inainte ca utilizatorii sa le gaseasca.'),
  (18, 'ro', 'Testare de Securitate', 'Scanare de vulnerabilitati, testare de penetrare si evaluare de risc integrate in ciclul tau de dezvoltare.');

-- French (fr)
INSERT OR IGNORE INTO subservice_translations (subservice_id, locale, title, description) VALUES
  (1, 'fr', 'Revue d''Architecture', 'Evaluation de votre architecture actuelle avec des recommandations pour la scalabilite, la securite et la maintenabilite.'),
  (2, 'fr', 'Selection de Technologies', 'Conseils impartiaux sur le choix des bonnes technologies pour vos besoins et contraintes specifiques.'),
  (3, 'fr', 'Revue de Code', 'Revue experte de votre base de code axee sur les meilleures pratiques, les vulnerabilites de securite et les problemes de performance.'),
  (4, 'fr', 'Strategie DevSecOps', 'Integration de la securite dans votre processus de developpement. Shifting left sans ralentir.'),
  (5, 'fr', 'Tests de Penetration', 'Tests de vulnerabilite manuels et automatises sur les applications web, APIs et infrastructure. Les memes techniques utilisees chez EA, maintenant pour vos applications.'),
  (6, 'fr', 'Audits de Securite', 'Revues de code et evaluations d''architecture pour trouver les vulnerabilites avant les attaquants. Nous avons examine des binaires de jeux et des plateformes entreprise.'),
  (7, 'fr', 'Securite Cloud', 'Revues de configuration AWS, politiques IAM, segmentation reseau, gestion des secrets. Les choses ennuyeuses qui previennent les violations.'),
  (8, 'fr', 'Protection DDoS & Bot', 'Implementation et reglage des defenses Akamai et Cloudflare. Credential stuffing, scraping, DDoS, prevention de prise de compte. Certifie Akamai.'),
  (9, 'fr', 'Reponse aux Incidents', 'Evaluation rapide, confinement et recuperation lors de violations. Analyse post-incident et renforcement de la securite.'),
  (10, 'fr', 'Implementation Zero Trust', 'Authentification multi-facteurs, controles d''acces et surveillance continue. Chaque utilisateur et appareil verifie avant l''acces.'),
  (11, 'fr', 'Conception de Tableaux de Bord', 'Donnees presentees dans des graphiques et visualisations que tout le monde peut comprendre. Des chiffres qui racontent une histoire.'),
  (12, 'fr', 'Suivi de Performance', 'Suivi precis avec les bonnes metriques pour votre situation. Pas de donnees poubelles.'),
  (13, 'fr', 'Analyse Concurrentielle', 'Voyez comment les utilisateurs se comportent, ce qu''ils preferent et comment vous vous comparez aux concurrents.'),
  (14, 'fr', 'Surveillance en Temps Reel', 'Donnees en direct quand vous en avez besoin, meme a haut volume.'),
  (15, 'fr', 'Tests Manuels', 'Tests pratiques qui detectent les problemes UX, les cas limites et les scenarios reels que les tests automatises manquent.'),
  (16, 'fr', 'Tests Automatises', 'Selenium, Appium et suites de tests personnalisees pour des tests de regression rapides et repetables entre les builds.'),
  (17, 'fr', 'Tests de Performance', 'Tests de charge, tests de stress et identification des goulots d''etranglement. Connaissez vos limites avant que vos utilisateurs ne les trouvent.'),
  (18, 'fr', 'Tests de Securite', 'Analyse de vulnerabilites, tests de penetration et evaluation des risques integres a votre cycle de developpement.');

-- German (de)
INSERT OR IGNORE INTO subservice_translations (subservice_id, locale, title, description) VALUES
  (1, 'de', 'Architektur-Review', 'Bewertung Ihrer aktuellen Architektur mit Empfehlungen fur Skalierbarkeit, Sicherheit und Wartbarkeit.'),
  (2, 'de', 'Technologieauswahl', 'Unvoreingenommene Beratung bei der Auswahl der richtigen Technologien fur Ihre spezifischen Anforderungen und Einschrankungen.'),
  (3, 'de', 'Code-Review', 'Experten-Review Ihrer Codebasis mit Fokus auf Best Practices, Sicherheitslucken und Performance-Probleme.'),
  (4, 'de', 'DevSecOps-Strategie', 'Integration von Sicherheit in Ihren Entwicklungsprozess. Shifting left ohne zu verlangsamen.'),
  (5, 'de', 'Penetrationstests', 'Manuelle und automatisierte Schwachstellentests fur Webanwendungen, APIs und Infrastruktur. Die gleichen Techniken, die wir bei EA verwendet haben, jetzt fur Ihre Anwendungen.'),
  (6, 'de', 'Sicherheitsaudits', 'Code-Reviews und Architekturbewertungen, um Schwachstellen zu finden, bevor Angreifer es tun. Wir haben Spiel-Binaries und Enterprise-Plattformen uberpruft.'),
  (7, 'de', 'Cloud-Sicherheit', 'AWS-Konfigurationsprufungen, IAM-Richtlinien, Netzwerksegmentierung, Secrets-Management. Die langweiligen Dinge, die Verletzungen verhindern.'),
  (8, 'de', 'DDoS- & Bot-Schutz', 'Implementierung und Tuning von Akamai- und Cloudflare-Abwehrmanahmen. Credential Stuffing, Scraping, DDoS, Konto-Ubernahme-Pravention. Akamai-zertifiziert.'),
  (9, 'de', 'Incident Response', 'Schnelle Bewertung, Eindammung und Wiederherstellung bei Sicherheitsverletzungen. Post-Incident-Analyse und Sicherheitshartung.'),
  (10, 'de', 'Zero-Trust-Implementierung', 'Multi-Faktor-Authentifizierung, Zugriffskontrollen und kontinuierliche Uberwachung. Jeder Benutzer und jedes Gerat wird vor dem Zugriff verifiziert.'),
  (11, 'de', 'Dashboard-Design', 'Daten prasentiert in Diagrammen und Visualisierungen, die jeder verstehen kann. Zahlen, die eine Geschichte erzahlen.'),
  (12, 'de', 'Performance-Tracking', 'Prazises Tracking mit den richtigen Metriken fur Ihre Situation. Keine Mullldaten.'),
  (13, 'de', 'Wettbewerbsanalyse', 'Sehen Sie, wie sich Benutzer verhalten, was sie bevorzugen und wie Sie im Vergleich zu Wettbewerbern abschneiden.'),
  (14, 'de', 'Echtzeit-Uberwachung', 'Live-Daten, wenn Sie sie brauchen, auch bei hohem Volumen.'),
  (15, 'de', 'Manuelles Testen', 'Praktisches Testen, das UX-Probleme, Grenzfalle und reale Szenarien erkennt, die automatisierte Tests ubersehen.'),
  (16, 'de', 'Automatisiertes Testen', 'Selenium, Appium und kundenspezifische Testsuiten fur schnelle, wiederholbare Regressionstests uber Builds hinweg.'),
  (17, 'de', 'Performance-Tests', 'Lasttests, Stresstests und Engpass-Identifikation. Kennen Sie Ihre Grenzen, bevor Ihre Benutzer sie finden.'),
  (18, 'de', 'Sicherheitstests', 'Schwachstellenscanning, Penetrationstests und Risikobewertung in Ihren Entwicklungszyklus integriert.');

-- Italian (it)
INSERT OR IGNORE INTO subservice_translations (subservice_id, locale, title, description) VALUES
  (1, 'it', 'Revisione Architettura', 'Valutazione della tua architettura attuale con raccomandazioni per scalabilita, sicurezza e manutenibilita.'),
  (2, 'it', 'Selezione Tecnologie', 'Guida imparziale nella scelta delle tecnologie giuste per i tuoi requisiti e vincoli specifici.'),
  (3, 'it', 'Revisione Codice', 'Revisione esperta della tua codebase focalizzata su best practice, vulnerabilita di sicurezza e problemi di performance.'),
  (4, 'it', 'Strategia DevSecOps', 'Integrazione della sicurezza nel tuo processo di sviluppo. Shifting left senza rallentare.'),
  (5, 'it', 'Penetration Testing', 'Test di vulnerabilita manuali e automatizzati su applicazioni web, API e infrastruttura. Le stesse tecniche usate in EA, ora per le tue applicazioni.'),
  (6, 'it', 'Audit di Sicurezza', 'Revisioni del codice e valutazioni dell''architettura per trovare vulnerabilita prima degli attaccanti. Abbiamo revisionato binari di giochi e piattaforme enterprise.'),
  (7, 'it', 'Sicurezza Cloud', 'Revisioni configurazione AWS, policy IAM, segmentazione rete, gestione secrets. Le cose noiose che prevengono le violazioni.'),
  (8, 'it', 'Protezione DDoS & Bot', 'Implementazione e tuning delle difese Akamai e Cloudflare. Credential stuffing, scraping, DDoS, prevenzione account takeover. Certificato Akamai.'),
  (9, 'it', 'Risposta agli Incidenti', 'Valutazione rapida, contenimento e recupero quando si verificano violazioni. Analisi post-incidente e hardening della sicurezza.'),
  (10, 'it', 'Implementazione Zero Trust', 'Autenticazione multi-fattore, controlli di accesso e monitoraggio continuo. Ogni utente e dispositivo verificato prima dell''accesso.'),
  (11, 'it', 'Design Dashboard', 'Dati presentati in grafici e visualizzazioni che chiunque puo capire. Numeri che raccontano una storia.'),
  (12, 'it', 'Tracking Prestazioni', 'Tracking accurato con le metriche giuste per la tua situazione. Niente dati spazzatura.'),
  (13, 'it', 'Analisi Competitiva', 'Vedi come si comportano gli utenti, cosa preferiscono e come ti confronti con i concorrenti.'),
  (14, 'it', 'Monitoraggio in Tempo Reale', 'Dati live quando ne hai bisogno, anche ad alto volume.'),
  (15, 'it', 'Testing Manuale', 'Testing pratico che individua problemi UX, casi limite e scenari reali che i test automatizzati perdono.'),
  (16, 'it', 'Testing Automatizzato', 'Selenium, Appium e suite di test personalizzate per test di regressione veloci e ripetibili tra le build.'),
  (17, 'it', 'Testing Prestazioni', 'Load testing, stress testing e identificazione dei colli di bottiglia. Conosci i tuoi limiti prima che li trovino i tuoi utenti.'),
  (18, 'it', 'Testing Sicurezza', 'Scansione vulnerabilita, penetration testing e valutazione del rischio integrati nel tuo ciclo di sviluppo.');

-- Spanish (es)
INSERT OR IGNORE INTO subservice_translations (subservice_id, locale, title, description) VALUES
  (1, 'es', 'Revision de Arquitectura', 'Evaluacion de tu arquitectura actual con recomendaciones para escalabilidad, seguridad y mantenibilidad.'),
  (2, 'es', 'Seleccion de Tecnologia', 'Orientacion imparcial para elegir las tecnologias adecuadas para tus requisitos y restricciones especificas.'),
  (3, 'es', 'Revision de Codigo', 'Revision experta de tu codigo enfocada en mejores practicas, vulnerabilidades de seguridad y problemas de rendimiento.'),
  (4, 'es', 'Estrategia DevSecOps', 'Integrando seguridad en tu proceso de desarrollo. Shifting left sin ralentizar.'),
  (5, 'es', 'Pruebas de Penetracion', 'Pruebas de vulnerabilidad manuales y automatizadas en aplicaciones web, APIs e infraestructura. Las mismas tecnicas que usamos en EA, ahora para tus aplicaciones.'),
  (6, 'es', 'Auditorias de Seguridad', 'Revisiones de codigo y evaluaciones de arquitectura para encontrar vulnerabilidades antes que los atacantes. Hemos revisado binarios de juegos y plataformas enterprise.'),
  (7, 'es', 'Seguridad Cloud', 'Revisiones de configuracion AWS, politicas IAM, segmentacion de red, gestion de secretos. Las cosas aburridas que previenen violaciones.'),
  (8, 'es', 'Proteccion DDoS & Bot', 'Implementacion y ajuste de defensas Akamai y Cloudflare. Credential stuffing, scraping, DDoS, prevencion de robo de cuentas. Certificado Akamai.'),
  (9, 'es', 'Respuesta a Incidentes', 'Evaluacion rapida, contencion y recuperacion cuando ocurren violaciones. Analisis post-incidente y fortalecimiento de seguridad.'),
  (10, 'es', 'Implementacion Zero Trust', 'Autenticacion multi-factor, controles de acceso y monitoreo continuo. Cada usuario y dispositivo verificado antes de otorgar acceso.'),
  (11, 'es', 'Diseno de Dashboards', 'Datos presentados en graficos y visualizaciones que cualquiera puede entender. Numeros que cuentan una historia.'),
  (12, 'es', 'Seguimiento de Rendimiento', 'Seguimiento preciso con las metricas correctas para tu situacion. Sin datos basura.'),
  (13, 'es', 'Analisis Competitivo', 'Ve como se comportan los usuarios, que prefieren y como te comparas con los competidores.'),
  (14, 'es', 'Monitoreo en Tiempo Real', 'Datos en vivo cuando los necesitas, incluso a alto volumen.'),
  (15, 'es', 'Testing Manual', 'Testing practico que detecta problemas de UX, casos limite y escenarios del mundo real que los tests automatizados pierden.'),
  (16, 'es', 'Testing Automatizado', 'Selenium, Appium y suites de tests personalizadas para testing de regresion rapido y repetible entre builds.'),
  (17, 'es', 'Testing de Rendimiento', 'Load testing, stress testing e identificacion de cuellos de botella. Conoce tus limites antes de que tus usuarios los encuentren.'),
  (18, 'es', 'Testing de Seguridad', 'Escaneo de vulnerabilidades, pruebas de penetracion y evaluacion de riesgos integrados en tu ciclo de desarrollo.');

-- ============================================================
-- SUBSERVICE TRANSLATIONS (Development Services: 19-30)
-- ============================================================

-- Romanian (ro)
INSERT OR IGNORE INTO subservice_translations (subservice_id, locale, title, description) VALUES
  -- AI & ML subservices (19-22)
  (19, 'ro', 'Procesarea Limbajului Natural', 'Chatboti, analiza de sentiment, clasificare text si traducere automata. Fa aplicatiile tale sa inteleaga si sa raspunda limbajului uman.'),
  (20, 'ro', 'Computer Vision', 'Recunoastere de imagini, detectie de obiecte si analiza video. De la controlul calitatii la monitorizarea securitatii.'),
  (21, 'ro', 'Deep Learning', 'Retele neuronale pentru recunoastere complexa de pattern-uri. Cand algoritmii traditionali nu sunt suficienti.'),
  (22, 'ro', 'Analize Predictive', 'Modele de machine learning care prognozeaza tendinte, detecteaza anomalii si optimizeaza decizii bazate pe date istorice.'),
  -- Mobile subservices (23-26)
  (23, 'ro', 'iOS & Android Nativ', 'Aplicatii cu adevarat native cu integrare completa a platformei. Nu React Native sau Flutter. Cand aplicatia ta trebuie sa se simta ca acasa pe dispozitiv.'),
  (24, 'ro', 'IoT & Wearables', 'Aplicatii pentru dispozitive conectate, integratii Fitbit si SDK-uri hardware. Experienta in livrarea produselor IoT la Enea AB.'),
  (25, 'ro', 'Plati & E-commerce', 'Stripe, Shopify si integratii de plati personalizate. Tranzactii securizate care respecta cerintele de conformitate.'),
  (26, 'ro', 'Sanatate & Farma', 'Aplicatii pentru industria veterinara, nutritie si farmaceutica. Intelegerea cerintelor de reglementare si sensibilitatea datelor.'),
  -- Database subservices (27-30)
  (27, 'ro', 'Baze de Date SQL', 'Design, optimizare si management de baze de date relationale. MySQL, PostgreSQL si solutii enterprise.'),
  (28, 'ro', 'Solutii NoSQL', 'Document stores, baze de date key-value si graph databases pentru date de mare viteza si nestructurate.'),
  (29, 'ro', 'Modelare Date', 'Design de schema care suporta query-urile tale si scaleaza cu cresterea ta. Punand fundatia corecta.'),
  (30, 'ro', 'Administrare Baze de Date', 'Strategii de backup, tuning de performanta, securizare si planificare disaster recovery.');

-- French (fr)
INSERT OR IGNORE INTO subservice_translations (subservice_id, locale, title, description) VALUES
  (19, 'fr', 'Traitement du Langage Naturel', 'Chatbots, analyse de sentiment, classification de texte et traduction automatique. Faites comprendre et repondre vos applications au langage humain.'),
  (20, 'fr', 'Vision par Ordinateur', 'Reconnaissance d''images, detection d''objets et analyse video. Du controle qualite a la surveillance de securite.'),
  (21, 'fr', 'Deep Learning', 'Reseaux de neurones pour la reconnaissance de patterns complexes. Quand les algorithmes traditionnels ne suffisent pas.'),
  (22, 'fr', 'Analytique Predictive', 'Modeles de machine learning qui prevoient les tendances, detectent les anomalies et optimisent les decisions basees sur les donnees historiques.'),
  (23, 'fr', 'iOS & Android Natif', 'De vraies applications natives avec integration complete de la plateforme. Pas React Native ou Flutter. Quand votre application doit se sentir chez elle sur l''appareil.'),
  (24, 'fr', 'IoT & Wearables', 'Applications pour appareils connectes, integrations Fitbit et SDKs materiels. Experience dans la livraison de produits IoT chez Enea AB.'),
  (25, 'fr', 'Paiement & E-commerce', 'Stripe, Shopify et integrations de paiement personnalisees. Transactions securisees conformes aux exigences.'),
  (26, 'fr', 'Sante & Pharma', 'Applications pour les industries veterinaire, nutrition et pharmaceutique. Comprehension des exigences reglementaires et de la sensibilite des donnees.'),
  (27, 'fr', 'Bases de Donnees SQL', 'Conception, optimisation et gestion de bases de donnees relationnelles. MySQL, PostgreSQL et solutions entreprise.'),
  (28, 'fr', 'Solutions NoSQL', 'Bases documentaires, bases cle-valeur et bases graphes pour donnees haute velocite et non structurees.'),
  (29, 'fr', 'Modelisation de Donnees', 'Conception de schema qui supporte vos requetes et evolue avec votre croissance. Poser les bonnes fondations.'),
  (30, 'fr', 'Administration de Bases de Donnees', 'Strategies de sauvegarde, optimisation des performances, renforcement de la securite et planification de reprise apres sinistre.');

-- German (de)
INSERT OR IGNORE INTO subservice_translations (subservice_id, locale, title, description) VALUES
  (19, 'de', 'Naturliche Sprachverarbeitung', 'Chatbots, Sentiment-Analyse, Textklassifizierung und maschinelle Ubersetzung. Lassen Sie Ihre Anwendungen menschliche Sprache verstehen und darauf reagieren.'),
  (20, 'de', 'Computer Vision', 'Bilderkennung, Objekterkennung und Videoanalyse. Von der Qualitatskontrolle bis zur Sicherheitsuberwachung.'),
  (21, 'de', 'Deep Learning', 'Neuronale Netze fur komplexe Mustererkennung. Wenn traditionelle Algorithmen nicht ausreichen.'),
  (22, 'de', 'Pradiktive Analytik', 'Machine-Learning-Modelle, die Trends vorhersagen, Anomalien erkennen und Entscheidungen basierend auf historischen Daten optimieren.'),
  (23, 'de', 'Natives iOS & Android', 'Echte native Apps mit vollstandiger Plattformintegration. Nicht React Native oder Flutter. Wenn sich Ihre App auf dem Gerat heimisch anfuhlen muss.'),
  (24, 'de', 'IoT & Wearables', 'Apps fur vernetzte Gerate, Fitbit-Integrationen und Hardware-SDKs. Erfahrung in der Lieferung von IoT-Produkten bei Enea AB.'),
  (25, 'de', 'Zahlung & E-Commerce', 'Stripe, Shopify und kundenspezifische Zahlungsintegrationen. Sichere Transaktionen, die Compliance-Anforderungen erfullen.'),
  (26, 'de', 'Gesundheit & Pharma', 'Apps fur Veterinar-, Ernahrungs- und Pharmaindustrie. Verstandnis fur regulatorische Anforderungen und Datensensibilitat.'),
  (27, 'de', 'SQL-Datenbanken', 'Design, Optimierung und Verwaltung relationaler Datenbanken. MySQL, PostgreSQL und Enterprise-Losungen.'),
  (28, 'de', 'NoSQL-Losungen', 'Dokumentenspeicher, Key-Value-Datenbanken und Graph-Datenbanken fur hochgeschwindigkeits- und unstrukturierte Daten.'),
  (29, 'de', 'Datenmodellierung', 'Schema-Design, das Ihre Abfragen unterstutzt und mit Ihrem Wachstum skaliert. Das Fundament richtig legen.'),
  (30, 'de', 'Datenbankadministration', 'Backup-Strategien, Performance-Tuning, Sicherheitshartung und Disaster-Recovery-Planung.');

-- Italian (it)
INSERT OR IGNORE INTO subservice_translations (subservice_id, locale, title, description) VALUES
  (19, 'it', 'Elaborazione del Linguaggio Naturale', 'Chatbot, analisi del sentiment, classificazione del testo e traduzione automatica. Fai capire e rispondere le tue applicazioni al linguaggio umano.'),
  (20, 'it', 'Computer Vision', 'Riconoscimento immagini, rilevamento oggetti e analisi video. Dal controllo qualita al monitoraggio della sicurezza.'),
  (21, 'it', 'Deep Learning', 'Reti neurali per il riconoscimento di pattern complessi. Quando gli algoritmi tradizionali non bastano.'),
  (22, 'it', 'Analisi Predittiva', 'Modelli di machine learning che prevedono tendenze, rilevano anomalie e ottimizzano decisioni basate su dati storici.'),
  (23, 'it', 'iOS & Android Nativo', 'App veramente native con integrazione completa della piattaforma. Non React Native o Flutter. Quando la tua app deve sentirsi a casa sul dispositivo.'),
  (24, 'it', 'IoT & Wearables', 'App per dispositivi connessi, integrazioni Fitbit e SDK hardware. Esperienza nella consegna di prodotti IoT presso Enea AB.'),
  (25, 'it', 'Pagamenti & E-commerce', 'Stripe, Shopify e integrazioni di pagamento personalizzate. Transazioni sicure che soddisfano i requisiti di conformita.'),
  (26, 'it', 'Sanita & Farmaceutica', 'App per industrie veterinaria, nutrizione e farmaceutica. Comprensione dei requisiti normativi e della sensibilita dei dati.'),
  (27, 'it', 'Database SQL', 'Progettazione, ottimizzazione e gestione di database relazionali. MySQL, PostgreSQL e soluzioni enterprise.'),
  (28, 'it', 'Soluzioni NoSQL', 'Document store, database key-value e graph database per dati ad alta velocita e non strutturati.'),
  (29, 'it', 'Modellazione Dati', 'Progettazione di schema che supporta le tue query e scala con la tua crescita. Mettere le basi giuste.'),
  (30, 'it', 'Amministrazione Database', 'Strategie di backup, tuning delle prestazioni, hardening della sicurezza e pianificazione del disaster recovery.');

-- Spanish (es)
INSERT OR IGNORE INTO subservice_translations (subservice_id, locale, title, description) VALUES
  (19, 'es', 'Procesamiento de Lenguaje Natural', 'Chatbots, analisis de sentimiento, clasificacion de texto y traduccion automatica. Haz que tus aplicaciones entiendan y respondan al lenguaje humano.'),
  (20, 'es', 'Vision por Computadora', 'Reconocimiento de imagenes, deteccion de objetos y analisis de video. Desde control de calidad hasta monitoreo de seguridad.'),
  (21, 'es', 'Deep Learning', 'Redes neuronales para reconocimiento de patrones complejos. Cuando los algoritmos tradicionales no son suficientes.'),
  (22, 'es', 'Analitica Predictiva', 'Modelos de machine learning que pronostican tendencias, detectan anomalias y optimizan decisiones basadas en datos historicos.'),
  (23, 'es', 'iOS & Android Nativo', 'Apps verdaderamente nativas con integracion completa de plataforma. No React Native ni Flutter. Cuando tu app necesita sentirse en casa en el dispositivo.'),
  (24, 'es', 'IoT & Wearables', 'Apps para dispositivos conectados, integraciones Fitbit y SDKs de hardware. Experiencia entregando productos IoT en Enea AB.'),
  (25, 'es', 'Pagos & E-commerce', 'Stripe, Shopify e integraciones de pago personalizadas. Transacciones seguras que cumplen requisitos de cumplimiento.'),
  (26, 'es', 'Salud & Farmaceutica', 'Apps para industrias veterinaria, nutricion y farmaceutica. Comprension de requisitos regulatorios y sensibilidad de datos.'),
  (27, 'es', 'Bases de Datos SQL', 'Diseno, optimizacion y gestion de bases de datos relacionales. MySQL, PostgreSQL y soluciones enterprise.'),
  (28, 'es', 'Soluciones NoSQL', 'Document stores, bases de datos key-value y bases de datos de grafos para datos de alta velocidad y no estructurados.'),
  (29, 'es', 'Modelado de Datos', 'Diseno de esquema que soporta tus consultas y escala con tu crecimiento. Estableciendo la base correcta.'),
  (30, 'es', 'Administracion de Bases de Datos', 'Estrategias de respaldo, ajuste de rendimiento, fortalecimiento de seguridad y planificacion de recuperacion ante desastres.');
