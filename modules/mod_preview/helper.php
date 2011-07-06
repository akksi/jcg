<?php

class modpreviewHelper
{
	function get_image($params)
	{
		$game_id = JRequest::getInt('id', 1);
		
		$sql = 'SELECT *
			FROM game g
			INNER JOIN uploaded_files f1 ON g.idFileFlash = f1.file_id
			INNER JOIN uploaded_files f2 ON g.idFilePreview = f2.file_id
			INNER JOIN uploaded_files f3 ON g.idFileThumbnail = f3.file_id
			WHERE idGame = ' . (int) $game_id . '
			ORDER BY RAND()
			LIMIT 1';
		
		$db = &JFactory::getDBO();
		$db->setQuery($sql);
		
		$images = $db->loadObjectList();
		return $images;
	}
	
	/*function getArticulos($params)
	{
		jimport('joomla.utilities.date');
		$jnow = new JDate();
		$now = $jnow->toMySQL(); 
 
		$db = &JFactory::getDBO();
		$consulta = "select title,id from #__content where datediff( #__content.created, '".$now."' ) = 365 limit 0,30";
		$db->setQuery($consulta);
		$categorias = $db->loadObjectList();
		return $db->loadObjectList();
	}*/
}

?>