<?php
  $page_title = 'Sucursales';
  require_once('includes/load.php');
  page_require_level(1);
  
  $all_branchs = find_all('branchs')
?>
<?php
 if(isset($_POST['add_bran'])){
   $req_field = array('branch-name');
   validate_fields($req_field);
   $bran_name = remove_junk($db->escape($_POST['branch-name']));
   if(empty($errors)){
      $sql  = "INSERT INTO branchs (name)";
      $sql .= " VALUES ('{$bran_name}')";
      if($db->query($sql)){
        $session->msg("s", "Nueva Sucursal");
        redirect('branch.php',false);
      } else {
        $session->msg("d", "Error");
        redirect('branch.php',false);
      }
   } else {
     $session->msg("d", $errors);
     redirect('branch.php',false);
   }
 }
?>
<?php include_once('layouts/header.php'); ?>

  <div class="row">
     <div class="col-md-12">
       <?php echo display_msg($msg); ?>
     </div>
  </div>
   <div class="row">
    <div class="col-md-5">
      <div class="panel panel-default">
        <div class="panel-heading">
          <strong>
            <span class="glyphicon glyphicon-th"></span>
            <span>Añadir Nueva Sucursal</span>
         </strong>
        </div>
        <div class="panel-body">
          <form method="post" action="branch.php">
            <div class="form-group">
                <input type="text" class="form-control" name="branch-name" placeholder="Sucursal" Name">
            </div>
            <button type="submit" name="add_bran" class="btn btn-primary">Añadir Sucursal</button>
        </form>
        </div>
      </div>
    </div>
    <div class="col-md-7">
    <div class="panel panel-default">
      <div class="panel-heading">
        <strong>
          <span class="glyphicon glyphicon-th"></span>
          <span>Sucursales</span>
       </strong>
      </div>
        <div class="panel-body">
          <table class="table table-bordered table-striped table-hover">
            <thead>
                <tr>
                    <th class="text-center" style="width: 50px;">#</th>
                    <th>Sucursal</th>
                    <th class="text-center" style="width: 100px;">Acciones</th>
                </tr>
            </thead>
            <tbody>
              <?php foreach ($all_branchs as $bran):?>
                <tr>
                    <td class="text-center"><?php echo count_id();?></td>
                    <td><?php echo remove_junk(ucfirst($bran['name'])); ?></td>
                    <td class="text-center">
                      <div class="btn-group">
                        <a href="edit_branch.php?id=<?php echo (int)$bran['id'];?>"  class="btn btn-xs btn-warning" data-toggle="tooltip" title="Edit">
                          <span class="glyphicon glyphicon-edit"></span>
                        </a>
                        <a href="delete_branch.php?id=<?php echo (int)$bran['id'];?>"  class="btn btn-xs btn-danger" data-toggle="tooltip" title="Remove">
                          <span class="glyphicon glyphicon-trash"></span>
                        </a>
                      </div>
                    </td>

                </tr>
              <?php endforeach; ?>
            </tbody>
          </table>
       </div>
    </div>
    </div>
   </div>
  </div>
  <?php include_once('layouts/footer.php'); ?>
