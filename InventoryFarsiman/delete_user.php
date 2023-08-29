<?php
  require_once('includes/load.php');
   page_require_level(1);
?>
<?php
  $delete_id = delete_by_id('users',(int)$_GET['id']);
  if($delete_id){
      $session->msg("s","Usuario Eliminado");
      redirect('users.php');
  } else {
      $session->msg("d","Error al eliminar");
      redirect('users.php');
  }
?>
