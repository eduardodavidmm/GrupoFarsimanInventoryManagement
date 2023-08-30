<?php
  $page_title = 'Editar Venta';
  require_once('includes/load.php');
   page_require_level(3);
?>
<?php
$order = find_by_id('orders',(int)$_GET['id']);
if(!$order){
  $session->msg("d","Error");
  redirect('orders.php');
}
?>
<?php $product = find_by_id('products',$order['product_id']); ?>
<?php

  if(isset($_POST['update_order'])){
    $req_fields = array('title','quantity','price','total', 'date' );
    validate_fields($req_fields);
        if(empty($errors)){
          $p_id      = $db->escape((int)$product['id']);
          $s_qty     = $db->escape((int)$_POST['quantity']);
          $s_total   = $db->escape($_POST['total']);
          $date      = $db->escape($_POST['date']);
          $s_date    = date("Y-m-d", strtotime($date));

          $sql  = "UPDATE orders SET";
          $sql .= " product_id= '{$p_id}',qty={$s_qty},price='{$s_total}',date='{$s_date}'";
          $sql .= " WHERE id ='{$order['id']}'";
          $result = $db->query($sql);
          if( $result && $db->affected_rows() === 1){
                    update_product_qty($s_qty,$p_id);
                    $session->msg('s',"Actualizado");
                    redirect('edit_order.php?id='.$order['id'], false);
                  } else {
                    $session->msg('d',' Error');
                    redirect('orders.php', false);
                  }
        } else {
           $session->msg("d", $errors);
           redirect('edit_order.php?id='.(int)$order['id'],false);
        }
  }

?>
<?php include_once('layouts/header.php'); ?>
<div class="row">
  <div class="col-md-6">
    <?php echo display_msg($msg); ?>
  </div>
</div>
<div class="row">

  <div class="col-md-12">
  <div class="panel">
    <div class="panel-heading clearfix">
      <strong>
        <span class="glyphicon glyphicon-th"></span>
        <span>Ventas</span>
     </strong>
     <div class="pull-right">
       <a href="orders.php" class="btn btn-primary">Mostrar Ventas</a>
     </div>
    </div>
    <div class="panel-body">
       <table class="table table-bordered">
         <thead>
          <th> Titulo </th>
          <th> Cantidad </th>
          <th> Precio </th>
          <th> Total </th>
          <th> Fecha </th>
          <th> Accion </th>
         </thead>
           <tbody  id="product_info">
              <tr>
              <form method="post" action="edit_order.php?id=<?php echo (int)$order['id']; ?>">
                <td id="s_name">
                  <input type="text" class="form-control" id="sug_input" name="title" value="<?php echo remove_junk($product['name']); ?>">
                  <div id="result" class="list-group"></div>
                </td>
                <td id="s_qty">
                  <input type="text" class="form-control" name="quantity" value="<?php echo (int)$order['qty']; ?>">
                </td>
                <td id="s_price">
                  <input type="text" class="form-control" name="price" value="<?php echo remove_junk($product['order_price']); ?>" >
                </td>
                <td>
                  <input type="text" class="form-control" name="total" value="<?php echo remove_junk($order['price']); ?>">
                </td>
                <td id="s_date">
                  <input type="date" class="form-control datepicker" name="date" data-date-format="" value="<?php echo remove_junk($order['date']); ?>">
                </td>
                <td>
                  <button type="submit" name="update_order
              " class="btn btn-primary">Actualizar</button>
                </td>
              </form>
              </tr>
           </tbody>
       </table>

    </div>
  </div>
  </div>

</div>

<?php include_once('layouts/footer.php'); ?>
