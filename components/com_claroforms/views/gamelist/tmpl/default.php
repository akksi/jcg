<?php // no direct access
defined('_JEXEC') or die('Restricted access'); ?>
<table>
	<thead>
		<tr>
			<th>
				View
			</th>
<!-- Joomla! Component Builder - begin code  -->
	<th class="jcb_fieldDiv jcb_fieldLabel">
		<?php echo JText::_( 'IDGAME' ); ?>
	</th>
	<th class="jcb_fieldDiv jcb_fieldLabel">
		<?php echo JText::_( 'NAME' ); ?>
	</th>
	<th class="jcb_fieldDiv jcb_fieldLabel">
		<?php echo JText::_( 'CREATIONDATE' ); ?>
	</th>
	<th class="jcb_fieldDiv jcb_fieldLabel">
		<?php echo JText::_( 'ACTIVATIONDATE' ); ?>
	</th>
	<th class="jcb_fieldDiv jcb_fieldLabel">
		<?php echo JText::_( 'EXPIRATIONDATE' ); ?>
	</th>
	<th class="jcb_fieldDiv jcb_fieldLabel">
		<?php echo JText::_( 'DESCRIPTION' ); ?>
	</th>
	<th class="jcb_fieldDiv jcb_fieldLabel">
		<?php echo JText::_( 'CREATIONIP' ); ?>
	</th>
	<th class="jcb_fieldDiv jcb_fieldLabel">
		<?php echo JText::_( 'EXPIRATIONIP' ); ?>
	</th>
	<th class="jcb_fieldDiv jcb_fieldLabel">
		<?php echo JText::_( 'IDSTATUS' ); ?>
	</th>
	<th class="jcb_fieldDiv jcb_fieldLabel">
		<?php echo JText::_( 'IDFILEFLASH' ); ?>
	</th>
	<th class="jcb_fieldDiv jcb_fieldLabel">
		<?php echo JText::_( 'IDFILEPREVIEW' ); ?>
	</th>
	<th class="jcb_fieldDiv jcb_fieldLabel">
		<?php echo JText::_( 'IDFILETHUMBNAIL' ); ?>
	</th>

<!-- Joomla! Component Builder - begin code  -->
		</tr>
	</thead>
	<tfoot>
		<tr>
			<td colspan="0">
				<div class="jcb_pagination"><?php echo $this->pagination->getPagesLinks(); ?> - <?php echo $this->pagination->getPagesCounter(); ?></div>
			</td>
		</tr>
	</tfoot>
	<tbody>
<?php foreach($this->data as $dataItem): ?> 
<?php
	$link = JRoute::_( "index.php?option=com_claroforms&view=game&id={$dataItem->idGame}" );
?>
		<tr>
			<td>
				<!-- You can use $link var for link edit controller -->
				<a href="<?php echo $link; ?>">View</a>
			</td>
<!-- Joomla! Component Builder - begin code  -->
	<td class="jcb_fieldDiv jcb_fieldValue">
		<?php echo $dataItem->idGame; ?>
	</td>
	<td class="jcb_fieldDiv jcb_fieldValue">
		<?php echo $dataItem->name; ?>
	</td>
	<td class="jcb_fieldDiv jcb_fieldValue">
		<?php echo $dataItem->creationDate; ?>
	</td>
	<td class="jcb_fieldDiv jcb_fieldValue">
		<?php echo $dataItem->activationDate; ?>
	</td>
	<td class="jcb_fieldDiv jcb_fieldValue">
		<?php echo $dataItem->expirationDate; ?>
	</td>
	<td class="jcb_fieldDiv jcb_fieldValue">
		<?php echo $dataItem->description; ?>
	</td>
	<td class="jcb_fieldDiv jcb_fieldValue">
		<?php echo $dataItem->creationIp; ?>
	</td>
	<td class="jcb_fieldDiv jcb_fieldValue">
		<?php echo $dataItem->expirationIp; ?>
	</td>
	<td class="jcb_fieldDiv jcb_fieldValue">
		<?php echo $dataItem->idStatus; ?>
	</td>
	<td class="jcb_fieldDiv jcb_fieldValue">
		<?php echo $dataItem->idFileFlash; ?>
	</td>
	<td class="jcb_fieldDiv jcb_fieldValue">
		<?php echo $dataItem->idFilePreview; ?>
	</td>
	<td class="jcb_fieldDiv jcb_fieldValue">
		<?php echo $dataItem->idFileThumbnail; ?>
	</td>

<!-- Joomla! Component Builder - begin code  -->
		</tr>
<?php endforeach; ?>
	<tbody>
</table>

