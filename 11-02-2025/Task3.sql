--Create
create table Students (
    ID int primary key identity(1,1),
    Name nvarchar(255) not null,
    BirthDate date not null,
    Address nvarchar(255),
    Email nvarchar(255) unique
);

create table familyInfo (
    ID int primary key identity(1,1),
    studentID int unique,
    fatherName nvarchar(255),
    PhoneNumber nvarchar(50),
    foreign key (studentID) references Students(ID)
);

create table Courses (
    ID int primary key identity(1,1),
    Name nvarchar(255) not null,
    Description nvarchar(255),
    Resource nvarchar(255)
);

create table Classes (
    ID int primary key identity(1,1),
    Code nvarchar(50),
    RoomNumber nvarchar(50),
    Schedule nvarchar(255)
);

create table Assignments (
    ID int primary key identity(1,1),
    StudentID int,
    name nvarchar(255) not null,
    Description nvarchar(255),
    Deadline date,
    States nvarchar(10) check (States in ('pass', 'failed')),
    foreign key (StudentID) references Students(ID)
);

CREATE TABLE Attendance (
    ID int primary key identity(1,1),
    StudentID INT,
    AttendanceDate date not null,
    Type nvarchar(50) check (Type in ('leaving', 'absence', 'late')),
    Reason nvarchar(255),
    foreign key (StudentID) references Students(ID)
);

create table Enrollments (
    ID int primary key identity(1,1),
    StudentID int,
    CourseID int,
    foreign key (StudentID) references Students(ID),
    foreign key (CourseID) references Courses(ID)
);

--Insert
insert into students (Name, BirthDate, Address, Email) values
('Rahaf', '1998-12-09', 'Irbid', 'rahaf@gmail.com'),
('Sara', '1999-01-01', 'Irbid', 'sara@gamil.com'),
('Rudaina', '2001-02-15', 'Irbid', 'rudaina@gmail.com'),
('Sura', '2000-09-05', 'Irbid', 'sura@gmail.com'),
('Hala', '2001-10-05', 'Irbid', 'hala@gmail.com');

insert into familyInfo (studentID, fatherName, PhoneNumber) values
(1, 'Jamal', '0788612628'),
(2, 'Yousef', '0782345678'),
(3, 'Abdallah', '0796358291'),
(4, 'Hani', '0797351834'),
(5, 'Mohammad', '0786475532');

insert into Courses (Name, Description, Resource) values
('Math', 'Math Description', 'math/'),
('Science', 'Science Description', 'science/'),
('English', 'English Description', 'english/'),
('History', 'History Description', 'history/'),
('Programming', 'Programming Description', 'programming/');

insert into Classes (Code, RoomNumber, Schedule) values
('1001', 'NB4', 'Monday,10:00am'),
('1002', 'SA1', 'Tuesday,11:00am'),
('1003', 'SA3', 'Wednesday,9:00am'),
('1004', 'NF5', 'Thursday,1:00am'),
('1005', 'SF4', 'Sunday,3:00pm');

insert into Assignments (StudentID, name, Description, Deadline, States) values
(1, 'Math Assignment', 'Math Description', '2025-02-13', 'pass'),
(2, 'Science Assignment', 'Science Description', '2025-02-14', 'failed'),
(3, 'English Assignment', 'English Description', '2025-02-15', 'pass'),
(4, 'History Assignment', 'History Description', '2025-02-16', 'failed'),
(5, 'Programming Assignment', 'Programming Description', '2025-02-25', 'pass');

insert into Attendance (StudentID, AttendanceDate, Type, Reason) values
(1, '2025-01-01', 'leaving', 'Doctor appointment'),
(2, '2025-01-03', 'absence', 'Sick leave'),
(3, '2025-01-04', 'late', 'Traffic'),
(4, '2025-01-05', 'leaving', 'Doctor appointment'),
(5, '2025-01-06', 'absence', 'Sick leave');

insert into enrollments (StudentID, CourseID) values
(1, 1), 
(2, 2), 
(3, 3), 
(4, 4), 
(5, 5);

--Select

select * from Students where BirthDate = '1999-01-01';

select * from Courses where Name = 'Math';

--alter table Students add Email nvarchar(255) unique;

--insert into Students (Name, BirthDate, Address, Email) 
--values ('Habib', '2002-05-20', 'Amman', 'habib@gmail.com');

select * 
from Students
join familyInfo on Students.ID = familyInfo.studentID;

select * 
from Students
join Enrollments on Students.ID = Enrollments.StudentID
join Courses on Enrollments.CourseID = Courses.ID
where Courses.Name = 'Math';

select *
from Students
join Assignments on Students.ID = Assignments.StudentID
where Assignments.Name = 'Programming Assignment' and Assignments.States = 'pass';

select * 
from Students
join Attendance on Students.ID = Attendance.StudentID
where Attendance.Type = 'leaving' and Attendance.AttendanceDate between '2025-01-01' and '2025-01-05';
