<?php
use Core\Session;
use Core\FH;
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="<?= SITE_ROOT ?>favicon.ico" type="image/x-icon">
    <title><?=$this->siteTitle(); ?></title>
    <link rel="stylesheet" href="<?=SITE_ROOT?>css/styles.css?v=<?=VERSION?>" media="screen" title="no title" charset="utf-8">
    <link rel="stylesheet" href="<?=SITE_ROOT?>css/alertMsg.min.css?v=<?=VERSION?>" media="screen" title="no title" charset="utf-8">
    <!-- <link rel="stylesheet" href="<?=SITE_ROOT?>css/custom.css?v=<?=VERSION?>" media="screen" title="no title" charset="utf-8"> -->
    <script>
        const JS_SITE_ROOT = `<?= SITE_ROOT ?>`;

        const JS_FILES_ROOT = `<?= FILES_ROOT ?>`;
    </script>
    <?= $this->content('head'); ?>
</head>

<body>
    <!-- Header -->
    <?php include 'admin_menu.php' ?>

    <!-- Main Container -->
    <div class="main-container">

    <!-- Sidebar -->
    <?php include 'admin_side_menu.php' ?>

        <!-- Content -->
        <div class="content">
            <?= Session::displayMsg() ?>
            <?= $this->content('body'); ?>
        <!-- Closing div for content section shall be closed at the respective view  -->
        <!-- </div> -->

      </div>

    <!-- Footer -->
    <div class="footer">
        Linchpin Solutions | All Rights Reserved. © 2018-2025
    </div>
    <script src="<?=SITE_ROOT?>js/app.js?v=<?=VERSION?>"></script>
    <script src="<?=SITE_ROOT?>js/alertMsg.min.js?v=<?=VERSION?>"></script>
</body>

</html>