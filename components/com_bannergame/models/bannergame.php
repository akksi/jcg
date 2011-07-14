<?php
/**
 * @version SVN: $Id$
 * @package    bannergame
 * @subpackage Models
 * @author     EasyJoomla {@link http://www.easy-joomla.org Easy-Joomla.org}
 * @author     David Bac {@link http://www.tppemarketing.com}
 * @author     Created on 07-Jul-2011
 * @license    GNU/GPL
 */

//-- No direct access
defined('_JEXEC') or die('=;)');

jimport('joomla.application.component.model');

/**
 * bannergame Model
 *
 * @package    bannergame
 * @subpackage Models
 */
class bannergameModelbannergame extends JModel
{
    /**
     * Gets the data.
     *
     * @return string The data to be displayed to the user
     */
    function getData()
    {
        $db =& JFactory::getDBO();

        $query = 'SELECT * FROM #__bannergame';
        $db->setQuery($query);
        $data = $db->loadObjectList();

        return $data;
    }//function

}//class
