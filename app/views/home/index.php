<?php $this->start('head') ?>
<?php $this->end() ?>
<?php $this->start('body'); ?>

<div class="content-header">
    <h1>📊 DASHBOARD OVERVIEW</h1>
    <div>
        Last Updated: June 19, 2025 - 10:30 AM
    </div>
</div>

<div class="dashboard-section">
    <!-- Key Metrics Cards -->
    <div class="metrics-grid">
        <div class="metric-card">
            <div class="metric-header">
                <div class="metric-title">Total Budget</div>
                <div class="metric-icon">💰</div>
            </div>
            <div class="metric-value"></div>
            <div class="metric-subtitle"></div>
            <div class="metric-change">
                <span></span>
                <span>vs last month</span>
            </div>
        </div>

        <div class="metric-card success">
            <div class="metric-header">
                <div class="metric-title">Active Projects</div>
                <div class="metric-icon">📋</div>
            </div>
            <div class="metric-value"></div>
            <div class="metric-subtitle"></div>
            <div class="metric-change">
                <span></span>
                <span>new this month</span>
            </div>
        </div>

        <div class="metric-card warning">
            <div class="metric-header">
                <div class="metric-title">Pending Approvals</div>
                <div class="metric-icon">⏳</div>
            </div>
            <div class="metric-value"></div>
            <div class="metric-subtitle"></div>
            <div class="metric-change">
                <span></span>
                <span>since yesterday</span>
            </div>
        </div>

        <div class="metric-card danger">
            <div class="metric-header">
                <div class="metric-title">Overdue Items</div>
                <div class="metric-icon">⚠️</div>
            </div>
            <div class="metric-value"></div>
            <div class="metric-subtitle"></div>
            <div class="metric-change">
                <span></span>
                <span>urgent</span>
            </div>
        </div>

        <div class="metric-card info">
            <div class="metric-header">
                <div class="metric-title">Total Employees</div>
                <div class="metric-icon">👥</div>
            </div>
            <div class="metric-value"></div>
            <div class="metric-subtitle"></div>
            <div class="metric-change">
                <span></span>
                <span>new hires</span>
            </div>
        </div>

        <div class="metric-card">
            <div class="metric-header">
                <div class="metric-title">Monthly Expenses</div>
                <div class="metric-icon">📊</div>
            </div>
            <div class="metric-value"></div>
            <div class="metric-subtitle"></div>
            <div class="metric-change">
                <span></span>
                <span>vs budget</span>
            </div>
        </div>
    </div>

    <!-- Recent Transactions Table -->
    <div class="table-section">
        <div class="table-section-header">RECENT TRANSACTIONS</div>
        <div class="table-container">
            <table class="table">
                <thead>
                    <tr>
                        <th>Transaction #</th>
                        <th>Date</th>
                        <th>Type</th>
                        <th>Amount</th>
                        <th>Status</th>
                        <th>Project</th>
                    </tr>
                </thead>
                <tbody id="transactions-table-body">
                    <!-- Transaction rows will be dynamically inserted here -->
                </tbody>
            </table>
        </div>
    </div>

    <!-- Project Status Table -->
    <div class="table-section">
        <div class="table-section-header">PROJECT STATUS OVERVIEW</div>
        <div class="table-container">
            <table class="table">
                <thead>
                    <tr>
                        <th>Project Code</th>
                        <th>Project Name</th>
                        <th>Budget</th>
                        <th>Spent</th>
                        <th>Remaining</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody id="projects-table-body">
                    <!-- Project rows will be dynamically inserted here -->
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- close content div -->
</div>


<script>
    // function logout() {
    //     if (confirm('Are you sure you want to logout?')) {
    //         alert('Logging out...');
    //         // Implement logout logic here
    //     }
    // }
    // Ensure the SITE_ROOT constant is defined in your PHP environment
    const SITE_ROOT = '<?= SITE_ROOT ?>';
    // API Configuration
    const API_BASE_URL = `<?= SITE_ROOT ?>`;
    const API_ENDPOINTS = {
        metrics: 'home/dashboard_metrics',
        transactions: 'home/recent_transactions',
        projects: 'home/projects_status',
        employees: 'home/hr_active_count'
    };

    // Utility functions
    function formatCurrency(amount) {
        return new Intl.NumberFormat('en-KE', {
            style: 'currency',
            currency: 'KES',
            minimumFractionDigits: 0,
            maximumFractionDigits: 0
        }).format(amount).replace('KES', 'KSh');
    }

    function formatDate(dateString) {
        return new Date(dateString).toLocaleDateString('en-CA'); // YYYY-MM-DD format
    }

    function calculatePercentageChange(current, previous) {
        if (previous === 0) return 0;
        return ((current - previous) / previous * 100).toFixed(1);
    }

    // API fetch functions
    async function fetchDashboardMetrics() {
        try {
            const response = await fetch(`${API_BASE_URL}${API_ENDPOINTS.metrics}`, {
                method: 'GET'
            });

            if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);
            return await response.json();
        } catch (error) {
            console.error('Error fetching dashboard metrics:', error);
            return null;
        }
    }

    async function fetchRecentTransactions() {
        try {
            const response = await fetch(`${API_BASE_URL}${API_ENDPOINTS.transactions}?limit=10`, {
                method: 'GET'
            });

            if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);
            return await response.json();
        } catch (error) {
            console.error('Error fetching transactions:', error);
            return null;
        }
    }

    async function fetchProjectStatus() {
        try {
            const response = await fetch(`${API_BASE_URL}${API_ENDPOINTS.projects}`, {
                method: 'GET'
            });

            if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);
            return await response.json();
        } catch (error) {
            console.error('Error fetching project status:', error);
            return null;
        }
    }

    // Update functions
    function updateMetricCard(cardSelector, data) {
        const card = document.querySelector(cardSelector);
        if (!card || !data) return;

        const valueElement = card.querySelector('.metric-value');
        const changeElement = card.querySelector('.metric-change span');
        const subtitleElement = card.querySelector('.metric-subtitle');

        if (valueElement && data.value !== undefined) {
            valueElement.textContent = data.formatted_value || data.value;
        }

        if (changeElement && data.change !== undefined) {
            const changePercent = Math.abs(data.change);
            const changeDirection = data.change >= 0 ? '↗' : '↘';
            const changeClass = data.change >= 0 ? 'change-positive' : 'change-negative';

            changeElement.className = changeClass;
            changeElement.textContent = `${changeDirection} ${data.change >= 0 ? '+' : ''}${changePercent}%`;
        }

        if (subtitleElement && data.subtitle) {
            subtitleElement.textContent = data.subtitle;
        }

        // Add update animation
        card.style.transform = 'scale(1.02)';
        setTimeout(() => {
            card.style.transform = '';
        }, 200);
    }

    function updateTransactionsTable(transactions) {
        if (!transactions || !Array.isArray(transactions)) return;

        const tableBody = document.querySelector('#transactions-table-body');
        if (!tableBody) return;

        tableBody.innerHTML = '';

        transactions.forEach(transaction => {
            const row = document.createElement('tr');

            const statusClass = transaction.status.toLowerCase() === 'approved' ? 'status-badge status-approved' :
                transaction.status.toLowerCase() === 'pending' ? 'status-badge status-pending' :
                'status-badge status-rejected';

            row.innerHTML = `
            <td>${transaction.id}</td>
            <td>${formatDate(transaction.date)}</td>
            <td>${transaction.type}</td>
            <td>${formatCurrency(transaction.amount)}</td>
            <td><span class="${statusClass}">${transaction.status.toUpperCase()}</span></td>
            <td>${transaction.project_code}</td>
        `;

            tableBody.appendChild(row);
        });
    }

    function updateProjectsTable(projects) {
        if (!projects || !Array.isArray(projects)) return;

        const tableBody = document.querySelector('#projects-table-body');

        if (!tableBody) return;

        tableBody.innerHTML = '';

        projects.forEach(project => {
            const row = document.createElement('tr');

            const statusClass = project.status.toLowerCase() === 'active' ? 'status-badge status-approved' :
                project.status.toLowerCase() === 'planning' ? 'status-badge status-pending' :
                'status-badge status-rejected';

            const remaining = project.budget - project.spent;

            row.innerHTML = `
            <td>${project.code}</td>
            <td>${project.name}</td>
            <td>${formatCurrency(project.budget)}</td>
            <td>${formatCurrency(project.spent)}</td>
            <td>${formatCurrency(remaining)}</td>
            <td><span class="${statusClass}">${project.status.toUpperCase()}</span></td>
        `;

            tableBody.appendChild(row);
        });
    }

    function updateLastUpdatedTime() {
        const timeElement = document.querySelector('.content-header div[style*="font-size"]');
        if (timeElement) {
            const now = new Date();
            const options = {
                year: 'numeric',
                month: 'long',
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                hour12: true
            };
            timeElement.textContent = `Last Updated: ${now.toLocaleDateString('en-US', options)}`;
        }
    }

    // Main dashboard update function
    async function updateDashboard() {
        console.log('Updating dashboard data...');

        try {
            // Show loading state
            const cards = document.querySelectorAll('.metric-card');
            cards.forEach(card => card.style.opacity = '0.7');

            // Fetch all data concurrently
            const [metricsData, transactionsData, projectsData] = await Promise.all([
                fetchDashboardMetrics(),
                fetchRecentTransactions(),
                fetchProjectStatus()
            ]);

            // Update metrics cards
            if (metricsData) {
                const metrics = metricsData.data || metricsData;

                // Update individual metric cards
                if (metrics.total_budget) {
                    updateMetricCard('.metric-card:nth-child(1)', {
                        value: formatCurrency(metrics.total_budget.value),
                        change: metrics.total_budget.change_percent,
                        subtitle: 'Total Projects Budget'
                    });
                }

                if (metrics.active_projects) {
                    updateMetricCard('.metric-card:nth-child(2)', {
                        value: metrics.active_projects.count,
                        change: metrics.active_projects.change_count,
                        subtitle: 'Currently Running'
                    });
                }

                if (metrics.pending_approvals) {
                    updateMetricCard('.metric-card:nth-child(3)', {
                        value: metrics.pending_approvals.count,
                        change: metrics.pending_approvals.change_count,
                        subtitle: 'Require Action'
                    });
                }

                if (metrics.overdue_items) {
                    updateMetricCard('.metric-card:nth-child(4)', {
                        value: metrics.overdue_items.count,
                        change: metrics.overdue_items.change_count,
                        subtitle: 'Need Attention'
                    });
                }

                if (metrics.total_employees) {
                    updateMetricCard('.metric-card:nth-child(5)', {
                        value: metrics.total_employees.count,
                        change: metrics.total_employees.change_count,
                        subtitle: 'Active Staff'
                    });
                }

                if (metrics.monthly_expenses) {
                    updateMetricCard('.metric-card:nth-child(6)', {
                        value: formatCurrency(metrics.monthly_expenses.amount),
                        change: metrics.monthly_expenses.change_percent,
                        subtitle: 'This Month'
                    });
                }
            }

            // Update tables
            if (transactionsData) {
                updateTransactionsTable(transactionsData.data || transactionsData);
            }

            if (projectsData) {
                updateProjectsTable(projectsData.data || projectsData);
            }

            // Update last updated time
            updateLastUpdatedTime();

            // Remove loading state
            cards.forEach(card => card.style.opacity = '1');

            console.log('Dashboard updated successfully');

        } catch (error) {
            console.error('Error updating dashboard:', error);

            // Remove loading state on error
            const cards = document.querySelectorAll('.metric-card');
            cards.forEach(card => card.style.opacity = '1');

            // Show error notification (optional)
            showNotification('Failed to update dashboard data. Please try again.', 'error');
        }
    }

    // Notification function (optional)
    function showNotification(message, type = 'info') {
        const notification = document.createElement('div');
        notification.style.cssText = `
        position: fixed;
        top: 20px;
        right: 20px;
        padding: 15px 20px;
        background: ${type === 'error' ? '#dc3545' : '#28a745'};
        color: white;
        border-radius: 4px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        z-index: 9999;
        font-size: 14px;
        max-width: 300px;
    `;
        notification.textContent = message;

        document.body.appendChild(notification);

        setTimeout(() => {
            notification.remove();
        }, 5000);
    }

    // Initialize dashboard updates
    document.addEventListener('DOMContentLoaded', function() {
        // Initial load
        updateDashboard();

        // Set up periodic updates (every 30 seconds)
        //setInterval helps keep a PHP session alive because it is used to send a request to the server after every 30 seconds via fetch API calls
        // This is useful for keeping the session active while the user is redirected to the dashboard once logged in
        setInterval(updateDashboard, 30000);

        // Add manual refresh button functionality
        const refreshButton = document.createElement('button');
        refreshButton.innerHTML = '🔄 Refresh';
        refreshButton.style.cssText = `
        background: rgba(255,255,255,0.2);
        border: 1px solid rgba(255,255,255,0.3);
        color: white;
        padding: 8px 15px;
        border-radius: 4px;
        cursor: pointer;
        font-size: 0.8rem;
        margin-left: 15px;
    `;
        refreshButton.onclick = updateDashboard;

        // Add refresh button to content header
        const contentHeader = document.querySelector('.content-header');
        if (contentHeader) {
            contentHeader.appendChild(refreshButton);
        }

        // Handle window focus to refresh data
        window.addEventListener('focus', function() {
            updateDashboard();
        });

        console.log('Dashboard auto-update initialized');
    });
</script>

<?php $this->end(); ?>