<?php
/**
 * Claroforms View for Claroforms Component
 * 
 * @package    Claroforms
 * @subpackage com_claroforms
 * @license  GNU/GPL v2
 *
 * Created with Marco's Component Creator for Joomla! 1.5
 * http://www.mmleoni.net/joomla-component-builder
 *
 */

// No direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

jimport( 'joomla.application.component.view' );

/**
 * Claroforms View
 *
 * @package    Joomla.Components
 * @subpackage 	Claroforms
 */
class ClaroformsViewGamelist extends JView
{
	/**
	 * Gamelist view display method
	 * @return void
	 **/
	function display($tpl = null){
		$app =& JFactory::getApplication();

		// Get data from the model
		$rows = & $this->get( 'Data');
		
		// draw menu
		JToolBarHelper::title(   JText::_( 'CLAROFORMS_MANAGER' ), 'generic.png' );
		JToolBarHelper::editListX();
		JToolBarHelper::addNewX();
		JToolBarHelper::divider();
		JToolBarHelper::deleteList();
		if(isset($rows[0]->published)){
			JToolBarHelper::publishList();
			JToolBarHelper::unpublishList();
		}
		// configuration editor for config.xml
		JToolBarHelper::divider();
		JToolBarHelper::preferences('com_claroforms', '250');

		$this->assignRef('rows', $rows );
		$pagination =& $this->get('Pagination');
		$this->assignRef('pagination', $pagination);

		// SORTING get the user state of order and direction
		$default_order_field = 'idGame';
		$lists['order_Dir'] = $app->getUserStateFromRequest('com_claroformsfilter_order_Dir', 'filter_order_Dir', 'ASC');
		$lists['order'] = $app->getUserStateFromRequest('com_claroformsfilter_order', 'filter_order', $default_order_field);
		$lists['search'] = $app->getUserStateFromRequest('com_claroformssearch', 'search', '');
		$this->assignRef('lists', $lists);


		parent::display($tpl);
	}
}