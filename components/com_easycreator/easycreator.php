<?php
/**
 * @version SVN: $Id: easycreator.php 1133 2010-03-24 22:30:26Z elkuku $
 * @package    EasyCreator
 * @subpackage Frontend
 * @author     EasyJoomla {@link http://www.easy-joomla.org Easy-Joomla.org}
 * @author     Nikolai Plath (elkuku) {@link http://www.nik-it.de NiK-IT.de}
 * @author     Created on 24-Sep-2008
 */

//-- No direct access
defined('_JEXEC') or die('=;)');

jimport('joomla.filesystem.file');

// --Global functions
require_once JPATH_COMPONENT_ADMINISTRATOR.DS.'functions.php';

//-- Load helpers
ecrLoadHelper('project');
ecrLoadHelper('projecthelper');

//-- Global constants
require_once JPATH_COMPONENT_ADMINISTRATOR.DS.'defines.php';

$document =& JFactory::getDocument();

//-- Add css
$document->addStyleSheet('components/com_easycreator/assets/css/default.css');

//-- Add javascript
$document->addScript(JURI::root().'components/com_easycreator/assets/js/easycreator.js');

//-- Include standard html
JLoader::import('helpers.html', JPATH_COMPONENT);

//-- Require the base controller
require_once JPATH_COMPONENT.DS.'controller.php';
$controller = new EasyCreatorController();

easyHTML::start();

//-- Perform the Request task
$controller->execute(JRequest::getVar('task'));

easyHTML::end();

//-- Redirect if set by the controller
$controller->redirect();
