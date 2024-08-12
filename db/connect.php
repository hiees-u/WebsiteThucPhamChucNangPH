<?php
    $con = mysqli_connect("localhost", "root", "","ql_store_tpcn");
    if(mysqli_connect_errno()){
        echo "Kết nối thất bại" . mysqli_connect_error();
    }
?>