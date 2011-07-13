<?php
/**
 * @version SVN: $Id$
 * @package    clarogames
 * @subpackage Views
 * @author     EasyJoomla {@link http://www.easy-joomla.org Easy-Joomla.org}
 * @author     David Bac {@link }
 * @author     Created on 29-Jun-2011
 * @license    GNU/GPL
 */

//-- No direct access
defined('_JEXEC') or die('=;)');
$user = & JFactory::getUser();
/*if($user->get('guest')==1){
    header('Location: index.php?option=com_clarogames&view=addfan');
}*/
?>

<h1><?php echo $this->greeting; ?></h1>
