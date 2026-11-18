create database Bankingdb;
use bankingdb;

-- create table:
/* 
Multi row 
comments 
*/

create table customers
(
CustomerID int,
FirstName varchar(50),
LastName varchar(50),
Email varchar(100),
Phone varchar(15),
AccountCreationDate date
);

desc customers;
describe customers;

show tables;
-- ---------------------------LAB2-------------------------
create table Accounts(
AccountID int,
AccountType varchar(20),
Balance decimal(10,2)
);

desc Accounts;

create table Transactions(
TransactionID int,
TransactionDate Date,
Amount decimal(10,2),
TransactionType varchar(20)
);

create table Branches(
BranchID int,
BranchName varchar(100),
BranchAddress varchar(200),
BranchPhone varchar(15)
);

create table AccountBranches(
AssignmentDate date
);

create table Loan(
LoanID int,
LoanAmount decimal(10,2),
InterestRate decimal(5,2),
StartDate date,
EndDate Date
);

show tables;

desc customers;

alter table customers add  DateOfBirth date;

alter table customers modify Phone varchar(20);

desc Accounts;

alter table Accounts add constraint chk_MinBalance check (Balance >=1000);

insert into Accounts values (1, 'Savings', 900); -- Error

drop table accountbranches;

alter table customers add primary key (CustomerID);

desc customers;
desc Accounts;

alter table Accounts add CustomerID int;

alter table Accounts add foreign key (CustomerID) references customers(CustomerID);

alter table customers modify FirstName varchar(50) not null;

select * from customers;

desc customers;

alter table customers add constraint uq_Email unique (Email);
-- -------------------------Activity 2----------------
alter table Branches add primary key (BranchID);

desc Accounts;
desc Branches;

alter table Accounts add BranchID int;

alter table Accounts add foreign key (BranchID) references Branches(BranchID);
-- -------------------------Activity 3----------------
alter table Accounts add primary key (AccountID);

desc Accounts;
desc Transactions;

alter table Transactions add AccountID int;

alter table Transactions add foreign key (AccountID) 
references Accounts(AccountID);
-- -------------------------Activity 4----------------

desc Loan;
desc Customers;

show tables;
alter table Loan add CustomerID int;

alter table Loan add foreign key (CustomerID) 
references Customers(CustomerID);

-- ------------------------------LAB 3-------------------

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, DateOfBirth)
VALUES
(101,'Rahul','Sharma','rahul@gmail.com','9876543210','1998-04-15');

INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(201,101,'Savings',25000);

SELECT * FROM ACCOUNTS;

UPDATE Customers
SET Phone='9999999999'
WHERE CustomerID=101;

select * from customers;

UPDATE Customers
SET Email='rahul.sharma@gmail.com'
WHERE CustomerID=101;

-- Insert 4 Records into Customers Table
INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, DateOfBirth)
VALUES
(102, 'Priya', 'Patil', 'priya@gmail.com', '9988776655', '2000-09-20'),
(103, 'Amit', 'Patel', 'amit.patel@gmail.com', '9876500001', '1995-06-18'),
(104, 'Sneha', 'Joshi', 'sneha.joshi@gmail.com', '9876500002', '1997-09-12'),
(105, 'Rohan', 'Kulkarni', 'rohan.k@gmail.com', '9876500003', '1993-11-25');

-- Insert 4 Records into Accounts Table
INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(202, 102, 'Current', 40000),
(203, 103, 'Savings', 35000),
(204, 104, 'Current', 60000),
(205, 105, 'Savings', 45000);

-- Insert 5 Records into Transactions Table
INSERT INTO Transactions
(TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES
(301, 201, '2025-05-10', 5000, 'Deposit'),
(302, 202, '2025-05-11', 2500, 'Withdraw'),
(303, 203, '2025-05-12', 10000, 'Deposit'),
(304, 204, '2025-05-13', 3000, 'Withdraw'),
(305, 205, '2025-05-14', 7000, 'Deposit');

-- Insert 5 Records into Branches Table
INSERT INTO Branches
(BranchID, BranchName, BranchAddress, BranchPhone)
VALUES
(1, 'Mumbai Branch', 'Andheri, Mumbai', '0221111111'),
(2, 'Pune Branch', 'Shivaji Nagar, Pune', '0202222222'),
(3, 'Nashik Branch', 'College Road, Nashik', '0253222222'),
(4, 'Nagpur Branch', 'Sitabuldi, Nagpur', '0712333333'),
(5, 'Navi Mumbai Branch', 'Vashi, Navi Mumbai', '0224444444');

-- Insert 5 Records into Loans Table
INSERT INTO Loan
(LoanID, LoanAmount, InterestRate, StartDate, EndDate, CustomerID)
VALUES
(301, 500000, 8.50, '2025-01-15', '2030-01-15', 101),
(302, 300000, 9.25, '2025-02-10', '2028-02-10', 102),
(303, 750000, 8.75, '2025-03-20', '2032-03-20', 103),
(304, 250000, 10.00, '2025-04-05', '2029-04-05', 104),
(305, 1000000, 7.95, '2025-05-12', '2035-05-12', 105);
-- --------------------------------LAB 4 -----------------------
select * from customers;
select firstname, lastname, Email, Phone from customers;

-- Retrive only the following details from Accounts table: 
-- AccountID, AccountType and Balance
select * from Accounts;
select AccountID, AccountType, Balance from Accounts;

-- Retrieve customers with Savings accounts
select * from Accounts where AccountType= 'Savings';

-- Retrieve Accounts with Balance Greater Than 25000
select * from Accounts where Balance > 25000;

-- Retrieve Transactions Between Specific Amounts (5000 and 20000)
select * from Transactions where Amount
between 5000 and 20000;

-- Retrieve Records for Selected Customers (101,102,103)
select * from customers where customerID in (101,102,103);

-- Search Customers Using Partial Name Matching
-- Wild card operators (%, [], _)
select * from customers where firstname like 'r%';
select * from customers where firstname like '%a';
select * from customers where firstname like '%i%';
select * from customers where firstname like '_a%';
select * from customers where firstname like '%a_';
select * from customers where firstname like '__h%';

-- Retrieve all current account records
select * from Accounts where AccountType = 'current';

-- Find accounts with balance less than 30000
select * from Accounts where Balance < 30000;

-- Display transactions between 3000 and 7000
select * from transactions where Amount between 3000 and 7000;

-- Retrieve customers records for customerID 104 and 105
select * from customers where customerID in (104,105);

-- Display customers whose last name starts with s
select * from customers where lastname like 's%';

-- Display Customers in Alphabetical order
select * from customers order by firstname asc; -- Default is ascending

-- Display Accounts with Highest Balanace First 
select * from Accounts order by Balance desc;

-- Retrieve Unique Account Types
select  distinct AccountType from Accounts;

-- Display Top 3 Highest Balance Accounts
select * from Accounts order by Balance desc limit 3;

-- Skip Initial Records While Viewing Transactions
select * from Transactions limit 5 offset 2;

-- Display customers sorted by LastName
select * from customers order by Lastname asc;

-- Retrieve top 3 transactions with highest amount
select * from transactions order by Amount desc limit 3;

-- Display unique transaction types
select distinct transactiontype from transactions;

-- Skip the first 3 transaction records and 
-- display the next 2 records
select * from transactions limit 5 offset 3;

-- Find Customers without Phone Numbers
select * from customers where phone is null;

update customers set phone = null where customerID = 103;
-- 9876500001

update customers set phone = 9876500001 where customerID = 103;

-- Find Customers having Phone Numbers
select * from customers where phone is not null;

-- Categorize Accounts Using Balance
-- >=50000 then Premium Account
-- >=35000 then Standard Account otherwise Basic Account

select AccountID, Balance,
case 
	when Balance >=50000 then 'Premium Account'
    when Balance >=35000 then 'Standard Account'
    else 'Basic Account'
end as AccountCategory
from Accounts;

-- Create a report that categorizes transactions as:
-- High transaction: >=7000
-- Medium transaction: >=3000
-- Low transaction: Else
-- Based on transaction Amount

select transactionID, Amount, 
case
	 when Amount >=7000 then "High transaction"
     when Amount >=3000 then "Medium transaction"
     else "Low transaction"
end as Transaction_Category
from transactions;

-- Window Function
-- Assign Rank Based on Account Balance

select AccountID, Balance,
rank() over(order by Balance desc) as BalanceRank
from Accounts;

update Accounts set Balance = 45000 where AccountID = 202;

select AccountID, Balance,
dense_rank() over(order by Balance desc) as BalanceRank
from Accounts;

-- Calculate Running Total of Transactions 
select TransactionID, Amount,
sum(Amount) over(order by TransactionDate) as RunningAmount
 from Transactions;

select * from Transactions;

-- Display Average Transaction Amount
select TransactionID, Amount,
avg(Amount) over() as AvgAmount
 from Transactions;

-- Rank customers based on account balance
select CustomerID, Balance, 
rank() over(order by Balance desc) as BalanaceRank  from Accounts;

-- Generate running total for account balances
select AccountID, Balance,
sum(Balance) over(order by Balance) as RunningAmount
 from Accounts;

-- Display maximum transaction amount using a window function
select max(Amount)from Transactions;

select *, max(Amount) over() as max_amount from Transactions;

-- Search Customers whose First Name Starts with "A"
select * from customers where Firstname like "A%";

-- Search Customers whose Email contains "gmail"
select * from customers where Email like "%gmail%";

-- Search Customers whose Last Name Ends with "kar"
select * from customers where Lastname like "%kar";

-- Display customers whose first name starts with R
select * from customers where Firstname like "R%";

-- Find customers whose email contains yahoo
select * from customers where Email like "%yahoo%";

-- Display customers whose last name starts with P
select * from customers where Lastname like "P%";

-- Search customers whose phone number ends with 99
select * from customers where Phone like "%99";

-- Retrieve Records for Selected Account Types
select * from Accounts where AccountType in ('Savings', 'current');

-- Retrieve Transactions for Selected Transaction Types
select * from Transactions where TransactionType in ('Deposit', 'Withdraw');

-- Display accounts belonging to Salary and Savings account types
select * from Accounts where AccountType in ('Savings', 'Salary');

-- Retrieve Transactions for Payment and Deposit categories
select * from Transactions where TransactionType in ('Deposit', 'Payment');

-- Display customer records for customerID 103 and 104
select * from customers where customerID in (103, 104);

-- Display customers in Ascending Order of Last Name
select * from customers order by LastName asc;

-- Display Accounts with Highest Balance First
select * from accounts order by Balance desc;

-- Display Transactions Sorted by Transaction Date
select * from Transactions order by TransactionDate desc;

-- Display customers sorted by Firstname
select * from customers order by firstName asc;

-- Display accounts sorted by AccountType
select * from accounts order by AccountType;

-- Display Transactions Sorted by Amount in descending order
select * from Transactions order by Amount desc;

-- Display customers sorted by DateOfBirth
select * from customers order by DateOfBirth;

-- Display Only Top 3 Highest Balance Accounts
select * from accounts order by Balance desc limit 3;

-- Display First 3 Customer Records
select * from customers limit 3;

-- Skip Initial Transaction Records While Viewing Data
select * from Transactions limit 5 offset 2;

-- -------------------LAB 6-------------------------------
select * from Customers;

select firstname, upper(firstname) as Uppercasename from Customers;

select firstname, upper(firstname) as Uppercasename,
lower(firstname) as Lowercasename
from Customers;

select firstname, length(firstname) as NameLegth from Customers;

select firstname, left(firstname,3) as Initials from Customers;

select concat(firstname,"_", lastname) as FullName from Customers;

-- ----Math Functions---------------------
select round(1256.75);
select ceil(1256.25);
select floor(1256.75);
select abs(-1256.75);
select mod(25,4);
-- -----------------Date Functions------------------------

select curdate();
select now();
select sysdate();

select * from customers;
desc customers;
select DateOfBirth,year(DateOfBirth) from customers;
select DateOfBirth,month(DateOfBirth) from customers;
select DateOfBirth,day(DateOfBirth) from customers;
select DateOfBirth,weekday(DateOfBirth) from customers;

select CustomerID, year(DateOfBirth) as Birthyear from customers;

select CustomerID, datediff(curdate(), DateOfBirth) 
as days from customers;

select CustomerID, DateOfBirth, 
timestampdiff(year,DateOfBirth,curdate()) 
as Birthyear from customers;

-- Comparison Finctions----------------------
-- Categorize customers as Adult or Young based on their birth year
select * from customers;
desc customers;

select FirstName, DateOfBirth,
if(year(DateOfBirth) <= 1995, "Adult", "Young") as Category
from customers;

-- Display "Not available" if a phone number is NULL
select * from customers;
desc customers;

-- 9876500002
update customers set phone = null where CustomerID = 104;
update customers set phone = 9876500002 where CustomerID = 104;

select FirstName, ifnull(Phone, "Not available") as PhoneNumber
from customers;

-- Find latest birth date
select * from customers;
desc customers;
select DateOfBirth from customers;

select greatest
('1998-04-15',
'2000-09-20',
'1995-06-18',
'1997-09-12',
'1993-11-25') as LatestBirthDate;

-- Find earliest birth date
select least
('1998-04-15',
'2000-09-20',
'1995-06-18',
'1997-09-12',
'1993-11-25') as EarliestBirthDate;

select FirstName, nullif(FirstName,'Priya') as Result from customers;
select * from customers;

-- --------Aggregate Functions-------------------
select sum(Balance) as total_balance from Accounts;
select avg(Balance) as average_balance from Accounts;
select max(Balance) as highest_balance from Accounts;
select min(Balance) as lowest_balance from Accounts;
select count(*) as total_accounts from Accounts;

-- -------GROUP BY-------------------------
select * from Accounts;
select AccountType, sum(Balance) as total_balance
from Accounts group by AccountType;

select AccountType, sum(Balance) as total_balance
from Accounts group by AccountType having total_balance > 100000;
-- ------------------LAB 7-------------------------------
select LoanID, CustomerID, LoanAmount,
rank() over(order by LoanAmount desc) as LoanRank
from Loan;

select LoanID, CustomerID, LoanAmount,
row_number() over(order by LoanAmount desc) as RowNumber
from Loan;

select LoanID, CustomerID, LoanAmount,
row_number() over (partition by CustomerID 
order by LoanAmount desc) as RowNumber
from Loan;

select AccountID, AccountType, Balance, row_number()
over ( partition by AccountType order by Balance desc) RowNum
from accounts;

select LoanID, CustomerID, LoanAmount,
lag(LoanAmount) over(order by LoanAmount desc) as PreviousLoanAmount
from Loan;

select LoanID, CustomerID, LoanAmount,
lead(LoanAmount) over(order by LoanAmount desc) as NextLoanAmount
from Loan;
-- ------------------------LAB 8 (JOIN)----------------------------
select * from Accounts;
select * from Transactions;
desc Accounts;
desc Transactions;

select a.AccountID, a.AccountType, a.Balance,
	t.TransactionID, t.TransactionDate, t.TransactionType, t.Amount
from Accounts a
Inner join Transactions t 
on a.AccountID = t.AccountID;

select a.AccountID, a.AccountType, a.Balance,
	t.TransactionID, t.TransactionDate, t.TransactionType, t.Amount
from Accounts a
Inner join Transactions t 
on a.AccountID = t.AccountID where t.TransactionType= 'Deposit';

select a.AccountID, a.AccountType, a.Balance,
	t.TransactionID, t.TransactionDate, t.TransactionType, t.Amount
from Accounts a
Inner join Transactions t 
on a.AccountID = t.AccountID 
where a.Balance > 40000 order by a.Balance desc;

-- -------------------LAB 9(Subqueries)------------------------
select avg(Amount) from Transactions;

select * from Transactions where Amount > 
(select avg(Amount) from Transactions);

select avg(Balance) from Accounts;

select AccountID, AccountType, Balance, CustomerID 
from Accounts where Balance > (select Avg(Balance) from Accounts)
order by Balance desc;

desc Accounts;

select AccountID, AccountType, Balance, CustomerID 
from Accounts where AccountID in 
(select AccountID from Transactions where TransactionType = 'Deposit');

select * from Transactions;

select AccountID, AccountType, Balance, CustomerID 
from Accounts where Balance =
(select max(Balance) from Accounts);

select * from Transactions;
-- ---------------------------LAB 10 (View)------------------------
desc Accounts;

create view High_Balance_Accounts as 
select AccountID, AccountType, Balance, CustomerID from Accounts
where Balance > 30000;

select * from High_Balance_Accounts;

create or replace view 
High_Balance_Accounts as 
select a.AccountID, a.AccountType, a.Balance, a. CustomerID,
t.TransactionID, t.TransactionDate, t.TransactionType, t.Amount
from Accounts a
inner join Transactions t
on a.AccountID = t.AccountID
where a.Balance > 30000;

desc Transactions;

select AccountID,AccountType, Balance, CustomerID, 
TransactionID, TransactionDate, TransactionType, Amount
from High_Balance_Accounts order by Balance desc;

