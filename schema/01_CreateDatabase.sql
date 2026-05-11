-- =============================================
-- CREATE DATABASE
-- =============================================
CREATE DATABASE PropertyManagementDB;
GO

USE PropertyManagementDB;
GO

-- =============================================
-- TABLE 1: Properties
-- =============================================
CREATE TABLE Properties (
    PropertyID      INT IDENTITY(1,1) PRIMARY KEY,
    PropertyName    VARCHAR(100) NOT NULL,
    Address         VARCHAR(200) NOT NULL,
    City            VARCHAR(50)  NOT NULL,
    Region          VARCHAR(50)  NOT NULL,
    PropertyType    VARCHAR(50)  NOT NULL,
    TotalUnits      INT          NOT NULL,
    ManagerName     VARCHAR(100) NOT NULL
);
GO

-- =============================================
-- TABLE 2: Tenants
-- =============================================
CREATE TABLE Tenants (
    TenantID    INT IDENTITY(1,1) PRIMARY KEY,
    FirstName   VARCHAR(50)  NOT NULL,
    LastName    VARCHAR(50)  NOT NULL,
    Email       VARCHAR(100),
    Phone       VARCHAR(20),
    IDNumber    VARCHAR(20),
    DateOfBirth DATE
);
GO

-- =============================================
-- TABLE 3: Leases
-- =============================================
CREATE TABLE Leases (
    LeaseID        INT IDENTITY(1,1) PRIMARY KEY,
    TenantID       INT            NOT NULL REFERENCES Tenants(TenantID),
    PropertyID     INT            NOT NULL REFERENCES Properties(PropertyID),
    UnitNumber     VARCHAR(10)    NOT NULL,
    LeaseStartDate DATE           NOT NULL,
    LeaseEndDate   DATE           NOT NULL,
    MonthlyRent    DECIMAL(10,2)  NOT NULL,
    LeaseStatus    VARCHAR(20)    NOT NULL
);
GO

-- =============================================
-- TABLE 4: Payments
-- =============================================
CREATE TABLE Payments (
    PaymentID     INT IDENTITY(1,1) PRIMARY KEY,
    LeaseID       INT           NOT NULL REFERENCES Leases(LeaseID),
    PaymentDate   DATE,
    AmountDue     DECIMAL(10,2) NOT NULL,
    AmountPaid    DECIMAL(10,2),
    PaymentStatus VARCHAR(20)   NOT NULL,
    PaymentMethod VARCHAR(30)
);
GO

-- =============================================
-- TABLE 5: MaintenanceRequests
-- =============================================
CREATE TABLE MaintenanceRequests (
    RequestID    INT IDENTITY(1,1) PRIMARY KEY,
    LeaseID      INT          NOT NULL REFERENCES Leases(LeaseID),
    RequestDate  DATE         NOT NULL,
    Category     VARCHAR(50)  NOT NULL,
    Description  VARCHAR(500),
    Priority     VARCHAR(20)  NOT NULL,
    Status       VARCHAR(20)  NOT NULL,
    ResolvedDate DATE
);
GO
