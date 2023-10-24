USE Academy
GO
--2. Кафедри (Departments)
--? Ідентифікатор (Id). Унікальний ідентифікатор кафедри.
--? Тип даних — int.
--? Авто збільшення.
--? Не може містити null-значення.
--? Первинний ключ.
--? Фінансування (Financing). Фонд фінансування кафедри.
--? Тип даних — money.
--? Не може містити null-значення.
--? Не може бути менше ніж 0.
--? Значення за замовчуванням — 0.
--? Назва (Name). Назва кафедри.
--? Тип даних — nvarchar(100).
--? Не може містити null-значення.
--? Не може бути порожнім.
--? Має бути унікальним.
--? Ідентифікатор факультету (FacultyId). Факультет, до
--складу якого належить кафедра.
--? Тип даних — int.
--? Не може містити null-значення.
--? Зовнішній ключ.

CREATE TABLE Departments(
id int identity(1,1) NOT NULL primary key,
Name nvarchar(100) NOT NULL default ('---') unique,
Financing money NOT NULL default(0) CHECK(Financing >= 0),
FacultyId int NOT NULL FOREIGN KEY REFERENCES Faculties(id)
)
GO
INSERT INTO Departments VALUES ('Mathematical', 45500, 7)
INSERT INTO Departments VALUES ('Physics', 21600, 1)
INSERT INTO Departments VALUES ('Software Development', 48300, 6)
INSERT INTO Departments VALUES ('Economy', 39000, 2)
INSERT INTO Departments VALUES ('Architecture', 28950, 5)
INSERT INTO Departments VALUES ('Psychology', 29900, 4)
INSERT INTO Departments VALUES ('Ecology', 11000, 3)
GO
SELECT * FROM Departments
GO
--3. Факультети (Faculties)
--? Ідентифікатор (Id). Унікальний ідентифікатор факультету.
--? Тип даних — int.
--? Авто збільшення.
--? Не може містити null-значення.
--? Первинний ключ.
--? Фінансування (Financing). Фонд фінансування факультету.
--? Тип даних — money.
--? Не може містити null-значення.
--? Не може бути менше ніж 0.
--? Значення за замовчуванням — 0.
--? Назва (Name). Назва факультету.
--? Тип даних — nvarchar(100).
--? Не може містити null-значення.
--? Не може бути порожнім.
--? Має бути унікальним.
CREATE TABLE Faculties
(
id int primary key identity(1, 1) not null,
Name nvarchar(100) not null default('---') unique,
Financing money NOT NULL default(0)CHECK(Financing >= 0),
)
GO 
INSERT INTO Faculties VALUES ('Technological', 21100)
INSERT INTO Faculties VALUES ('Economic', 34100)
INSERT INTO Faculties VALUES ('Energy', 29100)
INSERT INTO Faculties VALUES ('Psychology', 27700)
INSERT INTO Faculties VALUES ('Architecture', 33500)
INSERT INTO Faculties VALUES ('Computer Science', 38200)
INSERT INTO Faculties VALUES ('Mathematicians', 42000)
GO
SELECT * FROM Faculties
GO
--4. Групи (Groups)
--? Ідентифікатор (Id). Унікальний ідентифікатор групи.
--? Тип даних — int.
--? Авто збільшення.
--? Не може містити null-значення.
--? Первинний ключ.
--? Назва (Name). Назва групи.
--? Тип даних — nvarchar(10).
--? Не може містити null-значення.
--? Не може бути порожнім.
--? Має бути унікальним.
--? Курс (Year). Курс (рік) на якому навчається група.
--? Тип даних — int.
--? Не може містити null-значення.
--? Має бути в діапазоні від 1 до 5.
--? Ідентифікатор кафедри (DepartmentId). Кафедра, до
--складу якої належить група.
--? Тип даних — int.
--? Не може містити null-значення.
--? Зовнішній ключ.

CREATE TABLE Groups
(
id int primary key identity(1, 1) not null,
Name nvarchar(10) not null default('---') unique,
Year int not null check(Year >= 1 and Year <= 5),
DepartmentId int NOT NULL FOREIGN KEY REFERENCES Departments(id)
)
GO
INSERT INTO Groups VALUES ('A101', 3, 6)
INSERT INTO Groups VALUES ('B103', 4, 2)
INSERT INTO Groups VALUES ('P107', 3, 3)
INSERT INTO Groups VALUES ('C109', 2, 1)
INSERT INTO Groups VALUES ('E105', 3, 4)
INSERT INTO Groups VALUES ('K102', 4, 5)
INSERT INTO Groups VALUES ('D106', 4, 7)
GO
SELECT * FROM Groups
GO
UPDATE Groups SET DepartmentId = 3 WHERE id = 5
UPDATE Groups SET DepartmentId = 4 WHERE id = 3
GO
ALTER TABLE Groups ADD CHECK (Year > 0 AND Year < 6)
GO
UPDATE Groups SET Year = 5 WHERE id = 5 and id = 7
GO
--9. Викладачі (Teachers)
--? Ідентифікатор (Id). Унікальний ідентифікатор викладача.
--? Тип даних — int.
--? Авто збільшення.
--? Не може містити null-значення.
--? Первинний ключ.
--? Ім’я (Name). Ім’я викладача.
--? Тип даних — nvarchar(max).
--? Не може містити null-значення.
--? Не може бути порожнім.
--? Ставка (Salary). Ставка викладача.
--? Тип даних — money.
--? Не може містити null-значення.
--? Не може бути менше або рівним 0.
--? Прізвище (Surname). Прізвище викладача.
--? Тип даних — nvarchar(max).
--? Не може містити null-значення.
--? Не може бути порожнім.
CREATE TABLE Teachers
(
id int primary key identity(1,1) not null,
Name nvarchar(max) not null default('---'),
Surname nvarchar(max) not null default('---'),
Salary money not null CHECK(Salary > 0 and Salary != 0)
)
GO
INSERT INTO Teachers VALUES('Andriy', 'Litovkin', 1850)
INSERT INTO Teachers VALUES('Vadim', 'Ponomarenko', 1690)
INSERT INTO Teachers VALUES('Olena', 'Korotka', 1030)
INSERT INTO Teachers VALUES('Valery', 'Loskutova', 1650)
INSERT INTO Teachers VALUES('Valery', 'Rovny', 1045)
INSERT INTO Teachers VALUES('Andrii', 'Goryanoi', 1560)
INSERT INTO Teachers VALUES('Konstantin', 'Naumenko', 1145)
GO
SELECT * FROM Teachers
GO
--1. Куратори (Curators)
--? Ідентифікатор (Id). Унікальний ідентифікатор куратора.
--? Тип даних — int.
--? Авто збільшення.
--? Не може містити null-значення.
--? Первинний ключ.
--? Ім’я (Name). Ім’я куратора
--? Тип даних — nvarchar(max).
--? Не може містити null-значення.
--? Не може бути порожнім.
--? Прізвище (Surname). Прізвище куратора
--? Тип даних — nvarchar(max).
--? Не може містити null-значення.
--? Не може бути порожнім.
CREATE TABLE Curators
(
id int identity(1,1) not null primary key,
Name nvarchar(max) not null default('---'),
Surname nvarchar(max) not null default('---')
)
GO
INSERT INTO Curators VALUES('Oleksandr', 'Savchenko')
INSERT INTO Curators VALUES('Svitlana', 'Myshkovets')
INSERT INTO Curators VALUES('Ihor', 'Nikityuk')
INSERT INTO Curators VALUES('Valentyna', 'Maksymchuk')
INSERT INTO Curators VALUES('Serhiy', 'Kosharuk')
INSERT INTO Curators VALUES('Oleksandr', 'Tkachuk')
INSERT INTO Curators VALUES('Dmytro', 'Galushko')
GO
SELECT * FROM Curators
GO
--5. Групи та куратори (GroupsCurators)
--? Ідентифікатор (Id). Унікальний ідентифікатор групи та куратора.
--? Тип даних — int.
--? Авто збільшення.
--? Не може містити null-значення.
--? Первинний ключ.
--? Ідентифікатор куратора (CuratorId). Куратор.
--? Тип даних — int.
--? Не може містити null-значення.
--? Зовнішній ключ.
--? Ідентифікатор групи (GroupId). Група.
--? Тип даних — int.
--? Не може містити null-значення.
--? Зовнішній ключ.
CREATE TABLE GroupsCurators
(
id int identity(1,1) not null primary key,
CuratorId int not null FOREIGN KEY REFERENCES Curators(id),
GroupId int not null FOREIGN KEY REFERENCES Groups(id)
)
GO
INSERT INTO GroupsCurators VALUES(1, 5)
INSERT INTO GroupsCurators VALUES(2, 3)
INSERT INTO GroupsCurators VALUES(3, 7)
INSERT INTO GroupsCurators VALUES(4, 1)
INSERT INTO GroupsCurators VALUES(5, 2)
INSERT INTO GroupsCurators VALUES(6, 4)
INSERT INTO GroupsCurators VALUES(7, 6)
GO
SELECT * FROM GroupsCurators
GO
--6. Групи та лекції (GroupsLectures)
--? Ідентифікатор (Id). Унікальний ідентифікатор групи та лекції.
--? Тип даних — int.
--? Авто збільшення.
--? Не може містити null-значення.
--? Первинний ключ.
--? Ідентифікатор групи (GroupId). Група.
--? Тип даних — int.
--? Не може містити null-значення.
--? Зовнішній ключ.
--? Ідентифікатор лекції (LectureId). Лекція.
--? Тип даних — int.
--? Не може містити null-значення.
--? Зовнішній ключ.
CREATE TABLE GroupsLectures
(
id int identity(1,1) not null primary key,
GroupId int not null FOREIGN KEY REFERENCES Groups(id),
LectureId int not null FOREIGN KEY REFERENCES Lectures(id)
)
GO
INSERT INTO GroupsLectures VALUES(1, 7)
INSERT INTO GroupsLectures VALUES(2, 4)
INSERT INTO GroupsLectures VALUES(3, 5)
INSERT INTO GroupsLectures VALUES(4, 6)
INSERT INTO GroupsLectures VALUES(5, 1)
INSERT INTO GroupsLectures VALUES(6, 3)
INSERT INTO GroupsLectures VALUES(7, 2)
GO
SELECT * FROM GroupsLectures
GO
--7. Лекції (Lectures)
--? Ідентифікатор (Id). Унікальний ідентифікатор лекції.
--? Тип даних — int.
--? Авто збільшення.
--? Не може містити null-значення.
--? Первинний ключ.
--? Аудиторія (LectureRoom). Аудиторія, в якій читається лекція.
--? Тип даних — nvarchar(max).
--? Не може містити null-значення.
--? Не може бути порожнім.
--? Ідентифікатор дисципліни (SubjectId). Дисципліна, по якій читається лекція.
--? Тип даних — int.
--? Не може містити null-значення.
--? Зовнішній ключ.
--? Ідентифікатор викладача (TeacherId). Викладач, який читає лекцію.
--? Тип даних — int.
--? Не може містити null-значення.
--? Зовнішній ключ.
CREATE TABLE Lectures
(
id int identity(1,1) not null primary key,
LectureRoom nvarchar(max) not null default('---'),
SubjectId int not null FOREIGN KEY REFERENCES Subjects(id),
TeacherId int not null FOREIGN KEY REFERENCES Teachers(id)
)
GO
INSERT INTO Lectures VALUES(105, 1, 3)
INSERT INTO Lectures VALUES(108, 2, 5)
INSERT INTO Lectures VALUES(103, 3, 2)
INSERT INTO Lectures VALUES(107, 4, 1)
INSERT INTO Lectures VALUES(102, 5, 4)
INSERT INTO Lectures VALUES(101, 6, 7)
INSERT INTO Lectures VALUES(106, 7, 6)
GO
SELECT * FROM Lectures
GO
GO
UPDATE Lectures SET LectureRoom = 'A105' WHERE id = 1
UPDATE Lectures SET LectureRoom = 'C108' WHERE id = 2
UPDATE Lectures SET LectureRoom = 'B103' WHERE id = 3
UPDATE Lectures SET LectureRoom = 'D107' WHERE id = 4
UPDATE Lectures SET LectureRoom = 'G102' WHERE id = 5
UPDATE Lectures SET LectureRoom = 'F101' WHERE id = 6
UPDATE Lectures SET LectureRoom = 'K106' WHERE id = 7
GO
--8. Дисципліни (Subjects)
--? Ідентифікатор (Id). Унікальний ідентифікатор дисципліни.
--? Тип даних — int.
--? Авто збільшення.
--? Не може містити null-значення.
--? Первинний ключ.
--? Назва (Name). Назва дисципліни.
--? Тип даних — nvarchar(100).
--? Не може містити null-значення.
--? Не може бути порожнім.
--? Має бути унікальним.
CREATE TABLE Subjects
(
id int identity(1,1) not null primary key,
Name nvarchar(100) not null default('---') unique
)
GO
INSERT INTO Subjects (Name) VALUES('Database Theory')
INSERT INTO Subjects (Name) VALUES('Programming')
INSERT INTO Subjects (Name) VALUES('Maths')
INSERT INTO Subjects (Name) VALUES('Physics')
INSERT INTO Subjects (Name) VALUES('Foreign Language')
INSERT INTO Subjects (Name) VALUES('Historical')
INSERT INTO Subjects (Name) VALUES('Economy')
GO
SELECT * FROM Subjects
GO
--1. Вивести всі можливі пари рядків викладачів та груп.
SELECT Groups.Name as Grup, CONCAT(Teachers.Name, Teachers.Surname) as Teacher 
FROM Groups, Teachers	
GO
--2. Вивести назви факультетів, фонд фінансування кафедр
--яких перевищує фонд фінансування факультету.
SELECT Faculties.Name as Facultet, Faculties.Financing as Financing 
FROM Faculties, Departments WHERE Faculties.Financing < Departments.Financing 
and Faculties.id = Departments.FacultyId
GO
--3. Вивести прізвища кураторів груп та назви груп, які вони курирують.
SELECT Curators.Surname as Curator, Groups.Name as Groups
FROM Curators, Groups, GroupsCurators WHERE Curators.id = GroupsCurators.CuratorId and
Groups.id = GroupsCurators.GroupId
GO
--4. Вивести імена та прізвища викладачів, які читають лекції
--у групі “P107”.
SELECT CONCAT(Teachers.Name, ' ', Teachers.Surname) as Teacher,
Groups.Name as Groups FROM Teachers, Lectures, Groups, GroupsLectures 
WHERE Groups.id = GroupsLectures.GroupId and 
Lectures.id = GroupsLectures.LectureId and Teachers.id = Lectures.TeacherId
and Groups.Name = 'P107'
GO
--5. Вивести прізвища викладачів та назви факультетів, на яких
--вони читають лекції.
SELECT Teachers.Surname as Teacher, Faculties.Name as Faculties
FROM Teachers, Faculties, Lectures, GroupsLectures, Groups, Departments
WHERE Teachers.id = Lectures.TeacherId and Lectures.id = GroupsLectures.LectureId
and Groups.id = GroupsLectures.GroupId and Departments.id = Groups.DepartmentId 
and Faculties.id = Departments.FacultyId
GO
--6. Вивести назви кафедр та назви груп, які до них належать.
SELECT Departments.Name as Department, Groups.Name as Groups
FROM Departments, Groups WHERE Departments.id = Groups.DepartmentId
GO
--7. Вивести назви дисциплін, які читає викладач “Samantha Adams”.
SELECT CONCAT(Teachers.Name,' ', Teachers.Surname) as Teacher, 
Subjects.Name as Subject FROM Teachers, Subjects, Lectures
WHERE Teachers.Name = 'Samantha' and Teachers.Surname = 'Adams' and 
Teachers.id = Lectures.TeacherId and Subjects.id = Lectures.SubjectId
GO
--8. Вивести назви кафедр, де читається дисципліна “Database Theory”.
SELECT Departments.Name as Department, Subjects.Name as Subject
FROM Departments, Subjects, Lectures, GroupsLectures, Groups
WHERE Subjects.Name = 'Database Theory' and Subjects.id = Lectures.SubjectId
and Lectures.id = GroupsLectures.LectureId and GroupsLectures.GroupId = Groups.id
and Departments.id = Groups.DepartmentId
GO
--9. Вивести назви груп, що належать до факультету Computer Science.
SELECT Groups.Name as Groups, Faculties.Name as Faculty 
FROM Groups, Faculties, Departments WHERE Faculties.Name = 'Computer Science' 
and Faculties.id = Departments.FacultyId and Departments.id = Groups.DepartmentId
GO
--10. Вивести назви груп 5-го курсу, а також назву факультетів,
--до яких вони належать.
SELECT Groups.Name as Groups, Faculties.Name as Faculty 
FROM Groups, Faculties, Departments WHERE Groups.Year = 5
and Faculties.id = Departments.FacultyId and Departments.id = Groups.DepartmentId
GO
--11. Вивести повні імена викладачів та лекції, які вони читають 
--(назви дисциплін та груп), причому відібрати лише ті
--лекції, що читаються в аудиторії “B103”.
SELECT CONCAT(Teachers.Name,' ', Teachers.Surname) as Teacher,
Subjects.Name as Subject,Groups.Name as Groups, Lectures.LectureRoom
FROM Teachers, Lectures, Groups, Subjects, GroupsLectures
WHERE Lectures.LectureRoom = 'B103' and Teachers.id = Lectures.TeacherId 
and Subjects.id = Lectures.SubjectId and Lectures.id = GroupsLectures.LectureId
and Groups.id = GroupsLectures.GroupId
GO