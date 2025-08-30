// Global variables
let budgetLineCounter = 2;
let accountLineCounter = 2;

// Chart of accounts data
const chartOfAccounts = {
    '1001': 'Cash at Bank',
    '1002': 'Petty Cash',
    '1101': 'Accounts Receivable',
    '1201': 'Inventory',
    '1301': 'Office Equipment',
    '2001': 'Accounts Payable',
    '2101': 'Accrued Expenses',
    '3001': 'Capital Account',
    '4001': 'Revenue',
    '4002': 'Grant Income',
    '5001': 'Operating Expenses',
    '5002': 'Travel Expenses',
    '5003': 'Office Supplies',
    '6001': 'Depreciation Expense'
};

// Budget line management
function addBudgetLine() {
    budgetLineCounter++;
    const tableBody = document.getElementById('budgetTableBody');
    const subtotalRow = tableBody.querySelector('.subtotal-row');

    const newRow = document.createElement('tr');
    newRow.innerHTML = `
                    <td>${budgetLineCounter}</td>
                    <td>
                        <select class="budget-select">
                            <option>Select Project...</option>
                            <option>FAO-001::Study to assess s...</option>
                            <option>Forumciv 001::strengtheni...</option>
                        </select>
                    </td>
                    <td>
                        <select class="budget-select">
                            <option>Select Budget Line...</option>
                            <option>4.1::Accomodation for s...</option>
                            <option>A 1.3.5::three asdef + faci...</option>
                        </select>
                    </td>
                    <td>
                        <input type="number" class="budget-input" value="0.00" onchange="updateSubtotal()">
                    </td>
                    <td>
                        <input type="number" class="budget-input" value="0.00" onchange="updateSubtotal()">
                    </td>
                    <td>
                        <button class="remove-btn" onclick="removeBudgetLine(this)">❌</button>
                    </td>
                `;

    tableBody.insertBefore(newRow, subtotalRow);
    updateSubtotal();
}

function removeBudgetLine(button) {
    if (confirm('Are you sure you want to remove this budget line?')) {
        const row = button.closest('tr');
        row.remove();
        updateRowNumbers();
        updateSubtotal();
    }
}

function updateRowNumbers() {
    const rows = document.querySelectorAll('#budgetTableBody tr:not(.subtotal-row)');
    rows.forEach((row, index) => {
        row.cells[0].textContent = index + 1;
    });
    budgetLineCounter = rows.length;
}

function updateSubtotal() {
    const amountInputs = document.querySelectorAll('#budgetTableBody tr:not(.subtotal-row) td:nth-child(5) input');
    let total = 0;

    amountInputs.forEach(input => {
        total += parseFloat(input.value) || 0;
    });

    const subtotalInput = document.querySelector('.subtotal-input');
    subtotalInput.value = total.toFixed(2);
}

// Chart of Accounts management
function addAccountLine() {
    accountLineCounter++;
    const tableBody = document.getElementById('accountTableBody');
    const subtotalRow = tableBody.querySelector('.subtotal-row');

    const newRow = document.createElement('tr');
    newRow.innerHTML = `
                    <td>${accountLineCounter}</td>
                    <td>
                        <select class="accounts-select" onchange="updateAccountName(this)">
                            <option value="">Select Account...</option>
                                ${Object.keys(chartOfAccounts).map(code =>
        `<option value="${code}">${code}</option>`
    ).join('')}
                        </select>
                    </td>
                    <td>
                        <input type="text" class="accounts-input" placeholder="Account Name" readonly>
                    </td>
                    <td>
                        <input type="number" class="accounts-input" value="0.00" onchange="updateAccountTotals()">
                    </td>
                    <td>
                        <input type="number" class="accounts-input" value="0.00" onchange="updateAccountTotals()">
                    </td>
                    <td>
                        <input type="text" class="accounts-input" placeholder="Enter description...">
                    </td>
                    <td>
                        <button class="remove-btn" onclick="removeAccountLine(this)">❌</button>
                    </td>
                `;

    tableBody.insertBefore(newRow, subtotalRow);
    updateAccountTotals();
}

//BELOW FUNCTION ISNT WORKING AS EXPECTED AND IS NOT IMPLEMEMENTING the 'You must have at least one account line' ALERT

function removeAccountLine(button) {
    if (confirm('Are you sure you want to remove this account line?')) {
        if (document.getElementById('accountTableBody').children.length - 1 > 1) {
            button.closest('tr').remove();
            updateAccountTotals();
            updateAccountRowNumbers();
        } else {
            alert('You must have at least one account line.');
        }
    }
}

function updateAccountRowNumbers() {
    const rows = document.querySelectorAll('#accountTableBody tr:not(.subtotal-row)');
    rows.forEach((row, index) => {
        row.cells[0].textContent = index + 1;
    });
    accountLineCounter = rows.length;
}

function updateAccountName(selectElement) {
    const accountCode = selectElement.value;
    const nameInput = selectElement.closest('tr').cells[2].querySelector('input');
    nameInput.value = chartOfAccounts[accountCode] || '';
}


//USE BELOW IF SELECT OPTION HAS CODE-NAME VALUES IN THAT FORMAT
// function updateAccountName(selectElement) {
//     const row = selectElement.closest('tr');
//     const nameInput = row.cells[2].querySelector('input');
//     const accountText = selectElement.value;

//     if (accountText) {
//         nameInput.value = accountText.split(' - ')[1] || '';
//     } else {
//         nameInput.value = '';
//     }
// }


function updateAccountTotals() {
    const debitInputs = document.querySelectorAll('#accountTableBody tr:not(.subtotal-row) td:nth-child(4) input');
    const creditInputs = document.querySelectorAll('#accountTableBody tr:not(.subtotal-row) td:nth-child(5) input');

    let totalDebit = 0;
    let totalCredit = 0;

    debitInputs.forEach(input => {
        totalDebit += parseFloat(input.value) || 0;
    });

    creditInputs.forEach(input => {
        totalCredit += parseFloat(input.value) || 0;
    });

    document.getElementById('totalDebit').value = totalDebit.toFixed(2);
    document.getElementById('totalCredit').value = totalCredit.toFixed(2);

    // Update balance status
    const balanceStatus = document.getElementById('balanceStatus');
    const difference = Math.abs(totalDebit - totalCredit);

    if (difference < 0.01) { // Allow for small rounding differences
        balanceStatus.innerHTML = 'BALANCED ✓';
        balanceStatus.style.color = '#28a745';
    } else {
        balanceStatus.innerHTML = `OUT OF BALANCE ❌ (Diff: ${difference.toFixed(2)})`;
        balanceStatus.style.color = '#dc3545';
    }
}
// Form validation and submission
function validateForm() {
    const requiredFields = document.querySelectorAll('input[required], select[required]');
    let isValid = true;

    requiredFields.forEach(field => {
        if (!field.value.trim()) {
            field.style.borderColor = '#dc3545';
            isValid = false;
        } else {
            field.style.borderColor = '#ddd';
        }
    });

    return isValid;
}

// Auto-save functionality
function autoSave() {
    const formData = new FormData();
    const inputs = document.querySelectorAll('input, select, textarea');

    inputs.forEach(input => {
        if (input.name) {
            formData.append(input.name, input.value);
        }
    });

    // Simulate auto-save (replace with actual API call)
    console.log('Auto-saving form data...', Object.fromEntries(formData));
}

// Optimized form handling
const throttle = (func, limit) => {
    let inThrottle;
    return function (...args) {
        if (!inThrottle) {
            func.apply(this, args);
            inThrottle = true;
            setTimeout(() => inThrottle = false, limit);
        }
    }
}

// Auto-save with throttling
const throttledAutoSave = throttle(autoSave, 1000);

// Initialize on DOM load
document.addEventListener('DOMContentLoaded', () => {
    const formInputs = document.querySelectorAll('input, select, textarea');
    formInputs.forEach(input => {
        input.addEventListener('change', throttledAutoSave);
    });

    // Add event listeners for amount calculations
    const amountInputs = document.querySelectorAll('.budget-input');
    amountInputs.forEach(input => {
        input.addEventListener('input', updateSubtotal);
    });

    //Add event listeners for accounts-select
    const accountsSelects = document.querySelectorAll('.accounts-select');
    accountsSelects.forEach(select => {
        updateAccountName(select);
    });

  

});

// Keyboard shortcuts
document.addEventListener('keydown', function (e) {
    // Ctrl+S to save
    if (e.ctrlKey && e.key === 's') {
        e.preventDefault();
        autoSave();
        alert('Form saved!');
    }

    // Escape to go back
    if (e.key === 'Escape') {
        goBack();
    }
});

// Save and Cancel functions/ Form actions
function saveVoucher() {
    if (!validateForm()) {
        alert('Please fill in all required fields before saving.');
        return;
    }

    // Check if accounts are balanced
    const totalDebit = parseFloat(document.getElementById('totalDebit').value);
    const totalCredit = parseFloat(document.getElementById('totalCredit').value);

    if (Math.abs(totalDebit - totalCredit) >= 0.01) {
        if (!confirm('The debits and credits are not balanced. Do you want to save anyway?')) {
            return;
        }
    }

    // Collect form data
    const voucherData = {
        trxNo: document.querySelector('input[value="131000068"]').value,
        branch: document.getElementById('branch').value,
        country: document.getElementById('country').value,
        currency: document.getElementById('currency').value,
        trxType: document.getElementById('trxType').value,
        validDate: document.querySelector('input[type="date"]').value,
        supplier: document.getElementById('supplier').value,
        docType: document.getElementById('docType').value,
        docRef: document.getElementById('docRef').value,
        cheqRef: document.querySelector('input[value="543"]').value,
        description: document.querySelector('.form-textarea').value,
        hasBudgetLines: document.getElementById('hasBudgetLines').checked,
        budgetLines: [],
        accountLines: []
    };

    // Collect budget lines
    const budgetRows = document.querySelectorAll('#budgetTableBody tr:not(.subtotal-row)');
    budgetRows.forEach(row => {
        const cells = row.cells;
        voucherData.budgetLines.push({
            project: cells[1].querySelector('select').value,
            budgetline: cells[2].querySelector('select').value,
            balance: cells[3].querySelector('input').value,
            amount: cells[4].querySelector('input').value
        });
    });

    // Collect account lines
    const accountRows = document.querySelectorAll('#accountTableBody tr:not(.subtotal-row)');
    accountRows.forEach(row => {
        const cells = row.cells;
        voucherData.accountLines.push({
            accountCode: cells[1].querySelector('select').value,
            accountName: cells[2].querySelector('input').value,
            debit: cells[3].querySelector('input').value,
            credit: cells[4].querySelector('input').value,
            description: cells[5].querySelector('input').value
        });
    });

    // Simulate API call
    console.log('Saving voucher data:', voucherData);

    // Show success message
    alert('Voucher saved successfully!');

    // Optionally redirect or refresh
    // window.location.href = '/vouchers';
}

function cancelEdit() {
    if (confirm('Are you sure you want to cancel? All unsaved changes will be lost.')) {
        window.history.back();
        // Or redirect to vouchers list
        // window.location.href = '/vouchers';
    }
}