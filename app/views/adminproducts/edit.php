<?php

use Core\FH; ?>
<?php $this->setSiteTitle("Edit " . $this->product->name); ?>
<?php $this->start('head') ?>
<script src='<?= SITE_ROOT ?>vendor/tinymce/tinymce/tinymce.min.js'></script>
<script>
  tinymce.init({
    selector: '#body',
    width: "100%",
    height: 500,
    plugins: [
      'advlist', 'autolink', 'link', 'image', 'lists', 'charmap', 'preview', 'anchor', 'pagebreak',
      'searchreplace', 'wordcount', 'visualblocks', 'code', 'fullscreen', 'insertdatetime', 'media',
      'table', 'emoticons', 'template', 'codesample'
    ],
    toolbar: 'undo redo | styles | bold italic underline | alignleft aligncenter alignright alignjustify |' +
      'bullist numlist outdent indent | link image | print preview media fullscreen | ' +
      'forecolor backcolor emoticons',
    menu: {
      favs: {
        title: 'menu',
        items: 'code visualaid | searchreplace | emoticons'
      }
    },
    menubar: 'favs file edit view insert format tools table',
    content_style: 'body{font-family:Helvetica,Arial,sans-serif; font-size:16px}',
    branding: false,
    relative_urls: false,
    remove_script_host: false,
    document_base_url: JS_SITE_ROOT,
  });
</script>

<style>
  .select2-container {
    display: block;
  }

  /* Custom Multi-Select Styles */
  .custom-multi-select {
    position: relative;
    width: 100%;
    margin-bottom: 10px;
  }

  .select-display {
    border: 1px solid #ddd;
    border-radius: 4px;
    padding: 8px 12px;
    background: white;
    cursor: pointer;
    display: flex;
    justify-content: space-between;
    align-items: center;
    min-height: 38px;
  }

  .select-display:hover {
    border-color: #999;
  }

  .select-display:focus {
    border-color: #007bff;
    box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
  }

  .placeholder {
    color: #666;
    flex: 1;
  }

  .arrow {
    color: #999;
    font-size: 12px;
    transition: transform 0.2s;
  }

  .select-dropdown {
    position: absolute;
    top: 100%;
    left: 0;
    right: 0;
    background: white;
    border: 1px solid #ddd;
    border-top: none;
    border-radius: 0 0 4px 4px;
    z-index: 1000;
    max-height: 300px;
    overflow-y: auto;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
  }

  .search-input {
    width: 100%;
    padding: 8px 12px;
    border: none;
    border-bottom: 1px solid #eee;
    outline: none;
    font-size: 14px;
  }

  .search-input:focus {
    background-color: #f8f9fa;
  }

  .options-list {
    max-height: 200px;
    overflow-y: auto;
  }

  .option-item {
    padding: 8px 12px;
    cursor: pointer;
    display: flex;
    align-items: center;
    transition: background-color 0.2s;
  }

  .option-item:hover {
    background-color: #f8f9fa;
  }

  .option-item.selected {
    background-color: #e3f2fd;
  }

  .option-item input[type="checkbox"] {
    margin-right: 8px;
    margin-top: 0;
  }

  .option-item span {
    flex: 1;
    font-size: 14px;
  }

  /* Hide original select when custom is active */
  .multi-options-select[style*="display: none"] + .custom-multi-select {
    display: block;
  }
</style>

<script>
  let availableOptions = [];
  let selectedOptions = [];

  function calcInventory() {
    var total = 0;
    var options = document.querySelectorAll('input.option_inventory');
    for (var i = 0; i < options.length; i++) {
      var option = options[i];
      total += parseInt(option.value, 10) || 0;
    }
    document.getElementById('inventory').value = total;
  }

  // Load available options from server
  async function loadAvailableOptions() {
    try {
      const response = await fetch('<?= SITE_ROOT ?>adminproducts/getOptionsForForm', {
        method: 'GET',
        headers: {
          'Content-Type': 'application/json',
        }
      });
      const data = await response.json();
      availableOptions = data.items || [];
      updateCustomSelect();
    } catch (error) {
      console.error('Error loading options:', error);
    }
  }

  // Create custom multi-select functionality
  function createCustomMultiSelect() {
    const selectElement = document.querySelector('.multi-options-select');
    if (!selectElement) return;

    // Hide the original select
    selectElement.style.display = 'none';

    // Create custom select container
    const customSelect = document.createElement('div');
    customSelect.className = 'custom-multi-select';
    customSelect.innerHTML = `
      <div class="select-display" onclick="toggleDropdown()">
        <span class="placeholder">Select options...</span>
        <span class="arrow">▼</span>
      </div>
      <div class="select-dropdown" style="display: none;">
        <input type="text" class="search-input" placeholder="Search options..." oninput="filterOptions(this.value)">
        <div class="options-list"></div>
      </div>
    `;

    selectElement.parentNode.insertBefore(customSelect, selectElement);
    
    // Initialize with existing selected options
    initializeSelectedOptions();
    updateCustomSelect();
  }

  function initializeSelectedOptions() {
    const selectElement = document.querySelector('.multi-options-select');
    if (selectElement) {
      const options = selectElement.querySelectorAll('option[selected]');
      options.forEach(option => {
        selectedOptions.push({
          id: option.value,
          text: option.textContent
        });
      });
    }
  }

  function toggleDropdown() {
    const dropdown = document.querySelector('.select-dropdown');
    const isVisible = dropdown.style.display !== 'none';
    dropdown.style.display = isVisible ? 'none' : 'block';
    
    if (!isVisible) {
      loadAvailableOptions();
    }
  }

  function filterOptions(searchTerm) {
    const filteredOptions = availableOptions.filter(option => 
      option.text.toLowerCase().includes(searchTerm.toLowerCase())
    );
    renderOptions(filteredOptions);
  }

  function renderOptions(options) {
    const optionsList = document.querySelector('.options-list');
    optionsList.innerHTML = '';

    options.forEach(option => {
      const isSelected = selectedOptions.some(selected => selected.id === option.id);
      const optionDiv = document.createElement('div');
      optionDiv.className = `option-item ${isSelected ? 'selected' : ''}`;
      optionDiv.innerHTML = `
        <input type="checkbox" ${isSelected ? 'checked' : ''} onchange="toggleOption('${option.id}', '${option.text}', this.checked)">
        <span>${option.text}</span>
      `;
      optionsList.appendChild(optionDiv);
    });
  }

  function toggleOption(optionId, optionText, isSelected) {
    if (isSelected) {
      // Add option
      if (!selectedOptions.some(opt => opt.id === optionId)) {
        selectedOptions.push({ id: optionId, text: optionText });
        addOptionInventoryField(optionId, optionText);
      }
    } else {
      // Remove option
      selectedOptions = selectedOptions.filter(opt => opt.id !== optionId);
      removeOptionInventoryField(optionId);
    }
    
    updateCustomSelect();
    updateOriginalSelect();
  }

  function addOptionInventoryField(optionId, optionText) {
    const wrap = document.getElementById('optionsInventoryWrapper');
    const inputWrap = document.createElement('div');
    inputWrap.setAttribute('class', 'form-group');
    inputWrap.setAttribute('data-id', optionId);

    const label = document.createElement('label');
    label.setAttribute('class', 'control-label');
    label.setAttribute('for', 'inventory_' + optionId);
    const labelText = document.createTextNode(optionText + " Inventory");
    label.appendChild(labelText);
    inputWrap.appendChild(label);

    const input = document.createElement('input');
    input.setAttribute('class', 'form-control option_inventory');
    input.setAttribute('type', 'number');
    input.setAttribute('id', 'inventory_' + optionId);
    input.setAttribute('name', 'inventory_' + optionId);
    input.setAttribute('value', '0');
    input.addEventListener('blur', calcInventory);
    inputWrap.appendChild(input);
    wrap.appendChild(inputWrap);
    
    calcInventory();
  }

  function removeOptionInventoryField(optionId) {
    const wrap = document.querySelector('div[data-id="' + optionId + '"]');
    if (wrap) {
      wrap.remove();
      calcInventory();
    }
  }

  function updateCustomSelect() {
    const placeholder = document.querySelector('.placeholder');
    if (placeholder) {
      if (selectedOptions.length === 0) {
        placeholder.textContent = 'Select options...';
      } else if (selectedOptions.length === 1) {
        placeholder.textContent = selectedOptions[0].text;
      } else {
        placeholder.textContent = `${selectedOptions.length} options selected`;
      }
    }
  }

  function updateOriginalSelect() {
    const selectElement = document.querySelector('.multi-options-select');
    if (selectElement) {
      // Clear all selections
      const options = selectElement.querySelectorAll('option');
      options.forEach(option => option.selected = false);
      
      // Set selected options
      selectedOptions.forEach(selected => {
        const option = selectElement.querySelector(`option[value="${selected.id}"]`);
        if (option) {
          option.selected = true;
        } else {
          // Create new option if it doesn't exist
          const newOption = document.createElement('option');
          newOption.value = selected.id;
          newOption.textContent = selected.text;
          newOption.selected = true;
          selectElement.appendChild(newOption);
        }
      });
    }
  }

    // Close dropdown when clicking outside
  document.addEventListener('click', function(event) {
    const customSelect = document.querySelector('.custom-multi-select');
    const dropdown = document.querySelector('.select-dropdown');
    
    if (customSelect && dropdown && !customSelect.contains(event.target)) {
      dropdown.style.display = 'none';
    }
  });

  function goBack() {
    showConfirm('Are you sure you want to go back? Any unsaved changes will be lost.', function(result) {
      if (result) {
        window.history.back();
      }
    });
  }

  // Initialize event listeners when DOM is ready
  document.addEventListener('DOMContentLoaded', function() {
    const hasOptionsCheckbox = document.getElementById('has_options');
    if (hasOptionsCheckbox) {
      hasOptionsCheckbox.addEventListener('change', function(evt) {
        var wrapper = document.getElementById('optionsWrapper');
        var inventory = document.getElementById('inventory');
        if (evt.target.checked) {
          wrapper.classList.add('d-block');
          wrapper.classList.remove('d-none');
          inventory.setAttribute('readonly', "readonly");
        } else {
          wrapper.classList.add('d-none');
          wrapper.classList.remove('d-block');
          inventory.removeAttribute('readonly');
        }
      });
    }

    // Initialize custom multi-select
    calcInventory();
    createCustomMultiSelect();
  });
</script>
</script>
<?php $this->end() ?>

<?php $this->start('body'); ?>
<div class="content-header">
  <button class="back-btn" onclick="goBack()">◀ BACK</button>
  <h5><?= $this->header ?></h5>
</div>

<form action="" method="POST" enctype="multipart/form-data" class="" id="mainForm">
  <!-- Start of form section -->
  <div class="form-section">
    <?= FH::displayErrors($this->displayErrors) ?>
    <div class="form-grid">
      <?= FH::csrfInput(); ?>
      <input type="hidden" id="images_sorted" name="images_sorted" value="" />
      <?= FH::inputBlock('text', 'Product Name', 'name', $this->product->name, ['class' => 'form-control'], ['class' => 'form-group'], $this->displayErrors) ?>
      <?= FH::selectBlock('Brand', 'brand_id', $this->product->brand_id, $this->brands, ['class' => 'form-control'], ['class' => 'form-group'], $this->displayErrors) ?>
      <?= FH::inputBlock('number', 'Price', 'price', $this->product->price, ['class' => 'form-control', 'step' => 'any'], ['class' => 'form-group'], $this->displayErrors) ?>
      <?= FH::inputBlock('number', 'List Price', 'list', $this->product->list, ['class' => 'form-control', 'step' => 'any'], ['class' => 'form-group'], $this->displayErrors) ?>
      <?= FH::inputBlock('number', 'Shipping Cost', 'shipping', $this->product->shipping, ['class' => 'form-control', 'step' => 'any'], ['class' => 'form-group'], $this->displayErrors) ?>
    </div>
    <div class="form-grid">
      <?php
      $invInputClass = ['class' => 'form-control'];
      if ($this->product->hasOptions()) {
        $invInputClass['readonly'] = 'readonly';
      }
      ?>
      <?= FH::inputBlock('number', 'Inventory', 'inventory', $this->product->inventory, $invInputClass, ['class' => 'form-group'], $this->displayErrors) ?>
      <?= FH::checkboxBlock2('Featured Product', 'featured', $this->product->isChecked(), ['class' => 'checkbox'], ['class' => 'checkbox-group'], $this->displayErrors) ?>
      <?= FH::checkboxBlock2('Has Options', 'has_options', $this->product->hasOptions(), ['class' => 'checkbox'], ['class' => 'checkbox-group'], $this->displayErrors) ?>
    </div>
    <?= FH::textareaBlock('Product Description', 'body', $this->product->body, ['class' => 'form-textarea', 'rows' => '6'], ['class' => 'form-group'], $this->displayErrors) ?>
    <!-- End of form section -->
  </div>

  <!-- Product Options Section -->
  <div class="table-section <?= ($this->product->hasOptions()) ? 'd-block' : 'd-none' ?>" id="optionsWrapper">
    <div class="table-section-header">PRODUCT OPTIONS SECTION</div>
    <div class="table-container">
      <div class="form-grid">
        <div class="form-group">
          <label class="control-label">Product Options</label>
          <select class="multi-options-select form-control" name="options[]" multiple="multiple">
            <?php foreach ($this->options as $option) : ?>
              <option value="<?= $option->id ?>" selected="selected"><?= $option->name ?></option>
            <?php endforeach; ?>
          </select>
        </div>
      </div>
      
      <div id="optionsInventoryWrapper">
        <?php foreach ($this->options as $option) {
          echo FH::inputBlock('number', $option->name . " Inventory", 'inventory_' . $option->id, $option->inventory, ['class' => 'form-control option_inventory', 'onblur' => "calcInventory()"], ['class' => 'form-group', 'data-id' => $option->id]);
        } ?>
      </div>
    </div>
  </div>

  <!-- Product Images Section -->
  <div class="table-section">
    <div class="table-section-header">PRODUCT IMAGES SECTION</div>
    <div class="table-container">
      <?php $this->partial('adminproducts', 'editImages') ?>
      
      <div class="form-grid">
        <?= FH::inputBlock('file', "Upload Product Images:", 'productImages[]', '', ['class' => 'form-control', 'multiple' => 'multiple'], ['class' => 'form-group'], $this->displayErrors) ?>
      </div>
    </div>
  </div>

  <!-- Submit and Cancel Buttons -->
  <div class="form-grid">
    <div class="action-buttons">
      <a href="<?= SITE_ROOT ?>adminproducts" class="btn-cancel">✖ CANCEL</a>
      <?= FH::submitTag("💾 SAVE PRODUCT", ['class' => 'btn-save'], []); ?>
    </div>
  </div>
</form>

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

  function goBack() {
    showConfirm('Are you sure you want to go back? Any unsaved changes will be lost.', function(result) {
      if (result) {
        window.history.back();
      }
    });
  }

  // Initialize event listeners when DOM is ready
  document.addEventListener('DOMContentLoaded', function() {
    const hasOptionsCheckbox = document.getElementById('has_options');
    if (hasOptionsCheckbox) {
      hasOptionsCheckbox.addEventListener('change', function(evt) {
        var wrapper = document.getElementById('optionsWrapper');
        var inventory = document.getElementById('inventory');
        if (evt.target.checked) {
          wrapper.classList.add('d-block');
          wrapper.classList.remove('d-none');
          inventory.setAttribute('readonly', "readonly");
        } else {
          wrapper.classList.add('d-none');
          wrapper.classList.remove('d-block');
          inventory.removeAttribute('readonly');
        }
      });
    }

    // Initialize custom multi-select
    calcInventory();
    createCustomMultiSelect();
  });
</script>
<?php $this->end() ?>