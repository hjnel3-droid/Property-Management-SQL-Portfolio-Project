-- Query9_TenantsWithPaymentAndMaintenanceIssues
-- Identify tenants with both payment issues and open maintenance requests

SELECT
t.FirstName + ' ' + t.LastName AS TenantName,
pr.PropertyName,
COUNT(p.PaymentStatus) AS TotalOverdue,
COUNT(m.LeaseID) AS TotalMaintanceRequests

FROM Leases AS l
JOIN MaintenanceRequests AS m
ON l.LeaseID = m.LeaseID
JOIN Payments AS p
ON m.LeaseID =p.LeaseID
JOIN Tenants AS t
ON l.TenantID = t.TenantID
JOIN Properties AS pr
ON l.PropertyID = pr.PropertyID

WHERE m.Status<> 'Resolved' 
	AND p.PaymentStatus ='Overdue'

GROUP BY t.FirstName, t.LastName, pr.PropertyName