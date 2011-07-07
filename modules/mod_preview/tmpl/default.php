<?php

if ($params->get('asignarCss'))
{
	$css = $params->get('clase');
}

?>

<div id="game_preview"<?php if (isset($css)) { echo ' class="' . $css . '"'; } ?> >
	<?php
	
	foreach ($images as $img)
	{
	?>
	
	<img src="<?php echo $img->webpath; ?>" width="580" height="163" />
	
	<?php
	}
	
	?>
</div>
