<?php
use Core\FH;
?>
<?php $this->start('head') ?>
<?php $this->end() ?>
<?php $this->start('body'); ?>
<div class="content-header">
  <h2>🔐 System Login</h2>
  <p>Please enter your credentials to access the system</p>
</div>

<div class="login-form">
  <div class="error-message" id="errorMessage">
    Invalid username or password. Please try again.
  </div>

  <form id="loginForm"  action="<?=SITE_ROOT?>auth/index" method="post" novalidate>
  <?= FH::csrfInput() ?>
  
  <?= FH::inputBlock("text","Username","username",$this->login->username,
  ['class'=>"form-control", 'required' => "true", 'autocomplete' => "username", 'placeholder' => "Enter your username"],
  ['class'=>"form-group"],$this->displayErrors); ?>


  <?= FH::passwordBlock('password','Password','password',$this->login->password,
  ['class'=>'form-control', 'required' => 'required', 'autocomplete' => "current-password", 'placeholder' => "Enter your password"],
  ['type'=>"button",'class'=>"password-toggle",'onclick'=>"togglePassword();"],['class'=>"password-container"],['class'=>"form-group"],
  $this->displayErrors); ?>

  <?= FH::submitTag('🚀 LOGIN TO SYSTEM', ['class' => 'btn-login']) ?>
  </form>
</div>

<?php $this->end(); ?>