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

<?php

$url = JURI::base(true) . DS . 'modules' . DS . 'mod_gsearch' . DS . 'listhead.php';

?>

<script type="text/javascript">
//<![CDATA
$(function() {
	$('#sgsearch').click(function(e) {
		var term = $('#tgsearch').val();
		var mode = $('#mgsearch').val();
		
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

<div id="game_gsearch">
	<select>
	<?php
	
	foreach ($menu as $row)
	{
		echo '<option value="' . $row->link . '">' . $row->name . '</option>';
	}
	
	?>
	</select>
</div>