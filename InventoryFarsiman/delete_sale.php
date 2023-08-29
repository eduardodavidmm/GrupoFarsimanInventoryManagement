<?php
  require_once('includes/load.php');
  page_require_level(3);
?>
<?php
  $d_sale = find_by_id('sales',(int)$_GET['id']);
  if(!$d_sale){
    $session->msg("d","Error en Codigo de Venta");
    redirect('sales.php');
  }
?>
<?php
  $delete_id = delete_by_id('sales',(int)$d_sale['id']);
  if($delete_id){
      $session->msg("s","Venta Eliminada");
      redirect('sales.php');
  } else {
      $session->msg("d","Error al eliminar");
      redirect('sales.php');
  }
?>
