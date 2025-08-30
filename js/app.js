// Toggle functionality
const navbarToggle = document.getElementById('navbarToggle');
const sidebarToggle = document.getElementById('sidebarToggle');
const navMenu = document.getElementById('navMenu');
const sidebar = document.getElementById('sidebar');
const content = document.querySelector('.content');
let isNavMenuVisible = false;

// Navbar toggle - mobile only
navbarToggle.addEventListener('click', (e) => {
    e.stopPropagation();
    isNavMenuVisible = !isNavMenuVisible;
    navMenu.classList.toggle('show');
    navbarToggle.innerHTML = isNavMenuVisible ? '✕' : '☰'; // Change icon based on state
});

// Sidebar toggle - desktop only
sidebarToggle.addEventListener('click', (e) => {
    e.stopPropagation();
    sidebar.classList.toggle('collapsed');
    content.classList.toggle('full-width');
});

// Close navigation when clicking outside
document.addEventListener('click', (e) => {
    // Only handle navbar closing on mobile
    if (window.innerWidth <= 768) {
        if (!e.target.closest('.nav-menu') && !e.target.closest('#navbarToggle')) {
            navMenu.classList.remove('show');
        }
    }
});

// Reset classes on resize
window.addEventListener('resize', () => {
    if (window.innerWidth > 768) {
        navMenu.classList.remove('show');
        sidebar.classList.remove('show');
    } else {
        sidebar.classList.remove('collapsed');
    }
});



// Dropdown functions
function toggleDropdown(element) {
    // Close all other dropdowns first
    document.querySelectorAll('.dropdown.show').forEach(dropdown => {
        if (dropdown.parentElement !== element) {
            dropdown.classList.remove('show');
            console.log("ParentElement:", dropdown.parentElement);
            dropdown.parentElement.classList.remove('active');
        }
    });

    const dropdown = element.querySelector('.dropdown');
    dropdown.classList.toggle('show');
}

function toggleSidebarDropdown(element) {
    // Close all other sidebar dropdowns first
    document.querySelectorAll('.sidebar-dropdown.show').forEach(dropdown => {
        if (dropdown.parentElement !== element) {
            dropdown.classList.remove('show');
            dropdown.parentElement.classList.remove('active');
        }
    });

    const dropdown = element.querySelector('.sidebar-dropdown');
    /* The getBoundingClientRect() method returns the size of an element and its position relative to the viewport.
    The getBoundingClientRect() method returns a DOMRect object with eight properties: left, top, right, bottom, x, y, width, height. */
    const rect = element.getBoundingClientRect();

    if (dropdown) {
        dropdown.style.top = `${rect.top}px`;
        dropdown.classList.toggle('show');
        element.classList.toggle('active');
    }
}

// Close navbar dropdowns when clicking outside
document.addEventListener('click', function (e) {
    if (!e.target.closest('.nav-item')) {
        document.querySelectorAll('.dropdown.show').forEach(dropdown => {
            dropdown.classList.remove('show');
            dropdown.parentElement.classList.remove('active');
        });
    }
});

// Close sidebar dropdowns when clicking outside
document.addEventListener('click', function (e) {
    if (!e.target.closest('.sidebar-item')) {
        document.querySelectorAll('.sidebar-dropdown.show').forEach(dropdown => {
            dropdown.classList.remove('show');
            dropdown.parentElement.classList.remove('active');
        });
    }
});


//     document.addEventListener('click', function(e) {
//     if (!e.target.closest('.nav-item') && !e.target.closest('.sidebar-item')) {
//         document.querySelectorAll('.dropdown.show, .sidebar-dropdown.show').forEach(dropdown => {
//             dropdown.classList.remove('show');
//             dropdown.parentElement.classList.remove('active');
//         });
//     }
// });

// Navigation functions
// function goBack() {
//     if (confirm('Are you sure you want to go back? Any unsaved changes will be lost.')) {
//         window.history.back();
//     }
// }

function logout() {
    if (confirm('Are you sure you want to logout?')) {
        alert('Logging out...');
        // Implement logout logic here
    }
}
// Optimized form handling
// const throttle = (func, limit) => {
//     let inThrottle;
//     return function (...args) {
//         if (!inThrottle) {
//             func.apply(this, args);
//             inThrottle = true;
//             setTimeout(() => inThrottle = false, limit);
//         }
//     }
// }

// Auto-save with throttling
// const throttledAutoSave = throttle(autoSave, 1000);

// Initialize on DOM load
document.addEventListener('DOMContentLoaded', () => {


    // Initialize tooltips (simple implementation)
    const elements = document.querySelectorAll('[title]');
    elements.forEach(element => {
        element.addEventListener('mouseenter', function () {
            const tooltip = document.createElement('div');
            tooltip.className = 'tooltip';
            tooltip.textContent = this.getAttribute('title');
            tooltip.style.cssText = `
                            position: absolute;
                            background: #333;
                            color: white;
                            padding: 5px 10px;
                            border-radius: 4px;
                            font-size: 12px;
                            z-index: 1000;
                            pointer-events: none;
                        `;
            document.body.appendChild(tooltip);

            const rect = this.getBoundingClientRect();
            tooltip.style.left = rect.left + 'px';
            tooltip.style.top = (rect.top - 30) + 'px';
        });

        element.addEventListener('mouseleave', function () {
            const tooltip = document.querySelector('.tooltip');
            if (tooltip) {
                tooltip.remove();
            }
        });
    });

});
    // function 1 for top navbar dropdown
    //Below are IFIS functions i.e Imediately invoked function expressions(they usually have a parenthesis at the end)
    (function() {
        document.querySelectorAll(".dropdown-item").forEach(function(item) {
            // var HostExtension = JS_HOST;
            if (item.classList.contains('active')) {
                var grandparent = item.parentElement.parentElement;
                if (grandparent) {
                    grandparent.classList.add('active');
                }
            }
        });
    }());

    // function 2 for sidebar dropdown
    (function() {
        document.querySelectorAll(".sidebar-dropdown-item").forEach(function(item) {
            // var HostExtension = JS_HOST;
            if (item.classList.contains('active')) {
                var grandparent = item.parentElement.parentElement;
                if (grandparent) {
                    grandparent.classList.add('active');
                }
            }
        });
    }());