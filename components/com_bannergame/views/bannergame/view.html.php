<?php
/**
 * @version SVN: $Id$
 * @package    bannergame
 * @subpackage Views
 * @author     EasyJoomla {@link http://www.easy-joomla.org Easy-Joomla.org}
 * @author     David Bac {@link http://www.tppemarketing.com}
 * @author     Created on 07-Jul-2011
 * @license    GNU/GPL
 */

//-- No direct access
defined('_JEXEC') or die('=;)');

jimport('joomla.application.component.view');

/**
 * HTML View class for the bannergame Component
 *
 * @package    bannergame
 * @subpackage Views
 */

class bannergameViewbannergame extends JView
{
    /**
     * bannergame view display method
     * @return void
     **/
    function display($tpl = null)
    {
        $data = $this->get('Data');
        $this->assignRef('data', $data);

        parent::display($tpl);
    }//function

}// class
