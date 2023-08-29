<?php
  ob_start();
  require_once('includes/load.php');
  if($session->isUserLoggedIn(true)) { redirect('home.php', false);}
?>
<?php include_once('layouts/header.php'); ?>
<div class="login-page">
    <div class="text-center">
      <img src="libs/images/logologin.png"  class="img-fluid img-thumbnail" alt="">
       <h1>Inicio de Sesion</h1>
       <h4>Manejo de Inventarios</h4>
     </div>
     <?php echo display_msg($msg); ?>
      <form method="post" action="auth.php" class="clearfix">
        <div class="form-group">
              <label for="username" class="control-label">Nombre de Usuario</label>
              <input type="name" class="form-control" name="username" placeholder="Username">
        </div>
        <div class="form-group">
            <label for="Password" class="control-label">Contraseña</label>
            <input type="password" name= "password" class="form-control" placeholder="Password">
        </div>
        <div class="form-group">
          <center> <button type="submit" class="btn btn-danger btn-login" style="border-radius:0%">Ingresar</button></center>
        </div>
    </form>
</div>
<?php include_once('layouts/footer.php'); ?>
