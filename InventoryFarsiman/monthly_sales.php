<?php
  $page_title = 'Salidas Mensuales';
  require_once('includes/load.php');
   page_require_level(3);
?>
<?php
 $year = date('Y');
 $orders = monthlyOrders($year);
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
            <span>Salidas Mensuales</span>
          </strong>
        </div>
        <div class="panel-body">
          <table class="table table-bordered table-striped">
            <thead>
              <tr>
                <th class="text-center" style="width: 50px;">#</th>
                <th> Nombre del Producto </th>
                <th class="text-center" style="width: 15%;"> Cantidad Salida </th>
                <th class="text-center" style="width: 15%;"> Total </th>
                <th class="text-center" style="width: 15%;"> Fecha </th>
             </tr>
            </thead>
           <tbody>
             <?php foreach ($orders as $orders):?>
             <tr>
               <td class="text-center"><?php echo count_id();?></td>
               <td><?php echo remove_junk($orders['name']); ?></td>
               <td class="text-center"><?php echo (int)$orders['qty']; ?></td>
               <td class="text-center"><?php echo remove_junk($orders['total_saleing_price']); ?></td>
               <td class="text-center"><?php echo $orders['date']; ?></td>
             </tr>
             <?php endforeach;?>
           </tbody>
         </table>
        </div>
      </div>
    </div>
  </div>

<?php include_once('layouts/footer.php'); ?>
