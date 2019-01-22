<?php
$id_sp=$_GET['id_sp'];
$sql="SELECT * FROM sanpham WHERE id_sp=$id_sp";
$query=mysqli_query($conn,$sql);
$row=mysqli_fetch_array($query);
?>
<div id="product">
    <div id="prd-thumb" class="col-md-6 col-sm-12 col-xs-12 text-center">
        <img width="160px" src="quantri/anh/<?php echo $row['anh_sp'];?>"/>
    </div>
    <div id="prd-intro" class="col-md-6 col-sm-12 col-xs-12">
        <h3><?php echo $row['ten_sp']; ?></h3>
        <p id="prd-price"><span class="sl">Giá Sản Phẩm:</span> <span class="sr">
            <?php echo number_format($row['gia_sp'],0,',','.'); ?> VNĐ</span></p>
        <p><span class="sl">Bảo Hành:</span>    <?php echo $row['bao_hanh']; ?></p>
        <p><span class="sl">Đi kèm:</span>  <?php echo $row['phu_kien']; ?></p>
        <p><span class="sl">Tình Trạng:</span>  <?php echo $row['tinh_trang']; ?></p>
        <p><span class="sl">Khuyến Mại:</span>  <?php echo $row['khuyen_mai']; ?></p>
        <p><span class="sl">Còn Hàng:</span>    <?php echo $row['trang_thai']; ?></p>
        <a href="chucnang/giohang/themhang.php?id_sp=<?php echo $row['id_sp']; ?>"><button type="button" class="btn btn-danger">Đặt Mua</button></a>
    </div>
    <div id="prd-details" class="col-md-12 col-sm-12 col-xs-12 text-justify">
        <p>
            <?php echo $row['chi_tiet_sp']; ?>
        </p>
    </div>
</div> 
<?php
if(isset($_POST['submit']))
{
    $ten = $_POST['ten'];
    $dien_thoai = $_POST['dien_thoai'];
    $binh_luan = $_POST['binh_luan'];

    // xử lý thêm mới bình luận //
    $ngay_gio = date("Y-m-d H:i:s");
    if(isset($ten) && isset($dien_thoai) && isset($binh_luan))
    {
        $sql = "INSERT INTO binhluansanpham(ten,dien_thoai,binh_luan,ngay_gio,id_sp) VALUES ('$ten','$dien_thoai','$binh_luan','$ngay_gio','$id_sp')";
        $query = mysqli_query($conn,$sql);
        header('location:index.php?page_layout=chitietsp&id_sp='.$id_sp);
    }
}
?>
 <div id="comment" class="col-md-8 col-sm-9 col-xs-12">
    <h3>Bình Luận Sản Phẩm</h3>
    <form method="post" action="index.php?page_layout=chitietsp&id_sp=<?php echo $id_sp; ?>">
        <div class="form-group">
            <label>Tên</label>
            <input type="text" name="ten" required="" class="form-control">
        </div>
        <div class="form-group">
            <label>Điện Thoại</label>
            <input type="text" name="dien_thoai" required="" class="form-control">
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">Nội Dung</label>
            <textarea class="form-control" name="binh_luan" required=""></textarea>
        </div>
        <button type="submit" name="submit" class="btn btn-default">Bình Luận</button>
    </form>
</div>
<?php
if(isset($_GET['page']))
{
    $page = $_GET['page'];
}
else
{
    $page=1;
}
$rowsPerPage = 3;
$perRow=$page*$rowsPerPage-$rowsPerPage;

$sqlBl = "SELECT * FROM binhluansanpham WHERE id_sp=$id_sp ORDER BY id_bl ASC LIMIT $perRow,$rowsPerPage";
$queryBl=mysqli_query($conn,$sqlBl);
// tổng số bản ghi bình luận // 
$totalRows=mysqli_num_rows(mysqli_query($conn,"SELECT * FROM binhluansanpham WHERE id_sp=$id_sp"));
// tổng số trang // 
$totalPages=ceil($totalRows/$rowsPerPage);
// xây dựng thanh phân trang // 
$listPage="";
for($i=1; $i<=$totalPages;$i++){
    if($page==$i){
        $listPage.='<li class="active"><a href="index.php?page_layout=chitietsp&id_sp='.$id_sp.'&page='.$i.'">'.$i.'</a></li>';
    }
    else{
        $listPage.='<li><a href="index.php?page_layout=chitietsp&id_sp='.$id_sp.'&page='.$i.'">'.$i.'</a></li>';
    }
}
$totalBl=mysqli_num_rows($queryBl);
if($totalBl>0){
?>            
<div id="comments" class="col-md-12 col-sm-12 col-xs-12">
    <?php
        while($rowBl = mysqli_fetch_array($queryBl)){
    ?>
    <ul>
        <li class="comm-name"> <?php echo $rowBl['ten']; ?></li>
        <li class="comm-time"><?php echo $rowBl['ngay_gio']; ?></li>
        <li class="comm-details">
            <p>
               <?php echo $rowBl['binh_luan']; ?>
            </p>
        </li>
    </ul>
    <?php
        }
    ?> 
</div>
<?php
    }
?>
<!-- Pagination -->
<div id="pagination" class="col-md-12 col-sm-12 col-xs-12">
    <nav aria-label="Page navigation">
        <ul class="pagination">
            <?php echo $listPage; ?>
        </ul>
    </nav>
</div>            
<!-- End Pagination -->   
