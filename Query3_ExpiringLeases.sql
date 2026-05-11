--Query3_ExpiringLeases
--Find all active leases expiring within the next 6 months
--The property manager wants to see all active leases that are due to expire within the next 6 months, 
--including the tenant name, property name, unit number, monthly rent, and the expiry date - ordered by expiry date ascending so the most urgent ones appear first.

SELECT 
t.FirstName + ' ' + t.LastName AS TenantName,
p.PropertyName AS PropertyName,
l.UnitNumber,
l.MonthlyRent,
l.LeaseEndDate


FROM Leases as l
INNER JOIN Tenants AS t
ON t.TenantID = l.TenantID
INNER JOIN Properties AS p
ON l.PropertyID = p.PropertyID 

WHERE LeaseStatus = 'Active'
					AND DATEDIFF(month,GETDATE(),LeaseEndDate)<6
					AND LeaseEndDate> GETDATE()

ORDER BY LeaseEndDate ASC;