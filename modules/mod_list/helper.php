<?php

class modlistHelper
{
	function generate_list($params)
	{
		$sql = 'SELECT *
			FROM game g
			INNER JOIN uploaded_files f ON f.file_id = g.idFileThumbnail
			ORDER BY g.name';
		
		$db = &JFactory::getDBO();
		$db->setQuery($sql);
		
		$list = $db->loadObjectList();
		return $list;
	}
}

?>