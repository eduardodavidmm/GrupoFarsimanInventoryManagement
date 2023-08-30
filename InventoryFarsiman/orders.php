<?php
  $page_title = 'Validacion de Ordenes';
  require_once('includes/load.php');
   page_require_level(3);
?>
<?php
$orders = find_all_order();
?>
<?php include_once('layouts/header.php'); ?>
<div class="row">
  <div class="col-md-6">
    <?php echo display_msg($msg); ?>
  </div>
</div>
  <div class="row">
    <div class="col-md-12">
      <div class="panel panel-default">
        <div class="panel-heading clearfix">
          <strong>
            <span class="glyphicon glyphicon-th"></span>
            <span>Resumen de Salidas</span>
          </strong>
          <div class="pull-right">
            <a href="add_order.php" class="btn btn-primary">Cambiar Estado</a>
          </div>
        </div>
        <div class="panel-body">
          <table class="table table-bordered table-striped">
            <thead>
              <tr>
                <th class="text-center" style="width: 50px;">#</th>
                <th> Product name </th>
                <th class="text-center" style="width: 15%;"> Cantidad</th>
                <th class="text-center" style="width: 15%;"> Total </th>
                <th class="text-center" style="width: 15%;"> Date </th>
                <th class="text-center" style="width: 100px;"> Acciones </th>
             </tr>
            </thead>
           <tbody>
             <?php foreach ($orders as $order):?>
             <tr>
               <td class="text-center"><?php echo count_id();?></td>
               <td><?php echo remove_junk($order['name']); ?></td>
               <td class="text-center"><?php echo (int)$order['qty']; ?></td>
               <td class="text-center"><?php echo remove_junk($order['price']); ?></td>
               <td class="text-center"><?php echo $order['date']; ?></td>
               <td class="text-center">
                  <div class="btn-group">
                     <a href="edit_order.php?id=<?php echo (int)$order['id'];?>" class="btn btn-warning btn-xs"  title="Edit" data-toggle="tooltip">
                       <span class="glyphicon glyphicon-edit"></span>
                     </a>
                     <a href="delete_order.php?id=<?php echo (int)$order['id'];?>" class="btn btn-danger btn-xs"  title="Delete" data-toggle="tooltip">
                       <span class="glyphicon glyphicon-trash"></span>
                     </a>
                  </div>
               </td>
             </tr>
             <?php endforeach;?>
           </tbody>
         </table>
        </div>
      </div>
    </div>
  </div>
<?php include_once('layouts/footer.php'); ?>
