<?php
/**
 * Claroforms View for com_claroforms Component
 * 
 * @package    Claroforms
 * @subpackage com_claroforms
 * @license  GNU/GPL v2
 *
 * Created with Marco's Component Creator for Joomla! 1.5
 * http://www.mmleoni.net/joomla-component-builder
 *
 */

jimport( 'joomla.application.component.view');

/**
 * HTML View class for the Claroforms Component
 *
 * @package		Claroforms
 * @subpackage	Components
 */
class ClaroformsViewGamelist extends JView
{
	function display($tpl = null){
		$app =& JFactory::getApplication();
		/*
		$params =& JComponentHelper::getParams( 'com_claroforms' );
		$params =& $app->getParams( 'com_claroforms' );	
		$dummy = $params->get( 'dummy_param', 1 ); 
		*/
	
		$data =& $this->get('Data');
		$this->assignRef('data', $data);
		
		$pagination =& $this->get('Pagination');
		$this->assignRef('pagination', $pagination);

		parent::display($tpl);
	}
}
?>
