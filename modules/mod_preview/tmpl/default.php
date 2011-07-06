<?php

if ($params->get('asignarCss'))
{
	$css = $params->get('clase');
}

?>

<div<?php if (isset($css)) { echo ' class="' . $css . '"';} ?> >
	<?php
	
	var_dump($images);
	
	foreach ($images as $img)
	{
		echo '<img src="' . $img->webpath . '" />';
	}
	
	?>
</div>
