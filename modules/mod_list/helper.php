<?php

class modlistHelper
{
	function generate_list($params)
	{
		$sql = 'SELECT g.idGame, g.name, g.description, f.webpath
			FROM game g
			INNER JOIN uploaded_files f ON f.file_id = g.idFilePreview
			ORDER BY g.name';
		
		$db = &JFactory::getDBO();
		$db->setQuery($sql);
		
		$list = $db->loadObjectList();
		
		return $list;
	}
}

?>