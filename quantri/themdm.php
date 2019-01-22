<?php
if(isset($_POST['submit'])){
    $ten_dm=$_POST['ten_dm'];
    if(isset($ten_dm)){
        $sql="INSERT INTO danhmucsanpham(ten_dm) VALUES('$ten_dm')";
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
        <h1 class="page-header">Thêm Mới Danh Mục</h1>
    </div>
</div><!--/.row-->


<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">Thêm Mới Danh Mục</div>
            <div class="panel-body">
                <div class="col-md-12">
                    <form role="form" method="post">
                        <div class="form-group">
                            <label>Tên Danh Mục</label>
                            <input name="ten_dm" class="form-control" type="text" required="">
                        </div>																					
                        <button type="submit" class="btn btn-primary" name="submit">Thêm Mới</button>
                        <button type="reset" class="btn btn-default">Làm Mới</button>

                </div>
                </form>
            </div>
        </div>
    </div><!-- /.col-->
</div><!-- /.row -->

