<?php
 
defined('_JEXEC') or die;
 
require_once(dirname(__FILE__).DS.'helper.php');

$images = modpreviewHelper::get_image($params);
 
require JModuleHelper::getLayoutPath('mod_preview', $params->get('layout', 'default'));

?>