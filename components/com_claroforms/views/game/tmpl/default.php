<?php // no direct access
defined('_JEXEC') or die('Restricted access'); 
$data = $this->data;
$link = JRoute::_( "index.php?option=com_claroforms&view=game&id={$data->idGame}" );
?>
<div>
	<div class="jcb_fieldDiv">
		<span class="jcb_fieldLabel"><?php echo JText::_( 'IDGAME' ); ?></span>
		<span class="jcb_fieldValue"><?php echo $data->idGame; ?></span>
	</div>
	<div class="jcb_fieldDiv">
		<span class="jcb_fieldLabel"><?php echo JText::_( 'NAME' ); ?></span>
		<span class="jcb_fieldValue"><?php echo $data->name; ?></span>
	</div>
	<div class="jcb_fieldDiv">
		<span class="jcb_fieldLabel"><?php echo JText::_( 'CREATIONDATE' ); ?></span>
		<span class="jcb_fieldValue"><?php echo $data->creationDate; ?></span>
	</div>
	<div class="jcb_fieldDiv">
		<span class="jcb_fieldLabel"><?php echo JText::_( 'ACTIVATIONDATE' ); ?></span>
		<span class="jcb_fieldValue"><?php echo $data->activationDate; ?></span>
	</div>
	<div class="jcb_fieldDiv">
		<span class="jcb_fieldLabel"><?php echo JText::_( 'EXPIRATIONDATE' ); ?></span>
		<span class="jcb_fieldValue"><?php echo $data->expirationDate; ?></span>
	</div>
	<div class="jcb_fieldDiv">
		<span class="jcb_fieldLabel"><?php echo JText::_( 'DESCRIPTION' ); ?></span>
		<span class="jcb_fieldValue"><?php echo $data->description; ?></span>
	</div>
	<div class="jcb_fieldDiv">
		<span class="jcb_fieldLabel"><?php echo JText::_( 'CREATIONIP' ); ?></span>
		<span class="jcb_fieldValue"><?php echo $data->creationIp; ?></span>
	</div>
	<div class="jcb_fieldDiv">
		<span class="jcb_fieldLabel"><?php echo JText::_( 'EXPIRATIONIP' ); ?></span>
		<span class="jcb_fieldValue"><?php echo $data->expirationIp; ?></span>
	</div>
	<div class="jcb_fieldDiv">
		<span class="jcb_fieldLabel"><?php echo JText::_( 'IDSTATUS' ); ?></span>
		<span class="jcb_fieldValue"><?php echo $data->idStatus; ?></span>
	</div>
	<div class="jcb_fieldDiv">
		<span class="jcb_fieldLabel"><?php echo JText::_( 'IDFILEFLASH' ); ?></span>
		<span class="jcb_fieldValue"><?php echo $data->idFileFlash; ?></span>
	</div>
	<div class="jcb_fieldDiv">
		<span class="jcb_fieldLabel"><?php echo JText::_( 'IDFILEPREVIEW' ); ?></span>
		<span class="jcb_fieldValue"><?php echo $data->idFilePreview; ?></span>
	</div>
	<div class="jcb_fieldDiv">
		<span class="jcb_fieldLabel"><?php echo JText::_( 'IDFILETHUMBNAIL' ); ?></span>
		<span class="jcb_fieldValue"><?php echo $data->idFileThumbnail; ?></span>
	</div>

</div>
