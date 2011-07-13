<?php

class modgsearchHelper
{
	function get_search($params)
	{
		$sql = "SELECT id, name, link
			FROM #__menu
			WHERE menutype = 'Headings-List'
			ORDER BY ordering";
		
		$db = &JFactory::getDBO();
		$db->setQuery($sql);
		
		$menu = $db->loadObjectList();
		return $menu;
	}
}

?>