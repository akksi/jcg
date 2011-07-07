<?php

if (count($list))
{
	$cols = 2;
	$i = 0;
	$closed = false;
	
?>

<style type="text/css">
#gamelist {
	width: 100%;
	margin: 0;
	padding: 0;
}
#gamelist tr {
}
#gamelist td {
	padding: 5px;
width: 50%;
}
</style>

<table id="gamelist">
	<?php
	
	foreach ($list as $row)
	{
		if (!$i || $i == $cols)
		{
			$i = 0;
			$closed = false;
			
			echo '<tr>';
		}
		
		?>
		<td>
			<img src="<?php echo $row->webpath; ?>" align="left" />
			<h2><a id="_<?php echo $row->idGame; ?>" class="gamelist" href="#<?php echo $row->game_id; ?>"><?php echo $row->name; ?></a></h2>
			<p><?php echo $row->description; ?></p>
		</td>
		<?php
		
		if ($i == $cols - 1)
		{
			$closed = true;
			echo '</tr>';
		}
		
		$i++;
	}
	
	if (!$closed)
	{
		echo '</tr>';
	}
	
	$url = JURI::base(true) . DS . 'modules' . DS . 'mod_list' . DS . 'list.php';
	
	?>
</table>

<script type="text/javascript">
//<![CDATA

var btn =jQuery('#botonC');
$j('#gamelist a').click(function(e) {
	var game = $(this).id;
	e.preventDefault();

	$j.ajax({
		type: "POST",
		url:  "<?php echo $url; ?>",
		data: ({game: game}),
		dataType: "json",
		success: function(t) {
			$j('#game_preview').html('<img src="' + t.webpath + '" width="580" height="163" />');
		}
	})
});

//]]>
</script>

<?php
}

?>