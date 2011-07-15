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

jimport('joomla.application.component.model');

/**
 * Claroforms Model
 *
 * @package    Joomla.Components
 * @subpackage 	Claroforms
 */
class ClaroformsModelGame extends JModel{
	/**
	 * Constructor that retrieves the ID from the request
	 *
	 * @access	public
	 * @return	void
	 */
	function __construct(){
		parent::__construct();

		$array = JRequest::getVar('cid',  0, '', 'array');
		$this->setId((int)$array[0]);
	}

	/**
	 * Method to set the identifier for the record
	 *
	 * @access	public
	 * @param	int primary key identifier
	 * @return	void
	 */
	public function setId($id){
		// Set id and wipe data
		$this->_id		= $id;
		$this->_data	= null;
	}

	/**
	 * Method to get a record
	 * @return object with data
	 */
	public function &getData(){
		// Load the data
		if (empty($this->_data))
		{
			$query = 'SELECT * FROM `game` WHERE `idGame` = '.$this->_id;
			$this->_db->setQuery( $query );
			$this->_data = $this->_db->loadObject();
		}
		if (!$this->_data) {
			$this->_data =& $this->getTable();
		}
		return $this->_data;
	}
	
	public function &getStatus()
	{
		if (empty($this->_status))
		{
			$sql = 'SELECT *
				FROM status
				ORDER BY name';
			$this->_db->setQuery($sql);
			$this->_status = $this->_db->loadObjectList();
		}
		
		if (!$this->_status)
		{
			$this->_status = & $this->getTable();
		}
		
		return $this->_status;
	}
	
	public function &getIdfileflash()
	{
		if (empty($this->_fileflash))
		{
			$sql = 'SELECT file_id, webpath, upload_time
				FROM uploaded_files
				WHERE file_id = ' . (int) $this->_data->idFileFlash;
			$this->_db->setQuery($sql);
			$this->_fileflash = $this->_db->loadObject();
		}
		
		if (!$this->_fileflash)
		{
			$this->_fileflash = & $this->getTable();
		}
		
		return $this->_fileflash;
	}
	
	public function &getIdfilepreview()
	{
		if (empty($this->_filepreview))
		{
			$sql = 'SELECT file_id, webpath, upload_time
				FROM uploaded_files
				WHERE file_id = ' . (int) $this->_data->idFileFlash;
			$this->_db->setQuery($sql);
			$this->_filepreview = $this->_db->loadObject();
		}
		
		if (!$this->_filepreview)
		{
			$this->_filepreview = & $this->getTable();
		}
		
		return $this->_filepreview;
	}
	
	public function &getIdfilethumbnail()
	{
		if (empty($this->_filethumbnail))
		{
			$sql = 'SELECT file_id, webpath, upload_time
				FROM uploaded_files
				WHERE file_id = ' . (int) $this->_data->idFileThumbnail;
			$this->_db->setQuery($sql);
			$this->_filethumbnail = $this->_db->loadObject();
		}
		
		if (!$this->_filethumbnail)
		{
			$this->_filethumbnail = & $this->getTable();
		}
		
		return $this->_filethumbnail;
	}

	/**
	 * Method to store a record
	 *
	 * @access	public
	 * @return	boolean	True on success
	 */
	public function store(){	
		$row =& $this->getTable();

		$data = JRequest::get( 'post' );
		// HTML content must be required!
		//$data['my_html_field'] = JRequest::getVar( 'my_html_field', '', 'post', 'string', JREQUEST_ALLOWHTML );
		
		// mcm code 
		$data['idGame'] = JRequest::getVar('id', '', 'post', 'int');
		$data['idStatus'] = JRequest::getVar('idStatus', '', 'post', 'int');
		$data['idFileFlash'] = JRequest::getVar('idFileFlash', '', 'post', 'int');
		$data['idFilePreview'] = JRequest::getVar('idFilePreview', '', 'post', 'int');
		$data['idFileThumbnail'] = JRequest::getVar('idFileThumbnail', '', 'post', 'int');
		// mcm code
		
		$fileuploads = array(
			'flash' => JRequest::getVar('uploadflash', null, 'files', 'array'),
			'preview' => JRequest::getVar('uploadpreview', null, 'files', 'array'),
			'thumbnail' => JRequest::getVar('uploadthumbnail', null, 'files', 'array')
		);
		
		$include_filesystem = false;
		foreach ($fileuploads as $rowtype => $file)
		{
			if (!empty($file['name']))
			{
				if (!$include_filesystem)
				{
					jimport('joomla.filesystem.file');
				}
				
				$filename = JFile::makeSafe($file['name']);
				
				//Set up the source and destination of the file
				$src = $file['tmp_name'];
				$dest = JPATH_ROOT . '/games/' . "myfile.jpg";
				
				echo $dest . ' **';
				
				continue;
				JFile::upload($src, $dest);
			}
		}
		
		echo '<pre>';
		var_dump($uploadflash);
		echo '-------------';
		var_dump($uploadpreview);
		echo '-------------';
		var_dump($uploadthumbnail);
		echo '-------------';
		echo '</pre>';
		exit;
		
		/*
		
		*/

		// Bind the form fields to the table
		if (!$row->bind($data)) {
			$this->setError($this->_db->getErrorMsg());
			return false;
		}

		// Make sure the record is valid
		if (!$row->check()) {
			$this->setError($this->_db->getErrorMsg());
			return false;
		}

		// Store the web link table to the database
		if (!$row->store()) {
			$this->setError( $row->_db->getErrorMsg() );
			return false;
		}

		return true;
	}

	/**
	 * Method to delete record(s)
	 *
	 * @access	public
	 * @return	boolean	True on success
	 */
	public function delete(){
		$cids = JRequest::getVar( 'cid', array(0), 'post', 'array' );

		$row =& $this->getTable();

		if (count( $cids )) {
			foreach($cids as $cid) {
				if (!$row->delete( $cid )) {
					$this->setError( $row->getErrorMsg() );
					return false;
				}
			}
		}
		return true;
	}
	/**
	 * Method to move record(s)
	 *
	 * @access	public
	 * @return	boolean	True on success
	 */			
	public function move($direction){
		$row =& $this->getTable();
		if (!$row->load($this->_id)) {
			$this->setError($this->_db->getErrorMsg());
			return false;
		}

		if (!$row->move( $direction )) {
			$this->setError($this->_db->getErrorMsg());
			return false;
		}

		return true;
	}
				
	/**
	 * Method to save the new order
	 *
	 * @access	public
	 * @return	boolean	True on success
	 */
	public function saveorder($cid = array(), $order){
		$row =& $this->getTable();

		// update ordering values
		$n = count($cid);
		for( $i=0; $i < $n; $i++ )
		{
			$row->load( (int) $cid[$i] );

			if ($row->ordering != $order[$i])
			{
				$row->ordering = $order[$i];
				if (!$row->store()) {
					$this->setError($this->_db->getErrorMsg());
					return false;
				}
			}
		}

		return true;
	}			

	/**
	 * Methods to get options arrays for specific fields
	 * @return object with data
	 */
	
	public function &getGenericFieldName(){
		$options = array(
            JHTML::_('select.option',  'val1', 'text 1' ),
            JHTML::_('select.option',  'val2', 'text 2' )
        );    
		return $options;
	}
	
	

}