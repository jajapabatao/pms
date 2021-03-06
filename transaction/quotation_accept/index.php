<?php include("var.php"); ?>
  <script>
function showEditBox(editobj,id) {
  $('#frmAdd').hide();
  var currentMessage = $("#message_" + id + " .message-content").html();
  var editMarkUp = '<textarea rows="5" cols="80" id="txtmessage_'+id+'">'+currentMessage+'</textarea><button name="ok" onClick="callCrudAction(\'edit\','+id+')">Save</button><button name="cancel" onClick="cancelEdit(\''+currentMessage+'\','+id+')">Cancel</button>';
  $("#message_" + id + " .message-content").html(editMarkUp);
}
function cancelEdit(message,id) {
  $("#message_" + id + " .message-content").html(message);
  $('#frmAdd').show();
}
function cartAction(action,product_code) {
  var qty;
  qty = $("#qty_"+product_code).val();
  var queryString = "";
  if(action != "") {
    switch(action) {
      case "add":
      if(qty>=1)
      {
        queryString = 'action='+action+'&code='+ product_code+'&quantity='+$("#qty_"+product_code).val();
      break;
      }
      else if(qty==0)
      {
        alert("Quantity cannot be equal to Zero!");
      break;
      }
      else
      {
        alert("Quantity cannot be less than Zero!");
      break;
      }
      case "remove":
        queryString = 'action='+action+'&code='+ product_code;
      break;
      case "empty":
        queryString = 'action='+action;
      break;
    }  
  }
  jQuery.ajax({
  url: "quotation2_action.php",
  data:queryString,
  type: "POST",
  success:function(data){
    $("#cart-item").html(data);
    if(action != "") {
      switch(action) {
        /*case "add":
          $("#add_"+product_code).hide();
          "#added_"+product_code).show();
        break;*/
        case "remove":
          $("#add_"+product_code).show();
          $("#added_"+product_code).hide();
        break;
        case "empty":
          $(".btnAddAction").show();
          $(".btnAdded").hide();
        break;
      }  
    }
  },
  error:function (){}
  });
}
</script>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>Material Cart</title>
  <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

  <?php include("../../maintenance/plugins.php"); ?>
  <div class="se-pre-con"></div>

  <script>
function showEditBox(editobj,id) {
  $('#frmAdd').hide();
  var currentMessage = $("#message_" + id + " .message-content").html();
  var editMarkUp = '<textarea rows="5" cols="80" id="txtmessage_'+id+'">'+currentMessage+'</textarea><button name="ok" onClick="callCrudAction(\'edit\','+id+')">Save</button><button name="cancel" onClick="cancelEdit(\''+currentMessage+'\','+id+')">Cancel</button>';
  $("#message_" + id + " .message-content").html(editMarkUp);
}
function cancelEdit(message,id) {
  $("#message_" + id + " .message-content").html(message);
  $('#frmAdd').show();
}
function cartAction(action,product_code) {
  var qty;
  qty = $("#qty_"+product_code).val();
  var queryString = "";
  if(action != "") {
    switch(action) {
      case "add":
      if(qty>=1)
      {
        queryString = 'action='+action+'&code='+ product_code+'&quantity='+$("#qty_"+product_code).val();
      break;
      }
      else if(qty==0)
      {
        alert("Quantity cannot be equal to Zero!");
      break;
      }
      else
      {
        alert("Quantity cannot be less than Zero!");
      break;
      }
      case "remove":
        queryString = 'action='+action+'&code='+ product_code;
      break;
      case "empty":
        queryString = 'action='+action;
      break;
    }  
  }
  jQuery.ajax({
  url: "quotation2_action.php",
  data:queryString,
  type: "POST",
  success:function(data){
    $("#cart-item").html(data);
    if(action != "") {
      switch(action) {
        /*case "add":
          $("#add_"+product_code).hide();
          "#added_"+product_code).show();
        break;*/
        case "remove":
          $("#add_"+product_code).show();
          $("#added_"+product_code).hide();
        break;
        case "empty":
          $(".btnAddAction").show();
          $(".btnAdded").hide();
        break;
      }  
    }
  },
  error:function (){}
  });
}
</script>

   </head>

   <body class="skin-red fixed">


    <form action="" method="post" name="frm" id="frm">
      <header class="main-header">
        <!-- Logo --> 
        <a href="index.php" class="logo">

         <span class="logo-lg"><img style="HEIGHT:45px;" src="../../assets/img/logo.png" alt="Logo" style="float: left;"><label style="font-family: 'Cinzel'; font-size: 110%">PERSAN INC.</label></span>

         <!-- logo for regular state and mobile devices -->
         <span class="logo-lg"><img style="HEIGHT:45px;" src="../../assets/img/logo.png" alt="Logo" style="float: left;"><label style="font-family: 'Cinzel'; font-size: 110%">PERSAN INC.</label></span>
       </a>
       <!-- Logo -->
       <!-- Header Navbar: style can be found in header.less -->
           <nav class="navbar navbar-static-top" role="navigation">
        <!-- Sidebar toggle button-->
             <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>      
          </a>
        <div class="navbar-custom-menu">
          <ul class="nav navbar-nav">
            <!-- Messages: style can be found in dropdown.less-->
            
                 <li class="dropdown user user-menu">
            <!-- Menu Toggle Button -->
            <a href="#" class="dropdown-toggle " data-toggle="dropdown" >
             
             
               <?php include("../../maintenance/nav.php"); ?>  
            </a>
            <ul class="dropdown-menu">
              <!-- The user image in the menu -->
              <li class="user-header">
               

              <?php include("../../maintenance/user_type.php"); ?>
              </li>
              <!-- Menu Body -->
              
              <!-- Menu Footer-->
              <li class="user-footer">
                
                <div class="pull-center">
                  <a href="?logout=true" class="btn btn-primary btn-flat btn-center"><i class="fa fa-sign-in"></i> Sign out</a>
                </div>
              </li>
            </ul>
          </li> 
         
            <!-- User Account: style can be found in dropdown.less -->
          </ul>
        </div>
      </nav>
      </header>
        <?php
if(isset($_GET['logout']))
{
  mysql_query("update sample set status='inactive' where user='".$_SESSION['user']."' and pass='".$_SESSION['pass']."' ");
  session_destroy();
  echo "<meta http-equiv='refresh' content='0'>";
}
?>
      <!-- Left side column. contains the logo and sidebar -->
<?php include("../../maintenance/side_account.php") ?>


    <!-- Right side column. Contains the navbar and content of the page -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <h1>
          Quotation Approval
          <small>Transaction</small>
        </h1>                              
      </section>
<?php
if(isset($_POST['scname']) && isset($_POST['quote_no'])  && isset($_POST['prepared']) && isset($_POST['customer'] ))
{
$prepared=$_POST['prepared'];
$scname = $_POST['scname'];
$quote_no = $_POST['quote_no'];
}

$content2=mysql_query("select project,customer from quotation where quote_no='".$_GET['scname']."'");
$total2=@mysql_affected_rows();

    
$row=mysql_fetch_array($content2);
$project2=$row['project'];
$cust2=$row['customer'];


?>
      <!-- Main content -->
      <section class="content">
        <!--Table function-->


        <!-- Small boxes (Stat box) -->
        <div class="row" >                                 
          <div class="col-md-12 col-sm-8 col-xs-8">             <!-- NEW RECORD -->
                <!-- <a href="addTax.php"><button class="btn btn-success btn-lg" style="margin-bottom:5px;
                  box-shadow: 0px 4px 8px #888888"> 
                + ADD NEW RECORD</button> </a> -->
                <div class="box-header with-border">
                
                  <div class="col-sm-6" style="margin-bottom: 10px;">                        
                   <div class="row" style="margin-bottom:5px;"> <!-- ROW 2-->

                    <div class="col-xs-3" style="text-align: center;"> 
                      <label>Quotation ID:</label> <!-- Prod_Name -->
                      <input class="form-control" type="text" name="quote" id="quote" value="<?php echo ''.$_GET['id'].''; ?>" readonly style="text-align: center;">
                      
                    </div>  

                     <div class="col-xs-3" style="text-align: center;"> 
                      <label>Due Date:</label> <!-- Prod_Name -->
                      <input class="form-control" type="date" name="ddate" value="<?php echo $a; ?>" readonly style="text-align: center;">
                      
                    </div>            

                    <div class="col-xs-3" style="text-align: center;"> 
                      <label>Project Name:</label> <!-- Prod_Name -->
                      <input class="form-control" type="text" name="proj" id="proj" value="<?php echo ''.$project2.''; ?>" readonly style="text-align: center;">
                      
                    </div>   

                    <div class="col-xs-3" style="text-align: center;"> 
                      <label>Customer:</label> <!-- Prod_Name -->
                      <input class="form-control" type="text" name="proj" id="proj" value="<?php echo ''.$cust2.''; ?>" readonly style="text-align: center;">
                      
                    </div>   


                </div>          

                <div class="col-md-9 col-xs-12"> <!-- MESSAGE -->

                  <div class="alert alert-xs  bg-teal alert-dismissable" style="width:85%; display:none" id="msg">
                    <i class="icon fa fa-check"></i>
                    <label id="msgContent"></label>
                  </div>  

                </div>    
                                                
            </div>








            <div id="loading" class="modal fade">
              <div class="modal-dialog">
                <div class="overlay">
                  <div class="modal-body" style="text-align:center">
                    <div class="overlay">
                      <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                      <i class="fa fa-spinner fa-pulse fa-spin"  
                      style="font-size:60px;"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            

            <div class="row">                     <!-- TABLES -->
              <div class="col-lg-12 col-sm-12 col-xs-12">
                <div class="box box-solid">
                  <div class="box-header">
                    <center><h3 class="box-title">Available Items</h3></center>
                    <div class="myData"></div>

                  </div><!-- /.box-header -->
                  <div class="box-body">
                    

                       <?php
  $product_array = $db_handle->runQuery("SELECT * FROM materials where status='active' ORDER BY material_no ASC");
  if (!empty($product_array))
   { 
    echo'<table class="table table-condensed table-striped table-hover" id="jsontable1" name="jsontable1" style="font-size: 1em;">
                      <thead>

                        <tr>
                         

                          <th>Brand</th>
                          <th>Category</th>
                          <th>Sub-Category</th>
                          <th>Description</th>
                          <th>Color</th>
                          <th>Package</th>
                          <th>Measurement</th>
                          <th>Abbreviation</th>
                          <th>Quantity</th>
                          <th>Price</th>
                          <th>Action</th>
                        </tr>

                      </thead>';

    foreach($product_array as $key=>$value)
    {
  ?>    <tr>
      <form method="post" action="quotation2.php?action=add&code=<?php echo $product_array[$key]["code"]; ?>&employee=<?php echo $scname?>&materialreq=<?php echo $quote_no?>">
      <td><?php echo $product_array[$key]["brand_name"]; ?></td>
      <td><?php echo $product_array[$key]["category"]; ?></td>
      <td><?php echo $product_array[$key]["scategory_name"]; ?></td>
      <td><?php echo $product_array[$key]["description"]; ?></td>
      <td><?php echo $product_array[$key]["color"]; ?></td>
      <td><?php echo $product_array[$key]["package"]; ?></td>
      <td><?php echo $product_array[$key]["unit_measurement"];?></strong></td>
      <td><?php echo $product_array[$key]["abbre"];?></td>
      <td><input type="text" id="qty_<?php echo $product_array[$key]["code"]; ?>" class="form-control qty" name="quantity" value="1" style="width: 30%; text-align:center;"/></td>
      <td><?php echo '&#8369;'.$product_array[$key]["price"].'';?></td>
      <td><input type="button" id="add_<?php echo $product_array[$key]["code"]; ?>" name ="adds" value="Add to cart" class="btn btn-block bg-blue btnAddAction cart-action" onClick = "cartAction('add','<?php echo $product_array[$key]["code"]; ?>')" /></td>
      </form>
      </tr>
    </div>
    </tr>
  <?php
      }
  }
  ?> 
     </tbody>
  </table>



                      </div><!-- /.box-body -->
                    </div><!-- /.box -->
                  </div><!-- /.col -->
                </div>  <!-- /.row -->         
                

  
                  </div> <!-- /.row --> 
                </section><!-- right col -->
                 
                  <section class="content-header">
                             

                  </section>
                          <section class="content">


    <div class="row">
    <div class="col-md-12 col-sm-8 col-sm-8">     
<div class="box box-solid">
  <div class="box-body">
    <div id="cart-item"></div>
<form method="post" action="index.php?id=<?php echo ''.$_GET['id'].''?>&scname=<?php echo ''.$_GET['scname'].''?>&customer=<?php echo ''.$_GET['customer'].''?>&project=<?php echo ''.$project2.''?>&prepared=<?php echo ''.$_GET['prepared'].''?>">
<?php
$content3=mysql_query("SELECT * from quotation where customer='".$_GET['customer']."'");
$total3=@mysql_affected_rows();

    
$row3=mysql_fetch_array($content3);

$date3=$row3['date'];
$add3=$row3['address'];
$proj3=$row3['project'];


if(isset($_POST['btnAdd']))
{

if(empty($_SESSION["cart_itempoq"]))
{
 echo '<script type="text/javascript">alert("Cart empty")</script>'; 
}

else
{ 

  ?>

<div class="box-body">
<table class="table table-condensed table-striped table-hover" id="jsontable1" name="jsontable1" style="font-size: 1em;">
<thead>
<tr>
<th>Brand</th>
<th>Category</th>
<th>Sub-Category</th>
<th>Description</th>
<th>Color</th>
<th>Package</th>
<th>Measurement</th>
<th>Abbreviation</th>
<th>Quantity</th>
</tr> 
</thead>
<tbody>
    <h2 style="text-align: center;">List of Order</h2>

        <div class="col-lg-12 col-xs-12"> 
       <div class="alert alert-xs  bg-teal alert-dismissable" style="width:100%; float: center;" >
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
                <label><i class="icon fa fa-check"></i> ORDER HAS BEEN ADDED!</label>
               
              </div>           
</div>
<br>
<?php   
    foreach ($_SESSION["cart_itempoq"] as $item){
    ?>
       <?php
       $code=$item["code"];
       $brand_name = $item["brand_name"];
       $category = $item["category"];
       $scategory_name = $item["scategory_name"];
       $description = $item["description"];
       $color = $item["color"];
       $package = $item["package"];
       $unit_measurement = $item["unit_measurement"];
       $abbre = $item["abbre"];
       $quantity = $item["quantity"];
       ?>
        <tr>
        <td><?php echo $brand_name; ?></td>
        <td><?php echo $category; ?></td>
        <td><?php echo $scategory_name; ?></td>
        <td><?php echo $description; ?></td>
        <td><?php echo $color; ?></td>
        <td><?php echo $package; ?></td>
        <td><?php echo $unit_measurement; ?></td>
        <td><?php echo $abbre; ?></td>
        <td><?php echo $quantity; ?></input></td>
        </tr>
        <?php

    }
    ?>

</tbody>
</table>  

<?php
    $prep=mysql_real_escape_string($_GET['prepared']);
    $ddate=$_POST['due_date'];
    $dd=date_create($ddate);
    $datepic=date_format($dd,"Y-m-d");
    $accepted='active';
    foreach($_SESSION["cart_itempoq"] as $item)
    {
     

    $material_no = $item['material_no'];
    $brand_name = $item['brand_name'];
    $category = $item['category'];
    $scategory_name = $item['scategory_name'];
    $description = $item['description'];
    $color = $item['color'];
    $packages = $item['package'];
    $unit_measurement = $item['unit_measurement'];
    $abbre = $item['abbre'];
    $quantity = $item['quantity'];
    $price = $item['price'];
    $hash3= mt_rand(1,9999999);
    $hash2= md5($material_no+$hash3);

    $item_total += ($price*$quantity);
    
$content5=mysql_query("select *, max(material_no) as max from quotation_cart where quote_no='".$_GET['id']."' and material_no='".$material_no."'");
    $total5=@mysql_affected_rows();
    $row5=mysql_fetch_array($content5);

    $quantity_total=$quantity+$row5['quantity'];

{
mysql_query("insert into quotation_cart (quote_no, company,project,material_no,code,brand_name,category,scategory_name,description,color,package,unit_measurement,quantity,quantity_remaining,price,abbre,status) values('".$_GET['id']."','".$cust2."','".$_GET['project']."','".$material_no."','".$hash2."','".$brand_name."','".$category."','".$scategory_name."','".$description."','".$color."','".$package."','".$unit_measurement."','".$quantity."','".$quantity."','".$price."','".$abbre."','".$accepted."') ");

}
   
    
    }

    $content5=mysql_query("select * from quotation where quote_no='".$_GET['id']."'");
    $total5=@mysql_affected_rows();
    $row5=mysql_fetch_array($content5);

    $total_balance=$item_total+$row5['balance'];
    $total_ammount=$item_total+$row5['total_amount'];
  
    mysql_query("UPDATE quotation SET status='".$accepted."' , prepared_by='".$prep."', total_amount='".$total_ammount."', balance='".$total_balance."',due_date='".$datepic."' where project='".$project2."' ");
     echo '<script type="text/javascript">alert("Materials has been added")</script>'; 
        
     ?>
 

      
   <?php
   unset($_SESSION["cart_itempoq"]);
  }
}
    
?>
<center>
<button type="button"  class="btn btn-danger"><a id="btnEmpty" class="cart-action" onClick="cartAction('empty','');" style="color: white;">Empty Cart</a></button>
<button type="button"  onclick="done()" class=btn btn-default">Back</button>
<button type="submit" name="btnAdd" id="btnAdd" class="btn btn btn-primary" >Add</button>
</center>

</form>





<script type="text/javascript">
      $(document).ready(function(){
      $('#jsontable1').DataTable({
        "lengthMenu": [[5,10, 25, 50, -1], [5,10, 25, 50, "All"]]

      });
    });
    </script>


<script>
$(document).ready(function () {
  cartAction('','');
})
</script>


    <script>
    function done() {
    window.location.href="../quotation/index.php";
    }
    </script>
    </div> <!-- /. col -->
  </div> <!--/.box-body-->
</div> <!-- /.box -->
        
    </div> <!-- /. row -->

            </section><!-- right col -->


            </div><!-- /.row (main row) -->
          </section><!-- /.content -->
          <footer class="main-footer">
            <div class="pull-right hidden-xs">
              <b>Version</b> 3.0
            </div>
            <strong>Copyright &copy; 2016<?php if(date("Y")!=2015)echo" - ".date("Y")."";?></strong> All rights reserved.
          </footer>        
        </div><!-- /.content-wrapper -->

      </div><!-- ./wrapper -->


     
  <script type="text/javascript">
    function get_id(o) {
      myRowIndex = $(o).parent().parent().index();
      var getid=  (document.getElementById("jsontable").rows[($(o).parent().parent().index())+1].cells[0].innerHTML);    
      var $modal = $('#editModal'),
      $category_no1 = $modal.find('#category_no1');
      $category_no1.val(getid);
      $category_no1 = $modal.find('#category_no1');
      $category_no1.val(document.getElementById("jsontable").rows[($(o).parent().parent().index())+1].cells[0].innerHTML);


      $c_name1 = $modal.find('#c_name1');
      $c_name1.val(document.getElementById("jsontable").rows[($(o).parent().parent().index())+1].cells[1].innerHTML);

    }
  </script>


  </html>
  <script type="text/javascript">
    $(document).ready(function(){
      $('#jsontable').DataTable({
        "lengthMenu": [[5,10, 25, 50, -1], [5,10, 25, 50, "All"]]

      });
    });

      $(document).ready(function(){
      $('#jsontable2').DataTable({
        "lengthMenu": [[5,10, 25, 50, -1], [5,10, 25, 50, "All"]]

      });
    });
  </script>
  <script type="text/javascript">

    $('.remove').click(function(){
      swal({
        title: "Are you sure want to remove this item?",
        text: "You will not be able to recover this item",
        type: "warning",
        showCancelButton: true,
        confirmButtonClass: "btn-danger",
        confirmButtonText: "Confirm",
        cancelButtonText: "Cancel",
        closeOnConfirm: false,
        closeOnCancel: false
      },
      function(isConfirm) {
        if (isConfirm) {
          swal("Deleted!", "Your item deleted.", "success");
        } else {
          swal("Cancelled", "You Cancelled", "error");
        }
      });
    });

  </script>
  <script>
function myFunctions() {

 id = document.getElementById("quote_no").value;
    if (confirm("Are you sure?") == true) {

    } 
    else {
      return false;
        //window.location.href="purchaseorder1.php";
    }
}


</script>
<script>
$(document).ready(function () {
  cartAction('','');
})
</script>

<script>
function done() {


 id = document.getElementById("quote_no").value;
    if (confirm("Are you sure?") == true) {

    } 
    else {
      return false;
        //window.location.href="purchaseorder1.php";
    }


  }
</script>
