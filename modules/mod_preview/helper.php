<?php

class modpreviewHelper
{
	function get_image($params)
	{
		$sql = 'SELECT g.idGame, g.webpath
			FROM game g
			INNER JOIN uploaded_files f1 ON g.idFileFlash = f1.file_id
			INNER JOIN uploaded_files f2 ON g.idFilePreview = f2.file_id
			INNER JOIN uploaded_files f3 ON g.idFileThumbnail = f3.file_id
			ORDER BY RAND()
			LIMIT 1';
		
		$db = &JFactory::getDBO();
		$db->setQuery($sql);
		
		$images = $db->loadObjectList();
		
		return $images;
	}
}

?>