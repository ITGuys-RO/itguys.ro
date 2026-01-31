-- Convert AudioMovers ListenTo to a full case study with content in all 6 locales

UPDATE projects SET is_case_study = 1, duration = '3 months', completed_at = '2021-08' WHERE slug = 'audiomovers-listento';

UPDATE project_translations SET
  slug = 'audiomovers-listento',
  content = '## Background

AudioMovers needed to solve a problem in professional audio production: how to let music producers, mixing engineers, and mastering professionals share high-fidelity audio with clients and collaborators anywhere in the world, directly from their digital audio workstation (DAW). Existing solutions either compressed audio to the point of being useless for critical listening or required complex networking setups that disrupted the creative workflow.

ListenTo had to work as a native plugin within every major DAW: Pro Tools, Logic Pro, Ableton Live, Cubase, and others. It needed to support up to 128 channels of audio at sample rates up to 192kHz. The receiver side had to be accessible on any device without installing software, so web browsers were the primary listening endpoint. Native iOS and Android apps would provide additional flexibility for mobile monitoring.

## Technical approach

The plugin was built in C++ using the JUCE framework, which provided cross-platform compatibility across macOS and Windows while supporting all major plugin formats: VST3, Audio Unit (AU), and AAX. JUCE handled the low-level audio processing pipeline with minimal CPU overhead.

WebRTC was the real-time transport layer, modified to handle professional audio requirements that go far beyond typical voice or video communication. We implemented custom codec negotiation that could switch between compressed AAC for low-bandwidth monitoring and lossless 32-bit PCM for critical listening sessions. The adaptive bitrate system continuously monitored network conditions and adjusted quality without audible artifacts.

React powered the web-based receiver application. The receiver connected to the plugin''s stream via WebRTC, with fallback to WebSocket-based transport when peer-to-peer connections weren''t possible.

## Implementation details

The core challenge was achieving ultra-low latency while maintaining audio integrity. We designed a custom jitter buffer that balanced latency against dropouts, with configurable settings letting users choose between minimum delay for real-time collaboration and larger buffers for stable monitoring over unreliable connections. The system consistently achieved under 200ms end-to-end latency on standard broadband connections.

Multi-channel support required careful memory management in the C++ plugin. Streaming 128 channels of 32-bit audio at 192kHz generates substantial data throughput. We implemented efficient buffer pooling and zero-copy audio routing within the plugin to keep CPU usage below 5% even at maximum channel counts. This matters because the plugin runs alongside demanding audio processing chains.

The web receiver used the Web Audio API for precise playback timing and level metering. We built a custom audio decoder that handled seamless codec switching when the sender changed quality settings mid-session. A session management system let senders share unique listen links, with optional password protection and listener limits for confidential material.

For the iOS and Android apps, we used platform-native audio APIs (Core Audio and AAudio respectively) to bypass the higher latency of cross-platform audio frameworks. The apps supported background listening, AirPlay and Bluetooth routing, and displayed waveform visualizations synchronized with the incoming audio stream.

## Outcomes

ListenTo became an industry-standard tool adopted by Grammy-winning producers, major recording studios, and broadcast facilities worldwide. The plugin processes millions of streaming minutes monthly. The lossless streaming capability in particular filled a gap that no competing product addressed.',
  meta_title = 'AudioMovers ListenTo Professional Audio Streaming Case Study | ITGuys',
  meta_description = 'How we built a cross-platform audio streaming plugin in C++ with WebRTC — supporting 128 channels of lossless audio at 192kHz for professional studios worldwide.'
WHERE project_id = (SELECT id FROM projects WHERE slug = 'audiomovers-listento') AND locale = 'en';

UPDATE project_translations SET
  slug = 'audiomovers-listento',
  content = '## Context

AudioMovers avea de rezolvat o problemă concretă din producția audio profesională: cum le permiți producătorilor muzicali, inginerilor de mix și specialiștilor de mastering să trimită audio de înaltă fidelitate către clienți și colaboratori oriunde în lume, direct din stația lor de lucru audio digitală (DAW). Soluțiile existente fie comprimau sunetul până devenea inutil pentru ascultarea critică, fie presupuneau configurări complicate de rețea care stricau fluxul creativ.

ListenTo trebuia să funcționeze ca plugin nativ în fiecare DAW important: Pro Tools, Logic Pro, Ableton Live, Cubase și altele. Trebuia să suporte până la 128 de canale audio la rate de eșantionare de până la 192kHz. Receptorul trebuia să fie accesibil pe orice dispozitiv fără instalare de software, așa că browserele web erau principalul punct de ascultare. Aplicațiile native iOS și Android completau tabloul cu flexibilitate suplimentară pentru monitorizarea mobilă.

## Abordare tehnică

Plugin-ul a fost construit în C++ cu framework-ul JUCE, care asigura compatibilitate cross-platform pe macOS și Windows și suport pentru toate formatele majore de plugin: VST3, Audio Unit (AU) și AAX. JUCE se ocupa de pipeline-ul de procesare audio la nivel scăzut, cu un overhead minim de CPU.

WebRTC a fost stratul de transport în timp real, adaptat pentru cerințe audio profesionale care depășesc cu mult comunicarea obișnuită de voce sau video. Am implementat negociere personalizată de codec care putea comuta între AAC comprimat pentru monitorizare cu lățime de bandă redusă și PCM lossless pe 32 de biți pentru sesiuni de ascultare critică. Sistemul de bitrate adaptiv monitoriza continuu condițiile rețelei și ajusta calitatea fără artefacte audibile.

React a alimentat aplicația receptor din browser. Receptorul se conecta la stream-ul plugin-ului prin WebRTC, cu fallback pe transport bazat pe WebSocket atunci când conexiunile peer-to-peer nu erau posibile.

## Detalii de implementare

Provocarea principală a fost obținerea unei latențe ultra-scăzute fără a sacrifica integritatea audio. Am proiectat un jitter buffer personalizat care echilibra latența în raport cu dropout-urile, cu setări configurabile care le permiteau utilizatorilor să aleagă între întârziere minimă pentru colaborare în timp real și buffere mai mari pentru monitorizare stabilă pe conexiuni nesigure. Sistemul a obținut constant sub 200ms latență end-to-end pe conexiuni broadband standard.

Suportul multi-canal a necesitat gestionare atentă a memoriei în plugin-ul C++. Streaming-ul a 128 de canale audio pe 32 de biți la 192kHz generează un throughput substanțial de date. Am implementat buffer pooling eficient și rutare audio zero-copy în interiorul plugin-ului pentru a menține utilizarea CPU sub 5% chiar și la numărul maxim de canale. Asta contează fiindcă plugin-ul rulează alături de lanțuri exigente de procesare audio.

Receptorul web a folosit Web Audio API pentru timing precis de redare și măsurarea nivelurilor. Am construit un decodor audio personalizat care gestiona comutarea seamless de codec atunci când expeditorul schimba setările de calitate în timpul sesiunii. Un sistem de management al sesiunilor le permitea expeditorilor să partajeze linkuri unice de ascultare, cu protecție opțională prin parolă și limite de ascultători pentru material confidențial.

Pentru aplicațiile iOS și Android, am folosit API-uri audio native ale platformei (Core Audio, respectiv AAudio) pentru a evita latența mai mare a framework-urilor cross-platform. Aplicațiile suportau ascultare în fundal, rutare AirPlay și Bluetooth, și afișau vizualizări waveform sincronizate cu stream-ul audio primit.

## Rezultate

ListenTo a devenit un instrument standard în industrie, adoptat de producători câștigători de Grammy, studiouri de înregistrare majore și facilități de broadcast din întreaga lume. Plugin-ul procesează milioane de minute de streaming lunar. Capacitatea de streaming lossless a acoperit în mod special un gol pe care niciun produs concurent nu-l adresa.',
  meta_title = 'Studiu de Caz AudioMovers ListenTo — Streaming Audio Profesional | ITGuys',
  meta_description = 'Cum am construit un plugin cross-platform de streaming audio în C++ cu WebRTC — 128 canale de audio lossless la 192kHz pentru studiouri profesionale din întreaga lume.'
WHERE project_id = (SELECT id FROM projects WHERE slug = 'audiomovers-listento') AND locale = 'ro';

UPDATE project_translations SET
  slug = 'audiomovers-listento',
  content = '## Contexte

AudioMovers devait résoudre un problème concret de la production audio professionnelle : comment permettre aux producteurs de musique, ingénieurs de mixage et professionnels du mastering de partager de l''audio haute fidélité avec leurs clients et collaborateurs partout dans le monde, directement depuis leur station de travail audionumérique (DAW). Les solutions existantes soit compressaient l''audio au point de le rendre inutile pour l''écoute critique, soit nécessitaient des configurations réseau complexes qui perturbaient le flux créatif.

ListenTo devait fonctionner comme plugin natif dans chaque DAW majeur : Pro Tools, Logic Pro, Ableton Live, Cubase et d''autres. Il devait supporter jusqu''à 128 canaux audio à des fréquences d''échantillonnage allant jusqu''à 192kHz. Le récepteur devait être accessible sur tout appareil sans installation de logiciel, faisant des navigateurs web le point d''écoute principal. Des applications natives iOS et Android complétaient le dispositif avec une flexibilité supplémentaire pour l''écoute mobile.

## Approche technique

Le plugin a été développé en C++ avec le framework JUCE, qui assurait la compatibilité multiplateforme macOS et Windows tout en supportant tous les formats majeurs de plugin : VST3, Audio Unit (AU) et AAX. JUCE gérait le pipeline de traitement audio bas niveau avec un overhead CPU minimal.

WebRTC constituait la couche de transport en temps réel, adaptée pour répondre aux exigences audio professionnelles qui vont bien au-delà de la communication voix ou vidéo classique. Nous avons implémenté une négociation de codec personnalisée capable de basculer entre AAC compressé pour le monitoring à faible bande passante et PCM sans perte 32 bits pour les sessions d''écoute critique. Le système de débit adaptatif surveillait en permanence les conditions réseau et ajustait la qualité sans artefacts audibles.

React alimentait l''application récepteur web. Le récepteur se connectait au flux du plugin via WebRTC, avec un repli sur un transport WebSocket lorsque les connexions peer-to-peer n''étaient pas possibles.

## Détails d''implémentation

Le défi principal était d''atteindre une latence ultra-faible tout en préservant l''intégrité audio. Nous avons conçu un tampon de gigue personnalisé qui équilibrait latence et coupures, avec des réglages configurables permettant aux utilisateurs de choisir entre un délai minimal pour la collaboration en temps réel et des tampons plus grands pour une écoute stable sur des connexions peu fiables. Le système atteignait systématiquement moins de 200ms de latence bout à bout sur des connexions haut débit standard.

Le support multicanal nécessitait une gestion mémoire minutieuse dans le plugin C++. Le streaming de 128 canaux audio 32 bits à 192kHz génère un débit de données considérable. Nous avons implémenté un pooling de tampons efficace et un routage audio sans copie au sein du plugin pour maintenir l''utilisation CPU sous 5 % même au nombre maximal de canaux. C''est important car le plugin fonctionne aux côtés de chaînes de traitement audio exigeantes.

Le récepteur web utilisait l''API Web Audio pour un timing de lecture précis et la mesure des niveaux. Nous avons construit un décodeur audio personnalisé gérant le changement de codec transparent lorsque l''expéditeur modifiait les paramètres de qualité en cours de session. Un système de gestion de sessions permettait aux expéditeurs de partager des liens d''écoute uniques, avec protection par mot de passe optionnelle et limite du nombre d''auditeurs pour les contenus confidentiels.

Pour les applications iOS et Android, nous avons utilisé les API audio natives des plateformes (Core Audio et AAudio respectivement) pour contourner la latence plus élevée des frameworks multiplateformes. Les apps supportaient l''écoute en arrière-plan, le routage AirPlay et Bluetooth, et affichaient des visualisations de forme d''onde synchronisées avec le flux audio entrant.

## Résultats

ListenTo est devenu un outil de référence dans l''industrie, adopté par des producteurs lauréats de Grammy, de grands studios d''enregistrement et des installations de diffusion à travers le monde. Le plugin traite des millions de minutes de streaming chaque mois. La capacité de streaming sans perte a notamment comblé un vide qu''aucun produit concurrent n''adressait.',
  meta_title = 'Étude de Cas AudioMovers ListenTo — Streaming Audio Professionnel | ITGuys',
  meta_description = 'Comment nous avons construit un plugin de streaming audio multiplateforme en C++ avec WebRTC — 128 canaux audio sans perte à 192kHz pour les studios professionnels du monde entier.'
WHERE project_id = (SELECT id FROM projects WHERE slug = 'audiomovers-listento') AND locale = 'fr';

UPDATE project_translations SET
  slug = 'audiomovers-listento',
  content = '## Hintergrund

AudioMovers musste ein konkretes Problem in der professionellen Audioproduktion lösen: Wie können Musikproduzenten, Mixing-Ingenieure und Mastering-Profis hochauflösendes Audio mit Kunden und Mitarbeitern überall auf der Welt teilen — direkt aus ihrer Digital Audio Workstation (DAW)? Bestehende Lösungen komprimierten den Ton so stark, dass er für kritisches Hören unbrauchbar wurde, oder erforderten komplexe Netzwerk-Setups, die den kreativen Workflow störten.

ListenTo musste als natives Plugin in jeder wichtigen DAW funktionieren: Pro Tools, Logic Pro, Ableton Live, Cubase und anderen. Es musste bis zu 128 Audio-Kanäle bei Abtastraten bis 192kHz unterstützen. Die Empfängerseite musste auf jedem Gerät ohne Softwareinstallation zugänglich sein, weshalb Webbrowser der primäre Abhörpunkt waren. Native iOS- und Android-Apps ergänzten das Ganze mit zusätzlicher Flexibilität für mobiles Monitoring.

## Technischer Ansatz

Das Plugin wurde in C++ mit dem JUCE-Framework entwickelt, das plattformübergreifende Kompatibilität für macOS und Windows bot und alle gängigen Plugin-Formate unterstützte: VST3, Audio Unit (AU) und AAX. JUCE übernahm die Low-Level-Audio-Verarbeitung mit minimalem CPU-Overhead.

WebRTC bildete die Echtzeit-Transportschicht, angepasst an professionelle Audio-Anforderungen, die weit über typische Sprach- oder Videokommunikation hinausgehen. Wir implementierten eine benutzerdefinierte Codec-Aushandlung, die zwischen komprimiertem AAC für bandbreitensparendes Monitoring und verlustfreiem 32-Bit-PCM für kritische Hörsessions umschalten konnte. Das adaptive Bitraten-System überwachte kontinuierlich die Netzwerkbedingungen und passte die Qualität ohne hörbare Artefakte an.

React trieb die webbasierte Empfänger-Anwendung an. Der Empfänger verband sich über WebRTC mit dem Stream des Plugins, mit Fallback auf WebSocket-basierten Transport, wenn Peer-to-Peer-Verbindungen nicht möglich waren.

## Implementierungsdetails

Die zentrale Herausforderung war ultraniedrige Latenz bei gleichzeitiger Wahrung der Audioqualität. Wir entwickelten einen benutzerdefinierten Jitter-Buffer, der Latenz gegen Aussetzer abwog, mit konfigurierbaren Einstellungen, die es den Nutzern ermöglichten, zwischen minimaler Verzögerung für Echtzeit-Zusammenarbeit und größeren Puffern für stabiles Monitoring über unzuverlässige Verbindungen zu wählen. Das System erreichte konstant unter 200ms Ende-zu-Ende-Latenz über Standard-Breitband.

Mehrkanal-Support erforderte sorgfältiges Speichermanagement im C++-Plugin. Das Streaming von 128 Kanälen 32-Bit-Audio bei 192kHz erzeugt einen erheblichen Datendurchsatz. Wir implementierten effizientes Buffer-Pooling und Zero-Copy-Audio-Routing innerhalb des Plugins, um die CPU-Auslastung selbst bei maximaler Kanalzahl unter 5 % zu halten. Das ist wichtig, weil das Plugin neben anspruchsvollen Audio-Verarbeitungsketten läuft.

Der Web-Empfänger nutzte die Web Audio API für präzises Wiedergabe-Timing und Pegelmessung. Wir bauten einen benutzerdefinierten Audio-Decoder, der nahtloses Codec-Switching handhabte, wenn der Sender die Qualitätseinstellungen während einer Session änderte. Ein Session-Management-System ermöglichte es Sendern, einzigartige Hör-Links zu teilen, mit optionalem Passwortschutz und Hörerlimits für vertrauliches Material.

Für die iOS- und Android-Apps verwendeten wir plattformnative Audio-APIs (Core Audio bzw. AAudio), um die höhere Latenz plattformübergreifender Frameworks zu umgehen. Die Apps unterstützten Hintergrund-Wiedergabe, AirPlay- und Bluetooth-Routing und zeigten Wellenform-Visualisierungen synchron zum eingehenden Audio-Stream an.

## Ergebnisse

ListenTo wurde zum Branchenstandard-Tool, eingesetzt von Grammy-preisgekrönten Produzenten, großen Aufnahmestudios und Broadcast-Einrichtungen weltweit. Das Plugin verarbeitet monatlich Millionen Streaming-Minuten. Insbesondere die verlustfreie Streaming-Fähigkeit füllte eine Lücke, die kein Konkurrenzprodukt adressierte.',
  meta_title = 'AudioMovers ListenTo Fallstudie — Professionelles Audio-Streaming | ITGuys',
  meta_description = 'Wie wir ein plattformübergreifendes Audio-Streaming-Plugin in C++ mit WebRTC bauten — 128 Kanäle verlustfreies Audio bei 192kHz für professionelle Studios weltweit.'
WHERE project_id = (SELECT id FROM projects WHERE slug = 'audiomovers-listento') AND locale = 'de';

UPDATE project_translations SET
  slug = 'audiomovers-listento',
  content = '## Contesto

AudioMovers doveva risolvere un problema concreto della produzione audio professionale: come permettere a produttori musicali, ingegneri di mixaggio e professionisti del mastering di condividere audio ad alta fedeltà con clienti e collaboratori ovunque nel mondo, direttamente dalla loro workstation audio digitale (DAW). Le soluzioni esistenti comprimevano l''audio al punto da renderlo inutile per l''ascolto critico, oppure richiedevano configurazioni di rete complesse che interrompevano il flusso creativo.

ListenTo doveva funzionare come plugin nativo in ogni DAW importante: Pro Tools, Logic Pro, Ableton Live, Cubase e altri. Doveva supportare fino a 128 canali audio a frequenze di campionamento fino a 192kHz. Il ricevitore doveva essere accessibile su qualsiasi dispositivo senza installare software, rendendo i browser web il punto di ascolto principale. Le app native iOS e Android avrebbero fornito flessibilità aggiuntiva per il monitoraggio mobile.

## Approccio tecnico

Il plugin è stato sviluppato in C++ con il framework JUCE, che garantiva compatibilità cross-platform su macOS e Windows supportando tutti i principali formati plugin: VST3, Audio Unit (AU) e AAX. JUCE gestiva la pipeline di elaborazione audio a basso livello con un overhead CPU minimo.

WebRTC costituiva il livello di trasporto in tempo reale, adattato per gestire requisiti audio professionali che vanno ben oltre la tipica comunicazione voce o video. Abbiamo implementato una negoziazione codec personalizzata in grado di commutare tra AAC compresso per il monitoring a bassa larghezza di banda e PCM lossless a 32 bit per sessioni di ascolto critico. Il sistema di bitrate adattivo monitorava continuamente le condizioni della rete e regolava la qualità senza artefatti udibili.

React alimentava l''applicazione ricevitore web. Il ricevitore si collegava allo stream del plugin tramite WebRTC, con fallback su trasporto basato su WebSocket quando le connessioni peer-to-peer non erano possibili.

## Dettagli di implementazione

La sfida principale era raggiungere una latenza ultra-bassa mantenendo l''integrità audio. Abbiamo progettato un jitter buffer personalizzato che bilanciava latenza e dropout, con impostazioni configurabili che permettevano agli utenti di scegliere tra ritardo minimo per la collaborazione in tempo reale e buffer più ampi per un monitoraggio stabile su connessioni inaffidabili. Il sistema raggiungeva costantemente meno di 200ms di latenza end-to-end su connessioni broadband standard.

Il supporto multicanale richiedeva una gestione attenta della memoria nel plugin C++. Lo streaming di 128 canali audio a 32 bit a 192kHz genera un throughput di dati sostanziale. Abbiamo implementato buffer pooling efficiente e routing audio zero-copy all''interno del plugin per mantenere l''uso CPU sotto il 5% anche al massimo numero di canali. Questo è importante perché il plugin funziona accanto a catene di elaborazione audio impegnative.

Il ricevitore web utilizzava la Web Audio API per un timing di riproduzione preciso e la misurazione dei livelli. Abbiamo costruito un decoder audio personalizzato che gestiva la commutazione codec trasparente quando il mittente modificava le impostazioni di qualità durante la sessione. Un sistema di gestione sessioni permetteva ai mittenti di condividere link di ascolto unici, con protezione opzionale tramite password e limiti di ascoltatori per il materiale riservato.

Per le app iOS e Android, abbiamo utilizzato API audio native della piattaforma (Core Audio e AAudio rispettivamente) per aggirare la latenza più alta dei framework cross-platform. Le app supportavano l''ascolto in background, il routing AirPlay e Bluetooth, e mostravano visualizzazioni della forma d''onda sincronizzate con lo stream audio in arrivo.

## Risultati

ListenTo è diventato uno strumento di riferimento nel settore, adottato da produttori vincitori di Grammy, grandi studi di registrazione e strutture broadcast in tutto il mondo. Il plugin elabora milioni di minuti di streaming ogni mese. La capacità di streaming lossless ha colmato in particolare una lacuna che nessun prodotto concorrente affrontava.',
  meta_title = 'Caso Studio AudioMovers ListenTo — Streaming Audio Professionale | ITGuys',
  meta_description = 'Come abbiamo costruito un plugin cross-platform di streaming audio in C++ con WebRTC — 128 canali audio lossless a 192kHz per studi professionali in tutto il mondo.'
WHERE project_id = (SELECT id FROM projects WHERE slug = 'audiomovers-listento') AND locale = 'it';

UPDATE project_translations SET
  slug = 'audiomovers-listento',
  content = '## Contexto

AudioMovers necesitaba resolver un problema concreto en la producción de audio profesional: cómo permitir a productores musicales, ingenieros de mezcla y profesionales de mastering compartir audio de alta fidelidad con clientes y colaboradores en cualquier parte del mundo, directamente desde su estación de trabajo de audio digital (DAW). Las soluciones existentes o comprimían el audio hasta hacerlo inútil para la escucha crítica, o requerían configuraciones de red complejas que interrumpían el flujo creativo.

ListenTo debía funcionar como plugin nativo en cada DAW importante: Pro Tools, Logic Pro, Ableton Live, Cubase y otros. Necesitaba soportar hasta 128 canales de audio a tasas de muestreo de hasta 192kHz. El receptor debía ser accesible en cualquier dispositivo sin instalar software, por lo que los navegadores web eran el punto de escucha principal. Las apps nativas de iOS y Android proporcionarían flexibilidad adicional para el monitoreo móvil.

## Enfoque técnico

El plugin fue desarrollado en C++ usando el framework JUCE, que proporcionaba compatibilidad multiplataforma en macOS y Windows con soporte para todos los formatos principales de plugin: VST3, Audio Unit (AU) y AAX. JUCE se encargaba del pipeline de procesamiento de audio de bajo nivel con un overhead de CPU mínimo.

WebRTC fue la capa de transporte en tiempo real, adaptada para manejar requisitos de audio profesional que van mucho más allá de la comunicación típica de voz o video. Implementamos negociación de codec personalizada que podía alternar entre AAC comprimido para monitoreo de bajo ancho de banda y PCM lossless de 32 bits para sesiones de escucha crítica. El sistema de bitrate adaptativo monitoreaba continuamente las condiciones de red y ajustaba la calidad sin artefactos audibles.

React impulsaba la aplicación receptora web. El receptor se conectaba al stream del plugin vía WebRTC, con fallback a transporte basado en WebSocket cuando las conexiones peer-to-peer no eran posibles.

## Detalles de implementación

El desafío central fue lograr latencia ultra-baja manteniendo la integridad del audio. Diseñamos un jitter buffer personalizado que equilibraba latencia contra cortes, con ajustes configurables que permitían a los usuarios elegir entre retraso mínimo para colaboración en tiempo real y buffers más grandes para monitoreo estable en conexiones poco fiables. El sistema lograba consistentemente menos de 200ms de latencia extremo a extremo en conexiones de banda ancha estándar.

El soporte multicanal requirió gestión cuidadosa de memoria en el plugin C++. El streaming de 128 canales de audio de 32 bits a 192kHz genera un throughput de datos sustancial. Implementamos buffer pooling eficiente y enrutamiento de audio zero-copy dentro del plugin para mantener el uso de CPU por debajo del 5% incluso con el máximo de canales. Esto importa porque el plugin funciona junto a cadenas exigentes de procesamiento de audio.

El receptor web usaba la Web Audio API para timing preciso de reproducción y medición de niveles. Construimos un decodificador de audio personalizado que gestionaba el cambio transparente de codec cuando el emisor modificaba los ajustes de calidad durante la sesión. Un sistema de gestión de sesiones permitía a los emisores compartir enlaces de escucha únicos, con protección opcional por contraseña y límites de oyentes para material confidencial.

Para las apps de iOS y Android, utilizamos APIs de audio nativas de la plataforma (Core Audio y AAudio respectivamente) para evitar la mayor latencia de los frameworks multiplataforma. Las apps soportaban escucha en segundo plano, enrutamiento AirPlay y Bluetooth, y mostraban visualizaciones de forma de onda sincronizadas con el stream de audio entrante.

## Resultados

ListenTo se convirtió en una herramienta de referencia en la industria, adoptada por productores ganadores de Grammy, grandes estudios de grabación e instalaciones de broadcast en todo el mundo. El plugin procesa millones de minutos de streaming cada mes. La capacidad de streaming lossless cubrió en particular un vacío que ningún producto competidor abordaba.',
  meta_title = 'Caso de Estudio AudioMovers ListenTo — Streaming de Audio Profesional | ITGuys',
  meta_description = 'Cómo construimos un plugin multiplataforma de streaming de audio en C++ con WebRTC — 128 canales de audio lossless a 192kHz para estudios profesionales de todo el mundo.'
WHERE project_id = (SELECT id FROM projects WHERE slug = 'audiomovers-listento') AND locale = 'es';
