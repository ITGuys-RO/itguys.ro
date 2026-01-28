-- Spanish translations for service long descriptions

-- Technical Consulting
UPDATE service_translations SET long_description = '## Cómo trabajamos realmente

Cada recomendación que hacemos viene de nuestra experiencia construyendo y escalando sistemas en EA, TUI y Nagarro. No frameworks que leímos - cosas que entregamos.

### El proceso

Empezamos entendiendo tu situación. ¿Qué estás construyendo? ¿Qué restricciones existen? ¿Qué funcionó antes y qué no? Esto moldea todo lo que sigue.

Luego miramos tus sistemas. Identificamos cuellos de botella, mapeamos dependencias y te damos una imagen clara de dónde estás. Sin sorpresas.

Desde ahí, creamos un plan priorizado. No un documento de 100 páginas que se queda en el estante - pasos concretos con resultados claros.

### Problemas que vemos regularmente

La mayoría de las empresas con las que trabajamos están atascadas en uno de estos:

Tienen demasiadas opciones tecnológicas y no suficiente claridad sobre los compromisos. Construyeron algo que funcionaba con 1.000 usuarios pero lucha con 100.000. Las soluciones rápidas se convirtieron en problemas permanentes y ahora el código es un desastre. Sus procesos y herramientas ralentizan la entrega en lugar de ayudar. O tomaron decisiones de arquitectura hace años que ahora crean vulnerabilidades de seguridad.

### Quién nos contrata

CTOs en su primer puesto que necesitan orientación experimentada. Toman decisiones de arquitectura, construyen equipos y eligen tecnologías - a menudo por primera vez a esta escala.

Empresas que modernizan sistemas legacy. Necesitan a alguien que evalúe lo que tienen, decida qué mantener vs reemplazar, y planifique la transición sin romper todo.

Inversores haciendo due diligence técnico. Quieren una evaluación honesta del código, la infraestructura y el equipo antes de firmar el cheque.

### Lo que obtienes

Recomendaciones claras sobre las que puedes actuar. Documentación que tu equipo realmente usará. Soporte de seguimiento mientras implementas los cambios. Acceso directo a ingenieros que han resuelto problemas similares a gran escala.' WHERE service_id = 1 AND locale = 'es';

-- Security Services
UPDATE service_translations SET long_description = '## Seguridad de personas que han estado en ambos lados

Nuestro equipo de seguridad hizo pruebas de penetración en EA y protección DDoS en TUI. Hemos visto cómo piensan los atacantes porque hemos trabajado tanto en ataque como en defensa.

### Lo que hacemos

Intentamos penetrar tus sistemas como lo harían atacantes reales - aplicaciones web, APIs, apps móviles, infraestructura. Recibes un informe detallado de lo que encontramos y exactamente cómo arreglarlo.

Para auditorías de seguridad, examinamos código, configuraciones, procesos y arquitectura. No cumplimiento de casillas. Buscamos problemas que los escáneres automáticos no detectan.

Auditamos configuraciones de AWS, Azure y GCP por errores de configuración, permisos excesivos y brechas de cumplimiento. Demasiadas violaciones empiezan con un solo bucket S3 configurado como público.

Para protección DDoS, configuramos y optimizamos Cloudflare, Akamai o AWS Shield. Rate limiting, reglas WAF, planificación de respuesta a incidentes. Basado en proteger sitios de alto tráfico en TUI durante la temporada alta.

### Cómo funciona un pentest

Definimos el alcance juntos - qué está incluido, qué métodos usaremos, qué necesitas preparar. Luego recopilamos información como lo haría un atacante. Las pruebas activas ocurren dentro de los límites acordados. Verificamos los hallazgos y evaluamos el riesgo real, no el impacto teórico. Recibes documentación clara con pasos de reproducción. Nos quedamos para ayudar a tu equipo a entender y arreglar lo que encontramos.

### Lo que típicamente encontramos

Bypasses de autenticación y problemas de gestión de sesiones. Vulnerabilidades de inyección - SQL, NoSQL, inyección de comandos. Referencias directas inseguras donde usuarios pueden acceder a datos de otros. Problemas de API como autenticación rota o exposición excesiva de datos. Errores de configuración cloud - buckets públicos, roles IAM demasiado permisivos. Sistemas sin parchear y protocolos débiles.

### Industrias que conocemos bien

Gaming - consideraciones anti-cheat, seguridad de cuentas, protección de economía in-game. Viajes - cumplimiento PCI, seguridad de sistemas de reservas, integraciones API. Salud - cumplimiento HIPAA, protección PHI, audit logging. Finanzas - preparación SOC 2, seguridad de transacciones, prevención de fraude.' WHERE service_id = 2 AND locale = 'es';

-- Big Data & Analytics
UPDATE service_translations SET long_description = '## Transformando datos en decisiones

Los datos crudos que están en una base de datos son inútiles. Te ayudamos a transformarlos en insights que cambian cómo operas.

### Lo que construimos

Dashboards personalizados con visibilidad en tiempo real sobre las métricas que importan para tu negocio. No templates genéricos - dashboards diseñados alrededor de tus KPIs específicos y cómo tu equipo realmente trabaja.

Pipelines de datos que recolectan, transforman y cargan datos de múltiples fuentes. Manejamos streaming, procesamiento batch y enfoques híbridos según lo que necesites.

Analytics predictivo cuando el caso de negocio existe. Modelos de machine learning que ayudan a anticipar tendencias, identificar riesgos y optimizar operaciones. Nos enfocamos en modelos interpretables - no cajas negras en las que nadie confía.

Reporting self-service para que tu equipo pueda responder sus propias preguntas. Ponemos los cimientos para que no dependas de ingenieros para cada informe.

### Nuestro enfoque

Empezamos con las decisiones que estás tratando de tomar. ¿Qué cambiaría si tuvieras información perfecta? Trabajamos hacia atrás desde resultados de negocio hasta requisitos de datos.

Entregamos dashboards funcionales temprano. Empiezas a recibir valor inmediatamente mientras expandimos las capacidades. Nada de proyectos de seis meses que entregan todo al final.

Dedicamos tiempo a la calidad de datos porque el analytics es tan bueno como los datos subyacentes. Validación, governance, monitoring.

### Herramientas

Visualización: Grafana, Metabase, Apache Superset, dashboards D3.js personalizados cuando necesitas algo específico.

Procesamiento: Apache Spark, Apache Kafka, dbt, Airflow.

Almacenamiento: PostgreSQL, ClickHouse, BigQuery, Snowflake - depende de tu volumen y patrones de consulta.

### Casos de uso construidos

Funnels de conversión e-commerce y cálculos de customer lifetime value. Analytics de uso SaaS y predicción de churn. Monitoring de operaciones y análisis de costos. Atribución de campañas de marketing y análisis de tests A/B.

### Por qué nosotros

Somos ingenieros primero. Entendemos cómo se generan los datos, de dónde vienen los problemas de calidad y cómo construir sistemas que escalan. No solo hacemos gráficos - construimos infraestructura de datos confiable.' WHERE service_id = 3 AND locale = 'es';

-- QA & Testing Services
UPDATE service_translations SET long_description = '## Encontrando bugs antes que tus usuarios

Pruebas manuales, pruebas automatizadas, pruebas de rendimiento - lo que sea necesario para entregar con confianza.

### Lo que hacemos

Pruebas exploratorias por ingenieros QA experimentados que piensan como usuarios. Encontramos los casos límite que las pruebas automatizadas no detectan.

Automatización de pruebas con Selenium, Cypress o Playwright para web. Appium para móvil. Construimos suites de pruebas que corren de forma confiable y dan feedback rápido - no pruebas inestables que se ignoran.

Load testing con JMeter, k6 o Gatling. Identificamos cuellos de botella antes de que se conviertan en caídas. Sabrás exactamente cómo se comporta tu sistema a 10x tu tráfico actual.

Pruebas de API para REST y GraphQL. Contract testing, integration testing, security testing para servicios backend.

Cobertura OWASP Top 10 integrada en tu proceso de pruebas. Atrapamos vulnerabilidades comunes durante el desarrollo, no después del deployment.

### Cómo trabajamos

Analizamos tu aplicación para identificar caminos críticos, áreas de alto riesgo y prioridades de prueba. No todo necesita el mismo nivel de cobertura.

Creamos casos de prueba que cubren requisitos funcionales, casos límite y escenarios de usuario reales. Pruebas que aportan valor real, no solo números de cobertura.

Las pruebas ocurren continuamente, no solo antes de los releases. Nos integramos con tu pipeline CI/CD.

Los reportes de bugs incluyen pasos de reproducción, evaluación de severidad y sugerencias de fix. Nada de descripciones vagas que hacen perder tiempo a los desarrolladores.

### Herramientas

Automatización web: Selenium, Cypress, Playwright, Puppeteer
Móvil: Appium, XCTest, Espresso
Rendimiento: JMeter, k6, Gatling, Locust
APIs: Postman, REST Assured, Karate
CI/CD: GitHub Actions, GitLab CI, Jenkins

### Cuándo nos llaman los clientes

Antes de lanzamientos de producto para asegurar calidad. Durante proyectos de migración para verificar que nada se rompa. Para soporte QA continuo junto a su equipo de desarrollo. Para construir pruebas automatizadas desde cero. Para arreglar un proceso de pruebas que no funciona.

### Entregables

Planes de prueba y documentación de casos de prueba. Suites de pruebas automatizadas con documentación de mantenimiento. Benchmarks de rendimiento y recomendaciones. Reportes de bugs con ratings de severidad. Dashboards de métricas de pruebas.' WHERE service_id = 4 AND locale = 'es';

-- AI & Machine Learning
UPDATE service_translations SET long_description = '## IA que funciona en producción

Construimos sistemas de machine learning que entregan valor - no demos impresionantes que se desmoronan cuando intentas deployarlos.

### Lo que construimos

Clasificación de texto, análisis de sentimiento, extracción de entidades, comprensión de documentos. Procesamiento de texto no estructurado a escala.

Clasificación de imágenes, detección de objetos, OCR, sistemas de inspección visual. Desde control de calidad en líneas de producción hasta procesamiento de documentos.

Motores de recomendación que aprenden del comportamiento de usuarios. Recomendaciones de productos, sugerencias de contenido, precios dinámicos.

Pronósticos, detección de anomalías, scoring de riesgo. Modelos que te ayudan a anticipar problemas antes de que ocurran.

### Nuestro enfoque

No todos los problemas necesitan IA. Empezamos entendiendo qué estás tratando de lograr y si machine learning es realmente el enfoque correcto. A veces un motor de reglas es mejor.

Los modelos ML son tan buenos como sus datos de entrenamiento. Evaluamos qué datos tienes, qué necesitas y cómo manejar las brechas antes de escribir código.

Construimos modelos simples primero, validamos que funcionan, luego aumentamos la complejidad si es necesario. Ves resultados temprano y puedes corregir el rumbo.

Un modelo no es útil hasta que está deployado. Nos encargamos de la ingeniería para que ML funcione de forma confiable en producción - monitoring, pipelines de re-entrenamiento, detección de drift.

### Stack técnico

Frameworks: PyTorch, TensorFlow, scikit-learn, Hugging Face
MLOps: MLflow, Kubeflow, pipelines de deployment personalizados
Infraestructura: Clusters GPU, AWS SageMaker, Google Vertex AI
LLMs: Fine-tuning, sistemas RAG, prompt engineering

### Casos de uso entregados

Chatbots de servicio al cliente y clasificación de tickets. Extracción de facturas y análisis de contratos. Inspección visual para defectos de fabricación. Recomendaciones de productos para e-commerce. Pronóstico de demanda y optimización de inventario.

### Lo que nos diferencia

Somos pragmáticos con la IA. No recomendaremos deep learning cuando regresión logística es suficiente. Nos enfocamos en soluciones que son mantenibles, explicables y que realmente mueven tus métricas de negocio.' WHERE service_id = 5 AND locale = 'es';

-- Web Applications
UPDATE service_translations SET long_description = '## Aplicaciones web que funcionan bajo presión

Desde herramientas internas hasta plataformas para clientes, construimos aplicaciones web que rinden y escalan.

### Lo que construimos

Single page applications con React y Next.js. Rápidas, responsivas, optimizadas para navegadores modernos.

Progressive web apps que funcionan offline, envían notificaciones push y se sienten como apps nativas. El alcance de la web con capacidades de app.

Paneles de admin y herramientas internas que hacen a tu equipo más productivo. Construimos interfaces que son rápidas de usar, no solo rápidas de construir.

Productos SaaS con autenticación, facturación y la infraestructura para escalar. Hemos construido productos que sirven a miles de usuarios simultáneos.

E-commerce personalizado con gestión de inventario y flujos de checkout. Integrado con procesadores de pago y servicios de envío.

### Stack tecnológico

Frontend: React, Next.js, TypeScript, Tailwind CSS. State management con Zustand o React Query. Testing con Playwright y Jest.

Backend: Node.js, Python, PHP (Laravel). PostgreSQL, MySQL, MongoDB. Redis para caching y colas. APIs GraphQL o REST.

Infraestructura: Cloudflare Workers, AWS, Vercel. Docker y Kubernetes cuando es necesario. CI/CD con GitHub Actions.

### Cómo trabajamos

Empezamos entendiendo requisitos, necesidades de usuario y restricciones. Luego wireframes, prototipos y arquitectura técnica.

El desarrollo ocurre en sprints iterativos con demos regulares. Ves progreso semanalmente, no mensualmente.

Pruebas automatizadas, review de seguridad y optimización de rendimiento antes del lanzamiento.

Setup de CI/CD, monitoring y documentación. Luego mantenimiento continuo y desarrollo de features si lo necesitas.

### Lo que obtienes

Código limpio y mantenible con documentación. Pipelines de deployment automatizados. Setup de monitoring y alertas. Optimización de rendimiento. Mejores prácticas de seguridad integradas. Transferencia de conocimiento para que tu equipo pueda mantener.' WHERE service_id = 6 AND locale = 'es';

-- Mobile Applications
UPDATE service_translations SET long_description = '## Apps móviles nativas

Construimos apps nativas reales - Swift para iOS, Kotlin para Android. Nuestro equipo móvil tiene 10+ años en Nagarro y Enea AB, construyendo apps usadas por millones.

### Por qué nativo

Las apps nativas son más rápidas. Sin bridge JavaScript, sin compromiso. Tus usuarios sienten la diferencia, especialmente en dispositivos más antiguos.

Acceso completo a las capacidades de iOS y Android. Cámara, sensores, datos de salud, pagos - lo que sea que ofrezca la plataforma, podemos usarlo.

Las apps nativas respetan las convenciones de la plataforma. Los usuarios de iOS obtienen una experiencia iOS. Los usuarios de Android obtienen una experiencia Android. Esto importa más de lo que la mayoría se da cuenta.

Las actualizaciones de plataforma no rompen tu app. No estás esperando a un equipo de framework para soportar las últimas características del OS.

### Lo que construimos

Apps de consumidor que necesitan ser rápidas y confiables. Características sociales, reproducción de medios, soporte offline.

Apps enterprise - herramientas internas, aplicaciones de servicio de campo, productos B2B. Seguridad, integración MDM, requisitos corporativos.

Apps companion IoT con conectividad Bluetooth y gestión de dispositivos. Hemos construido apps para dispositivos médicos, sensores industriales y electrónica de consumo.

Experiencias de compra nativas con checkout fluido, notificaciones push y personalización.

### Cómo trabajamos

Definimos características, creamos wireframes y planificamos el journey del usuario. Consideramos ambas plataformas desde el inicio.

Desarrollo iOS y Android en paralelo con patrones de arquitectura compartidos. Builds regulares para pruebas y feedback.

Pruebas en dispositivos con múltiples tamaños de pantalla y versiones de OS. Profiling de rendimiento y optimización de memoria.

Manejamos el envío a App Store y Play Store, respondemos al feedback de review y obtenemos la aprobación de tu app.

Actualizaciones de OS, correcciones de bugs, adiciones de características. Mantenemos apps por años.

### Capacidades técnicas

iOS: Swift, SwiftUI, UIKit, Core Data, HealthKit, ARKit
Android: Kotlin, Jetpack Compose, Room, WorkManager
Backend: REST, GraphQL, WebSockets, gRPC
Push: Firebase, APNs, soluciones personalizadas
Analytics: Firebase Analytics, Mixpanel, tracking personalizado

### Industrias

Apps de salud (conformes con HIPAA). IoT industrial (datos de sensores en tiempo real). E-commerce (transacciones de alto volumen). Viajes (requisitos offline-first). Finanzas (críticas para la seguridad).' WHERE service_id = 7 AND locale = 'es';

-- DevOps & Cloud Infrastructure
UPDATE service_translations SET long_description = '## Infraestructura que escala

Construimos infraestructura cloud en AWS que maneja el crecimiento, resiste ataques y no te mantiene despierto por la noche.

### Lo que hacemos

Diseño e implementación de infraestructura AWS. VPCs, load balancers, auto-scaling groups, servicios gestionados. Configurados para seguridad y eficiencia de costos.

Deployments de Docker y Kubernetes cuando los necesitas. Containerización, orquestación, gestión de recursos.

Workflows automatizados de build, test y deployment. GitHub Actions, GitLab CI o AWS CodePipeline - configurados para releases rápidos y seguros.

Terraform y CloudFormation para infraestructura reproducible. No más configuración manual o cambios no documentados.

Monitoring con Prometheus, Grafana y CloudWatch. Alertas que te avisan de problemas antes de que los usuarios noten.

### Cómo pensamos

Cada decisión de infraestructura considera la seguridad. Acceso de mínimo privilegio, encriptación en reposo y en tránsito, segmentación de red.

Diseñamos para eficiencia. Reserved instances, spot instances, right-sizing. Te ayudamos a evitar el shock de la factura cloud.

Deployments multi-AZ, failover automático, planificación de disaster recovery. Construimos para escenarios de fallo porque ocurren.

Cada sistema viene con runbooks, diagramas de arquitectura y procedimientos operativos. Tu equipo puede gestionar sin nosotros.

### Proyectos comunes

Migración cloud desde on-premises a AWS. Adopción de Kubernetes para aplicaciones que lo necesitan. Implementación de CI/CD. Hardening de seguridad para requisitos de cumplimiento. Reducción de costos en deployments cloud existentes. Implementación de disaster recovery.

### Tecnologías

Cloud: AWS (principal), GCP, Cloudflare
Containers: Docker, Kubernetes, ECS, EKS
IaC: Terraform, CloudFormation, Pulumi
CI/CD: GitHub Actions, GitLab CI, ArgoCD
Monitoring: Prometheus, Grafana, CloudWatch, Datadog
Seguridad: AWS IAM, Vault, SOPS, security scanning

### Entregables

Documentación de arquitectura con diagramas. Repositorios Infrastructure as Code. Dashboards de monitoring y alertas. Runbooks para operaciones comunes. Review y recomendaciones de seguridad. Análisis y optimización de costos.' WHERE service_id = 8 AND locale = 'es';

-- Backend, APIs & Integrations
UPDATE service_translations SET long_description = '## Sistemas backend que funcionan

Construimos sistemas del lado servidor que alimentan aplicaciones. APIs, microservicios, bases de datos, integraciones - diseñados para confiabilidad y rendimiento.

### Lo que construimos

APIs RESTful que los equipos frontend y móvil adoran. Autenticación correcta, rate limiting, manejo de errores, documentación.

Servicios GraphQL cuando los clientes necesitan flexibilidad. Diseño de schema, resolvers, optimización de rendimiento.

Microservicios cuando los monolitos necesitan dividirse. Límites de servicios, comunicación inter-servicios, gestión de la complejidad.

Integraciones de terceros. Procesadores de pago, CRMs, ERPs, proveedores de envío - conectamos tu sistema a servicios externos.

Procesamiento en background. Colas de jobs, tareas programadas, procesamiento event-driven. Sistemas que manejan trabajo de forma confiable sin bloquear las peticiones de usuario.

### Cómo trabajamos

Diseñamos APIs antes de implementarlas. Contratos claros, patrones consistentes, documentación desde el inicio.

Autenticación, autorización, validación de input, rate limiting integrados desde el día uno. No añadidos después.

Optimización de queries de base de datos, estrategias de caching, connection pooling. Medimos y optimizamos antes de que ocurran problemas.

Logging, métricas y tracing que te ayudan a entender qué está pasando en producción. El debugging no debería ser adivinar.

### Tecnologías

Lenguajes: Node.js (Express, Fastify, NestJS), Python (FastAPI, Django), PHP (Laravel), Go para servicios críticos en rendimiento.

Bases de datos: PostgreSQL, MySQL para relacional. MongoDB, DynamoDB para documentos. Redis para caching y colas. Elasticsearch para búsqueda.

Colas de mensajes: RabbitMQ, AWS SQS, Redis Streams, Kafka.

Herramientas API: Documentación OpenAPI/Swagger, GraphQL con Apollo, gRPC para servicios internos.

### Integraciones comunes

Procesamiento de pagos: Stripe, PayPal, Adyen, métodos de pago locales.
Autenticación: Proveedores OAuth, SSO, identity management.
Comunicación: Email (SendGrid, SES), SMS (Twilio), notificaciones push.
Almacenamiento: S3, Cloudflare R2, integración CDN.
Analytics: Segment, Mixpanel, tracking de eventos personalizado.

### Entregables

APIs bien documentadas con specs OpenAPI. Tests de integración y entornos de prueba. Configuraciones de deployment y CI/CD. Monitoring y alertas. Benchmarks de rendimiento. Documentación de review de seguridad.' WHERE service_id = 9 AND locale = 'es';

-- Database Design & Management
UPDATE service_translations SET long_description = '## Bases de datos que se mantienen rápidas

Los datos son el fundamento de tu aplicación. Diseñamos schemas, optimizamos queries y construimos arquitecturas de datos que manejan el crecimiento.

### Lo que hacemos

Modelado de datos que refleja tu dominio de negocio. Estructuras normalizadas para integridad, desnormalizadas donde el rendimiento lo requiere.

Queries lentas identificadas y arregladas. Estrategias de indexación, reescritura de queries, análisis de planes de ejecución. Hacemos las bases de datos rápidas.

Migración entre sistemas o versiones de base de datos sin pérdida de datos. Migraciones que no requieren downtime extendido.

Cuando las bases de datos de servidor único no son suficientes - read replicas, setups master-master, sharding horizontal.

Backups automatizados, point-in-time recovery, pruebas de disaster recovery. Tus datos sobreviven a fallos de hardware y errores humanos.

### Tecnologías de base de datos

Relacional: PostgreSQL (nuestra recomendación por defecto), MySQL/MariaDB, Amazon RDS y Aurora.

Documento: MongoDB, Amazon DynamoDB, Couchbase.

Búsqueda y analytics: Elasticsearch, ClickHouse, TimescaleDB.

Caching: Redis, Memcached.

### Cómo pensamos

Empezamos con los patrones de acceso. ¿Cómo se escribirán tus datos? ¿Cómo se leerán? Las respuestas determinan el diseño del schema y las elecciones tecnológicas.

No adivinamos los problemas de rendimiento. Medimos tiempos de query, analizamos planes de ejecución y arreglamos los cuellos de botella reales.

Lo que funciona a 1.000 filas puede fallar a 1.000.000. Diseñamos con tu trayectoria de crecimiento en mente.

No usamos características complejas a menos que sean necesarias. Los schemas simples son más fáciles de entender, mantener y optimizar.

### Proyectos comunes

Optimización de rendimiento - arreglar queries lentas y cuellos de botella de base de datos. Rediseño de schema para bases de datos que crecieron orgánicamente. Migración tecnológica - MySQL a PostgreSQL, SQL a NoSQL. Escalado con read replicas, connection pooling, capas de caching. Modelado de datos para nuevas aplicaciones. Cumplimiento - audit logging, encriptación, controles de acceso.

### Entregables

Diagramas entidad-relación y documentación de schema. Análisis de queries y recomendaciones de optimización. Scripts de migración y procedimientos de rollback. Dashboards de monitoring para salud de base de datos. Runbooks de backup y recovery. Benchmarks y baselines de rendimiento.' WHERE service_id = 10 AND locale = 'es';
