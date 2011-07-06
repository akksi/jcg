<?php
 
defined('_JEXEC') or die;
 
require_once(dirname(__FILE__).DS.'helper.php');

$thumbnails = modthumbnailsHelper::generate_thumbnails($params);
 
require JModuleHelper::getLayoutPath('mod_thumbnails', $params->get('layout', 'default'));

?>