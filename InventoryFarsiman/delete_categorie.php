<?php
  require_once('includes/load.php');
  // Checkin What level user has permission to view this page
  page_require_level(1);
?>
<?php
  $categorie = find_by_id('categories',(int)$_GET['id']);
  if(!$categorie){
    $session->msg("d","Error de Categoria");
    redirect('categorie.php');
  }
?>
<?php
  $delete_id = delete_by_id('categories',(int)$categorie['id']);
  if($delete_id){
      $session->msg("s","Categoria Eliminada");
      redirect('categorie.php');
  } else {
      $session->msg("d","Error al eliminar");
      redirect('categorie.php');
  }
?>
