<?php
  $page_title = 'Orden de Salida';
  require_once('includes/load.php');
   page_require_level(3);
   $all_branchs = find_all('branchs')
?>
<?php

  if(isset($_POST['add_order'])){
    $req_fields = array('s_id','quantity','price','total','date' );
    validate_fields($req_fields);
        if(empty($errors)){
          $p_id      = $db->escape((int)$_POST['s_id']);
          $s_qty     = $db->escape((int)$_POST['quantity']);
          $s_total   = $db->escape($_POST['total']);
          $date      = $db->escape($_POST['date']);
          $s_date    = make_date();
          $s_status  = $db->escape((int)$_POST['s_status']);

          $sql  = "INSERT INTO orders (";
          $sql .= " product_id,qty,price,date,status";
          $sql .= ") VALUES (";
          $sql .= "'{$p_id}','{$s_qty}','{$s_total}','{$s_date}','{$s_status}'";
          $sql .= ")";

                if($db->query($sql)){
                  update_product_qty($s_qty,$p_id);
                  $session->msg('s',"Orden Añadida ");
                  redirect('add_order.php', false);
                } else {
                  $session->msg('d',' Error al añadir Orden');
                  redirect('add_order.php', false);
                }
        } else {
           $session->msg("d", $errors);
           redirect('add_order.php',false);
        }
  }

?>
<?php include_once('layouts/header.php'); ?>
<div class="row">
  <div class="col-md-6">
    <?php echo display_msg($msg); ?>
    <form method="post" action="ajax.php" autocomplete="off" id="sug-form">
        <div class="form-group">
          <div class="input-group">
            <span class="input-group-btn">
              <button type="submit" class="btn btn-primary">Buscar</button>
            </span>
            <input type="text" id="sug_input" class="form-control" name="title"  placeholder="Buscar Nombre del Producto">
         </div>
         <div id="result" class="list-group"></div>
        </div>
    </form>
  </div>
</div>
<div class="row">

  <div class="col-md-12">
    <div class="panel panel-default">
      <div class="panel-heading clearfix">
        <strong>
          <span class="glyphicon glyphicon-th"></span>
          <span>Editar</span> <br>
          <select class="form-control" name="product-categorie">
              <option value="">Sucursal</option>
              <?php  foreach ($all_branchs as $bran): ?>
                  <option value="<?php echo (int)$bran['id'] ?>">
              <?php echo $bran['name'] ?></option>
            <?php endforeach; ?>
          </select>
       </strong>
      </div>
      <div class="panel-body">
        <form method="post" action="add_order.php">
         <table class="table table-bordered">
           <thead>
            <th> Producto </th>
            <th> Costo </th>
            <th> Cantidad </th>
            <th> Total </th>
            <th> Vencimiento</th>
            <th> Accion</th>
           </thead>
             <tbody  id="product_info"> </tbody>
         </table>
       </form>
      </div>
    </div>
  </div>

</div>

<?php include_once('layouts/footer.php'); ?>
