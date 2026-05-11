-- Query8_RegionalRevenueSummary
-- Produce a regional revenue summary

SELECT 
pr.Region,
SUM(AmountPaid) AS TotalRevenue

FROM Payments AS p
JOIN Leases AS l
ON l.LeaseID = p.LeaseID
JOIN Properties AS pr
ON pr.PropertyID = l.PropertyID

GROUP BY pr.Region
ORDER BY TotalRevenue DESC
