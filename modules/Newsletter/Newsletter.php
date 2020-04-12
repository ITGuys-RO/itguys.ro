<?php

namespace modules\Newsletter;

use Craft;
use craft\events\RegisterUrlRulesEvent;
use craft\web\UrlManager;
use modules\Newsletter\controllers\AdminController;
use modules\Newsletter\controllers\NewsletterController;
use modules\Newsletter\controllers\SiteController;
use yii\base\Event;

/**
 * Custom module class.
 *
 * This class will be available throughout the system via:
 * `Craft::$app->getModule('Newsletter')`.
 *
 * You can change its module ID ("Newsletter") to something else from
 * config/app.php.
 *
 * If you want the module to get loaded on every request, uncomment this line
 * in config/app.php:
 *
 *     'bootstrap' => ['Newsletter']
 *
 * Learn more about Yii module development in Yii's documentation:
 * http://www.yiiframework.com/doc-2.0/guide-structure-modules.html
 */
class Newsletter extends \yii\base\Module
{
    /**
     * @var array
     */
    public $controllerMap = [
        'site' => SiteController::class,
        'admin' => AdminController::class,
    ];

    /**
     * Initializes the module.
     */
    public function init()
    {
        // Set a @modules alias pointed to the modules/ directory
        Craft::setAlias('@modules', __DIR__);

        parent::init();
        // Custom initialization code goes here..

        // Register our site routes
        Event::on(UrlManager::class, UrlManager::EVENT_REGISTER_SITE_URL_RULES, function (RegisterUrlRulesEvent $event) {
            $event->rules['/newsletter/subscribe'] = 'Newsletter/site/subscribe';
        });
    }
}
