<?php

if ($params->get('asignarCss'))
{
	$css = $params->get('clase');
}

?>

<div id="game_preview"<?php if (isset($css)) { echo ' class="' . $css . '"';} ?> >
	<?php
	
	foreach ($images as $img)
	{
		echo '<img src="' . $img->webpath . '" />';
	}
	
	?>
</div>
