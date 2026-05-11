-- Query4_RentCollectionSummary
-- Calculate total rent collected vs outstanding per property
--The finance team wants a summary per property showing the total rent that should have been collected, the total actually paid, and the difference between the two - 
--so they can see at a glance which properties have the largest outstanding balances. Order by outstanding amount descending so the worst performers appear first.

SELECT
    pr.PropertyName,
    SUM(py.AmountDue) AS TotalAmountDue,
    SUM(py.AmountPaid) AS TotalAmountPaid,
    SUM(py.AmountDue) - SUM(ISNULL(py.AmountPaid, 0)) AS OutstandingBalance

FROM Payments AS py
INNER JOIN Leases AS l
    ON l.LeaseID = py.LeaseID
INNER JOIN Properties AS pr
    ON l.PropertyID = pr.PropertyID

GROUP BY pr.PropertyName
ORDER BY OutstandingBalance DESC
