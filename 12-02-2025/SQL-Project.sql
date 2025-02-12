create table Categories
(
ID int primary key identity(1,1),
Name nvarchar(255) not null,
Description nvarchar(255) not null
);

create table Books 
(
ID int primary key identity(1,1),
Title nvarchar(255) not null,
Author nvarchar(255) not null,
Genre nvarchar(255) not null,
PublicationYear date not null,
AvailabilityStatus nvarchar(50) not null,
CategoryID int,
Foreign key (CategoryID) references Categories(ID)
);

create table Members
(
ID int primary key identity(1,1),
Name nvarchar(255) not null, 
ContactInfo nvarchar(255) not null,
MemberShipType nvarchar(50) not null,
RegistrationDate date not null
);

create table Borrowing
(
ID int primary key identity(1,1),
MemberID int,
BookID int,
BorrowingDate date not null,
DueDate date not null,
ReturnDate date,
Foreign key (MemberID) references Members(ID),
Foreign key (BookID) references Books(ID)
);

create table Reservations
(
ID int primary key identity(1,1),
MemberID int,
BookID int,
ReservationDate date not null,
Status nvarchar(50) not null,
Foreign key (MemberID) references Members(ID),
Foreign key (BookID) references Books(ID)
);

create table LibraryStaff
(
ID int primary key identity(1,1),
Name nvarchar(255) not null,
ContactInfo nvarchar(255) not null,
AssignedSection nvarchar(255) not null,
EmploymentDate date not null
);

create table FinancialFines 
(
ID int primary key identity(1,1),
MemberID int,
Amount decimal not null,
Status nvarchar(50) not null,
Foreign key (MemberID) references Members(ID),
);

--Insert 

insert into Categories values 
('Classic','Classic Description'),
('Dystopian','Dystopian Description'),
('Romance','Romance Description'),
('Adventure','Adventure Description'),
('History','History Description');

insert into Books (title, author, genre, publicationyear, availabilitystatus, categoryid) values
('To Kill a Mockingbird', 'Harper Lee', 'Classic', '1960-07-11', 'Available', 1),
('1984', 'George Orwell', 'Dystopian', '1949-06-08', 'Checked Out', 2),
('Pride and Prejudice', 'Jane Austen', 'Romance', '1813-01-28', 'Available', 3),
('The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', '1925-04-10', 'Available', 1),
('Moby Dick', 'Herman Melville', 'Adventure', '1851-10-18', 'Reserved', 4),
('Database Fundamentals', 'Ayman Aljaradat', 'Programming', '1851-10-18', 'Reserved', 4);


insert into Members (Name,ContactInfo,MemberShipType,RegistrationDate) values 
('Rahaf Alsmairat', '0786264841', 'VIP', '2025-01-01'),
('Sara Harahsheh', '0783541762', 'Basic', '2024-02-15'),
('Rudaina Alyaseen', '0781114456', 'Basic', '2024-11-22'),
('Sura Hailat', '0789983761', 'VIP', '2025-02-05'),
('Hala Hamad', '0797776351', 'Yearly', '2025-01-30');

INSERT INTO Borrowing (MemberID, BookID, BorrowingDate, DueDate, ReturnDate) VALUES
(7, 2, '2025-02-01', '2025-02-15', NULL),
(8, 3, '2025-01-20', '2025-02-03', '2025-02-01'),
(9, 1, '2025-02-05', '2025-02-19', NULL),
(10, 4, '2025-02-10', '2025-02-24', NULL),
(11, 5, '2025-01-25', '2025-02-08', '2025-02-07');

INSERT INTO Reservations (MemberID, BookID, ReservationDate, Status) VALUES
(7, 5, '2025-02-02', 'Pending'),
(8, 4, '2025-02-03', 'Completed'),
(9, 2, '2025-01-29', 'Pending'),
(10, 3, '2025-02-04', 'Completed'),
(11, 1, '2025-01-30', 'Canceled');

INSERT INTO LibraryStaff (Name, ContactInfo, AssignedSection, EmploymentDate) VALUES
('Ali Ahmad', '0776543210', 'Fiction', '2019-05-10'),
('Lina Mohammad', '0798765432', 'Reference', '2020-08-22'),
('Omar Khalid', '0781234567', 'Children', '2018-11-30'),
('Nour Hasan', '0791112223', 'Research', '2022-01-15'),
('Ahmad Saeed', '0789998887', 'Administration', '2017-07-05');

INSERT INTO FinancialFines (MemberID, Amount, Status) VALUES
(7, 10.50, 'Paid'),
(8, 3.25, 'Paid'),
(9, 15.00, 'Unpaid');

--Questions
select * from Members where RegistrationDate = '01-01-2025';

select * from Books where Title = 'Database Fundamentals';

alter table Members add Email varchar(255);

insert into Members values 
('Omar', '9876543210', 'Student', '05-06-2024', 'omar@gmail.com');

select *
from Members
join Reservations on Members.ID = Reservations.MemberID;

select *
from Members
join Borrowing on Members.ID = Borrowing.MemberID
join Books on Books.ID = Borrowing.BookID
where Books.Title = 'The Great Gatsby';

select *
from Members
join Reservations on Members.ID = Reservations.MemberID
join Books on Books.ID = Reservations.BookID
where Books.Title = 'Pride and Prejudice' and Reservations.Status='Completed';

INSERT INTO Borrowing (MemberID, BookID, BorrowingDate, DueDate, ReturnDate) VALUES
(7, 2, '2025-02-01', '2025-02-15', '2025-03-15');

select *
from Members
join Borrowing on Members.ID = Borrowing.MemberID
where Borrowing.ReturnDate > Borrowing.DueDate;

select * from Borrowing;

select Title, count(Borrowing.BookID) as BorrowingTimes
from Books
join Borrowing on Books.ID = Borrowing.BookID
group by Title
having count(Borrowing.BookID)>3;

select * 
from Members
join Borrowing on Members.ID = Borrowing.MemberID
where Borrowing.BorrowingDate between '01-01-2024' and '10-01-2024';

select Count(*)
from Books
where Books.AvailabilityStatus = 'Available';

select * 
from Members
join Borrowing on Borrowing.MemberID = Members.ID
where Borrowing.ReturnDate = Null;

