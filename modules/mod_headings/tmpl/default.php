<?php
/**
 * @version		$Id: default.php 20983 2011-03-17 16:19:45Z chdemko $
 * @package		Joomla.Site
 * @subpackage	mod_menu
 * @copyright	Copyright (C) 2005 - 2011 Open Source Matters, Inc. All rights reserved.
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

// No direct access.
defined('_JEXEC') or die;

$url = JURI::base(true) . DS . 'modules' . DS . 'mod_headings' . DS . 'list.php';

?>

<style type="text/css">

.menu_heading {
	height: 32px;
	list-style: none !important;
	margin: 0 !important;
	padding: 0 !important;
	border: 0 !important;
}
.menu_heading li {
	float: left;
	margin-bottom: 5px;
	margin-left: 5px;
}
.menu_heading a {
	padding: 5px;
	text-align: center;
}

</style>

<script type="text/javascript">
//<![CDATA

$j(function() {
	$j('#headings a').click(function(e) {
		var filter = $(this).href.split('#');
		filter = filter[1];
		
		e.preventDefault();
	
		$j.ajax({
			type: "POST",
			url:  "<?php echo $url; ?>",
			data: ({filter: filter}),
			dataType: "html",
			success: function(t) {
				$j('#gamelistcont').html(t);
			}
		})
	});
});

//]]>
</script>

<ul id="headings" class="menu_heading<?php echo $class_sfx;?>"<?php
	$tag = '';
	if ($params->get('tag_id')!=NULL) {
		$tag = $params->get('tag_id').'';
		echo ' id="'.$tag.'"';
	}
?>>
<?php
foreach ($list as $i => &$item) :
	$class = '';
	if ($item->id == $active_id) {
		$class .= 'current ';
	}

	if (	$item->type == 'alias' &&
			in_array($item->params->get('aliasoptions'),$path)
		||	in_array($item->id, $path)) {
	  $class .= 'active ';
	}
	if ($item->deeper) {
		$class .= 'deeper ';
	}
	
	if ($item->parent) {
		$class .= 'parent ';
	}

	if (!empty($class)) {
		$class = ' class="'.trim($class) .'"';
	}

	echo '<li id="item-'.$item->id.'"'.$class.'>';

	// Render the menu item.
	switch ($item->type) :
		case 'separator':
		case 'url':
		case 'component':
			require JModuleHelper::getLayoutPath('mod_menu', 'default_'.$item->type);
			break;

		default:
			require JModuleHelper::getLayoutPath('mod_menu', 'default_url');
			break;
	endswitch;

	// The next item is deeper.
	if ($item->deeper) {
		echo '<ul>';
	}
	// The next item is shallower.
	else if ($item->shallower) {
		echo '</li>';
		echo str_repeat('</ul></li>', $item->level_diff);
	}
	// The next item is on the same level.
	else {
		echo '</li>';
	}
endforeach;
?></ul>
