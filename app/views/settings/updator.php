<?php
use Core\FH; ?>
<?php $this->start('head') ?>
<?php $this->end() ?>
<?php $this->start('body'); ?>
<div class="content-header">
  <button class="back-btn" onclick="window.location.href='<?= SITE_ROOT ?>settings/index'">◀ BACK</button>
  <h5>COMPANY SETTINGS</h5>
</div>
<form action="" method="POST" class="" id="mainForm" enctype="multipart/form-data">
  <!-- Start of form section -->
  <div class="form-section">
    <?= FH::displayErrors($this->displayErrors) ?>
    <div class="form-grid">
      <?= FH::csrfInput(); ?>
      <!-- Company Basic Information -->
      <?= FH::inputBlock('text', 'Initials', 'short_name', $this->model->short_name, ['class' => 'form-control'], ['class' => 'form-group'], $this->displayErrors) ?>
      <?= FH::inputBlock('text', 'Full Name', 'long_name', $this->model->long_name, ['class' => 'form-control'], ['class' => 'form-group'], $this->displayErrors) ?>
      <?= FH::inputBlock('text', 'Email', 'email', $this->model->email, ['class' => 'form-control'], ['class' => 'form-group'], $this->displayErrors) ?>
      <?= FH::inputBlock('text', 'Website', 'website', $this->model->website, ['class' => 'form-control'], ['class' => 'form-group'], $this->displayErrors) ?>
      <?= FH::inputBlock('text', 'Contacts', 'phone', $this->model->phone, ['class' => 'form-control'], ['class' => 'form-group'], $this->displayErrors) ?>
    </div>
    <div class="form-grid">
      <?= FH::inputBlock('text', 'Address', 'address', $this->model->address, ['class' => 'form-control'], ['class' => 'form-group'], $this->displayErrors) ?>
      <?= FH::inputBlock('text', 'trx Start', 'trx_no', $this->model->trx_no, ['class' => 'form-control'], ['class' => 'form-group'], $this->displayErrors) ?>
      <?= FH::inputBlock('text', 'SRF start', 'req_no', $this->model->req_no, ['class' => 'form-control'], ['class' => 'form-group'], $this->displayErrors) ?>
      <?= FH::inputBlock('text', 'PO Start', 'po_no', $this->model->po_no, ['class' => 'form-control'], ['class' => 'form-group'], $this->displayErrors) ?>
      <?= FH::inputBlock('text', 'RR Start', 'rn_no', $this->model->rn_no, ['class' => 'form-control'], ['class' => 'form-group'], $this->displayErrors) ?>
      <?= FH::inputBlock('text', 'Sale Invoice Start', 'sale_no', $this->model->sale_no, ['class' => 'form-control'], ['class' => 'form-group'], $this->displayErrors) ?>
      <?= FH::inputBlock('text', 'Purchase Invoice Start', 'purchase_no', $this->model->purchase_no, ['class' => 'form-control'], ['class' => 'form-group'], $this->displayErrors) ?>
    </div>
    <div class="form-grid">
      <?= FH::inputBlock('text', 'Voucher Start', 'voucher_trx_no', $this->model->voucher_trx_no, ['class' => 'form-control'], ['class' => 'form-group'], $this->displayErrors) ?>
      <?= FH::inputBlock('file', 'Logo', 'logo', $this->model->logo, ['class' => 'form-control'], ['class' => 'form-group'], $this->displayErrors); ?>
      <?php if ($this->hasImage) : ?>
        <div class="form-group">
          <label class="form-label">Current Logo</label>
          <div class="form-control">
          <img class="" src="<?= SITE_ROOT . $this->model->logo ?>" style="height:2em;width:auto;object-fit:cover;" />
        </div>
        </div>

  <?php endif; ?>
    </div>
    <!-- End of form section -->
  </div>
  

  <!-- Submit and Cancel Buttons Row -->
  <div class="form-grid">
    <div class="action-buttons">
      <a href="<?= SITE_ROOT ?>settings" class="btn-cancel">✖ CANCEL</a>
      <?= FH::submitTag("💾 SAVE", ['class' => 'btn-save'], []); ?>
    </div>
  </div>
</form>

<?php $this->end(); ?>