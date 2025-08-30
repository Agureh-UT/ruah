<?php $this->start('head') ?>
<!-- <link rel="stylesheet" href="<?= SITE_ROOT ?>css/formstyles.css?v=<?= VERSION ?>"> -->
<?php $this->end() ?>
<?php $this->start('body'); ?>
<div class="content-header">
    <button class="back-btn" onclick="goBack()">◀ BACK</button>
    <h5>Edit-131000068</h5>
</div>

<div class="form-section">
    <div class="form-grid">
        <div class="form-group">
            <label class="form-label">TRX NO</label>
            <input type="text" class="form-control" value="131000068" readonly>
        </div>
        <div class="form-group">
            <label class="form-label">BRANCH</label>
            <select class="form-control" id="branch">
                <option>Wajir</option>
            </select>
        </div>
        <div class="form-group">
            <label class="form-label">COUNTRY</label>
            <select class="form-control" id="country">
                <option>Kenya</option>
            </select>
        </div>
        <div class="form-group">
            <label class="form-label">CURRENCY</label>
            <select class="form-control" id="currency">
                <option>Kenya Shillings(!)</option>
            </select>
        </div>
        <div class="form-group">
            <label class="form-label">TRX TYPE</label>
            <select class="form-control" id="trxType">
                <option>Payment</option>
            </select>
        </div>
    </div>

    <div class="form-grid">
        <div class="form-group">
            <label class="form-label">VALID DATE</label>
            <input type="date" class="form-control" value="2025-06-04">
        </div>
        <div class="form-group">
            <label class="form-label">SUPPLIER</label>
            <select class="form-control" id="supplier">
                <option>AMARA BLUE REORT LTD</option>
            </select>
        </div>
        <div class="form-group">
            <label class="form-label">LINKED DOCTYPE</label>
            <select class="form-control" id="docType">
                <option>-Select-</option>
            </select>
        </div>
        <div class="form-group">
            <label class="form-label">LINKED DOCREF</label>
            <select class="form-control" id="docRef">
                <option>-Select-</option>
            </select>
        </div>
        <div class="form-group">
            <label class="form-label">CHEQ.NO/REF</label>
            <input required type="text" class="form-control" value="543">
        </div>
    </div>

    <div class="form-group">
        <label class="form-label">DESCRIPTION</label>
        <textarea class="form-textarea" placeholder="qtdtsa"></textarea>
    </div>

    <div class="checkbox-group">
        <input type="checkbox" class="checkbox" id="hasBudgetLines" checked>
        <label for="hasBudgetLines">HASBUDGETLINES</label>
    </div>
</div>

<!-- Project Budget Section -->
<div class="table-section">
    <div class="table-section-header">PROJECT BUDGETLINES SECTION</div>
    <div class="table-container">
        <table class="table">
            <thead>
                <tr>
                    <th>#</th>
                    <th>PROJECT</th>
                    <th>BUDGETLINE</th>
                    <th>BUDGETLINE BALANCE</th>
                    <th>AMOUNT</th>
                    <th>
                        <button class="add-btn" onclick="addBudgetLine()">➕ Add</button>
                    </th>
                </tr>
            </thead>
            <tbody id="budgetTableBody">
                <tr>
                    <td>1</td>
                    <td>
                        <select class="table-select budget-select">
                            <option>FAO-001::Study to assess s...</option>
                        </select>
                    </td>
                    <td>
                        <select class="table-select budget-select">
                            <option>4.1::Accomodation for s...</option>
                        </select>
                    </td>
                    <td>
                        <input type="number" class="budget-input table-input" value="72000.00">
                    </td>
                    <td>
                        <input type="number" class="budget-input table-input" value="100.00">
                    </td>
                    <td>
                        <button class="remove-btn" onclick="removeBudgetLine(this)">❌</button>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>
                        <select class="table-select budget-select">
                            <option>Forumciv 001::strengtheni...</option>
                        </select>
                    </td>
                    <td>
                        <select class="table-select budget-select">
                            <option>A 1.3.5::three asdef + faci...</option>
                        </select>
                    </td>
                    <td>
                        <input type="number" class="budget-input table-input" value="24000.00">
                    </td>
                    <td>
                        <input type="number" class="budget-input table-input" value="100.00">
                    </td>
                    <td>
                        <button class="remove-btn" onclick="removeBudgetLine(this)">❌</button>
                    </td>
                </tr>
                <tr class="subtotal-row">
                    <td colspan="4" style="text-align: right; padding-right: 20px;">
                        Subtotal::BudgetlineEntries
                    </td>
                    <td>
                        <input type="number" class="subtotal-input" value="200.00" readonly>
                    </td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<!-- Chart of Accounts Section -->
<div class="table-section">
    <div class="table-section-header">CHART OF ACCOUNTS SECTION</div>
    <div class="table-container">
        <table class="table">
            <thead>
                <tr>
                    <th>#</th>
                    <th>ACCOUNT CODE</th>
                    <th>ACCOUNT NAME</th>
                    <th>DEBIT</th>
                    <th>CREDIT</th>
                    <th>DESCRIPTION</th>
                    <th>
                        <button class="add-btn" onclick="addAccountLine()">➕ Add</button>
                    </th>
                </tr>
            </thead>
            <tbody id="accountTableBody">
                <tr>
                    <td>1</td>
                    <td>
                        <select class="table-select accounts-select" onchange="updateAccountName(this)">
                            <option selected value="1001">1001</option>
                            <option value="1002">1002</option>
                            <option value="2001">2001</option>
                            <option value="3001">3001</option>
                            <option value="4001">4001</option>
                            <option value="5001">5001</option>
                        </select>
                    </td>
                    <td>
                        <input type="text" class="table-input accounts-input" readonly>
                    </td>
                    <td>
                        <input type="number" class="table-input accounts-input" value="100.00"
                            onchange="updateAccountTotals()">
                    </td>
                    <td>
                        <input type="number" class="table-input accounts-input" value="0.00"
                            onchange="updateAccountTotals()">
                    </td>
                    <td>
                        <input type="text" class="table-input accounts-input" placeholder="Enter description...">
                    </td>
                    <td>
                        <button class="remove-btn" onclick="removeAccountLine(this)">❌</button>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>
                        <select class="table-select accounts-select" onchange="updateAccountName(this)">
                            <option value="1001">1001</option>
                            <option value="1002">1002</option>
                            <option selected value="2001">2001</option>
                            <option value="3001">3001</option>
                            <option value="4001">4001</option>
                            <option value="5001">5001</option>
                        </select>
                    </td>
                    <td>
                        <input type="text" class="table-input accounts-input" value="" readonly>
                    </td>
                    <td>
                        <input type="number" class="table-input accounts-input" value="0.00"
                            onchange="updateAccountTotals()">
                    </td>
                    <td>
                        <input type="number" class="table-input accounts-input" value="100.00"
                            onchange="updateAccountTotals()">
                    </td>
                    <td>
                        <input type="text" class="table-input accounts-input" placeholder="Enter description...">
                    </td>
                    <td>
                        <button class="remove-btn" onclick="removeAccountLine(this)">❌</button>
                    </td>
                </tr>
                <tr class="subtotal-row">
                    <td colspan="3" style="text-align: right; padding-right: 20px;">
                        <strong>Totals:</strong>
                    </td>
                    <td>
                        <input type="number" class="subtotal-input" id="totalDebit" value="100.00" readonly>
                    </td>
                    <td>
                        <input type="number" class="subtotal-input" id="totalCredit" value="100.00"
                            readonly>
                    </td>
                    <td colspan="2">
                        <span id="balanceStatus" style="font-weight: bold;">BALANCED ✓</span>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

<!-- Action Buttons -->
<div class="action-buttons">
    <button class="btn-save" onclick="saveVoucher()">💾 SAVE VOUCHER</button>
    <button class="btn-cancel" onclick="cancelEdit()">✖ CANCEL</button>
</div>

<!-- close content div -->
</div>

<script src="<?= SITE_ROOT ?>js/vouchers.js?v=<?= VERSION ?>"></script>
<?php $this->end(); ?>