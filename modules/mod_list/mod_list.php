<?php
 
defined('_JEXEC') or die;
 
require_once(dirname(__FILE__).DS.'helper.php');

$list = modlistHelper::generate_list($params);
 
require JModuleHelper::getLayoutPath('mod_list', $params->get('layout', 'default'));

?>