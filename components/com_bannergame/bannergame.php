<?php
/**
 * @version SVN: $Id$
 * @package    bannergame
 * @subpackage Base
 * @author     EasyJoomla {@link http://www.easy-joomla.org Easy-Joomla.org}
 * @author     David Bac {@link http://www.tppemarketing.com}
 * @author     Created on 07-Jul-2011
 * @license    GNU/GPL
 */

//-- No direct access
defined('_JEXEC') or die('=;)');

/**
 *  Require the base controller.
 */
require_once JPATH_COMPONENT.DS.'controller.php';

//-- Require specific controller if requested
if($controller = JRequest::getCmd('controller'))
{
    $path = JPATH_COMPONENT.DS.'controllers'.DS.$controller.'.php';

    if( file_exists($path))
    {
        require_once $path;
    }
    else
    {
        $controller = '';
    }
}

//-- Create the controller
$classname = 'bannergameController'.$controller;
$controller = new $classname();

//-- Perform the Request task
$controller->execute(JRequest::getCmd('task'));

//-- Redirect if set by the controller
$controller->redirect();
