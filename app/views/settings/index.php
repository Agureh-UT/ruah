<?php

use Core\H;
use Core\FH;
use App\Models\Projects;
use App\Models\Users;
use App\Models\PurchaseOrders;
use App\Models\ReceiveNotes;
use App\Models\Requisitions;
use App\Models\Vouchers;

if (!$this->page || $this->page < 1) $this->page = 1;
$canBack = $this->page > 1;
$canForward = $this->page < $this->totalPages;
?>
<?php $this->start('body') ?>



<div class="content-header">
  <h5 class="content-title">📋 Settings</h5>
  <a class="btn btn-primary" href="<?= SITE_ROOT ?>settings/updator/new">➕ Add New</a>
</div>

<!-- Search Section -->
<form id="pagerForm" class="form-section" action="" method="post" autocomplete="off" onsubmit="return false;">
  <div class="form-grid">
    <?= FH::hiddenInput('page', $this->page) ?>
    <?= FH::hiddenInput('limit', $this->limit) ?>
  </div>

</form>

<!-- Data Table -->
<div class="table-section">
  <div class="table-section-header">SETTINGS TABLE</div>
  <div class="table-container">
    <table class="table" id="itemTable">
      <thead>
        <tr>
          <th>#</th>
          <th>Initials</th>
          <th>Name</th>
          <th>Email</th>
          <th>Website</th>
          <th>Primary Contact</th>
          <th>Address</th>
          <th>Logo</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <?php
        if ($this->page == 1) {
          $i = $this->page;
        } else {
          $i = $this->page * $this->limit - $this->limit + 1;
        }

        foreach ($this->modeldata as $data) : ?>
          <tr data-id="<?= $data->id ?>">
            <td><?= sprintf('%03d', $i++) ?></td>
            <td><?= $data->short_name ?></td>
            <td><?= $data->long_name ?></td>
            <td><?= $data->email ?></td>
            <td><?= $data->website ?></td>
            <td><?= $data->phone ?></td>
            <td><?= $data->address ?></td>
            <td>
              <?php if (isset($data->logo)) : ?>
                <img style="width: 60px; background-color:white" src="<?= SITE_ROOT . $data->logo ?>" alt="logo">
              <?php endif; ?>
            </td>
            <td>
              <div class="table-actions">
                <a class="btn btn-sm btn-view" href="<?= SITE_ROOT ?>settings/details/<?= $data->id ?>">
                  <span>👁️</span>
                </a>
                <a class="btn btn-sm btn-edit" href="<?= SITE_ROOT ?>settings/updator/<?= $data->id ?>">
                  <span>🖉</span>
                </a><!-- <button class="btn btn-sm btn-danger font-weight-bold" onclick="confirmDelete('<?= $data->id ?>')"><i class="fas fa-trash"></i> Delete</button> -->
              </div>
            </td>
          </tr>
        <?php endforeach; ?>
      </tbody>
    </table>
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
        // $i = $this->page + 1;

        for ($i = $this->page; $i <= $page_limit && $i <= $this->totalPages; $i++) : ?>
          <button onclick="pager('<?= $i ?>')" class="page-btn  <?= ($this->page == $i) ? " active" : "" ?>"><?= $i ?></button>
        <?php endfor; ?>

        <button onclick="pager('<?= $this->page + 1 ?>')" class="page-btn" <?= $canForward ? "" : "disabled" ?>>Next ›</button>
        <button onclick="pager('<?= $endPage ?>')" class="page-btn">Last ››</button>
      </div>
    </div>

  </div>
</div>


<div class="dashboard-section">
  <div class="metrics-grid">

    <div class="metric-card">
      <?php
      $requisitions = count(Requisitions::find());
      ?>
      <div class="metric-header">
        <div class="metric-title">Requisitions</div>
        <div class="metric-icon">📄</div>
      </div>
      <div class="metric-value"><b><?= $requisitions ?></b></div>
      <div class="metric-subtitle">
        <a class="card-footer border-white text-white clearfix z-1" href="<?= SITE_ROOT ?>requisitions/index">
          <span>➡️View Details</span>
        </a>
      </div>
      <div class="metric-change">
        <span></span>
        <span></span>
      </div>
    </div>

    <div class="metric-card success">
      <?php
      $LPOs = count(PurchaseOrders::find());
      ?>
      <div class="metric-header">
        <div class="metric-title">Purchase Orders</div>
        <div class="metric-icon">📄</div>
      </div>
      <div class="metric-value"><b><?= $LPOs ?></b></div>
      <div class="metric-subtitle">
        <a class="card-footer border-white text-white clearfix z-1" href="<?= SITE_ROOT ?>purchaseorders/index">
          <span>➡️View Details</span>
        </a>
      </div>
      <div class="metric-change">
        <span></span>
        <span></span>
      </div>
    </div>

    <div class="metric-card warning">
      <?php
      $receivenotes = count(ReceiveNotes::find());
      ?>
      <div class="metric-header">
        <div class="metric-title">Receive Notes</div>
        <div class="metric-icon">📄</div>
      </div>
      <div class="metric-value"><b><?= $receivenotes ?></b></div>
      <div class="metric-subtitle">
        <a class="card-footer border-white text-white clearfix z-1" href="<?= SITE_ROOT ?>receivenotes/index">
          <span>➡️View Details</span>
        </a>
      </div>
      <div class="metric-change">
        <span></span>
        <span></span>
      </div>
    </div>

    <div class="metric-card info">
      <?php
      $vouchers = count(Vouchers::find());
      ?>
      <div class="metric-header">
        <div class="metric-title">Vouchers</div>
        <div class="metric-icon">📄</div>
      </div>
      <div class="metric-value"><b><?= $vouchers ?></b></div>
      <div class="metric-subtitle">
        <a class="card-footer border-white text-white clearfix z-1" href="<?= SITE_ROOT ?>vouchers/index">
          <span>➡️View Details</span>
        </a>
      </div>
      <div class="metric-change">
        <span></span>
        <span></span>
      </div>
    </div>

  </div>
</div>
<!-- /.row -->
<!-- Main row -->

<!-- </div> -->

</div>
<script>
  // function confirmDelete(userId) {
  //   if (window.confirm("Are you sure you want to delete the data? This cannot be undone!")) {
  //     window.location.href = `<?= SITE_ROOT ?>useradmin/deleteUser/${userId}`;
  //   }
  // }

  function pager(page) {
    document.getElementById('page').value = page;
    var form = document.getElementById('pagerForm');
    form.submit();
  }

  document.getElementById('pagerForm').addEventListener('submit', function(evt) {
    var form = evt.target;
    evt.preventDefault();
    document.getElementById('page').value = 1;
    form.submit();
  });

  // To prevent page reload/refresh confirmation when data clicks pager values are changed
  if (window.history.replaceState) {
    window.history.replaceState(null, null, window.location.href);
  }
</script>
<?php $this->end(); ?>