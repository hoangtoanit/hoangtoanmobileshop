<script type="text/javascript">
	function searchFocus()
	{
		if(document.sfrom.stext.value=='Tìm Kiếm Sản Phẩm')
		{
			document.sfrom.stext.value='';
		}
	}

	function searchBlur()
	{
		if(document.sfrom.stext.value=='')
		{
			document.sfrom.stext.value='Tìm Kiếm Sản Phẩm';
		}
	}
</script>
<div id="search" class="col-md-4 col-sm-12 col-xs-12">
    <form method="post" name="sfrom" action="index.php?page_layout=danhsachtimkiem">
        <input type="submit" name="submit" value="">
        <input onfocus="searchFocus();" onblur="searchBlur();" type="text" name="stext" value="Tìm Kiếm Sản Phẩm">
    </form>
</div>