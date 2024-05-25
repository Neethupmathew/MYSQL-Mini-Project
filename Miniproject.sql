CREATE DATABASE LIBRARY;
USE LIBRARY;
CREATE TABLE BRANCH(
Branch_no INT PRIMARY KEY,
Manager_Id int,
Branch_Address VARCHAR(100),
Contact_No bigint
);

INSERT INTO Branch VALUES
(1, 101, '100 Main St, Springfield', 5263418796),
(2, 102, '400 Oak St, Shelbyville', 5463214587),
(3, 103, '700 Maple St, Capital City', 5487965412),
(4, 104, '500 Elm St, Ogdenville', 6587459632),
(5, 105, '200 Pine St, North Haverbrook', 5478963254),
(6, 106, '300 Birch St, Brockway', 2541236587),
(7, 107, '400 Cedar St, Cypress Creek', 245879632),
(8, 108, '800 Ash St, West Springfield', 3564215698),
(9, 109, '600 Cherry St, Monorail', 585580987),
(10, 110, '900 Redwood St, East Springfield', 2655552109);

ALTER TABLE BRANCH CHANGE COLUMN Contact_No Contact_No bigint;

SELECT * FROM BRANCH;

CREATE TABLE EMPLOYEE (
Emp_Id INT PRIMARY KEY,
Emp_name varchar(60),
Position varchar(60),
Salary int,
Branch_No int,
FOREIGN KEY (Branch_No) REFERENCES Branch (Branch_No) on delete cascade
);
INSERT INTO Employee values
(201, 'John Smith', 'Manager', 50000, 1),
(202, 'Emily Johnson', 'Assistant Librarian', 40000, 9),
(203, 'Michael Brown', 'Clerk', 52000, 2),
(204, 'Jessica Davis', 'Circulation Clerk', 41000, 2),
(205, 'Daniel Wilson', 'Reference Librarian', 53000, 3),
(206, 'Sarah Moore', 'Kids Librarian', 42000, 8),
(207, 'David Taylor', 'Tech Analyst', 54000, 4),
(208, 'Laura Anderson', 'Digital Librarian', 43000, 4),
(209, 'James Thomas', 'Shelf Keeper', 55000, 7),
(210, 'Sophia Jackson', 'Cleaner', 20000, 5);

SELECT * FROM EMPLOYEE;

CREATE TABLE CUSTOMER(
Customer_Id INT,
Customer_Name VARCHAR(60),
Customer_Address VARCHAR(100),
Reg_Date date
);

INSERT INTO Customer (Customer_Id, Customer_Name, Customer_Address, Reg_Date) VALUES
(1, 'Anjali Nair', 'House No. 1, Kollam', '2023-01-10'),
(2, 'Vishnu Menon', 'House No. 2, Thiruvananthapuram', '2023-02-15'),
(3, 'Divya Pillai', 'House No. 3, Kochi', '2023-03-12'),
(4, 'Arun Kumar', 'House No. 4, Kozhikode', '2023-04-18'),
(5, 'Sreelakshmi Unni', 'House No. 5, Thrissur', '2023-05-22'),
(6, 'Manoj Nair', 'House No. 6, Alappuzha', '2023-06-25'),
(7, 'Sneha Krishnan', 'House No. 7, Kannur', '2023-07-30'),
(8, 'Pradeep Menon', 'House No. 8, Malappuram', '2023-08-19'),
(9, 'Aswathy Soman', 'House No. 9, Palakkad', '2023-09-27'),
(10, 'Vijay Kumar', 'House No. 10, Wayanad', '2023-10-15');
ALTER TABLE CUSTOMER CHANGE COLUMN Customer_Adress Customer_Address varchar(100);



CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(255),
    Publisher VARCHAR(255)
);

INSERT INTO BOOKS VALUES
('BK1', 'The Alchemist', 'Fiction', 10.99, 'yes', 'Paulo Coelho', 'HarperCollins'),
('BK2', 'The Da Vinci Code', 'Mystery', 12.99, 'yes', 'Dan Brown', 'Doubleday'),
('BK3', 'The Hunger Games', 'Young Adult', 9.99, 'no', 'Suzanne Collins', 'Scholastic Press'),
('BK4', 'The Girl with the Dragon Tattoo', 'Mystery', 11.50, 'yes', 'Stieg Larsson', 'Knopf'),
('BK5', 'Gone Girl', 'Thriller', 13.25, 'no', 'Gillian Flynn', 'Crown Publishing'),
('BK6', 'The Fault in Our Stars', 'Young Adult', 10.75, 'yes', 'John Green', 'Dutton Books'),
('BK7', 'The Help', 'Historical Fiction', 11.99, 'yes', 'Kathryn Stockett', 'Penguin Books'),
('BK8', 'The Maze Runner', 'Young Adult', 9.75, 'no', 'James Dashner', 'Delacorte Press'),
('BK9', 'The Shining', 'Horror', 10.50, 'yes', 'Stephen King', 'Doubleday'),
('BK10', 'The Lord of the Rings', 'Fantasy', 14.99, 'yes', 'J.R.R. Tolkien', 'Houghton Mifflin');


Create table IssueStatus(
Issue_Id int primary key,
Issued_cust int,
Issued_book_name varchar(30),
Issue_date date,
Isbn_book varchar(20),
foreign key(issued_cust) references customer(customer_Id) on delete cascade,
foreign key(isbn_book) references Books(ISBN) on delete cascade
);

CREATE INDEX idx_customer_id ON CUSTOMER(customer_id);
CREATE INDEX idx_isbn ON BOOKS(isbn);

insert into Issuestatus values
(101, 1, 'The Alchemist', '2023-01-10', 'BK1'),
(102, 2, 'The Da Vinci Code', '2023-02-15', 'BK2'),
(103, 3, 'The Hunger Games', '2023-03-12', 'BK3'),
(104, 4,'The Girl with the Dragon Tattoo','2023-04-18','BK4'),
(105, 5, 'Gone Girl', '2023-05-22', 'BK5'),
(106, 2, 'The Fault in Our Stars', '2023-06-25', 'BK6'),
(107, 1, 'The Help', '2023-07-30', 'BK7'),
(108, 2, 'The Maze Runner', '2023-08-19', 'BK8'),
(109, 1, 'The Shining', '2023-09-27', 'BK9'),
(110, 2, 'The Lord of the Rings', '2023-10-15', 'BK10');
ALTER TABLE ISSUESTATUS CHANGE COLUMN Issue_Id Issue_Id VARCHAR(20);
ALTER TABLE ISSUESTATUS CHANGE COLUMN Issued_book_name Issued_book_name varchar(60);


SET SQL_SAFE_UPDATES=0;
UPDATE Issuestatus 
set Issued_Cust = 3 
where issue_id = 103;

UPDATE Issuestatus 
set Issued_Cust = 4 
where issue_id = 104;

UPDATE Issuestatus 
set Issued_Cust = 5
where issue_id = 105;

UPDATE Issuestatus 
set Issued_Cust = 6
where issue_id = 106;

UPDATE Issuestatus 
set Issued_Cust = 7 
where issue_id = 107;

SELECT * FROM Issuestatus;


CREATE TABLE ReturnStatus
(Return_Id INT PRIMARY KEY,
Return_Cust varchar(60),
Return_book_name varchar(100),
Return_date DATE,
Isbn_book2 varchar(30),
FOREIGN KEY (Isbn_book2) references BOOKS(ISBN) on delete cascade
);

INSERT INTO ReturnStatus values
(1001,'Anjali Nair','The Alchemist','2023-04-10','BK1'),
(1002,'Vishnu Menon','The Da Vinci Code','2023-05-15','BK2'),
(1003,'Divya Pillai','The Hunger Games','2023-06-12','BK3');

#Write the queries for the following:
#1. Retrieve the book title, category, and rental price of all available
#books.
SELECT Book_Title,Category,Rental_price FROM Books WHERE STATUS = 'YES';
#2. List the employee names and their respective salaries in descending
#order of salary.
SELECT Emp_name, salary from employee order by salary DESC;
#3. Retrieve the book titles and the corresponding customers who have
#issued those books.
SELECT Issued_book_name, Issued_cust from Issuestatus;
#4. Display the total count of books in each category.
SELECT Category, COUNT(*) FROM Books GROUP BY Category; 
#5) Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name,Position,Salary FROM Employee WHERE Salary > 50000;
#6) List the customer names who registered before 2022-01-01 and have not issued any books yet.
select customer_name from customer where Reg_date<"2022-01-01" and customer_id not in (select issued_cust from issuestatus);
#7 Display the branch numbers and the total count of employees in each branch
select b.branch_no,count(e.emp_id) as total_employees from branch b left join 
employee e on b.branch_no=e.branch_no group by b.branch_no;

#8 Display the names of customers who have issued books in the month of June 2023.

select customer_name from customer where month(Reg_date)=6;

#9  Retrieve book_title from book table containing history. 

select book_title from books where book_title like "%history%" ;

#10 Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.

SELECT Branch_no, COUNT(Emp_Id) AS Employee_Count FROM Employee GROUP BY Branch_no HAVING COUNT(Emp_Id) >5;


