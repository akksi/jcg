/**
 * @version SVN: $Id: easycreator.js 315 2008-09-24 19:12:11Z elkuku $
 * @package		EasyCreator
 * @subpackage	Frontend-Assets
 * @author		EasyJoomla {@link http://www.easy-joomla.org Easy-Joomla.org}
 * @author		Nikolai Plath {@link http://www.nik-it.de}
 * @author		Created on 24-Sep-08
 */

function drawProject(project)
{
	frm = document.adminForm;
	frm.ebc_project.value=project;
	frm.submit();
}//function