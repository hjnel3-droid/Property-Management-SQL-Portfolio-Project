-- Query7_UnresolvedCriticalMaintenance
-- Find unresolved critical maintenance requests older than 30 days

SELECT
p.PropertyName,
RequestDate,
Description,
Priority
FROM MaintenanceRequests AS m
JOIN Leases AS l
ON l.LeaseID = m.LeaseID
JOIN Properties AS p
ON l.PropertyID = p.PropertyID

WHERE Priority = 'Critical' 
	AND Status <> 'Resolved'
	AND DATEDIFF(DAY,RequestDate,GETDATE())>30
ORDER BY RequestDate ASC
