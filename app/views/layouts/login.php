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
    <link rel="stylesheet" href="<?= SITE_ROOT ?>css/login.css?v=<?= VERSION ?>">
    <link rel="stylesheet" href="<?=SITE_ROOT?>css/alertMsg.min.css?v=<?=VERSION?>" media="screen" title="no title" charset="utf-8">
    <?= $this->content('head'); ?>
</head>

<body>
    <!-- Header -->

    <!-- Main Container -->


    <!-- Sidebar -->

        <!-- Content -->
        <div class="content">
            <?= Session::displayMsg() ?>
            <?= $this->content('body'); ?>
        </div>



    <!-- Footer -->
    <div class="footer">
        Linchpin Solutions | All Rights Reserved. © 2018-2025
    </div>
    <script src="<?= SITE_ROOT ?>js/login.js?v=<?= VERSION ?>"></script>
    <script src="<?=SITE_ROOT?>js/alertMsg.min.js?v=<?=VERSION?>"></script>
</body>

</html>