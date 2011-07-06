<?php

class modthumbnailsHelper
{
	function generate_thumbnails($params)
	{
		$sql = 'SELECT *
			FROM game g
			INNER JOIN uploaded_files f ON g.idFileThumbnails = f.file_id  
			ORDER BY g.name';
		
		$db = &JFactory::getDBO();
		$db->setQuery($sql);
		
		$thumbnails = $db->loadObjectList();
		return $thumbnails;
	}
}

?>