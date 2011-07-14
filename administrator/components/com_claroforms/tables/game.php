<?php
/**
 * Claroforms Model for Claroforms Component
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

/**
 * Claroforms Table
 *
 * @package    Joomla.Components
 * @subpackage 	Claroforms
 */
class TableGame extends JTable{
	/** jcb code */
	/**
	 * Primary Key
	 *
	 * @var int
	 */
	var $idGame = null;
	/**
	 *
	 * @var string
	 */
	var $name = null;
	/**
	 *
	 * @var datetime
	 */
	var $creationDate = null;
	/**
	 *
	 * @var datetime
	 */
	var $activationDate = null;
	/**
	 *
	 * @var datetime
	 */
	var $expirationDate = null;
	/**
	 *
	 * @var string
	 */
	var $description = null;
	/**
	 *
	 * @var string
	 */
	var $creationIp = null;
	/**
	 *
	 * @var string
	 */
	var $expirationIp = null;
	/**
	 *
	 * @var int
	 */
	var $idStatus = null;
	/**
	 *
	 * @var int
	 */
	var $idFileFlash = null;
	/**
	 *
	 * @var int
	 */
	var $idFilePreview = null;
	/**
	 *
	 * @var int
	 */
	var $idFileThumbnail = null;
	/** jcb code */

	/**
	 * Constructor
	 *
	 * @param object Database connector object
	 */
	function TableGame(& $db){
		parent::__construct('game', 'idGame', $db);
	}
	
	function check(){
		// write here data validation code
		return parent::check();
	}
}