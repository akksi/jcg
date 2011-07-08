<?php

if ($params->get('asignarCss'))
{
	$css = $params->get('clase');
}

?>

<div id="game_preview"<?php if (isset($css)) { echo ' class="' . $css . '"'; } ?> >
	<?php
	
	foreach ($images as $row)
	{
	?>
	
	<a href="<?php echo ''; ?>"><img src="<?php echo $row->webpath; ?>" width="580" height="163" /></a>
	
	<?php
	}
	
	?>
</div>
