# Property Management SQL Analysis — MRI ERP Simulation

Microsoft SQL Server | T-SQL | SSMS | Data Analysis | ERP Systems

![SQL Server](https://img.shields.io/badge/SQL%20Server-CC2927?style=flat&logo=microsoft-sql-server&logoColor=white)
![T-SQL](https://img.shields.io/badge/T--SQL-4479A1?style=flat&logo=databricks&logoColor=white)
![SSMS](https://img.shields.io/badge/SSMS-CC2927?style=flat&logo=microsoft&logoColor=white)
![Data Analysis](https://img.shields.io/badge/Data%20Analysis-2E86AB?style=flat&logoColor=white)
![ERP](https://img.shields.io/badge/ERP%20Systems-F4A261?style=flat&logoColor=white)
![Status](https://img.shields.io/badge/Status-Complete-2a9d8f?style=flat&logoColor=white)


## Overview
This project simulates the data environment of a property management ERP system, 
modelled on platforms such as MRI Software. It demonstrates core SQL Developer 
skills including data extraction, aggregation, date logic, NULL handling, 
multi-table joins, and data correction — applied to realistic business problems 
across a relational database schema.

The project was built using Microsoft SQL Server 2025 Express and SQL Server 
Management Studio (SSMS).

---

## Business Context
Property management companies rely on ERP systems to track tenants, leases, 
payments, and maintenance requests across multiple properties and regions. 
Analysts and SQL developers working in this environment are expected to 
investigate data issues, produce reporting outputs, and correct records 
as part of day-to-day operations.

This project replicates that environment using a mock dataset of 20 properties, 
50 tenants, 60 leases, 126 payments, and 61 maintenance requests across 6 US regions.

---

## Schema Design

The database consists of 5 related tables:

| Table | Relationships |
|---|---|
| Properties | One property has many Leases |
| Tenants | One tenant has many Leases |
| Leases | Links Properties and Tenants; parent to Payments and MaintenanceRequests |
| Payments | Belongs to a Lease |
| MaintenanceRequests | Belongs to a Lease |

## Business Problems and Queries

### Query 1: Overdue Payments with Tenant and Property Details
**Business problem:** Extract all overdue payments with tenant name, property, 
unit number, and amount due so the property manager can follow up with tenants.

**Skills demonstrated:** Multi-table JOIN, WHERE filtering, string concatenation

---

### Query 2: Tenants with Missing Contact Information
**Business problem:** Identify tenants where email or phone number is missing 
so records can be completed before lease renewals or maintenance communications.

**Skills demonstrated:** NULL handling with IS NULL, OR logic

---

### Query 3:Active Leases Expiring Within 6 Months
**Business problem:** Surface all active leases due to expire within the next 
6 months so the renewals team can initiate contact ahead of expiry.

**Skills demonstrated:** DATEDIFF, GETDATE, compound WHERE conditions, date comparison

---

### Query 4: Rent Collection Summary by Property
**Business problem:** Produce a property-level summary of total rent due vs 
total collected vs outstanding balance, ordered by worst performing properties first.

**Skills demonstrated:** SUM aggregation, ISNULL, GROUP BY, ORDER BY DESC

---

### Query 5: Tenants with Multiple Overdue Payments
**Business problem:** Flag tenants with 2 or more overdue payments for 
escalation to property management.

**Skills demonstrated:** COUNT, GROUP BY, HAVING, multi-table JOIN

---

### Query 6: Maintenance Request Summary by Property and Priority
**Business problem:** Generate a summary of open maintenance requests grouped 
by property and priority level so the maintenance team can allocate resources effectively.

**Skills demonstrated:** GROUP BY multiple columns, COUNT, ORDER BY multiple columns

---

### Query 7: Unresolved Critical Maintenance Requests Older Than 30 Days
**Business problem:** Identify critical maintenance requests that remain unresolved 
after 30 days so they can be escalated immediately.

**Skills demonstrated:** DATEDIFF with GETDATE, inequality filtering, multi-table JOIN

---

### Query 8: Regional Revenue Summary
**Business problem:** Produce a regional breakdown of total rent collected 
so leadership can assess portfolio performance by geography.

**Skills demonstrated:** SUM, GROUP BY region, multi-table JOIN, ORDER BY DESC

---

### Query 9: Tenants with Both Payment Issues and Open Maintenance Requests
**Business problem:** Identify high-risk tenants who have overdue payments 
and unresolved maintenance requests simultaneously, for combined escalation.

**Skills demonstrated:** Multi-condition WHERE, COUNT across multiple joined tables, GROUP BY

---

### Query 10: Data Correction: Partial Payment Update
**Business problem:** A tenant completed a previously partial payment. 
Update the payment record to reflect the full amount paid and correct the status.

**Skills demonstrated:** UPDATE statement, targeted WHERE using primary key, 
before-and-after SELECT verification

---

## How to Run This Project

1. Install Microsoft SQL Server Express and SSMS
2. Open SSMS and connect to your local instance
3. Run `schema/01_CreateDatabase.sql` to create the database and all tables
4. Run `schema/02_InsertData.sql` to populate the dataset
5. Open any query file in the `queries/` folder and execute against `PropertyManagementDB`

---

## Project Structure

```
PropertyManagement-SQL/
├── README.md
├── schema/
│   ├── 01_CreateDatabase.sql
│   └── 02_InsertData.sql
└── queries/
    ├── Query1_OverduePayments.sql
    ├── Query2_MissingContacts.sql
    ├── Query3_ExpiringLeases.sql
    ├── Query4_RentCollectionSummary.sql
    ├── Query5_MultipleOverduePayments.sql
    ├── Query6_MaintenanceSummary.sql
    ├── Query7_CriticalUnresolvedMaintenance.sql
    ├── Query8_RegionalRevenueSummary.sql
    ├── Query9_PaymentAndMaintenanceIssues.sql
    └── Query10_DataCorrection.sql
```

## Tools Used
- Microsoft SQL Server 2025 Express
- SQL Server Management Studio (SSMS)
- T-SQL (Transact-SQL)

---

## Author
Jordan Nel
[GitHub: InsightswithJ](https://github.com/InsightswithJ)
[Portfolio: jordan-nel-portfolio.netlify.app](https://jordan-nel-portfolio.netlify.app)
---

## Project Structure
