create database Schoole;

create table Teachers 
(
ID int primary Key,
Name varchar(255) not null,
Email varchar(255) unique
);

create table Students
(
ID int primary Key,
Name varchar(255) not null,
GPA decimal not null,
Email varchar(255) unique
);

create table Courses 
(
ID int primary Key,
Name varchar(255) not null,
Description varchar(255),
TeacherID int,
Foreign key (TeacherID) references Teachers(ID)
);

create table TeacherDetails
(
ID int primary key,
Address varchar(255),
Salary decimal not null,
Phone varchar(255),
TeacherID int unique
Foreign key (TeacherID) references Teachers(ID),
);

create table StudentCourse
(
StudentID int,
CourseID int,
primary key (StudentID, CourseID),
Foreign key (StudentID) references Students(ID),
Foreign key (CourseID) references Courses(ID)
);

insert into Teachers values
(1, 'Ayman', 'ayman@gmail.com'),
(2, 'Batool', 'batool@gmail.com'),
(3, 'Mohammad', 'mohammad@gmail.com'),
(4, 'Salam', 'salam@gmail.com'),
(5, 'Amer', 'amer@gmail.com');

insert into Students values 
(1,'Rahaf', 95.6, 'rahaf@gmail.com'),
(2,'Sura', 95.6, 'sura@gmail.com'),
(3,'Rudaina', 95.6, 'rudaina@gmail.com'),
(4,'Sara', 95.6, 'sara@gmail.com'),
(5,'Hala', 95.6, 'hala@gmail.com');

insert into Courses values
(1, 'HTML', 'Intro to HTML',1),
(2, 'CSS', 'Intro to CSS',1),
(3, 'JS', 'Intro to JS',1),
(4, 'C#', 'Intro to C#',2),
(5, 'Soft Skills', 'Presentation Skills',5);

insert into TeacherDetails values 
(1, 'Irbid', 800, '0789990001',1),
(2, 'Amman', 800, '0785670032',2),
(3, 'Amman', 800, '0788737021',3),
(4, 'Irbid', 800, '0784533992',4),
(5, 'Irbid', 800, '0793672800',5);

insert into StudentCourse values 
(1,2),
(1,3),
(2,4),
(5,2),
(5,5);