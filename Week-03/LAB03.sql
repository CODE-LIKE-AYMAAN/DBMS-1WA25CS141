CREATE DATABASE BANK;
USE BANK;
CREATE TABLE BRANCH( branch_name VARCHAR(50) PRIMARY KEY,
branch_city VARCHAR(50),
assets  DECIMAL(15,2) CHECK (assets>=0) );
CREATE TABLE Account(
account_number INT PRIMARY KEY,
branch_name VARCHAR(50),
balance DECIMAL(12,2) CHECK (balance >=0),
FOREIGN KEY (branch_name)
REFERENCES BRANCH(branch_name) );

CREATE TABLE Customer (
customer_name VARCHAR(50) PRIMARY KEY,
customer_street VARCHAR(100),
customer_city VARCHAR(50)
);

CREATE TABLE Depositor (
customer_name VARCHAR(50),
account_number INT,
PRIMARY KEY (customer_name, account_number),
FOREIGN KEY (customer_name)
REFERENCES Customer(customer_name),
FOREIGN KEY (account_number)
REFERENCES Account(account_number)
);

CREATE TABLE Loan (
loan_number INT PRIMARY KEY,
branch_name VARCHAR(50),
amount DECIMAL(12,2) CHECK (amount >= 0),
FOREIGN KEY (branch_name)
REFERENCES Branch(branch_name)
);
INSERT INTO Branch VALUES
('SBI_ResidencyRoad', 'Bangalore', 5000000),
('SBI_MG_Road', 'Bangalore', 7000000),
('SBI_Delhi', 'Delhi', 6000000),
('SBI_Bombay', 'Bombay', 8000000),
('SBI_Mysore', 'Mysore', 4000000);

INSERT INTO Account VALUES
(101, 'SBI_ResidencyRoad', 25000),
(102, 'SBI_ResidencyRoad', 40000),
(103, 'SBI_MG_Road', 30000),
(104, 'SBI_Delhi', 50000),
(105, 'SBI_Bombay', 60000),
(106, 'SBI_Mysore', 20000);

INSERT INTO Customer VALUES
('Aman', 'MG Road', 'Bangalore'),
('Rahul', 'Residency Road', 'Bangalore'),
('Priya', 'Park Street', 'Delhi'),
('Sneha', 'Marine Drive', 'Bombay'),
('Arjun', 'Vijay Nagar', 'Mysore');

INSERT INTO Depositor VALUES
('Aman', 101),
('Aman', 102),
('Rahul', 103),
('Priya', 104),
('Sneha', 105),
('Arjun', 106);

INSERT INTO Loan VALUES
(201, 'SBI_ResidencyRoad', 100000),
(202, 'SBI_MG_Road', 150000),
(203, 'SBI_Delhi', 200000),
(204, 'SBI_Bombay', 250000),
(205, 'SBI_Mysore', 120000);

SELECT branch_name, assets / 100000 AS 'assets in lakhs' FROM Branch;
SELECT D.customer_name, A.branch_name,
COUNT(A.account_number) AS total_accounts
FROM Depositor D
JOIN Account A
ON D.account_number = A.account_number
GROUP BY D.customer_name, A.branch_name
HAVING COUNT(A.account_number) >= 2;

CREATE VIEW Branch_Loan_Total AS
SELECT branch_name,
SUM(amount) AS total_loan
FROM Loan
GROUP BY branch_name;

SELECT * FROM Branch_Loan_Total;

SELECT *
FROM Loan
ORDER BY amount DESC;

CREATE TABLE Borrower (
customer_name VARCHAR(50),
loan_number INT,

PRIMARY KEY (customer_name, loan_number),

FOREIGN KEY (customer_name)
REFERENCES Customer(customer_name),

FOREIGN KEY (loan_number)
REFERENCES Loan(loan_number)
);

SELECT customer_name
FROM Depositor
UNION
SELECT customer_name
FROM Borrower;

UPDATE Branch SET assets = assets * 1.05;

SELECT * FROM Branch;

SHOW TABLES;

SELECT * FROM Branch;
SELECT * FROM Account;
SELECT * FROM Customer;
SELECT * FROM Depositor;
SELECT * FROM Loan;
SELECT * FROM Borrower;

SELECT * FROM Branch_Loan_Total;