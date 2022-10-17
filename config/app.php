<?php
/**
 * Yii Application Config
 *
 * Edit this file at your own risk!
 *
 * The array returned by this file will get merged with
 * vendor/craftcms/cms/src/config/app.php and app.[web|console].php, when
 * Craft's bootstrap script is defining the configuration for the entire
 * application.
 *
 * You can define custom modules and system components, and even override the
 * built-in system components.
 *
 * If you want to modify the application config for *only* web requests or
 * *only* console requests, create an app.web.php or app.console.php file in
 * your config/ folder, alongside this one.
 */

return [
    'modules' => [
        'Newsletter' => \modules\Newsletter\Newsletter::class,
    ],
    'bootstrap' => ['Newsletter'],
    'components' => [
        'cache' => craft\cache\DbCache::class,
    ],
    'aliases' => [
        '@web' => getenv('DEFAULT_SITE_URL'),
        '@webroot' => dirname(__DIR__).DIRECTORY_SEPARATOR.'web',
        '@assetBaseUrl' => '@web/assets',
        '@assetBasePath' => '@webroot/assets',
    ],
];
