<?php
    include('../db/connect.php');
?>
<?php
    if(isset($_POST['capnhatdonhang'])){
        $xuly = $_POST['xuly'];
        $mahang = $_POST['mahang_xuly'];
        $sql_update_donhang = mysqli_query($con, "UPDATE tbl_donhang SET tinhtrang = '$xuly' WHERE mahang = '$mahang'");
    }
?>
<?php
    if(isset($_GET['xoadonhang'])){
        $mahang = $_GET['xoadonhang'];
        $sql_delete = mysqli_query($con, "DELETE FROM tbl_donhang WHERE mahang = '$mahang'");
        header('Location:xulydonhang.php');
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đơn hàng</title>
    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="xulydonhang.php">Đơn hàng</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="xulydanhmuc.php">Danh mục</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="xulysanpham.php">Sản phẩm</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="xulykhachhang.php">Khách hàng</a>
        </li>
      </ul>
    </div>
  </div>
</nav><br><br>
    <div class="container">
        <div class="row">
            <?php
                if(isset($_GET['quanly']) == 'xemdonhang'){
                    $mahang = $_GET['mahang'];
                    $sql_chitiet = mysqli_query($con, "SELECT * FROM tbl_donhang, tbl_sanpham WHERE tbl_donhang.sanpham_id = tbl_sanpham.sanpham_id AND tbl_donhang.mahang = '$mahang'");
                    ?>
                    <div class="col-md-7">
                    <p>Xem chi tiết đơn hàng</p>
                    <form action="" method="POST">
                    <table class="table table-bordered">
                    <tr>
                        <th>Thứ tự</th>
                        <th>Mã hàng</th>
                        
                        <th>Tên sản phẩm</th>
                        <th>Số lượng</th>
                        <th>Gía</th>
                        <th>Tổng tiền</th>
                        <th>Quản lý</th>
                    </tr>
                    <?php
                        $i = 0;
                        while($row_donhang = mysqli_fetch_array($sql_chitiet)){
                            $i++;
                    ?>
                    <tr>
                        <td><?php echo $i;?></td>
                        <td><?php echo $row_donhang['mahang']?></td>
                        
                        <td><?php echo $row_donhang['sanpham_name']?></td>
                        <td><?php echo $row_donhang['soluong']?></td>
                        <td><?php echo number_format($row_donhang['sanpham_giakhuyenmai']).'VNĐ' ?></td>
                        <td><?php echo number_format($row_donhang['soluong'] * $row_donhang['sanpham_giakhuyenmai']).'VNĐ' ?></td>
                        <input type="hidden" name="mahang_xuly" value="<?php echo $row_donhang['mahang']?>">
                        <td><a href="?xoa=<?php echo $row_donhang['donhang_id']?>">Xóa</a> || <a href="?quanly=xemdonhang&mahang=<?php echo $row_donhang['mahang']?>">Xem đơn hàng</a></td>
                    </tr>
                    <?php
                        }
                    ?>
                </table>
                <select class="form-control" name="xuly">
                    <option value="1">Đã xử lý</option>
                    <option value="0">Chưa xử lý</option>
                </select><br>
                <input type="submit" value="Cập nhật đơn hàng" name="capnhatdonhang" class="btn btn-success">
                    </form>
                </div>
                    <?php
                }else{
                    ?>
                        <div class="col-md-7">
                            <p>Đơn hàng</p>
                        </div>
                    <?php
                }
            ?>
                        
                    
                           
            <div class="col-md-5">
                <h4>Liệt kê đơn hàng</h4>
                <?php
                    $sql_select = mysqli_query($con, "SELECT * FROM tbl_sanpham, tbl_khachhang, tbl_donhang WHERE tbl_donhang.sanpham_id = tbl_sanpham.sanpham_id AND tbl_donhang.khachhang_id = tbl_khachhang.khachhang_id ORDER BY tbl_donhang.donhang_id DESC");
                ?>
                <table class="table table-bordered">
                    <tr>
                        <th>Thứ tự</th>
                        <th>Mã hàng</th>
                        <th>Tình trạng đơn hàng</th>
                        <th>Tên khách hàng</th>
                        <th>Quản lý</th>
                    </tr>
                    <?php
                        $i = 0;
                        while($row_donhang = mysqli_fetch_array($sql_select)){
                            $i++;
                    ?>
                    <tr>
                        <td><?php echo $i;?></td>
                        <td><?php echo $row_donhang['mahang']?></td>
                        <td>
                            <?php
                                if($row_donhang['tinhtrang'] == 0){
                                    echo 'Chưa xử lý';
                                }else{
                                    echo 'Đã xử lý';
                                }
                            ?>
                        </td>
                        <td><?php echo $row_donhang['name']?></td>
                        <td><a href="?xoadonhang=<?php echo $row_donhang['mahang']?>">Xóa</a> || <a href="?quanly=xemdonhang&mahang=<?php echo $row_donhang['mahang']?>">Xem đơn hàng</a></td>
                    </tr>
                    <?php
                        }
                    ?>
                </table>
            </div>
        </div>
    </div>
</body>
</html>