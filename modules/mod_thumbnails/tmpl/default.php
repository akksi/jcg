
<br />
<ul id="thumbnails" class="jcarousel-skin-tango">
	<?php
	
	if ($tcount = count($thumbnails))
	{
		foreach ($thumbnails as $row)
		{
			echo '<li><a id="_' . $row->idGame . '" href="#' . $row->idGame . '"><img src="' . $row->webpath . '" width="75" height="75" alt="" /></a></li>';
		}
	}
	else
	{
	?>
		<li><img src="http://static.flickr.com/66/199481236_dc98b5abb3_s.jpg" width="240" height="180" alt="I1" /></li>
		<li><img src="http://static.flickr.com/75/199481072_b4a0d09597_s.jpg" width="240" height="180" alt="I2" /></li>
		<li><img src="http://static.flickr.com/57/199481087_33ae73a8de_s.jpg" width="240" height="180" alt="I3" /></li>
		<li><img src="http://static.flickr.com/77/199481108_4359e6b971_s.jpg" width="240" height="180" alt="I4" /></li>
		<li><img src="http://static.flickr.com/58/199481143_3c148d9dd3_s.jpg" width="240" height="180" alt="I5" /></li>
		<li><img src="http://static.flickr.com/72/199481203_ad4cdcf109_s.jpg" width="240" height="180" alt="I6" /></li>
		<li><img src="http://static.flickr.com/58/199481218_264ce20da0_s.jpg" width="240" height="180" alt="I7" /></li>
		<li><img src="http://static.flickr.com/69/199481255_fdfe885f87_s.jpg" width="240" height="180" alt="I8" /></li>
		<li><img src="http://static.flickr.com/60/199480111_87d4cb3e38_s.jpg" width="240" height="180" alt="I9" /></li>
		<li><img src="http://static.flickr.com/70/229228324_08223b70fa_s.jpg" width="240" height="180" alt="I0" /></li>
	<?php
	}
	?>
</ul>
<br />

<script type="text/javascript">
//<![CDATA[

$(function() {
	$('#thumbnails').jcarousel({
		wrap: 'circular'
	});
});

//]]>
</script>

<?php

$url = JURI::base(true) . DS . 'modules' . DS . 'mod_list' . DS . 'list.php';

?>

<script type="text/javascript">
//<![CDATA

$('#thumbnails a').click(function(e) {
	var game = $(this).attr('id');
	e.preventDefault();

	$.ajax({
		type: "POST",
		url:  "<?php echo $url; ?>",
		data: ({game: game}),
		dataType: "json",
		success: function(t) {
			$('#game_preview').html(t.webpath);
		}
	})
});

//]]>
</script>