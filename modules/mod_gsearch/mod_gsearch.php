<?php
 
defined('_JEXEC') or die;
 
require_once(dirname(__FILE__).DS.'helper.php');

$menu = modgsearchHelper::get_search($params);
 
require JModuleHelper::getLayoutPath('mod_gsearch', $params->get('layout', 'default'));

?>