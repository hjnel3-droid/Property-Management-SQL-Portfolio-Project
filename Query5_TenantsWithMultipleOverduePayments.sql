-- Query5_TenantsWithMultipleOverduePayments
-- Flag tenants with 2 or more overdue payments

SELECT
t.FirstName + ' ' + t.LastName AS TenantName,
p.PropertyName,
COUNT(py.PaymentStatus) AS OverdueCount

FROM Payments py
JOIN Leases  AS l
ON py.LeaseID   = l.LeaseID
JOIN Tenants AS t 
ON l.TenantID   = t.TenantID
JOIN Properties AS p 
ON l.PropertyID = p.PropertyID

WHERE py.PaymentStatus = 'Overdue'
GROUP BY t.FirstName, t.LastName, p.PropertyName
HAVING COUNT(py.PaymentStatus) >= 2
ORDER BY OverdueCount DESC;