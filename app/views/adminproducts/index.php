<?php

use Core\FH;

if (!$this->page || $this->page < 1) $this->page = 1;
$canBack = $this->page > 1;
$canForward = $this->page < $this->totalPages;
$startPage = 1;
$endPage = $this->totalPages;

?>
<?php $this->start('head') ?>
<?php $this->end() ?>
<?php $this->start('body') ?>
<div class="content-header">
  <h5 class="content-title">📦 Manage Products</h5>
  <a class="btn btn-secondary" href="<?= SITE_ROOT ?>adminproducts/index">🛖 Products</a>
  <a class="btn btn-secondary" href="<?= SITE_ROOT ?>adminproducts/categories">📂 Categories</a>
  <a class="btn btn-secondary" href="<?= SITE_ROOT ?>adminproducts/brands">🏷️ Brands</a>
  <a class="btn btn-secondary" href="<?= SITE_ROOT ?>adminproducts/excel">📊 Export</a>
  <a class="btn btn-primary" href="<?= SITE_ROOT ?>adminproducts/edit/new">➕ Add New Product</a>
</div>

<!-- Search Section -->
<form id="pagerForm" class="form-section" action="" method="post" autocomplete="off" onsubmit="return false;">
  <div class="form-grid">
    <?= FH::hiddenInput('p', $this->page) ?>
    <?= FH::hiddenInput('limit', $this->limit) ?>
    <?= FH::inputBlock('text', 'Search', 'search', $this->search, ['class' => 'form-control', 'placeholder' => 'Search products...'], ['class' => 'form-group']) ?>
    <?= FH::selectBlock('Brand', 'brand', $this->brand, $this->brandOptions, ['class' => 'form-control'], ['class' => 'form-group']) ?>
    <?= FH::inputBlock('number', 'Price Min', 'min_price', $this->min_price, ['class' => 'form-control', 'step' => 'any', 'placeholder' => '0.00'], ['class' => 'form-group']) ?>
    <?= FH::inputBlock('number', 'Price Max', 'max_price', $this->max_price, ['class' => 'form-control', 'step' => 'any', 'placeholder' => '0.00'], ['class' => 'form-group']) ?>
  </div>
  <div class="search-actions">
    <button class="btn btn-search">🔍 Search</button>
    <button class="btn btn-reset" onclick="resetSearch()">🔄 Reset</button>
  </div>
</form>

<!-- Data Table -->
<div class="table-section">
  <div class="table-section-header">PRODUCTS TABLE</div>
  <div class="table-container">
    <table class="table">
      <thead>
        <tr>
          <th>#</th>
          <th>ID</th>
          <th>PRODUCT NAME</th>
          <th>BRAND</th>
          <th>PRICE</th>
          <th>LIST PRICE</th>
          <th>SHIPPING</th>
          <th>ACTIONS</th>
        </tr>
      </thead>
      <tbody>
        <?php
        if ($this->page == 1) {
          $i = $this->page;
        } else {
          $i = $this->page * $this->limit - $this->limit + 1;
        }

        foreach ($this->products as $product) :
          $shipping = ($product->shipping == '0.00') ? 'Free Shipping!' : 'Shipping: $' . $product->shipping;
          $list = ($product->list != '0.00') ? '$' . $product->list : 'N/A';
        ?>
          <tr data-id="<?= $product->id ?>">
            <td><?= sprintf('%03d', $i++) ?></td>
            <td><?= $product->id ?></td>
            <td><?= $product->name ?></td>
            <td><?= $product->brand ?></td>
            <td>$<?= $product->price ?></td>
            <td><?= $list ?></td>
            <td><?= $shipping ?></td>
            <td>
              <div class="table-actions">
                <a class="btn btn-sm btn-view" href="<?= SITE_ROOT ?>adminproducts/details/<?= $product->id ?>">
                  <span>👁️</span>
                </a>
                <a class="btn btn-sm btn-edit" href="<?= SITE_ROOT ?>adminproducts/edit/<?= $product->id ?>">
                  <span>🖉</span>
                </a>
                <a class="btn btn-sm btn-delete" href="#" onclick="deleteProduct('<?= $product->id ?>');return false;">
                  <span>🗑️</span>
                </a>
              </div>
            </td>
          </tr>
        <?php endforeach; ?>
      </tbody>
    </table>
  </div>
</div>

<!-- Pagination -->
<div class="pagination-section">
  <div class="pagination-info">
    <!-- A dynamic PHP functionality for text "Showing 1-8 of 25 records" -->
    <?php
    $startRecord = ($this->page - 1) * $this->limit + 1;
    $endRecord = min($this->page * $this->limit, $this->total);
    $totalRecords = $this->total;
    $startPage = 1;
    $endPage = $this->totalPages;
    ?>
    Showing <?= $startRecord ?>-<?= $endRecord ?> of <?= $totalRecords ?> records
    <!-- End of dynamic PHP functionality -->
  </div>
  <div class="pagination">
    <button class="page-btn" onclick="pager(<?= $startPage ?>)">Start ‹‹</button>
    <button <?= $canBack ? "" : "disabled" ?> class="page-btn" onclick="pager(<?= $this->page - 1 ?>)">Prev ‹</button>
    <?php
    //You can change this $page_limit to whichever number you like to set maximum number of page navigation links to display 
    $page_limit = $this->page + 5;

    for ($i = $this->page; $i <= $page_limit && $i <= $this->totalPages; $i++) : ?>
      <button onclick="pager('<?= $i ?>')" class="page-btn  <?= ($this->page == $i) ? " active" : "" ?>"><?= $i ?></button>
    <?php endfor; ?>

    <button onclick="pager('<?= $this->page + 1 ?>')" class="page-btn" <?= $canForward ? "" : "disabled" ?>>Next ›</button>
    <button onclick="pager('<?= $endPage ?>')" class="page-btn">Last ››</button>
  </div>
</div>

<!-- close content div -->
</div>

<!-- Custom Alert -->
<div class="custom-alert" id="customAlert">
  <div class="alert-content">
    <div class="alert-header" id="alertHeader">
      <span id="alertIcon"></span>
      <span id="alertTitle"></span>
    </div>
    <div class="alert-body">
      <p id="alertMessage"></p>
    </div>
    <div class="alert-footer">
      <button class="btn btn-primary" onclick="closeAlert()">OK</button>
    </div>
  </div>
</div>

<!-- Custom Confirm -->
<div class="custom-alert" id="customConfirm">
  <div class="alert-content">
    <div class="alert-header warning">
      <span>⚠️</span>
      <span>Confirm Action</span>
    </div>
    <div class="alert-body">
      <p id="confirmMessage"></p>
    </div>
    <div class="alert-footer">
      <button class="btn btn-secondary" onclick="closeConfirm(false)">Cancel</button>
      <button class="btn btn-danger" onclick="closeConfirm(true)">Confirm</button>
    </div>
  </div>
</div>

<script>
  // Custom Alert/Confirm variables
  let confirmCallback = null;

  // Custom Alert function
  function showAlert(type, title, message) {
    const alertModal = document.getElementById('customAlert');
    const alertHeader = document.getElementById('alertHeader');
    const alertIcon = document.getElementById('alertIcon');
    const alertTitle = document.getElementById('alertTitle');
    const alertMessage = document.getElementById('alertMessage');

    // Reset classes
    alertHeader.className = `alert-header ${type}`;

    // Set content based on type
    switch (type) {
      case 'success':
        alertIcon.textContent = '✅';
        break;
      case 'error':
        alertIcon.textContent = '❌';
        break;
      case 'warning':
        alertIcon.textContent = '⚠️';
        break;
      default:
        alertIcon.textContent = 'ℹ️';
    }

    alertTitle.textContent = title;

    // Handle different message types
    if (Array.isArray(message)) {
      if (type === 'error') {
        // Display errors with red bullet points and ❌ icons
        const errorList = message.map(msg => `<div style="color: #dc3545; margin: 5px 0;"><span style="margin-right: 8px;">❌</span>${msg}</div>`);
        alertMessage.innerHTML = errorList.join('');
      } else {
        alertMessage.innerHTML = message.join("<br>");
      }
    } else if (typeof message === 'object' && message !== null) {
      // Handle object messages (convert to readable format)
      if (message.message) {
        alertMessage.innerHTML = message.message;
      } else {
        // Convert object to readable format
        const messageArray = [];
        for (const [key, value] of Object.entries(message)) {
          if (Array.isArray(value)) {
            messageArray.push(`${key}: ${value.join(', ')}`);
          } else {
            messageArray.push(`${key}: ${value}`);
          }
        }
        
        if (type === 'error') {
          // Display errors with red bullet points and ❌ icons
          const errorList = messageArray.map(msg => `<div style="color: #dc3545; margin: 5px 0;"><span style="margin-right: 8px;">❌</span>${msg}</div>`);
          alertMessage.innerHTML = errorList.join('');
        } else {
          alertMessage.innerHTML = messageArray.join("<br>");
        }
      }
    } else {
      alertMessage.innerHTML = message;
    }

    alertModal.classList.add('show');
    document.body.style.overflow = 'hidden';
  }

  function closeAlert() {
    const alertModal = document.getElementById('customAlert');
    alertModal.classList.remove('show');
    document.body.style.overflow = 'auto';
  }

  // Custom Confirm function
  function showConfirm(message, callback) {
    const confirmModal = document.getElementById('customConfirm');
    const confirmMessage = document.getElementById('confirmMessage');

    confirmMessage.textContent = message;
    confirmCallback = callback;

    confirmModal.classList.add('show');
    document.body.style.overflow = 'hidden';
  }

  function closeConfirm(result) {
    const confirmModal = document.getElementById('customConfirm');
    confirmModal.classList.remove('show');
    document.body.style.overflow = 'auto';

    if (confirmCallback) {
      confirmCallback(result);
      confirmCallback = null;
    }
  }

  function deleteProduct(id) {
    showConfirm("Are you sure you want to delete this product? This action cannot be reversed.", function(confirmed) {
      if (confirmed) {
        // Create form data
        const formData = new FormData();
        formData.append('id', id);

        fetch('<?= SITE_ROOT ?>adminproducts/delete', {
          method: 'POST',
          body: formData
        })
        .then(response => response.json())
        .then(resp => {
          const msgType = resp.success ? 'success' : 'error';
          if (resp.success) {
            const row = document.querySelector('tr[data-id="' + resp.model_id + '"]');
            if (row) {
              row.remove();
            }
          }
          showAlert(msgType, msgType === 'success' ? 'Success' : 'Error', resp.msg);
        })
        .catch(error => {
          console.error('Error:', error);
          showAlert('error', 'Error', 'An error occurred while deleting the product.');
        });
      }
    });
  }

  function pager(page) {
    document.getElementById('p').value = page;
    var form = document.getElementById('pagerForm');
    form.submit();
  }

  document.getElementById('pagerForm').addEventListener('submit', function(evt) {
    var form = evt.target;
    evt.preventDefault();
    document.getElementById('p').value = 1;
    form.submit();
  });

  function resetSearch() {
    // Reset all search inputs
    document.querySelectorAll('.form-control').forEach(input => {
      if (input.type !== 'hidden') {
        input.value = '';
      }
    });
  }

  // To prevent page reload/refresh confirmation when user clicks pager values are changed
  if (window.history.replaceState) {
    window.history.replaceState(null, null, window.location.href);
  }
</script>
<?php $this->end(); ?>