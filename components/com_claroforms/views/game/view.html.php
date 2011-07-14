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
 * @package	Joomla.Components
 * @subpackage	Claroforms
 */
class ClaroformsViewGame extends JView
{
	function display($tpl = null)
	{
		$data = $this->get('Data');
		$this->assignRef('data', $data);

		parent::display($tpl);
	}
}
?>
