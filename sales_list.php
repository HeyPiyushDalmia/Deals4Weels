<?php
include './dbconfigur.php';
if (!empty($user_id)) {
    ?>
    <html>
        <head>
            <title>Sales List</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
            <link rel="stylesheet" href="css/styles.css">
            <link rel="stylesheet" href="css/myaccount.css">
          <link rel="stylesheet" href="css/reg-style.css">
        </head>
        <body class="register">
          <header>
             <div class="flex">
               <div class="logo">
                 <a href="index.php"> <img src="images/D4W.png" alt=""> </a>
               </div>
               <nav>
                 <button id="nav-toggle" class="hamburger-menu">
                   <span class="strip"></span>
                   <span class="strip"></span>
                   <span class="strip"></span>
                 </button>
                 <ul id="nav-menu-container">
                   <li><a href="index.php">HOME</a></li>
                   <li><a href="about.php">ABOUT US</a></li>
                   <li><a href="contact.php">CONTACT US</a></li>
                   <li><a href="buycars.php">BUY CARS</a></li>
                   <?php
                   if (!empty($user_id)) {
                       ?>
                       <li><a href="myaccount.php">MY ACCOUNT</a></li>
                       <?php
                   } else {
                       ?>
                       <li><a href="register.php">Register</a></li>
                       <li><a href="login.php">Login</a></li>
                       <?php
                   }
                   ?>
                 </ul>
               </nav>
             </div>
           </header>

            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <div class="title-box clearfix">&nbsp;<br/><br/></div>
                        <?php
                        include './leftmenu.php';
                        ?>
                    </div>
                    <div class="col-md-8">
                        <div class="title-box clearfix">&nbsp;<br/><br/></div>
                        <form class="form-light mt-20" role="form" method="post" action="contact_list.php">
                            <table class="table_list">
                                <?php
                                if (isset($_GET['status']) && $_GET['status'] == "success") {
                                    echo '<tr><td colspan="8">Cars has been successfully Delete.</td></tr>';
                                }
                                ?>
                                <tr>
                                    <td class="grid_heading">S.No</td>
                                    <td class="grid_heading">Image</td>
                                    <td class="grid_heading">Company Name With Model And Varient</td>
                                    <td class="grid_heading">Car Type</td>
                                    <td class="grid_heading">Engine CC </td>
                                    <td class="grid_heading">Fuel Type</td>
                                    <td class="grid_heading">Year of Manufacturing</td>
                                    <td class="grid_heading">Sales Price</td>
                                </tr>
                                <?php
                                $i = 0;
                                $sql_contact = "";
                                if ($user_type == "admin") {
                                    $sql_contact = "SELECT p.*,c.*,c.created AS ads_date,c.id ads_id FROM cars c JOIN payments p WHERE c.user_id=p.product_id ORDER BY c.id DESC";
                                } else {
                                    // $sql_contact = "SELECT p.*,c.*,c.created AS ads_date,c.id ads_id FROM cars c JOIN payments p WHERE c.user_id=p.product_id ORDER BY c.id DESC";
      $sql_contact = "SELECT imagepath, brands, car_type, car_engine, car_fuel, car_yom, sales_price FROM cars WHERE user_id = '" . $user_id . "' ";
                                }

                                $res_contact = mysqli_query($conn, $sql_contact);
                                if (mysqli_num_rows($res_contact) > 0) {
                                    while ($row = mysqli_fetch_array($res_contact)) {
                                        $i++;
                                        ?>
                                        <tr>
                                            <td class="grid_label" align="center"><?php echo $i; ?></td>
                                            <td class="grid_label" align="center">
                                                <img src="<?php echo $row['imagepath'] ?>" height="80" width="80"/>
                                            </td>
                                            <td class="grid_label">
                                                <?php echo $row['brands'] ?><br/>
                                            </td>
                                            <td class="grid_label">
                                                <?php echo $row['car_type'] ?><br/>
                                            </td>
                                            <td class="grid_label">
                                                <?php echo $row['car_engine'] ?>
                                            </td>
                                            <td class="grid_label">
                                                <?php echo $row['car_fuel'] ?>
                                            </td>
                                            <td class="grid_label">
                                                <?php echo $row['car_yom'] ?>
                                            </td>
                                            <td class="grid_label">
                                                <?php echo $row['sales_price'] ?>
                                            </td>
                                        </tr>
                                        <?php
                                    }
                                } else {
                                    echo '<tr><td colspan="7">Data not found.</td></tr>';
                                }
                                ?>
                            </table>
                        </form>
                    </div>
                </div>
            </div>

<br><br><br><br>

            <footer >
              <div class="flex">
                <small>Copyright &copy; 2022 All rights reserved | Deals 4 Wheels</small>
                <ul id="nav-menu-container">
                  <li><a href="index.php">HOME</a></li>
                  <li><a href="about.php">ABOUT US</a></li>
                  <li><a href="contact.php">CONTACT US</a></li>
                  <li><a href="buycars.php">BUY CARS</a></li>
                  <?php
                  if (!empty($user_id)) {
                      ?>
                      <li><a href="myaccount.php">MY ACCOUNT</a></li>
                      <?php
                  } else {
                      ?>
                      <li><a href="register.php">REGISTER</a></li>
                      <li><a href="login.php">LOGIN</a></li>
                      <?php
                  }
                  ?>
                </ul>
              </div>

            </footer>
        </body>
    </html>
    <?php
} else {
    header("location:login.php?msg=login");
    ob_flush();
}
?>
