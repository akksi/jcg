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
			<ul>
				<?php
				
				if (count($images))
				{
					foreach ($images as $img)
					{
						echo '<li><img src="' . $img->webpath . '" width="240" height="180" alt="I1" /></li>';
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
		<div class="control">
			<a href="#" class="prev">prev</a>
			<a href="#" class="next">next</a>
		</div>
	</div>
</div>