-- 1. Create a table named "Employees" with columns for ID (integer), Name (varchar), and Salary (decimal).
CREATE TABLE Employees (
    ID INT,
    Name VARCHAR(50),
    Salary DECIMAL(10,2)
);

-- 2. Add a new column named "Department" to the "Employees" table with data type varchar(50).
ALTER TABLE Employees
ADD Department VARCHAR(50);

-- 3. Remove the "Salary" column from the "Employees" table.
ALTER TABLE Employees
DROP COLUMN Salary;

-- 4. Rename the "Department" column in the "Employees" table to "DeptName".
ALTER TABLE Employees
RENAME COLUMN Department TO DeptName;

-- 5. Create a new table called "Projects" with columns for ProjectID (integer) and ProjectName (varchar).
CREATE TABLE Projects (
    ProjectID INT,
    ProjectName VARCHAR(50)
);

-- 6. Add a primary key constraint to the "Employees" table for the "ID" column.
ALTER TABLE Employees
ADD CONSTRAINT PK_Employees PRIMARY KEY (ID);

-- 7. Create a foreign key relationship between the "Employees" table (referencing "ID") and the "Projects" table (referencing "ProjectID").
ALTER TABLE Employees
ADD ProjectID INT,
ADD CONSTRAINT FK_Employees_Projects FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID);

-- 8. Remove the foreign key relationship between "Employees" and "Projects".
ALTER TABLE Employees
DROP CONSTRAINT FK_Employees_Projects;

-- 9. Add a unique constraint to the "Name" column in the "Employees" table.
ALTER TABLE Employees
ADD CONSTRAINT UQ_Employee_Name UNIQUE (Name);

-- 10. Create a table named "Customers" with columns for CustomerID (integer), FirstName (varchar), LastName (varchar), and Email (varchar), and Status (varchar).
CREATE TABLE Customers (
    CustomerID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Status VARCHAR(20)
);

-- 11. Add a unique constraint to the combination of "FirstName" and "LastName" columns in the "Customers" table.
ALTER TABLE Customers
ADD CONSTRAINT UQ_Customer_FullName UNIQUE (FirstName, LastName);

-- 12. Add a default value of 'Active' for the "Status" column in the "Customers" table.
ALTER TABLE Customers
ALTER COLUMN Status SET DEFAULT 'Active';

-- 13. Create a table named "Orders" with columns for OrderID (integer), CustomerID (integer), OrderDate (datetime), and TotalAmount (decimal).
CREATE TABLE Orders (
    OrderID INT,
    CustomerID INT,
    OrderDate DATETIME,
    TotalAmount DECIMAL(10,2)
);

-- 14. Add a check constraint to the "TotalAmount" column in the "Orders" table to ensure that it is greater than zero.
ALTER TABLE Orders
ADD CONSTRAINT CHK_TotalAmount CHECK (TotalAmount > 0);
-- 15. Create a schema named "Sales" and move the "Orders" table into this schema.
CREATE SCHEMA Sales;

ALTER SCHEMA Sales
TRANSFER dbo.Orders;

-- 16. Rename the "Orders" table to "SalesOrders".
ALTER TABLE Sales.Orders
RENAME TO SalesOrders;