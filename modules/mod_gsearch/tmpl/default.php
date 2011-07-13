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
	$('#fsearch').submit(function(e) {
		var term = $('#tgsearch').val();
		var filt = $('#mgsearch').val();
		
		e.preventDefault();
		
		if (!term) {
			$('#tgsearch').focus();
			return;
		}
		
		$.ajax({
			type: "POST",
			url:  "<?php echo $url; ?>",
			data: ({term: term, filt: filt}),
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
	<div>Buscar Juegos</div>
	<form action="/" method="post" id="fsearch">
	<input id="tgsearch" name="term" type="text" value="" />
	<select id="mgsearch">
	<?php
	
	foreach ($menu as $row)
	{
		echo '<option value="' . $row->link . '">' . $row->name . '</option>';
	}
	
	?>
	</select>
	<input name="search" type="submit" value="Buscar" />
	</form>
</div>