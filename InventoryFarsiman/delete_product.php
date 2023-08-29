<?php
  require_once('includes/load.php');
  page_require_level(2);
?>
<?php
  $product = find_by_id('products',(int)$_GET['id']);
  if(!$product){
    $session->msg("d","No se encuentra el Id");
    redirect('product.php');
  }
?>
<?php
  $delete_id = delete_by_id('products',(int)$product['id']);
  if($delete_id){
      $session->msg("s","Producto Eliminado");
      redirect('product.php');
  } else {
      $session->msg("d","Error al eliminar");
      redirect('product.php');
  }
?>
