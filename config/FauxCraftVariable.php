<?php
/**
 * @license   MIT
 * @license   https://opensource.org/licenses/MIT MIT Licensed
 */

namespace nystudio107\craft;

use craft\web\twig\variables\CraftVariable;

/**
 * Class FauxCraftVariable extends the actual Craft Variable, but with added properties
 * that reflect things that are added to the Craft Variable dynamically by
 * plugins or modules.
 *
 * @property \craft\web\twig\variables\Cp                     $cp
 * @property \craft\web\twig\variables\Io                     $io
 * @property \craft\web\twig\variables\Routes                 $routes
 * @property \craft\web\twig\variables\CategoryGroups         $categoryGroups
 * @property \craft\web\twig\variables\Config                 $config
 * @property \craft\web\twig\variables\Deprecator             $deprecator
 * @property \craft\web\twig\variables\ElementIndexes         $elementIndexes
 * @property \craft\web\twig\variables\EntryRevisions         $entryRevisions
 * @property \craft\web\twig\variables\Feeds                  $feeds
 * @property \craft\web\twig\variables\Fields                 $fields
 * @property \craft\web\twig\variables\Globals                $globals
 * @property \craft\web\twig\variables\I18N                   $i18n
 * @property \craft\web\twig\variables\Request                $request
 * @property \craft\web\twig\variables\Sections               $sections
 * @property \craft\web\twig\variables\SystemSettings         $systemSettings
 * @property \craft\web\twig\variables\UserSession            $session
 * @property \putyourlightson\blitz\variables\BlitzVariable   $blitz
 * @property \nystudio107\twigpack\variables\ManifestVariable $twigpack
 * @property \teamextension\tickit\variables\TickitVariable   $tickit
 *
 * @mixin \craft\commerce\web\twig\CraftVariableBehavior
 *
 * @since     1.0.2
 */
class FauxCraftVariable extends CraftVariable
{
}
