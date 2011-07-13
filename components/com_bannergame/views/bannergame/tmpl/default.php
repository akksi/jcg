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

foreach($this->data as $data) :
?>

<h1><?php echo $data->greeting; ?></h1>

<?php
endforeach;