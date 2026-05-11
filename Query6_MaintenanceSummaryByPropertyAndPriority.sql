-- Query6_MaintenanceSummaryByPropertyAndPriority
-- Generate a maintenance request summary by property and priority

SELECT
p.PropertyName AS PropertyName,
COUNT(p.PropertyName) AS TotalWorkRequests,
m.Priority 


FROM MaintenanceRequests AS m
JOIN Leases AS l
ON l.LeaseID = m.LeaseID
JOIN Properties AS p
ON l.PropertyID = p.PropertyID

GROUP BY p.PropertyName, m.Priority
ORDER BY p.PropertyName, m.Priority