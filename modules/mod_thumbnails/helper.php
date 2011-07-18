<?php

class modthumbnailsHelper
{
	function generate_thumbnails($params)
	{
		$db = &JFactory::getDBO();
		
		$sql = 'SELECT g.idGame, f.webpath
			FROM game g
			INNER JOIN uploaded_files f ON f.file_id = g.idFileThumbnail
				WHERE g.idStatus = 1
			ORDER BY g.name';
		$db->setQuery($sql);
		
		$thumbnails = $db->loadObjectList();
		return $thumbnails;
	}
}

?>