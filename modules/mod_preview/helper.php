<?php

class modpreviewHelper
{
	function get_image($params)
	{
		$sql = 'SELECT g.idGame, f.webpath
			FROM game g
			INNER JOIN uploaded_files f ON f.file_id = g.idFileFlash
			WHERE g.idStatus = 1
			ORDER BY RAND()
			LIMIT 1';
		
		$db = &JFactory::getDBO();
		$db->setQuery($sql);
		
		$images = $db->loadObjectList();
		
		return $images;
	}
}

?>