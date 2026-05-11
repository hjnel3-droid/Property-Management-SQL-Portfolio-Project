-- Query2_MissingContacts
-- Identify tenants with missing contact information

SELECT
    FirstName + ' ' + LastName AS TenantName,
    Email AS TenantEmail,
    Phone  AS TenantPhone
FROM Tenants
WHERE Email IS NULL
      OR Phone IS NULL
ORDER BY LastName;