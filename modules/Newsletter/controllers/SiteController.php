<?php

namespace modules\Newsletter\controllers;

use Craft;
use craft\elements\Entry;
use craft\helpers\ElementHelper;
use craft\records\EntryType;
use craft\records\Section;
use craft\services\Elements;
use craft\web\Controller;

/**
 * Class SiteController
 * @package modules\Newsletter\controllers
 */
class SiteController extends Controller
{
    /**
     * @inheritdoc
     */
    protected $allowAnonymous = true;

    /**
     * @return \yii\web\Response
     *
     * @throws \Throwable
     * @throws \craft\errors\ElementNotFoundException
     * @throws \craft\errors\MissingComponentException
     * @throws \craft\errors\SiteNotFoundException
     * @throws \yii\base\Exception
     */
    public function actionSubscribe()
    {
        $request = Craft::$app->getRequest();
        $email = $request->getBodyParam('email');
        if (!empty($email)) {
            $section = Section::findOne(['handle' => 'newsletter']);
            $entryType = EntryType::findOne(['handle' => 'newsletter']);
            $entry = Entry::findOne(['title' => $email]);
            if (empty($entry)) {
                $entry = new Entry();
                $entry->sectionId = $section->id;
                $entry->siteId = Craft::$app->getSites()
                                            ->getCurrentSite()->id;
                $entry->typeId = $entryType->id;
                $entry->email = $email;
            }
            if ($entry->validate(['email'])) {
                $entry->title = $email;
                $entry->slug = ElementHelper::normalizeSlug($email);
                $elements = new Elements();
                $elements->saveElement($entry);
            }
            //show errors
            $errors = $entry->getErrors('email');
            if (!empty($errors)) {
                $error = implode('; ', $errors);
                Craft::$app->getSession()
                           ->addFlash('danger', $error);
            } else {
                Craft::$app->getSession()
                           ->addFlash('success', 'We\'ve received your subscription, we\'ll stay in touch');
            }
        }

        return $this->redirect($request->getReferrer());
    }
}
