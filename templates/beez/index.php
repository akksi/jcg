<?php
/**
 * @copyright	Copyright (C) 2005 - 2010 Open Source Matters. All rights reserved.
 * @license		GNU/GPL, see LICENSE.php
 * Joomla! is free software. This version may have been modified pursuant
 * to the GNU General Public License, and as distributed it includes or
 * is derivative of works licensed under the GNU General Public License or
 * other free or open source software licenses.
 * See COPYRIGHT.php for copyright notices and details.
 */

defined('_JEXEC') or die('Restricted access');

$url = clone(JURI::getInstance());
$showRightColumn = $this->countModules('user1 or user2 or right or top');
$showRightColumn &= JRequest::getCmd('layout') != 'form';
$showRightColumn &= JRequest::getCmd('task') != 'edit'
?>
<?php echo '<?xml version="1.0" encoding="utf-8"?'.'>'; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo $this->language; ?>" lang="<?php echo $this->language; ?>" dir="<?php echo $this->direction; ?>" >
<head>
	<title>Claro Games</title>
	<link rel="stylesheet" type="text/css" href="<?php echo JURI::base(true); ?>/templates/beez/css/jcarousel.css" /> 
	<script type="text/javascript" src="<?php echo JURI::base(true); ?>/templates/beez/javascript/jquery-min.js"></script>
	<script type="text/javascript" src="<?php echo JURI::base(true); ?>/templates/beez/javascript/jquery-carousel.js"></script>
</head>
<body>
<table style="text-align: left; width: 960px;" border="0"
cellpadding="2" cellspacing="2" align="center">
<tbody>
<tr>
<td colspan="2" rowspan="1" style="vertical-align: top;">header<br>
<br>
</td>
</tr>
<tr>
<td style="vertical-align: top;"><jdoc:include type="modules" name="menugames" style="beezDivision" headerLevel="3" /><br>
</td>
<td style="vertical-align: top;">Buscador<br><jdoc:include type="modules" name="breadcrumb" style="beezDivision" headerLevel="3" />
</td>
</tr>
<tr>
<td style="vertical-align: top;"><jdoc:include type="modules" name="modulo1" style="beezDivision" headerLevel="3" /><br>
</td>
<td colspan="1" rowspan="3" style="vertical-align: top;"><br>
<jdoc:include type="modules" name="right" style="beezDivision" headerLevel="3" />
</td>
</tr>
<tr>
<td style="vertical-align: top;"><jdoc:include type="modules" name="modulo2" style="beezDivision" headerLevel="3" /><br>
</td>
</tr>
<tr>
	<td>
		
		<?php if ($this->countModules('preview')): ?>
              	<div id="top"><jdoc:include type="modules" name="preview"   />
              	</div>
            	<?php endif; ?>
              <?php if ($this->countModules('thumbnails')): ?>
              	<div id="top"><jdoc:include type="modules" name="thumbnails"   />
              	</div>
            	<?php endif; ?>
              <?php if ($this->countModules('headings')): ?>
              	<div id="top"><jdoc:include type="modules" name="headings"   />
              	</div>
            	<?php endif; ?>
              <?php if ($this->countModules('list')): ?>
              	<div id="top"><jdoc:include type="modules" name="list"   />
              	</div>
            	<?php endif; ?>
		
	</td>
</tr>
<tr>
<td style="vertical-align: top;"><jdoc:include type="modules" name="bannerbody"/>
</td>
</tr>
<tr>
<td colspan="2" rowspan="1" style="vertical-align: top;"><jdoc:include type="modules" name="footer" style="beezDivision" headerLevel="3" /><br>
</td>
</tr>
</tbody>
</table>
</body>
</html>
