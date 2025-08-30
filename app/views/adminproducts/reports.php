<?php $this->start('body')?>
<table class="table table-bordered table-hover table-striped table-sm">
  <thead >
    <th>Name</th>
    <th>Desc</th>
    <th>Price</th>
    <th>Shipping</th>
    <th>List Price</th>
    <th>Inventory</th>
    <th>Brand</th>
   <!-- <th>View</th>-->
    <th  class="text-center">View/Edit/Delete</th>

  </thead>
  <tbody>
    <?php foreach($this->products as $product):
    $shipping = ($product->shipping == '0.00')? 'Free Shipping!' : 'Shipping: $'.$product->shipping;
    $list = ($product->list != '0.00')? '$'.$product->list : ''; ?>
      <tr data-id="<?=$product->id?>">
        <td><a href="<?=SITE_ROOT?>products/details/<?=$product->id?>"><?=$product->name?></a></td>
        <td><?= html_entity_decode($product->body)?></td>
        <td>$<?=$product->price ?></td>
        <td><?=$shipping ?></td>
        <td><?=$list?></td>
        <td><?=$product->inventory?></td>
        <td><?=$product->brand?></td>

        <td class="text-right">
          <a class="btn btn-sm btn-primary mr-1" href="<?=SITE_ROOT?>products/details/<?=$product->id?>"><i class="fas fa-eye"></i></a>

          <a class="btn btn-sm btn-secondary mr-1" href="<?=SITE_ROOT?>adminproducts/edit/<?=$product->id?>"><i class="fas fa-edit"></i></a>
          <a class="btn btn-sm btn-danger" href="#" onclick="deleteProduct('<?=$product->id?>');return false;"><i class="fas fa-trash-alt"></i></a>
        </td>
      </tr>
    <?php endforeach; ?>
  </tbody>
</table>


<script>
  function deleteProduct(id){
    if(window.confirm("Are you sure you want to delete this product. It cannot be reversed.")){
      jQuery.ajax({
        url : '<?=SITE_ROOT?>adminproducts/delete',
        method : "POST",
        data : {id : id},
        success: function(resp){
          var msgType = (resp.success)? 'success' : 'danger';
          if(resp.success){
            jQuery('tr[data-id="'+resp.model_id+'"]').remove();
          }
          alertMsg(resp.msg, msgType);
        }
      });
    }
  }


</script>
<?php $this->end(); ?>
