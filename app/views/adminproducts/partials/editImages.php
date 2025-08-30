<style>
  .images-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
    gap: 15px;
    padding: 20px;
    background: #f8f9fa;
    border-radius: 8px;
    margin-bottom: 20px;
  }

  .image-card {
    position: relative;
    background: white;
    border-radius: 8px;
    padding: 10px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    transition: transform 0.2s, box-shadow 0.2s;
    cursor: move;
    border: 2px solid transparent;
  }

  .image-card:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(0,0,0,0.15);
    border-color: #007bff;
  }

  .image-card.dragging {
    opacity: 0.5;
    transform: rotate(5deg);
  }

  .image-preview {
    width: 100%;
    height: 120px;
    object-fit: cover;
    border-radius: 6px;
    background: #f8f9fa;
  }

  .image-controls {
    position: absolute;
    top: 5px;
    right: 5px;
    display: flex;
    gap: 5px;
  }

  .control-btn {
    width: 24px;
    height: 24px;
    border-radius: 50%;
    border: none;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 12px;
    transition: all 0.2s;
  }

  .delete-btn {
    background: #dc3545;
    color: white;
  }

  .delete-btn:hover {
    background: #c82333;
    transform: scale(1.1);
  }

  .sort-handle {
    background: #6c757d;
    color: white;
  }

  .sort-handle:hover {
    background: #5a6268;
    transform: scale(1.1);
  }

  .drop-zone {
    border: 2px dashed #007bff;
    background: rgba(0, 123, 255, 0.1);
    border-radius: 8px;
    padding: 10px;
    margin: 5px;
    min-height: 60px;
    transition: all 0.3s;
  }

  .drop-zone.drag-over {
    background: rgba(0, 123, 255, 0.2);
    border-color: #0056b3;
  }

  .no-images {
    text-align: center;
    padding: 40px;
    color: #6c757d;
    font-style: italic;
  }

  .image-info {
    margin-top: 8px;
    text-align: center;
    font-size: 12px;
    color: #6c757d;
  }

  .sort-indicator {
    position: absolute;
    top: 5px;
    left: 5px;
    background: rgba(0, 123, 255, 0.8);
    color: white;
    border-radius: 50%;
    width: 20px;
    height: 20px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 10px;
    font-weight: bold;
  }
</style>

<div class="images-container">
  <div class="images-grid" id="sortableImages">
    <?php if (empty($this->images)): ?>
      <div class="no-images">
        <span>📷</span>
        <p>No images uploaded yet. Upload some images to get started!</p>
      </div>
    <?php else: ?>
      <?php foreach($this->images as $index => $image): ?>
        <div class="image-card" id="image_<?= $image->id ?>" data-id="<?= $image->id ?>" draggable="true">
          <div class="sort-indicator"><?= $index + 1 ?></div>
          <div class="image-controls">
            <button type="button" class="control-btn sort-handle" title="Drag to reorder">
              <span>⋮⋮</span>
            </button>
            <button type="button" class="control-btn delete-btn" onclick="deleteImage('<?= $image->id ?>')" title="Delete image">
              <span>✕</span>
            </button>
          </div>
          <img src="<?= SITE_ROOT . $image->url ?>" class="image-preview" alt="Product Image" />
          <div class="image-info">
            Image <?= $index + 1 ?>
          </div>
        </div>
      <?php endforeach; ?>
    <?php endif; ?>
  </div>
</div>

<script>
  let draggedElement = null;
  let draggedIndex = -1;

  // Update sort order and hidden input
  function updateSort() {
    const imageCards = document.querySelectorAll('#sortableImages .image-card');
    const sortedIDs = Array.from(imageCards).map(card => card.id);
    document.getElementById('images_sorted').value = JSON.stringify(sortedIDs);
    
    // Update sort indicators
    imageCards.forEach((card, index) => {
      const indicator = card.querySelector('.sort-indicator');
      if (indicator) {
        indicator.textContent = index + 1;
      }
      const info = card.querySelector('.image-info');
      if (info) {
        info.textContent = `Image ${index + 1}`;
      }
    });
  }

  // Delete image with confirmation
  function deleteImage(imageId) {
    showConfirm("Are you sure you want to delete this image? This action cannot be undone!", function(confirmed) {
      if (confirmed) {
        const formData = new FormData();
        formData.append('image_id', imageId);

        fetch('<?= SITE_ROOT ?>adminproducts/deleteImage', {
          method: 'POST',
          body: formData
        })
        .then(response => response.json())
        .then(resp => {
          if (resp.success) {
            const imageElement = document.getElementById('image_' + resp.model_id);
            if (imageElement) {
              // Add fade out animation
              imageElement.style.transition = 'opacity 0.3s, transform 0.3s';
              imageElement.style.opacity = '0';
              imageElement.style.transform = 'scale(0.8)';
              
              setTimeout(() => {
                imageElement.remove();
                updateSort();
                
                // Check if no images left
                const remainingImages = document.querySelectorAll('#sortableImages .image-card');
                if (remainingImages.length === 0) {
                  document.getElementById('sortableImages').innerHTML = `
                    <div class="no-images">
                      <span>📷</span>
                      <p>No images uploaded yet. Upload some images to get started!</p>
                    </div>
                  `;
                }
              }, 300);
            }
            showAlert('success', 'Success', 'Image deleted successfully!');
          } else {
            showAlert('error', 'Error', resp.message || 'Failed to delete image.');
          }
        })
        .catch(error => {
          console.error('Error:', error);
          showAlert('error', 'Error', 'An error occurred while deleting the image.');
        });
      }
    });
  }

  // Initialize drag and drop functionality
  function initializeSortable() {
    const container = document.getElementById('sortableImages');
    if (!container) return;

    // Add drag event listeners to existing image cards
    addDragListeners();

    // Container event listeners for drop zones
    container.addEventListener('dragover', handleDragOver);
    container.addEventListener('drop', handleDrop);
  }

  function addDragListeners() {
    const imageCards = document.querySelectorAll('#sortableImages .image-card');
    
    imageCards.forEach(card => {
      card.addEventListener('dragstart', handleDragStart);
      card.addEventListener('dragend', handleDragEnd);
    });
  }

  function handleDragStart(e) {
    draggedElement = e.target;
    draggedElement.classList.add('dragging');
    
    // Store the original index
    const cards = Array.from(document.querySelectorAll('#sortableImages .image-card'));
    draggedIndex = cards.indexOf(draggedElement);
    
    e.dataTransfer.effectAllowed = 'move';
    e.dataTransfer.setData('text/html', draggedElement.outerHTML);
  }

  function handleDragEnd(e) {
    if (draggedElement) {
      draggedElement.classList.remove('dragging');
      draggedElement = null;
      draggedIndex = -1;
    }
    
    // Remove any temporary drop zones
    document.querySelectorAll('.drop-zone').forEach(zone => zone.remove());
  }

  function handleDragOver(e) {
    e.preventDefault();
    e.dataTransfer.dropEffect = 'move';
    
    if (!draggedElement) return;
    
    const afterElement = getDragAfterElement(e.clientX);
    const container = document.getElementById('sortableImages');
    
    if (afterElement == null) {
      container.appendChild(draggedElement);
    } else {
      container.insertBefore(draggedElement, afterElement);
    }
  }

  function handleDrop(e) {
    e.preventDefault();
    updateSort();
  }

  function getDragAfterElement(x) {
    const draggableElements = [...document.querySelectorAll('#sortableImages .image-card:not(.dragging)')];
    
    return draggableElements.reduce((closest, child) => {
      const box = child.getBoundingClientRect();
      const offset = x - box.left - box.width / 2;
      
      if (offset < 0 && offset > closest.offset) {
        return { offset: offset, element: child };
      } else {
        return closest;
      }
    }, { offset: Number.NEGATIVE_INFINITY }).element;
  }

  // Initialize when DOM is ready
  document.addEventListener('DOMContentLoaded', function() {
    initializeSortable();
    updateSort();
  });

  // Re-initialize when new images are added
  function reinitializeAfterUpload() {
    setTimeout(() => {
      addDragListeners();
      updateSort();
    }, 100);
  }

  // Add this function to be called after image upload
  window.reinitializeImageSort = reinitializeAfterUpload;
</script>
