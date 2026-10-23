# Client Monthly Payment & Ledger Management System

A web-based accounting and ledger application designed to manage $N$ clients with recurring fixed monthly payments, monthly fee overrides, payment deductions, cumulative balances, and **exact month-by-month balance tracking**.

---

## 🌟 Key Features

1. **Client Management ($N$ Clients)**
   - Add, edit, and view unlimited clients.
   - Set contact details, company name, billing start month (`YYYY-MM`), and standard fixed monthly payment.
   - Real-time client directory with live balance badges (Settled, Pending, or Advance Credit).

2. **Fixed Monthly Payments with Custom Overrides**
   - Each client has a default fixed recurring fee accrued for every active month.
   - **Month-Specific Overrides**: Easily change the charge for any *particular month* (e.g. promotional discounts, extra service fees, or project add-ons) with custom reasons.

3. **Cumulative Ledger & Payment Deductions**
   - Monthly dues accumulate chronologically into the client's total amount owed.
   - Whenever the client makes a payment (full, partial, or advance), it is recorded with date, payment mode (UPI, Cash, Bank Transfer, Cheque), and notes.
   - Payments are automatically subtracted from the total balance, updating the **Final Balance** in real-time.

4. **Particular Month Balance Inspector ("Balance From a Particular Month")**
   - Interactive tool allowing you to select **any specific month** (e.g., *September 2026*) to inspect:
     - Expected fee for that month (with override indicators).
     - Total payments credited towards that month.
     - **Exact balance remaining strictly from that month**.
     - Running cumulative balance up to that month.

5. **Flexible Payment Settlement (FIFO & Targeted)**
   - **Auto-Settle (FIFO)**: Payments automatically settle the oldest unpaid months first.
   - **Specific Month Tagging**: Option to explicitly credit a payment towards a chosen month.
   - Any overpayment flows forward as credit / advance balance.

6. **Printable Account Statements / Invoices**
   - Clean, professional client ledger statements with company branding, itemized month breakdown, payment receipt history, and authorized signature section.
   - One-click print or save as PDF (`window.print()`).

7. **Configurable Currency & Branding**
   - Supports ₹ (INR), $ (USD), € (EUR), £ (GBP), AED, or custom symbols.
   - Customizable organization / firm name.

---

## 🚀 How to Run the Application

### Option 1: Quick Start (Double-Click on Windows)
Simply double-click [`start.bat`](start.bat) in the project folder. It will launch the backend server and open your default web browser to:
```
http://localhost:5000
```

### Option 2: Command Line
Open PowerShell or Command Prompt in `d:\BRT Application\Rahul` and run:

```bash
# Start server and web application
npm start
```

Then visit [http://localhost:5000](http://localhost:5000) in your browser.

---

## 🛠️ Tech Stack & Architecture

- **Backend**: Node.js v24 + Express + Native `node:sqlite` (zero external C++ drivers, robust SQLite persistence in `server/data/ledger.db`).
- **Frontend**: React 18, Vite, Tailwind CSS, Lucide Icons.
- **Ledger Engine**: [`server/ledgerService.js`](server/ledgerService.js) handles chronological month sequence generation, fee overrides, FIFO payment cascading, and running cumulative balances.

---

## 📁 Project Directory Structure

```
Rahul/
  ├── package.json               # Root scripts (npm start, npm run build)
  ├── start.bat                  # One-click launcher for Windows
  ├── server/
  │    ├── index.js              # Express REST API & static web serving
  │    ├── db.js                 # SQLite schema & database connection
  │    ├── ledgerService.js      # Month-by-month calculation engine
  │    └── data/
  │         └── ledger.db        # SQLite database file
  └── client/
       ├── src/
       │    ├── App.jsx          # Main application & routing
       │    ├── api.js           # API client & currency formatting
       │    └── components/
       │         ├── Navbar.jsx               # Header & quick actions
       │         ├── DashboardStats.jsx       # Top overview metrics
       │         ├── ClientList.jsx           # Filterable clients directory
       │         ├── ClientDetail.jsx         # Full client ledger view
       │         ├── MonthBalanceInspector.jsx# Month-specific balance tool
       │         ├── AddClientModal.jsx       # New client modal
       │         ├── RecordPaymentModal.jsx   # Payment recording modal
       │         ├── MonthOverrideModal.jsx   # Custom month fee override modal
       │         ├── StatementView.jsx        # Printable statement
       │         └── SettingsModal.jsx        # Branding & currency modal
```
