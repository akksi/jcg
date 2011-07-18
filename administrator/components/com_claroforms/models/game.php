<?php
/**
 * Claroforms Model for Claroforms Component
 * 
 * @package    Claroforms
 * @subpackage com_claroforms
 * @license  GNU/GPL v2
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
			$this->_fileflash = array();
		}
		
		return $this->_fileflash;
	}
	
	public function &getIdfilepreview()
	{
		if (empty($this->_filepreview))
		{
			$sql = 'SELECT file_id, webpath, upload_time
				FROM uploaded_files
				WHERE file_id = ' . (int) $this->_data->idFilePreview;
			$this->_db->setQuery($sql);
			$this->_filepreview = $this->_db->loadObject();
		}
		
		if (!$this->_filepreview)
		{
			$this->_filepreview = array();
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
			$this->_filethumbnail = array();
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
		
		$data['idGame'] = JRequest::getVar('id', '', 'post', 'int');
		$data['idStatus'] = JRequest::getVar('idStatus', '', 'post', 'int');
		
		if (!$data['idGame'])
		{
			$data['creationIp'] = htmlspecialchars($_SERVER['REMOTE_ADDR']);
			$data['expirationIp'] = null;
		}
		else
		{
			$data['expirationIp'] = htmlspecialchars($_SERVER['REMOTE_ADDR']);
		}
		
		$fileuploads = array(
			'flash' => JRequest::getVar('uploadflash', null, 'files', 'array'),
			'preview' => JRequest::getVar('uploadpreview', null, 'files', 'array'),
			'thumbnail' => JRequest::getVar('uploadthumbnail', null, 'files', 'array')
		);
		
		$include_filesystem = false;
		foreach ($fileuploads as $rowtype => $file)
		{
			if (!$include_filesystem)
			{
				$include_filesystem = true;
				jimport('joomla.filesystem.file');
			}
			
			$filename = JFile::makeSafe($file['name']);
			
			if (empty($filename))
			{
				continue;
			}
			
			$filename = str_replace(' ', '', strtolower($filename));
			$extension = strtolower(str_replace('.', '', substr($filename, strrpos($filename, '.'))));
			
			//Set up the source and destination of the file
			$src = $file['tmp_name'];
			$dest = JPATH_ROOT . '/games/' . str_replace('.' . $extension, '', $filename) . '-' . $rowtype . '.' . $extension;
			
			if (JFile::upload($src, $dest))
			{
				$sql = "SELECT file_category_id
					FROM file_category
					WHERE file_category_description LIKE '%" . $rowtype . "%'";
				$this->_db->setQuery($sql);
				$file_category = $this->_db->loadObject();
				
				$webpath = 'http://' . $_SERVER['SERVER_NAME'] . '/' . implode('', array_splice(explode(DS, JPATH_SITE), -1)) . str_replace(JPATH_ROOT, '', $dest);
				$mime_type = mime_content_type($dest);
				$file_size = filesize($dest);
				
				$sql = "INSERT INTO uploaded_files (file_category_id, path, webpath, file_name, mime_type, file_size, upload_time)
					VALUES (" . $file_category->file_category_id . ", '" . $dest . "', '" . $webpath . "', '" . $filename . "', '" . $mime_type_ . "', " . $file_size . ", NOW())";
				$this->_db->setQuery($sql);
				$this->_db->query();
				$upload_id = $this->_db->insertid();
				
				$data['idFile' . ucfirst($rowtype)] = $upload_id;
				
				if ($data['idGame'])
				{
					$sql = 'UPDATE game SET idFile' . ucfirst($rowtype) . ' = ' . (int) $upload_id . '
						WHERE idGame = ' . (int) $data['idGame'];
					$this->_db->setQuery($sql);
					$this->_db->query();
				}
			}
		}
		
		/*if (!$data['idGame'])
		{
			$sql = "INSERT INTO game (name, creationDate, activationDate, expirationDate, description, creationIp, idStatus, idFileFlash, idFilePreview, idFileThumbnail)
				VALUES ('', '', '', '', '', '', 0, 0, 0, 0)";
			$this->_db->setQuery($sql);
			$this->_db->query();
		}*/
		
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

		$sql = 'SELECT idStatus, name
			FROM status
			ORDER BY name';
		$this->_db->setQuery($sql);
		$status_list = $this->_db->loadObjectList();
		
		$status = array();
		foreach ($status_list as $i => $row)
		{
			$status[$row->name] = $row->idStatus; 
		}
		
		$expiration_ip = htmlspecialchars($_SERVER['REMOTE_ADDR']);

		if (count( $cids))
		{
			foreach ($cids as $cid)
			{
				$sql = 'SELECT idStatus
					FROM game
					WHERE idGame = ' . (int) $cid;
				$this->_db->setQuery($sql);
				$eachgame = $this->_db->loadObject();
				
				switch ($eachgame->idStatus)
				{
					case 1:
						$sql = 'UPDATE game SET idStatus = ' . (int) $status['Inactivo'] . ", expirationIp = '" . $expiration_ip . "' 
							WHERE idGame = " . (int) $cid;
						break;
					case 2:
						$sql = 'UPDATE game SET idStatus = ' . (int) $status['Activo'] . ", expirationIp = '" . $expiration_ip . "' 
							WHERE idGame = " . (int) $cid;
						break;
				}
				
				$this->_db->setQuery($sql);
				$this->_db->query();
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