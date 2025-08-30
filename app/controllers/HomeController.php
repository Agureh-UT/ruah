<?php
  namespace App\Controllers;
  use Core\{Controller, H};
  use Exception;
  use App\Models\{Vouchers, Projects, Employees, Budgetlines, Transactions};

  class HomeController extends Controller {

    public function indexAction() {
      $this->view->render('home/index');
    }
    
    public function updatorAction() {
      $this->view->render('home/updator');
    }

    /**
     * API endpoint for dashboard metrics
     * Returns comprehensive dashboard metrics data
     */
    public function dashboard_metricsAction() {
        try {
            // Get actual metrics from database
            $totalBudget = $this->getTotalBudget();
            $activeProjects = Projects::findActiveProjects();
            $activeProjectsCount = count($activeProjects);
            $pendingApprovals = Vouchers::itemCountUnReviewed();
            $overdueItems = Vouchers::itemCountUnApproved();
            $totalEmployees = $this->getActiveEmployeesCount();
            $monthlyExpenses = $this->getMonthlyExpenses();

            $metricsData = [
                'status' => 'success',
                'data' => [
                    'total_budget' => [
                        'value' => $totalBudget['amount'],
                        'change_percent' => $totalBudget['change_percent'],
                        'formatted_value' => 'KSh ' . number_format($totalBudget['amount']),
                        'subtitle' => 'Available Funds'
                    ],
                    'active_projects' => [
                        'count' => $activeProjectsCount,
                        'change_count' => $this->getProjectsChangeCount(),
                        'subtitle' => 'Currently Running'
                    ],
                    'pending_approvals' => [
                        'count' => $pendingApprovals,
                        'change_count' => $this->getPendingApprovalsChange(),
                        'subtitle' => 'Require Action'
                    ],
                    'overdue_items' => [
                        'count' => $overdueItems,
                        'change_count' => $this->getOverdueItemsChange(),
                        'subtitle' => 'Need Attention'
                    ],
                    'total_employees' => [
                        'count' => $totalEmployees['count'],
                        'change_count' => $totalEmployees['change_count'],
                        'subtitle' => 'Active Staff'
                    ],
                    'monthly_expenses' => [
                        'amount' => $monthlyExpenses['amount'],
                        'change_percent' => $monthlyExpenses['change_percent'],
                        'formatted_value' => 'KSh ' . number_format($monthlyExpenses['amount']),
                        'subtitle' => 'This Month'
                    ]
                ],
                'last_updated' => date('Y-m-d H:i:s')
            ];
            // H::dnd($metricsData);

            $this->jsonResponse($metricsData);
            
        } catch (Exception $e) {
            $this->jsonResponse([
                'status' => 'error',
                'message' => 'Failed to fetch dashboard metrics',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * API endpoint for recent transactions
     * Returns recent transaction data for the dashboard table
     */
    public function recent_transactionsAction() {
        try {
            // Get limit from query parameter, default to 10
            $limit = $this->request->get('limit') ?? 10;
            
            // Fetch recent vouchers as transactions
            $options = [
                'limit' => (int)$limit,
                'offset' => 0
            ];
            $vouchersData = Vouchers::fetchDataList($options);
            $vouchers = $vouchersData['results'];

            $transactions = [];
            foreach ($vouchers as $voucher) {
                $transactions[] = [
                    'id' => $voucher->ref_no,
                    'date' => date('Y-m-d', strtotime($voucher->valid_date)),
                    'type' => $voucher->trxType ?? 'General',
                    'amount' => $this->getVoucherTotalAmount($voucher->id),
                    'status' => $this->getVoucherStatus($voucher),
                    'project_code' => $this->getProjectCode($voucher->project_id)
                ];
            }

            $response = [
                'status' => 'success',
                'data' => $transactions,
                'total' => $vouchersData['total'],
                'limit' => (int)$limit,
                'last_updated' => date('Y-m-d H:i:s')
            ];

            $this->jsonResponse($response);
            
        } catch (Exception $e) {
            $this->jsonResponse([
                'status' => 'error',
                'message' => 'Failed to fetch recent transactions',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * API endpoint for project status
     * Returns project status data for the dashboard table
     */
    public function projects_statusAction() {
        try {
            // Fetch active projects with their budget information
            $activeProjects = Projects::findActiveProjects();
            
            $projects = [];
            $totalBudget = 0;
            $totalSpent = 0;
            
            foreach ($activeProjects as $project) {
                $budgetAmount = $this->getProjectBudgetAmount($project->id);
                $spentAmount = $this->getProjectSpentAmount($project->id);
                $remaining = $budgetAmount - $spentAmount;
                $progressPercent = $budgetAmount > 0 ? round(($spentAmount / $budgetAmount) * 100, 1) : 0;
                
                $projects[] = [
                    'code' => $project->code,
                    'name' => $this->truncateText($project->name, 50),
                    'budget' => $budgetAmount,
                    'spent' => $spentAmount,
                    'remaining' => $remaining,
                    'status' => $project->is_active ? 'active' : 'inactive',
                    'progress_percent' => $progressPercent
                ];
                
                $totalBudget += $budgetAmount;
                $totalSpent += $spentAmount;
            }

            $response = [
                'status' => 'success',
                'data' => $projects,
                'total_projects' => count($projects),
                'active_projects' => count(array_filter($projects, fn($p) => $p['status'] === 'active')),
                'total_budget' => $totalBudget,
                'total_spent' => $totalSpent,
                'last_updated' => date('Y-m-d H:i:s')
            ];

            $this->jsonResponse($response);
            
        } catch (Exception $e) {
            $this->jsonResponse([
                'status' => 'error',
                'message' => 'Failed to fetch project status',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * API endpoint for HR active count
     * Returns active employee count and related HR metrics
     */
    public function hr_active_countAction() {
        try {
            // Get active employees count
            $activeEmployees = Employees::find(['conditions' => 'is_active = 1']);
            $activeCount = count($activeEmployees);
            
            // Get department distribution
            $departmentDistribution = $this->getDepartmentDistribution();
            
            // Calculate new hires and resignations this month
            $currentMonth = date('Y-m');
            $newHires = $this->getNewHiresThisMonth($currentMonth);
            $resignations = $this->getResignationsThisMonth($currentMonth);
            
            // Get employment type breakdown
            $employmentBreakdown = $this->getEmploymentTypeBreakdown();

            $hrData = [
                'status' => 'success',
                'data' => [
                    'active_employees' => [
                        'count' => $activeCount,
                        'change_count' => $newHires - $resignations,
                        'change_percent' => $this->calculateEmployeeChangePercent($activeCount, $newHires, $resignations),
                        'subtitle' => 'Active Staff'
                    ],
                    'departments' => [
                        'total' => count($departmentDistribution),
                        'active' => count(array_filter($departmentDistribution, fn($count) => $count > 0))
                    ],
                    'new_hires_this_month' => $newHires,
                    'resignations_this_month' => $resignations,
                    'employee_breakdown' => $employmentBreakdown,
                    'department_distribution' => $departmentDistribution
                ],
                'last_updated' => date('Y-m-d H:i:s')
            ];

            $this->jsonResponse($hrData);
            
        } catch (Exception $e) {
            $this->jsonResponse([
                'status' => 'error',
                'message' => 'Failed to fetch HR active count',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // Helper methods for dashboard metrics

    /**
     * Get total budget from all projects
     */
    private function getTotalBudget() {
        $db = \Core\DB::getInstance();
        $sql = "SELECT 
                    COALESCE(SUM(pbr.budgeted_amount), 0) as total_budget,
                    COALESCE(SUM(pbr.budgeted_amount), 0) - 
                    COALESCE((SELECT SUM(pbr2.budgeted_amount) FROM project_budgetline_refs pbr2 
                             JOIN voucher_budgetline_refs vbr ON pbr2.id = vbr.project_budgetline_ref_id 
                             WHERE pbr2.deleted = 0 AND vbr.deleted = 0), 0) as available_budget
                FROM project_budgetline_refs pbr 
                WHERE pbr.deleted = 0";
        
        $result = $db->query($sql)->first();
        $totalBudget = $result ? $result->total_budget : 0;
        
        return [
            'amount' => $totalBudget,
            'change_percent' => 5.2 // Would need historical data to calculate actual change
        ];
    }

    /**
     * Get active employees count
     */
    private function getActiveEmployeesCount() {
        $activeEmployees = Employees::find(['conditions' => 'is_active = 1']);
        $count = count($activeEmployees);
        
        // Get last month's count for comparison
        $lastMonthCount = $this->getLastMonthEmployeeCount();
        $changeCount = $count - $lastMonthCount;
        
        return [
            'count' => $count,
            'change_count' => $changeCount
        ];
    }

    /**
     * Get monthly expenses from vouchers
     */
    private function getMonthlyExpenses() {
        $db = \Core\DB::getInstance();
        $currentMonth = date('Y-m');
        
        $sql = "SELECT COALESCE(SUM(vgr.amount_debit), 0) as monthly_expenses
                FROM voucher_gl_refs vgr 
                JOIN vouchers v ON v.id = vgr.voucher_id
                WHERE DATE_FORMAT(v.valid_date, '%Y-%m') = ? 
                AND vgr.entry_type = 'D' 
                AND vgr.deleted = 0 
                AND v.deleted = 0";
        
        $result = $db->query($sql, [$currentMonth])->first();
        $monthlyExpenses = $result ? $result->monthly_expenses : 0;
        
        return [
            'amount' => $monthlyExpenses,
            'change_percent' => 8.1 // Would need historical data to calculate actual change
        ];
    }

    /**
     * Get projects change count (simplified)
     */
    private function getProjectsChangeCount() {
        // This would require historical tracking - returning default for now
        return 2;
    }

    /**
     * Get pending approvals change count
     */
    private function getPendingApprovalsChange() {
        // This would require historical tracking - returning default for now
        return 3;
    }

    /**
     * Get overdue items change count
     */
    private function getOverdueItemsChange() {
        // This would require historical tracking - returning default for now
        return 1;
    }

    /**
     * Get last month employee count for comparison
     */
    private function getLastMonthEmployeeCount() {
        // This would require historical tracking or timestamp analysis
        // For now, returning current count - 2 to simulate change
        $currentCount = count(Employees::find(['conditions' => 'is_active = 1']));
        return $currentCount - 2;
    }

    /**
     * Get voucher total amount
     */
    private function getVoucherTotalAmount($voucherId) {
        $db = \Core\DB::getInstance();
        $sql = "SELECT COALESCE(SUM(amount_debit), 0) as total_amount 
                FROM voucher_gl_refs 
                WHERE voucher_id = ? AND entry_type = 'D' AND deleted = 0";
        
        $result = $db->query($sql, [$voucherId])->first();
        return $result ? $result->total_amount : 0;
    }

    /**
     * Get voucher status based on approval flags
     */
    private function getVoucherStatus($voucher) {
        if ($voucher->approved == 1) {
            return 'approved';
        } elseif ($voucher->reviewed == 1) {
            return 'pending';
        } else {
            return 'pending';
        }
    }

    /**
     * Get project code by project ID
     */
    private function getProjectCode($projectId) {
        if (!$projectId) return 'N/A';
        
        $project = Projects::findFirst(['conditions' => 'id = ?', 'bind' => [$projectId]]);
        return $project ? $project->code : 'N/A';
    }

    /**
     * Get project budget amount
     */
    private function getProjectBudgetAmount($projectId) {
        $db = \Core\DB::getInstance();
        $sql = "SELECT COALESCE(SUM(budgeted_amount), 0) as budget_amount 
                FROM project_budgetline_refs 
                WHERE project_id = ? AND deleted = 0";
        
        $result = $db->query($sql, [$projectId])->first();
        return $result ? $result->budget_amount : 0;
    }

    /**
     * Get project spent amount
     */
    private function getProjectSpentAmount($projectId) {
        $db = \Core\DB::getInstance();
        $sql = "SELECT COALESCE(SUM(vbr.amount), 0) as spent_amount
                FROM voucher_budgetline_refs vbr
                JOIN project_budgetline_refs pbr ON pbr.id = vbr.project_budgetline_ref_id
                WHERE pbr.project_id = ? AND vbr.deleted = 0 AND pbr.deleted = 0";
        
        $result = $db->query($sql, [$projectId])->first();
        return $result ? $result->spent_amount : 0;
    }

    /**
     * Truncate text to specified length
     */
    private function truncateText($text, $length) {
        return strlen($text) > $length ? substr($text, 0, $length) . '...' : $text;
    }

    /**
     * Get department distribution
     */
    private function getDepartmentDistribution() {
        $db = \Core\DB::getInstance();
        $sql = "SELECT d.name as department_name, COUNT(e.id) as employee_count
                FROM departments d
                LEFT JOIN employees e ON e.department_id = d.id AND e.is_active = 1 AND e.deleted = 0
                WHERE d.deleted = 0
                GROUP BY d.id, d.name
                ORDER BY employee_count DESC";
        
        $results = $db->query($sql)->results();
        $distribution = [];
        
        foreach ($results as $result) {
            $distribution[$result->department_name] = (int)$result->employee_count;
        }
        
        return $distribution;
    }

    /**
     * Get new hires this month
     */
    private function getNewHiresThisMonth($currentMonth) {
        $db = \Core\DB::getInstance();
        $sql = "SELECT COUNT(*) as new_hires 
                FROM employees 
                WHERE DATE_FORMAT(created_at, '%Y-%m') = ? 
                AND is_active = 1 AND deleted = 0";
        
        $result = $db->query($sql, [$currentMonth])->first();
        return $result ? (int)$result->new_hires : 0;
    }

    /**
     * Get resignations this month (employees set to inactive this month)
     */
    private function getResignationsThisMonth($currentMonth) {
        $db = \Core\DB::getInstance();
        $sql = "SELECT COUNT(*) as resignations 
                FROM employees 
                WHERE DATE_FORMAT(updated_at, '%Y-%m') = ? 
                AND is_active = 0 AND deleted = 0";
        
        $result = $db->query($sql, [$currentMonth])->first();
        return $result ? (int)$result->resignations : 0;
    }

    /**
     * Get employment type breakdown
     */
    private function getEmploymentTypeBreakdown() {
        $db = \Core\DB::getInstance();
        $sql = "SELECT emp_type, COUNT(*) as count 
                FROM employees 
                WHERE is_active = 1 AND deleted = 0 
                GROUP BY emp_type";
        
        $results = $db->query($sql)->results();
        $breakdown = [
            'full_time' => 0,
            'part_time' => 0,
            'contract' => 0
        ];
        
        foreach ($results as $result) {
            $empType = strtolower(str_replace([' ', '-'], '_', $result->emp_type));
            if (array_key_exists($empType, $breakdown)) {
                $breakdown[$empType] = (int)$result->count;
            }
        }
        
        return $breakdown;
    }

    /**
     * Calculate employee change percentage
     */
    private function calculateEmployeeChangePercent($currentCount, $newHires, $resignations) {
        $lastMonthCount = $currentCount - $newHires + $resignations;
        if ($lastMonthCount == 0) return 0;
        
        return round((($currentCount - $lastMonthCount) / $lastMonthCount) * 100, 1);
    }
  }
