<?php

if ($params->get('asignarCss'))
{
	$css = $params->get('clase');
}

$url = JURI::base(true) . DS . 'modules' . DS . 'mod_preview' . DS . 'listhead.php';

?>

<style type="text/css">

.menu_heading {
	height: 32px;
	list-style: none !important;
	margin: 0 !important;
	padding: 0 !important;
	border: 0 !important;
}
.menu_heading li {
	float: left;
	margin-bottom: 5px;
	margin-left: 5px;
}
.menu_heading a {
	padding: 5px;
	text-align: center;
}

</style>

<script type="text/javascript">
//<![CDATA

$(function() {
	$('.headings a').click(function(e) {
		var filter = $(this).href.split('#');
		filter = filter[1];
		
		e.preventDefault();
	
		$.ajax({
			type: "POST",
			url:  "<?php echo $url; ?>",
			data: ({filter: filter}),
			dataType: "html",
			success: function(t) {
				$('#gamelistcont').html(t);
			}
		})
	});
});

//]]>
</script>

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
