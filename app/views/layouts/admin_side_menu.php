<?php

use Core\Router;
use Core\H;
use App\Models\{Companies, PurchaseOrders, Requisitions, Vouchers, ReceiveNotes, Users};

$menu = Router::getMenu('admin_menu_acl');
// UNAPPROVED DOCS
$UnapprovedPOCount = PurchaseOrders::itemCountUnApproved();
$unapprovedPOActive = (H::currentPage() == SITE_ROOT . 'purchaseorders/approve') ? " active" : "";
$UnapprovedSRFCount = Requisitions::itemCountUnApproved();
$UnapprovedSRFActive = (H::currentPage() == SITE_ROOT . 'requisitions/approve') ? " active" : "";
$UnapprovedVoucherCount = Vouchers::itemCountUnApproved();
$UnapprovedVoucherActive = (H::currentPage() == SITE_ROOT . 'vouchers/approve') ? " active" : "";
$totalUnapproved = $UnapprovedPOCount + $UnapprovedSRFCount + $UnapprovedVoucherCount;
// UNREVIEWED DOCS
$UnReviewedPOCount = PurchaseOrders::itemCountUnReviewed();
$UnReviewedPOActive = (H::currentPage() == SITE_ROOT . 'purchaseorders/review') ? " active" : "";
$UnReviewedSRFCount = Requisitions::itemCountUnReviewed();
$UnReviewedSRFActive = (H::currentPage() == SITE_ROOT . 'requisitions/review') ? " active" : "";
$UnReviewedVoucherCount = Vouchers::itemCountUnReviewed();
$UnReviewedVoucherActive = (H::currentPage() == SITE_ROOT . 'vouchers/review') ? " active" : "";
$totalUnreviewed = $UnReviewedPOCount + $UnReviewedSRFCount + $UnReviewedVoucherCount;
?>
<!-- Sidebar -->
<div class="sidebar" id="sidebar">
  <?= H::buildSidebarListItems($menu); ?>
  <div class="sidebar-item" onclick="toggleSidebarDropdown(this)">
    ✍️ UnApproved Docs
    <span class="sidebar-badge"><?= $totalUnapproved ?></span>
    <div class="sidebar-dropdown">
      <?php if ($UnapprovedSRFCount > 0) : ?>
        <a class="sidebar-dropdown-item <?= $UnapprovedSRFActive ?>" href="<?= SITE_ROOT ?>requisitions/approve"> Requisitions <span class="sidebar-badge"><?= $UnapprovedSRFCount ?></span></a>
      <?php endif; ?>
      <?php if ($UnapprovedPOCount > 0) : ?>
        <a class="sidebar-dropdown-item <?= $unapprovedPOActive ?>" href="<?= SITE_ROOT ?>purchaseorders/approve">Purchase Orders <span class="sidebar-badge"><?= $UnapprovedPOCount ?></span></a>
      <?php endif; ?>

      <?php if ($UnapprovedVoucherCount > 0) : ?>
        <a class="sidebar-dropdown-item <?= $UnapprovedVoucherActive ?>" href="<?= SITE_ROOT ?>vouchers/approve">Payment Vouchers <span class="sidebar-badge"><?= $UnapprovedVoucherCount ?></span></a>
      <?php endif; ?>
    </div>
  </div>
  <div class="sidebar-item" onclick="toggleSidebarDropdown(this)">
    👀 UnReviewed Docs
    <span class="sidebar-badge"><?= $totalUnreviewed ?></span>
    <div class="sidebar-dropdown">
      <?php if ($UnReviewedSRFCount > 0) : ?>
        <a class="sidebar-dropdown-item <?= $UnReviewedSRFActive ?>" href="<?= SITE_ROOT ?>requisitions/review">Requisitions <span class="sidebar-badge"><?= $UnReviewedSRFCount ?></span></a>
      <?php endif; ?>
      <?php if ($UnReviewedPOCount > 0) : ?>
        <a class="sidebar-dropdown-item <?= $UnReviewedPOActive ?>" href="<?= SITE_ROOT ?>purchaseorders/review">Purchase Orders <span class="sidebar-badge"><?= $UnReviewedPOCount ?></span></a>
      <?php endif; ?>
      <?php if ($UnReviewedVoucherCount > 0) : ?>
        <a class="sidebar-dropdown-item <?= $UnReviewedVoucherActive ?>" href="<?= SITE_ROOT ?>vouchers/review">Payment Vouchers <span class="sidebar-badge"><?= $UnReviewedVoucherCount ?></span></a>
      <?php endif; ?>
    </div>
  </div>
</div>