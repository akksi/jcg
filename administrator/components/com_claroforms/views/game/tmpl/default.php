<?php defined('_JEXEC') or die('Restricted access'); ?>
<?php jimport( 'joomla.html.editor' ); $editor =& JFactory::getEditor(); ?>
<?php jimport( 'joomla.html.html' ); ?>
<?php

$data =& $this->data;
$dataOptions = & $this->dataOptions;

?>

<script type="text/javascript">

	function submitbutton(pressbutton)	{
		var form = document.adminForm;
	
		if (pressbutton == 'cancel') {
			submitform( pressbutton );
			return;
		}
	
		// remove this code
		alert ('<?php echo 'Remember to add js check in ' . __FILE__ . ' after line n. ' . __LINE__; ?>');
		submitform( pressbutton );
		return;
		// end remove this code
	
		// do field validation
		if (form.My_Field_Name.value == "") {
			alert( "<?php echo JText::_( 'Field must have a name', true ); ?>" );
		} else if (form.My_Field_Name.value.match(/[a-zA-Z0-9]*/) != form.My_Field_Name.value) {
			alert( "<?php echo JText::_( 'Field name contains bad caracters', true ); ?>" );
		} else if (form.My_Field_Name_typefield.options[form.My_Field_Name_typefield.selectedIndex].value == "0") {
			alert( "<?php echo JText::_( 'You must select a field type', true ); ?>" );		
		} else {
			submitform( pressbutton );
		}
	}

</script>

<form action="index.php" method="post" name="adminForm" id="adminForm" enctype="multipart/form-data">
<div class="col100">
	<fieldset class="adminform">
		<legend><?php echo JText::_( 'DETAILS' ); ?></legend>
		<table class="admintable">
<!-- jcb code -->
<tr>
	<td width="100" align="right" class="key">
		<label for="name">
			<?php echo JText::_( 'NAME' ); ?>:
		</label>
	</td>
	<td>
		<input class="text_area" type="text" name="name" id="name" size="32" maxlength="300" value="<?php echo htmlspecialchars($this->data->name, ENT_COMPAT, 'UTF-8');?>" />
	</td>
</tr>
<tr>
	<td width="100" align="right" class="key">
		<label for="creationDate">
			<?php echo JText::_( 'CREATIONDATE' ); ?>:
		</label>
	</td>
	<td>
		<?php echo JHTML::calendar($this->data->creationDate, 'creationDate', 'creationDate'); ?>
	</td>
</tr>
<tr>
	<td width="100" align="right" class="key">
		<label for="activationDate">
			<?php echo JText::_( 'ACTIVATIONDATE' ); ?>:
		</label>
	</td>
	<td>
		<?php echo JHTML::calendar($this->data->activationDate, 'activationDate', 'activationDate'); ?>
	</td>
</tr>
<tr>
	<td width="100" align="right" class="key">
		<label for="expirationDate">
			<?php echo JText::_( 'EXPIRATIONDATE' ); ?>:
		</label>
	</td>
	<td>
		<?php echo JHTML::calendar($this->data->expirationDate, 'expirationDate', 'expirationDate'); ?>
	</td>
</tr>
<tr>
	<td width="100" align="right" class="key">
		<label for="description">
			<?php echo JText::_( 'DESCRIPTION' ); ?>:
		</label>
	</td>
	<td>
		<input class="text_area" type="text" name="description" id="description" size="32" maxlength="300" value="<?php echo htmlspecialchars($this->data->description, ENT_COMPAT, 'UTF-8');?>" />
	</td>
</tr>
<tr>
	<td width="100" align="right" class="key">
		<label for="creationIp">
			<?php echo JText::_( 'CREATIONIP' ); ?>:
		</label>
	</td>
	<td>
		<input class="text_area" type="text" name="creationIp" id="creationIp" size="32" maxlength="255" value="<?php echo htmlspecialchars($this->data->creationIp, ENT_COMPAT, 'UTF-8');?>" />
	</td>
</tr>
<tr>
	<td width="100" align="right" class="key">
		<label for="expirationIp">
			<?php echo JText::_( 'EXPIRATIONIP' ); ?>:
		</label>
	</td>
	<td>
		<input class="text_area" type="text" name="expirationIp" id="expirationIp" size="32" maxlength="255" value="<?php echo htmlspecialchars($this->data->expirationIp, ENT_COMPAT, 'UTF-8');?>" />
	</td>
</tr>
<tr>
	<td width="100" align="right" class="key">
		<label for="idStatus">
			<?php echo JText::_( 'IDSTATUS' ); ?>:
		</label>
	</td>
	<td>
		<select name="idStatus" id="idStatus">
		<?php
		
		while (($row = each($dataOptions['status'])) !== false)
		{
		?>
			<option<?php echo ($row[1]->idStatus == $this->data-idStatus) ? ' selected="selected"' : '' ?> value="<?php echo $row[1]->idStatus; ?>"><?php echo $row[1]->name; ?></option>
		<?php
		}
		
		?>
		</select>
	</td>
</tr>
<tr>
	<td width="100" align="right" class="key">
		<label for="idFileFlash">
			<?php echo JText::_( 'IDFILEFLASH' ); ?>:
		</label>
	</td>
	<td>
		<?php
		
		while (($row = each($dataOptions['idFileFlash'])) !== false)
		{
		?>
		
		<div><?php echo $row[0]; ?>: <?php echo $row[1]; ?></div>
		
		<?php
		}
		
		/*
		 * <input class="text_area" type="text" name="idFileFlash" id="idFileFlash" size="32" maxlength="11" value="<?php echo htmlspecialchars($this->data->idFileFlash, ENT_COMPAT, 'UTF-8');?>" />
		 */
		?>
		
		<input name="uploadflash" type="file" value="">
	</td>
</tr>
<tr>
	<td width="100" align="right" class="key">
		<label for="idFilePreview">
			<?php echo JText::_( 'IDFILEPREVIEW' ); ?>:
		</label>
	</td>
	<td>
		<?php
		
		while (($row = each($dataOptions['idFilePreview'])) !== false)
		{
		?>
		
		<div><?php echo $row[0]; ?>: <?php echo $row[1]; ?></div>
		
		<?php
		}
		
		/*
		 * <input class="text_area" type="text" name="idFilePreview" id="idFilePreview" size="32" maxlength="11" value="<?php echo htmlspecialchars($this->data->idFilePreview, ENT_COMPAT, 'UTF-8');?>" />
		 */
		?>
		
		<input name="uploadpreview" type="file" value="">
	</td>
</tr>
<tr>
	<td width="100" align="right" class="key">
		<label for="idFileThumbnail">
			<?php echo JText::_( 'IDFILETHUMBNAIL' ); ?>:
		</label>
	</td>
	<td>
		<?php
		
		while (($row = each($dataOptions['idFileThumbnail'])) !== false)
		{
		?>
		
		<div><?php echo $row[0]; ?>: <?php echo $row[1]; ?></div>
		
		<?php
		}
		
		/*
		 * <input class="text_area" type="text" name="idFileThumbnail" id="idFileThumbnail" size="32" maxlength="11" value="<?php echo htmlspecialchars($this->data->idFileThumbnail, ENT_COMPAT, 'UTF-8');?>" />
		 */
		?>
		
		<input name="uploadthumbnail" type="file" value="">
	</td>
</tr>
<!-- jcb code -->

		</table>
	</fieldset>
</div>
<div class="clr"></div>

<input type="hidden" name="option" value="com_claroforms" />
<input type="hidden" name="id" value="<?php echo $this->data->idGame; ?>" />
<input type="hidden" name="task" value="" />
<input type="hidden" name="controller" value="game" />
</form>
