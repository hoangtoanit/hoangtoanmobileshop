<?php
$id_dm = $_GET['id_dm'];
$sql = "SELECT * FROM danhmucsanpham WHERE id_dm='$id_dm'";
$query = mysqli_query($conn, $sql);
$row = mysqli_fetch_array($query);
if(isset($_POST['submit'])){
    $ten_dm=$_POST['ten_dm'];
    if(isset($ten_dm)){
        $sql="UPDATE danhmucsanpham SET ten_dm='$ten_dm' WHERE id_dm=$id_dm";
        $query= mysqli_query($conn, $sql);
        header('location: quantri.php?page_layout=danhsachdm');
    }
}
?>
<div class="row">
    <ol class="breadcrumb">
        <li><a href="#"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
        <li class="active"></li>
    </ol>
</div><!--/.row-->

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Sửa Danh Mục</h1>
    </div>
</div><!--/.row-->


<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">Sửa Danh Mục</div>
            <div class="panel-body">
                <div class="col-md-12">
                    <form role="form" method="post">
                        <div class="form-group">
                            <label>Tên Danh Mục</label>
                            <input class="form-control" type="text" name="ten_dm" value="<?php echo $row['ten_dm']; ?>" required="">
                        </div>														
                        <button type="submit" class="btn btn-primary" name="submit">Sửa</button>
                        <button type="reset" class="btn btn-default">Làm Mới</button>
                    </form>
                </div>

            </div>
        </div>
    </div><!-- /.col-->
</div><!-- /.row -->

