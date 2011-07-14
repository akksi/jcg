<?php
/**
 * @version SVN: $Id$
 * @package    clarogames
 * @subpackage Base
 * @author     EasyJoomla {@link http://www.easy-joomla.org Easy-Joomla.org}
 * @author     David Bac {@link }
 * @author     Created on 29-Jun-2011
 * @license    GNU/GPL
 */

//-- No direct access
defined('_JEXEC') or die('=;)');

/**
 *  Require the base controller.
 */
require_once JPATH_COMPONENT.DS.'controller.php';

if($controller == JRequest::getCmd('controller'))
{
    $path = JPATH_COMPONENT.DS.'controllers'.DS.$controller.'.php';

    if( file_exists($path))
    {
        /**
         * Require specific controller if requested.
         */
        require_once $path;
    }
    else
    {
        $controller = '';
    }
}

//-- Create the controller
$classname = 'clarogamesController'.$controller;
$controller = new $classname();

//-- Perform the Request task
$controller->execute(JRequest::getCmd('task'));

//-- Redirect if set by the controller
$controller->redirect();

