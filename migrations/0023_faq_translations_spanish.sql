-- Spanish translations for FAQ items

-- Security FAQs
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'security-pentest-frequency'), 'es',
'¿Con qué frecuencia deberíamos hacer pruebas de penetración?',
'Mínimo una vez al año, más después de cualquier cambio importante en tu aplicación o infraestructura. Si manejas pagos, datos de salud o información financiera, trimestral es mejor. Y siempre antes de un lanzamiento grande - no quieres enterarte de las vulnerabilidades por tus usuarios.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'security-pentest-duration'), 'es',
'¿Cuánto dura una prueba de penetración?',
'La mayoría de los tests de aplicaciones web toman 1-2 semanas. Una API simple puede estar lista en unos días. Los tests completos de infraestructura pueden tomar 3-4 semanas. Te daremos un timeline específico durante el scoping una vez que entendamos qué estamos probando.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'security-compliance'), 'es',
'¿Pueden ayudarnos a obtener la certificación SOC 2 o ISO 27001?',
'Sí. Ayudamos a las empresas a prepararse para auditorías de cumplimiento - identificar brechas, implementar controles, documentar prácticas. Hemos guiado equipos a través de SOC 2, ISO 27001, HIPAA y GDPR. El proceso es menos doloroso cuando alguien que ya lo ha hecho te ayuda.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'security-cloud-audit'), 'es',
'¿Qué cubre una auditoría de seguridad cloud?',
'Configuraciones IAM, seguridad de red, configuraciones de encriptación, logging, monitoring, protección de datos y cómo te comparas con los benchmarks CIS. Recibes una lista priorizada de qué arreglar y cómo.');

-- Web Development FAQs
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'web-timeline'), 'es',
'¿Cuánto tiempo toma construir una aplicación web?',
'Un MVP simple: 6-8 semanas. Un producto SaaS completo con auth, facturación y funcionalidades reales: 3-6 meses. Aplicaciones enterprise con integraciones complejas: más tiempo. Podemos dar una estimación real una vez que entendamos qué estás construyendo.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'web-technology-choice'), 'es',
'¿Por qué usan principalmente React y Next.js?',
'React tiene el ecosistema más grande, las mejores herramientas y la mayor cantidad de desarrolladores que lo conocen. Next.js añade server-side rendering, rutas API y optimizaciones de rendimiento que tomarían meses construir por tu cuenta. Para la mayoría de los proyectos, es la elección correcta.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'web-maintenance'), 'es',
'¿Ofrecen mantenimiento continuo después del lanzamiento?',
'Sí. Ofrecemos paquetes de mantenimiento - actualizaciones de seguridad, corrección de bugs, monitoreo de rendimiento, nuevas funcionalidades. Muchos clientes empiezan con un proyecto de desarrollo y nos mantienen para trabajo continuo.');

-- Mobile Development FAQs
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'mobile-native-vs-cross'), 'es',
'¿Por qué desarrollo nativo en lugar de React Native o Flutter?',
'Las apps nativas son más rápidas y tienen acceso completo a las funcionalidades de la plataforma. Los frameworks cross-platform añaden complejidad, y a menudo terminas escribiendo código nativo de todos modos para funciones avanzadas. Si tu app necesita sentirse premium, nativo vale la pena.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'mobile-timeline'), 'es',
'¿Cuánto tiempo toma el desarrollo de una app móvil?',
'Una app simple para una plataforma: 2-3 meses. iOS y Android con backend compartido: 4-6 meses. Apps con soporte offline, funcionalidades en tiempo real o integración de hardware toman más tiempo. La complejidad determina el timeline más que la cantidad de funcionalidades.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'mobile-app-store'), 'es',
'¿Manejan el envío a App Store y Play Store?',
'Sí. Preparamos los assets, manejamos el envío, respondemos al feedback de revisión y hacemos cualquier cambio que Apple o Google pidan. Tenemos suficiente experiencia para saber qué dispara rechazos y cómo evitarlos.');

-- DevOps FAQs
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'devops-cloud-choice'), 'es',
'¿Qué proveedor cloud recomiendan?',
'AWS para la mayoría de las cosas - más servicios, mejor documentación. También usamos GCP y Cloudflare Workers cuando encajan mejor. La respuesta correcta depende de qué estás construyendo, qué cumplimiento necesitas y qué ya conoce tu equipo.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'devops-kubernetes'), 'es',
'¿Necesitamos Kubernetes?',
'Probablemente no. Kubernetes añade overhead operacional que la mayoría de los proyectos no necesitan. ECS, Cloud Run o instancias EC2 bien configuradas funcionan bien para la mayoría de los workloads. Solo recomendamos Kubernetes cuando los requisitos realmente justifican la complejidad.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'devops-cost'), 'es',
'¿Cómo podemos reducir nuestros costos cloud?',
'Dimensiona correctamente tus instancias, usa reserved o spot instances donde puedas, configura auto-scaling, optimiza la transferencia de datos y elimina lo que no usas. Típicamente encontramos ahorros de 20-40% cuando auditamos setups AWS existentes.');

-- Consulting FAQs
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'consulting-engagement'), 'es',
'¿Cómo funcionan típicamente los compromisos de consultoría?',
'Usualmente empieza con 1-2 semanas de discovery para entender tu situación. Luego recomendaciones, documentación y a menudo ayuda práctica implementando los cambios. Algunos compromisos son proyectos de alcance fijo, otros se convierten en relaciones de asesoría continua.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'consulting-deliverables'), 'es',
'¿Qué entregables recibimos de un compromiso de consultoría?',
'Documentación de arquitectura, recomendaciones tecnológicas con razonamiento, roadmaps de implementación, a veces prototipos funcionales. Todo documentado para que tu equipo pueda continuar independientemente.');

-- QA FAQs
INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'qa-automation-worth'), 'es',
'¿Vale la pena la inversión en automatización de pruebas?',
'Si estás desarrollando activamente la app y planeas mantenerla a largo plazo, sí. Las pruebas automatizadas atrapan regresiones, te permiten refactorizar sin miedo y aceleran los releases. La mayoría de los proyectos activos ven ROI positivo en 6-12 meses.');

INSERT OR IGNORE INTO faq_translations (faq_id, locale, question, answer) VALUES
((SELECT id FROM faq_items WHERE slug = 'qa-integration'), 'es',
'¿Pueden integrarse con nuestro equipo de desarrollo existente?',
'Sí. Podemos unirnos a tus sprints, asistir a standups, usar tus herramientas. A muchos clientes les gusta este modelo - somos básicamente una extensión de su equipo en lugar de un vendor separado.');
