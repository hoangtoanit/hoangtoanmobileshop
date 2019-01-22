<?php
if (isset($_SESSION['giohang']))
{
    $arrId = array();
    foreach ($_SESSION['giohang'] as $id_sp => $sl) 
    {
        $arrId[] = $id_sp;
    }
    $strId = implode(',', $arrId);
    $sql = "SELECT * FROM sanpham WHERE id_sp IN($strId) ORDER BY id_sp DESC";
    $query = mysqli_query($conn, $sql);
}
?>


<div id="checkout">
    <h2 class="h2-bar">Xác Nhận Hóa Đơn Thanh Toán</h2>
    <table class="table table-bordered">
        <tr>
            <thead>
                <th>Tên Sản Phẩm</th>
                <th>Giá</th>
                <th>Số Lượng</th>
                <th>Thành Tiền</th>
            </thead>
        </tr>
        <?php
        $totalPriceAll = 0;
        while ($row = mysqli_fetch_array($query)) {
            $totalPrice = $row['gia_sp'] * $_SESSION['giohang'][$row['id_sp']];
            ?>
            <tr>
                <td><?php echo $row['ten_sp']; ?></td>
                <td><span><?php echo number_format($row['gia_sp'],0,',','.'); ?></span></td>
                <td><?php echo $_SESSION['giohang'][$row['id_sp']]; ?></td>
                <td><span><?php echo number_format($totalPrice ,0,',','.');?></span></td>
            </tr>
            <?php
            $totalPriceAll += $totalPrice;
        }
        ?>
        <tr>
            <td>Tổng Giá Trị Hóa Đơn:</td>
            <td colspan="2"></td>
            <td><b><span><?php echo number_format($totalPriceAll,0,',','.'); ?></span></b></td>
        </tr>
    </table>
</div>
<?php
    if(isset($_POST['submit']))
        {
            $ten=$_POST['name'];
            $email=$_POST['mail'];
            $sdt=$_POST['mobi'];
            $diachi=$_POST['add'];

            if(isset($ten) && isset($email) && isset($sdt) && isset($diachi))
            {
                if (isset($_SESSION['giohang']))
                {
                    $arrId = array();
                    foreach ($_SESSION['giohang'] as $id_sp => $sl)
                        {
                            $arrId[] = $id_sp;
                        }
                $strId = implode(',', $arrId);
                $sql = "SELECT * FROM sanpham WHERE id_sp IN($strId) ORDER BY id_sp DESC";
                $query = mysqli_query($conn, $sql);
                }
            }
            $strBody = '';
            // Thông tin Khách hàng
            $strBody = '<p>
                <b>Khách Hàng:</b> '.$ten.'<br />
                <b>Email:</b> '.$email.'<br />
                <b>Điện Thoại:</b> '.$sdt.'<br />
                <b>Địa Chỉ:</b> '.$diachi.'
            </p>';
            // Danh sách Sản phẩm đã mua
            $strBody .= '<table border="1px" cellpadding="10px" cellspacing="1px" width="100%">
                <tr>
                    <td align="center" bgcolor="#3F3F3F" colspan="4"><font color="white"><b>XÁC NHẬN HÓA ĐƠN THANH TOÁN</b></font></td>
                </tr>
                <tr id="invoice-bar">
                    <td width="45%"><b>Tên Sản Phẩm</b></td>
                    <td width="20%"><b>Giá</b></td>
                    <td width="15%"><b>Số Lượng</b></td>
                    <td width="20%"><b>Thành Tiền</b></td>
                </tr>';

                $totalPriceAll = 0;
                while($row = mysqli_fetch_array($query)){
                $totalPrice = $row['gia_sp']*$_SESSION['giohang'][$row['id_sp']];

                $strBody .= '<tr>
                    <td class="prd-name">'.$row['ten_sp'].'</td>
                    <td class="prd-price"><font color="#C40000">'.$row['gia_sp'].' VNĐ</font></td>
                    <td class="prd-number">'.$_SESSION['giohang'][$row['id_sp']].'</td>
                    <td class="prd-total"><font color="#C40000">'.$totalPrice.' VNĐ</font></td>
                </tr>';

                $totalPriceAll += $totalPrice;
                    }

                $strBody .= '<tr>
                    <td class="prd-name">TỔNG GIÁ TRỊ HOÁ ĐƠN LÀ:</td>
                    <td colspan="2"></td>
                    <td class="prd-total"><b><font color="#C40000">'.$totalPriceAll.' VNĐ</font></b></td>
                </tr>
            </table>';

            $strBody .= '<p align="justify">
                <b>Quý khách đã đặt hàng thành công!</b><br />
                • Sản phẩm của Quý Khách sẽ được chuyển đến Địa Chỉ có trong phần Thông Tin Khách Hàng của chúng Tôi sau thời gian 2 đến 3 ngày, tính từ thời điểm này.<br />
                • Nhân viên giao hàng sẽ liên hệ với Quý khách qua Số Điện thoại trước khi giao hàng 24 tiếng.<br />
                <b><br />Cám ơn Quý Khách đã sử dụng Sản phẩm của Công Ty Chúng Tôi!</b>
            </p>';

            // Thiết lập SMTP Server
            require("class.phpmailer.php"); // nạp thư viện
            $mailer = new PHPMailer(); // khởi tạo đối tượng
            $mailer->IsSMTP(); // gọi class smtp để đăng nhập
            $mailer->CharSet="utf-8"; // bảng mã unicode

            //Đăng nhập Gmail
            $mailer->SMTPAuth = true; // Đăng nhập
            $mailer->SMTPSecure = "ssl"; // Giao thức SSL
            $mailer->Host = "smtp.gmail.com"; // SMTP của GMAIL
            $mailer->Port = 465; // cổng SMTP

            // Phải chỉnh sửa lại
            $mailer->Username = "hoangvantoan.edu@gmail.com"; // GMAIL username
            $mailer->Password = "HT241198hvt916"; // GMAIL password
            $mailer->AddAddress($email, $ten); //email người nhận, $email và $ten là 2 biến đc gán bởi $_POST lấy từ trong form
            $mailer->AddCC("hoangvantoan.edu@gmail.com", "Admin Hoangtoanmobile Shop"); // gửi thêm một email cho Admin

            // Chuẩn bị gửi thư nào
            $mailer->FromName = 'Hoangtoanmobile Shop'; // tên người gửi
            $mailer->From = 'hoangvantoan.edu@gmail.com'; // mail người gửi
            $mailer->Subject = 'Hóa Đơn Xác Nhận Mua Hàng Từ Vietpro Shop';
            $mailer->IsHTML(TRUE); //Bật HTML không thích thì false

            // Nội dung lá thư
            $mailer->Body = $strBody;

            // Gửi email 

            if(!$mailer->Send())
            {
            //gửi không được, đưa ra thông báo lỗi
                echo "Lỗi Gửi Email: ".$mailer->ErrorInfo;
            }
            else
            {
            //gửi thành công
            header('location: index.php?page_layout=hoanthanh');
            }
        }
?>
<div id="custom-form" class="col-md-6 col-sm-8 col-xs-12">
    <form method="post">
        <div class="form-group">
            <label>Tên Khách Hàng</label>
            <input required type="text" class="form-control" name="name">
        </div>
        <div class="form-group">
            <label>Địa Chỉ Email</label>
            <input required type="text" class="form-control" name="mail">
        </div>
        <div class="form-group">
            <label>Số Điện Thoại</label>
            <input required type="text" class="form-control" name="mobi">
        </div>
        <div class="form-group">
            <label>Địa Chỉ Nhận Hàng</label>
             <input required type="text" class="form-control" name="add">
        </div>
            <button class="btn btn-default" name="submit">Mua Hàng</button>
    </form>
</div>