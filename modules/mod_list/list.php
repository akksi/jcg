<?php

define('_JEXEC', 1);
define('JPATH_NOW', dirname(__FILE__));
define('DS', DIRECTORY_SEPARATOR);
define('JPATH_BASE', str_replace(DS . 'modules' . DS . 'mod_list', '', JPATH_NOW));
require_once(JPATH_BASE . DS . 'includes' . DS . 'defines.php');
require_once(JPATH_BASE . DS . 'includes' . DS . 'framework.php');
require_once(JPATH_BASE . DS . 'libraries' . DS . 'joomla' . DS . 'factory.php');

$mainframe = & JFactory::getApplication('site');
$mainframe->initialise();
$db = & JFactory::getDBO();

if ($_POST)
{
	$game_id = JRequest::getInt('game', '', 'post');
	
	$sql = 'SELECT g.idGame, f.webpath
		FROM game g
		INNER JOIN uploaded_files f ON g.idFileFlash = f.file_id 
		WHERE g.idGame = ' . (int) $game_id . '
			AND g.idStatus = 1';
	$db->setQuery($sql);
	
	$result = $db->loadObjectList();
	
	$response = array(
		'webpath' => ''
	);
	
	if (count($result))
	{
		foreach ($result as $row)
		{
			$extension = strtolower(str_replace('.', '', substr($row->webpath, strrpos($row->webpath, '.'))));
			
			$object_width = 580;
			$object_height = 163;
			
			switch ($extension)
			{
				case 'swf':
					$response['webpath'] = '<object data="' . $row->webpath . '" type="application/x-shockwave-flash" id="myflash" width="' . $object_width . '" height="' . $object_height . '">
<param name="movie" value="' . $row->webpath . '" />
<param name="bgcolor" value="#ffffff" />
<param name="height" value="' . $object_width . '" />
<param name="width" value="' . $object_height . '" />
<param name="quality" value="high" />
<param name="menu" value="false" />
<param name="allowscriptaccess" value="samedomain" />
<p>Adobe <a href="http://get.adobe.com/flashplayer/">Flash Player</a> is required to view this content.</p>
</object>';
					break;
				default:
					$response['webpath'] = '<a href="#' . $row->idGame . '"><img src="' . $row->webpath . '" width="' . $object_width . '" height="' . $object_height . '" /></a>';
					break;
			}
		}
	}
	
	echo json_encode($response);
}
else
{
	echo 'die';
}

?>  
