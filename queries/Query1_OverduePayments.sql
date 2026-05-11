-- QUERY 1: Overdue Payments with Tenant and Property Details
-- =============================================
SELECT
    t.FirstName + ' ' + t.LastName  AS TenantName,
    p.PropertyName,
    p.City,
    l.UnitNumber,
    py.AmountDue,
    py.PaymentStatus
FROM Payments py
JOIN Leases   l ON py.LeaseID   = l.LeaseID
JOIN Tenants  t ON l.TenantID   = t.TenantID
JOIN Properties p ON l.PropertyID = p.PropertyID
WHERE py.PaymentStatus = 'Overdue'
ORDER BY p.PropertyName, t.LastName;
