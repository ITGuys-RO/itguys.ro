<?php
/**
 * @license   MIT
 * @license   https://opensource.org/licenses/MIT MIT Licensed
 */

namespace nystudio107\craft;

use craft\elements\Asset;
use craft\elements\Category;
use craft\elements\Entry;
use craft\elements\Tag;
use craft\elements\User;
use craft\models\Site;
use Twig\Extension\AbstractExtension;
use Twig\Extension\GlobalsInterface;

/**
 * Class FauxTwigExtension provides a faux Twig extension for PhpStorm to index
 * so that we get Intellisense auto-complete in our Twig templates.
 *
 * @author    nystudio107
 * @since     1.0.2
 */
class FauxTwigExtension extends AbstractExtension implements GlobalsInterface
{
    /**
     * @return array
     *
     * @throws \Exception
     */
    public function getGlobals(): array
    {
        return [
            // Craft Variable
            'craft' => new FauxCraftVariable(),
            // Craft Elements
            'asset' => new Asset(),
            'category' => new Category(),
            'entry' => new Entry(),
            'tag' => new Tag(),
            // Craft "Constants"
            'SORT_ASC' => 4,
            'SORT_DESC' => 3,
            'SORT_REGULAR' => 0,
            'SORT_NUMERIC' => 1,
            'SORT_STRING' => 2,
            'SORT_LOCALE_STRING' => 5,
            'SORT_NATURAL' => 6,
            'SORT_FLAG_CASE' => 8,
            'POS_HEAD' => 1,
            'POS_BEGIN' => 2,
            'POS_END' => 3,
            'POS_READY' => 4,
            'POS_LOAD' => 5,
            // Misc. Craft globals
            'currentUser' => new User(),
            'currentSite' => new Site(),
            'now' => new \DateTime(),
            // Commerce Elements
            'lineItem' => new \craft\commerce\models\LineItem(),
            'order' => new \craft\commerce\elements\Order(),
            'product' => new \craft\commerce\elements\Product(),
            // Third party globals
            'seomatic' => new \nystudio107\seomatic\variables\SeomaticVariable(),
        ];
    }
}
