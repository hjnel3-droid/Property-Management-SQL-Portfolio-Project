-- Query10_DataCorrection
-- Correct a partial payment record and verify the update
---Carlos Mendoza made a partial payment on LeaseID 9 where he paid $1,500 against $3,100 due. He has now paid the remaining $1,600

--Check data on Carlos Mendoza payment history
SELECT PaymentID, LeaseID, AmountDue, AmountPaid, PaymentStatus
FROM Payments
WHERE LeaseID = 9
AND PaymentStatus = 'Partial';

--update his payment history and change payment status to 'paid'
UPDATE Payments
SET    AmountPaid=3100,PaymentStatus='Paid'
WHERE  PaymentID = 24

--Check that update pulled through
SELECT PaymentID, LeaseID, AmountDue, AmountPaid, PaymentStatus
FROM Payments
WHERE PaymentID = 24
