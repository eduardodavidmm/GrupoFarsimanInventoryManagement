<?php
  require_once('includes/load.php');
  page_require_level(3);
?>
<?php
  $d_order = find_by_id('orders',(int)$_GET['id']);
  if(!$d_order){
    $session->msg("d","Error en Codigo de Venta");
    redirect('orders.php');
  }
?>
<?php
  $delete_id = delete_by_id('orders',(int)$d_order['id']);
  if($delete_id){
      $session->msg("s","Venta Eliminada");
      redirect('orders.php');
  } else {
      $session->msg("d","Error al eliminar");
      redirect('orders.php');
  }
?>
