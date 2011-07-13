<?php

define('_JEXEC', 1);
define('JPATH_NOW', dirname(__FILE__));
define('DS', DIRECTORY_SEPARATOR);
define('JPATH_BASE', str_replace(DS . 'modules' . DS . 'mod_gsearch', '', JPATH_NOW));
require_once(JPATH_BASE . DS . 'includes' . DS . 'defines.php');
require_once(JPATH_BASE . DS . 'includes' . DS . 'framework.php');
require_once(JPATH_BASE . DS . 'libraries' . DS . 'joomla' . DS . 'factory.php');

$mainframe = & JFactory::getApplication('site');
$mainframe->initialise();
$db = & JFactory::getDBO();

if ($_POST)
{
	$term = JRequest::getString('term', '', 'post');
	$filter = JRequest::getWord('filt', '', 'post');
	
	/*
	 * $sql = "SELECT g.idGame, g.name, g.description, f.webpath
		FROM game g
		INNER JOIN uploaded_files f ON f.file_id = g.idFileThumbnail
		WHERE g.name LIKE '%" . $term . "%'
		ORDER BY g.name";
	 */
	
	switch ($filter)
	{
		case 'top':
			$sql = "SELECT g.idGame, g.name, g.description, f.webpath, COUNT(u.userFB_uid) AS top_games
				FROM game g
				INNER JOIN uploaded_files f ON f.file_id = g.idFileThumbnail
				INNER JOIN gamesUserFb u ON u.game_idGame = g.idGame
				WHERE g.name LIKE '%" . $term . "%'
				GROUP BY u.game_idGame
				ORDER BY top_games DESC
				LIMIT 10";
			break;
		case 'new';
			$sql = "SELECT g.idGame, g.name, g.description, f.webpath
				FROM game g
				INNER JOIN uploaded_files f ON f.file_id = g.idFileThumbnail
				WHERE g.name LIKE '%" . $term . "%'
				ORDER BY g.creationDate DESC";
			break;
		case 'all';
			$sql = "SELECT g.idGame, g.name, g.description, f.webpath
				FROM game g
				INNER JOIN uploaded_files f ON f.file_id = g.idFileThumbnail
				WHERE g.name LIKE '%" . $term . "%'
				ORDER BY g.name";
			break;
		case 'my':
			$user = JFactory::getUser();
			$user_id = $user_id->id;
			
			if ($user_id)
			{
				$sql = 'SELECT g.idGame, g.name, g.description, f.webpath
					FROM game g
					INNER JOIN uploaded_files f ON f.file_id = g.idFileThumbnail
					INNER JOIN gamesUserFB gu ON gu.game_idGame = g.idGame
					INNER JOIN userFB uf ON uf.uid = gu.userFB_uid
					INNER JOIN #__users u ON u.id = uf.uid
					WHERE u.id = ' . (int) $user_id . "
						AND g.name LIKE '%" . $term . "%'
					ORDER BY g.name";
			}
			else
			{
				echo '<div align="center">Actualmente no hay juegos seleccionados.</div>';
			}
			
			break;
		default:
			break;
	}
	
	if (!empty($sql))
	{
		$db->setQuery($sql);
		
		$list = $db->loadObjectList();
		
		if (!count($list))
		{
			echo '<div align="center">No se encuentran juegos relacionados al t&eacute;rmino "' . $term . '".</div>';
		}
	}
	else
	{
		$list = array();
	}
	
	if (count($list))
	{
		$cols = 2;
		$i = 0;
		$closed = false;
		
	?>
		
	<table id="gamelist">
	<?php
	
	foreach ($list as $row)
	{
		if (!$i || $i == $cols)
		{
			$i = 0;
			$closed = false;
			
			echo '<tr>';
		}
		
		?>
		<td>
			<img src="<?php echo $row->webpath; ?>" align="left" />
			<h2><a id="_<?php echo $row->idGame; ?>" class="gamelist" href="#<?php echo $row->idGame; ?>"><?php echo $row->name; ?></a></h2>
			<p><?php echo $row->description; ?></p>
		</td>
		<?php
		
		if ($i == $cols - 1)
		{
			$closed = true;
			echo '</tr>';
		}
		
		$i++;
	}
	
	if (!$closed)
	{
		echo '</tr>';
	}
	
	?>
</table>
		
<?php
	}
	
	$url = str_replace('/modules/mod_headings', '', JURI::base(true)) . DS . 'modules' . DS . 'mod_list' . DS . 'list.php';
	
?>
	
<script type="text/javascript">
//<![CDATA
$('#gamelist a').click(function(e) {
	var game = $(this).attr('id');
	e.preventDefault();
	
	$.ajax({
		type: "POST",
		url:  "<?php echo $url; ?>",
		data: ({game: game}),
		dataType: "json",
		success: function(t) {
			$('#game_preview').html(t.webpath);
		}
	})
});
//]]>
</script>
	
<?php
}

?>  
