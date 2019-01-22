<div id="y-cart" class="col-md-8 col-sm-12 col-xs-12">
    <div id="y-cart-main">
        <p>Bạn Đang Có <span><?php if(isset($_SESSION['giohang']))
        {echo count($_SESSION['giohang']);} else {echo 0;} ?></span> Sản Phẩm</p>
        <a href="index.php?page_layout=giohang">Chi Tiết Giỏ Hàng</a>
    </div>
</div>