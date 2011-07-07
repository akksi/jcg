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
	
	$sql = 'SELECT *
		FROM game g
		INNER JOIN uploaded_files f ON g.idFilePreview = f.file_id 
		WHERE g.idGame = ' . (int) $game_id;
	$db->setQuery($sql);
	
	$result = $db->loadObjectList();
	
	$response = array();
	
	if (count($result))
	{
		foreach ($result as $row)
		{
			$response['webpath'] = $row->webpath;
		}
	}
	else
	{
		$response['webpath'] = '';
	}
	
	echo json_encode($response);
}

?>  
