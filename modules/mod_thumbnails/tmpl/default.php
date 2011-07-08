<script type="text/javascript">
//<![CDATA[
window.addEvent("domready", function() {
	var thumbgame = new slideGallery($$(".thumbgame"), {
		steps: 2,
		mode: "circle",
 		duration: 4000,
 		speed: 700
 	});
});
//]]>
</script>
<style type="text/css">
.thumbgame { width: 960px; }
.thumbgame .holder {
	width: 100%;
	position: relative;
	overflow: hidden;
}
.thumbgame .holder ul {
	margin: 0;
	padding: 0 !important;
	list-style: none !important;
	width: 99999px !important;
}
.thumbgame .holder ul li { float: left; }
</style>

<div id="wrapper">
	<div class="gallery thumbgame">
		<div class="holder">
			<ul id="thumbnails">
				<?php
				
				if ($tcount = count($thumbnails))
				{
					foreach ($thumbnails as $row)
					{
						echo '<li><a id="_' . $row->idGame . '" href="#' . $row->idGame . '"><img src="' . $row->webpath . '" width="240" height="180" alt="I1" /></a></li>';
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
		</div>
		<?php
		
		if ($tcount > 4)
		{
		?>
		
		<div class="control">
			<a href="#" class="prev">prev</a>
			<a href="#" class="next">next</a>
		</div>
		
		<?php
		}

		?>
	</div>
</div>

<?php

$url = JURI::base(true) . DS . 'modules' . DS . 'mod_list' . DS . 'list.php';

?>

<script type="text/javascript">
//<![CDATA

$j('#thumbnails a').click(function(e) {
	var game = $(this).id;
	e.preventDefault();

	$j.ajax({
		type: "POST",
		url:  "<?php echo $url; ?>",
		data: ({game: game}),
		dataType: "json",
		success: function(t) {
			$j('#game_preview').html(t.webpath);
		}
	})
});

//]]>
</script>