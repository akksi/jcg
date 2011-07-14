<?php
/**
 * @version SVN: $Id: default.php 1173 2010-04-25 19:45:54Z elkuku $
 * @package    EasyCreator
 * @subpackage Frontent
 * @author     EasyJoomla {@link http://www.easy-joomla.org Easy-Joomla.org}
 * @author     Nikolai Plath (elkuku) {@link http://www.nik-it.de NiK-IT.de}
 * @author     Created on 24-Sep-2008
 */

//-- No direct access
defined('_JEXEC') or die('=;)');

?>
<table width="100%">
  <tr>
    <td>
        <?php easyHTML::projectSelector(); ?>
    </td>
    <td align="center">
        <strong style="color: red;">
            <?php echo JText::_('Please_select_a_project'); ?>
        </strong>
    </td>
  </tr>
</table>
