<div id="cart">
    <h2 class="h2-bar">Giỏ Hàng Của Bạn</h2>
    <?php
        if(isset($_SESSION['giohang']))
        {
            if(isset($_POST['sl']))
            {
                foreach ($_POST['sl'] as $id_sp => $sl)
                {
                   if($sl==0)
                    {
                        unset($_SESSION['giohang'][$id_sp]);
                    }
                    else if($sl>0)
                    {
                        $_SESSION['giohang'][$id_sp]=$sl;
                    }
                }
            }
            $arrId = array();
            foreach ($_SESSION['giohang'] as $id_sp => $so_luong)
            {
                $arrId[]=$id_sp;
            }
            $strId = implode(',',$arrId);
            $sql = "SELECT * FROM sanpham WHERE id_sp IN($strId) ORDER BY id_sp DESC";
            $query = mysqli_query($conn,$sql);
    ?>
<form id="giohang" method="post">
    <table id="cart" class="table table-hover table-condensed">
        <thead>
            <tr>
                <th style="width:40%">Sản Phẩm</th>
                <th style="width:10%">Giá</th>
                <th style="width:10%">Số Lượng</th>
                <th style="width:30%" class="text-center">Tổng Tiền</th>
                <th style="width:10%"></th>
            </tr>
        </thead>
            <!-- Product Item -->
             <?php
                $totalPriceAll=0;
                while($row=mysqli_fetch_array($query)){
                    $totalPrice=$row['gia_sp']*$_SESSION['giohang'][$row['id_sp']];
            ?>
        <tbody>
            <tr>
                <td data-th="Product">
                    <div class="row">
                        <div class="col-sm-2 hidden-xs">
                            <img src="quantri/anh/<?php echo $row['anh_sp']; ?>" alt="..." class="img-responsive"/>
                        </div>
                         <div class="col-sm-10">
                             <h5><?php echo $row['ten_sp']; ?></h5>
                        </div>
                    </div>
                </td>
                <td data-th="Price"><?php echo number_format($row['gia_sp'],0,',','.'); ?></td>
                <td data-th="Quantity">
                    <input name ="sl[<?php echo $row['id_sp']; ?>]" type="number" min="1" class="form-control text-center" value="<?php echo $_SESSION['giohang'][$row['id_sp']]; ?>">
                </td>
                <td data-th="Subtotal" class="text-center"><span><?php echo number_format($totalPrice,0,',','.'); ?></span></td>
                <td class="actions" data-th="">
                    <a class="btn btn-default" href="chucnang/giohang/xoahang.php?id_sp=<?php echo $row['id_sp']; ?>">Xóa Sản Phẩm</a>
                </td>
            </tr>
        </tbody>
            <?php
                    $totalPriceAll+=$totalPrice;
                    } 
            ?>
            <!-- End Product Item -->
        <tfoot>
            <tr class="visible-xs">
                <td class="text-center"><strong>Total <span><?php echo $totalPriceAll; ?></span></strong></td>
            </tr>
            <tr>
                <td>
                    <a href="index.php" class="btn btn-warning">Tiếp Tục Mua Hàng</a>
                    <a onclick="document.getElementById('giohang').submit();" href="#" class="btn btn-info">Cập Nhật Giỏ Hàng</a> 
                </td>
                <td colspan="2" class="hidden-xs">
                     <a class="btn btn-default" href="chucnang/giohang/xoahang.php?id_sp=0"> Xoá Hết Sản Phẩm</a>
                </td>
                <td class="hidden-xs text-center"><strong>Tổng Tiền Giỏ Hàng: <span><?php echo number_format($totalPriceAll,0,',','.'); ?></span></strong></td>
                <td><a href="index.php?page_layout=muahang" class="btn btn-success btn-block">Thanh Toán</a></td>
            </tr>
        </tfoot>
    </table>
</form>
    <?php
        }
        else
        {
            echo '<script>alert("Hiện Không Có Sản Phẩm Trong Giỏ Hàng Của Bạn!");</script>';
        }
    ?>
</div>
           