<?php
/**
 * General Configuration
 *
 * All of your system's general configuration settings go in here. You can see a
 * list of the available settings in vendor/craftcms/cms/src/config/GeneralConfig.php.
 *
 * @see \craft\config\GeneralConfig
 */

return [
    // Global settings
    '*' => [
        // Default Week Start Day (0 = Sunday, 1 = Monday...)
        'defaultWeekStartDay' => 1,
        'omitScriptNameInUrls' => true,
        'cpTrigger' => 'admin',
        'securityKey' => getenv('SECURITY_KEY'),
        'enableGql' => false,
        'sendPoweredByHeader' => false,
        'allowUpdates' => false,
        'allowAdminChanges' => true,
        'autoLoginAfterAccountActivation' => true,
        'imageDriver' => 'imagick',
        'preventUserEnumeration' => true,
        'purgePendingUsersDuration' => 31536000,
        'elevatedSessionDuration' => 31536000,
        'storeUserIps' => true,
        'rememberedUserSessionDuration' => 31536000,
        'userSessionDuration' => 31536000,
        'timezone' => 'Europe/Bucharest',
        'enableTemplateCaching' => getenv('ENABLE_TEMPLATE_CACHING'),
        'runQueueAutomatically' => true,
    ],

    // Dev environment settings
    'dev' => [
        'devMode' => true,
        'allowUpdates' => true,
        'enableTemplateCaching' => getenv('ENABLE_TEMPLATE_CACHING'),
    ],

    // Production environment settings
    'production' => [],
];
