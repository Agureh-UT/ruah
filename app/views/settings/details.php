<?php $this->setSiteTitle($this->model->short_name); ?>
<?php $this->start('head'); ?>
<!-- content in head here! -->
<?php $this->end(); ?>
<?php $this->start('body'); ?>
<div class="content-header">
  <button class="back-btn" onclick="window.location.href='<?= SITE_ROOT ?>settings/index'">◀ BACK</button>
  <h5><?= $this->model->short_name ?></h5>

</div>

<div class="form-section">
  <div class="form-grid">
    <div class="form-group">
      <p><strong>Initials : </strong><?= $this->model->short_name; ?></p>
    </div>
  </div>

  <div class="form-grid">
    <div class="form-group">
      <p><strong>Long Name : </strong><?= $this->model->long_name; ?></p>
    </div>
  </div>

  <div class="form-grid">
    <div class="form-group">
      <p><strong>Email : </strong><?= $this->model->email; ?></p>
    </div>
  </div>

  <div class="form-grid">
    <div class="form-group">
      <p><strong>Website : </strong><?= $this->model->website; ?></p>
    </div>
  </div>

  <div class="form-grid">
    <div class="form-group">
      <p><strong>Contact : </strong><?= $this->model->phone; ?></p>
    </div>
  </div>

  <div class="form-grid">
    <div class="form-group">
      <p><strong>Address : </strong><?= $this->model->address; ?></p>
    </div>
  </div>


      <div class="form-grid">
              <?php if ($this->hasImage): ?>
        <div class="form-group">
          <strong>Logo : </strong>
          <img src="<?= SITE_ROOT . $this->model->logo ?>" style="height:2em;width:10em;object-fit:cover;" />
        </div>
            <?php endif; ?>
      </div>

</div>




<?php $this->end(); ?>