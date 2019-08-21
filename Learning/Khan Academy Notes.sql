


Create Database IntroToSQL
Create Table groceries
(
    ID Integer Primary Key,
    Name Text,
    Quantity Integer
)

Insert Into Groceries
Values
    (1, 'Bananas', 4);
Insert Into Groceries
Values
    (2, 'Peanut Butter', 1);
Insert Into Groceries
Values
    (3, 'Dark chocolate bars', 2);

Alter Table Groceries Add aisle Integer

Update dbo.groceries
Set aisle = 7
Where id = 1
Update dbo.groceries
Set aisle = 2
Where id = 2
Update dbo.groceries
Set aisle = 2
Where id = 3

Insert Into Groceries
Values
    (4, 'Ice cream', 1, 12);
Insert Into Groceries
Values
    (5, 'Cherries', 6, 2);
Insert Into Groceries
Values
    (6, 'Chocolate syrup', 1, 4);

Select *
From Groceries
Where aisle > 5
Order by aisle;

Select aisle, SUM(quantity)
From groceries
Group By aisle;
--Select * From Groceries



Create Table exercise_logs
(
    id Integer Identity(1,1) Primary Key,
    type Text,
    minutes Integer,
    Calories Integer,
    heart_rate Integer
);
Insert Into exercise_logs
    (type, minutes, calories, heart_rate)
Values
    ('biking', 30, 100, 110);
Insert Into exercise_logs
    (type, minutes, calories, heart_rate)
Values
    ('biking', 10, 30, 105);
Insert Into exercise_logs
    (type, minutes, calories, heart_rate)
Values
    ('dancing', 15, 200, 120);

Select *
From exercise_logs
Where calories > 50 and minutes < 30
Order by Calories

Create Table drs_favorites
(
    id Integer Identity(1,1) Primary Key,
    type Text,
    reason Text
);

Insert Into drs_favorites
    (type, reason)
Values
    ('biking', 'Improves endurance and flexibility.');
Insert Into drs_favorites
    (type, reason)
Values
    ('hiking', 'Increases cardiovascular health.');
Insert Into drs_favorites
    (type, reason)
Values
    ('Skateboarding', 'improves endurance and flexibility.');

SELECT title
FROM songs
WHERE artist IN (
SELECT name
FROM artists
WHERE genre = 'Pop');




CREATE TABLE exercise_logs
(
    id INTEGER Identity(1,1) PRIMARY KEY,
    ExerciseType TEXT,
    minutes INTEGER,
    calories INTEGER,
    heart_rate INTEGER
);

INSERT INTO exercise_logs
    (ExerciseType, minutes, calories, heart_rate)
VALUES
    ('biking', 30, 115, 110);
INSERT INTO exercise_logs
    (ExerciseType, minutes, calories, heart_rate)
VALUES
    ('biking', 10, 45, 105);
INSERT INTO exercise_logs
    (ExerciseType, minutes, calories, heart_rate)
VALUES
    ('dancing', 15, 200, 120);
INSERT INTO exercise_logs
    (ExerciseType, minutes, calories, heart_rate)
VALUES
    ('dancing', 15, 165, 120);
INSERT INTO exercise_logs
    (ExerciseType, minutes, calories, heart_rate)
VALUES
    ('tree climbing', 30, 70, 90);
INSERT INTO exercise_logs
    (ExerciseType, minutes, calories, heart_rate)
VALUES
    ('tree climbing', 25, 72, 80);
INSERT INTO exercise_logs
    (ExerciseType, minutes, calories, heart_rate)
VALUES
    ('rowing', 30, 70, 90);
INSERT INTO exercise_logs
    (ExerciseType, minutes, calories, heart_rate)
VALUES
    ('hiking', 60, 80, 85);

SELECT CAST(ExerciseType AS VARCHAR(100)) ExerciseType,
    SUM(Calories) AS Total_Calories
FROM exercise_logs
GROUP   BY CAST(ExerciseType AS VARCHAR(100))
Having  SUM(Calories) > 150

SELECT CAST(ExerciseType AS VARCHAR(100)) ExerciseType,
    AVG(Calories) AS Average_Calories
FROM exercise_logs
GROUP   BY CAST(ExerciseType AS VARCHAR(100))
Having  AVG(Calories) > 70

Select CAST(ExerciseType AS VARCHAR(100)) ExerciseType
From exercise_logs
Group By CAST(ExerciseType AS VARCHAR(100))
Having Count(*) >= 2

SELECT Count(*)
FROM exercise_logs
WHERE heart_rate >= (0.50 * (220-30))
    AND heart_rate <= (0.90 * (220-30));



Select heart_rate, exercisetype,
    Case
		When heart_rate > 220-30 Then 'Above Max'
		When heart_rate > (0.90 * (220-30)) Then 'Above Target'
		When heart_rate > (0.50 * (220-30)) Then 'Within Target'
		Else 'Below Target'
	End as 'hr_zone'
From exercise_logs

Select count(*),
    Case
            When number_grade > 90 Then 'A'
            When number_grade > 80 Then 'B'
            When number_grade > 70 Then 'C'
            Else 'F'
        End as 'letter_grade'
From student_grades
Group by letter_grade



CREATE TABLE students
(
    id INTEGER Identity(1,1) PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    phone TEXT,
    birthdate TEXT
);

INSERT INTO students
    (first_name, last_name, email, phone, birthdate)
VALUES
    ('Peter', 'Rabbit', 'peter@rabbit.com', '555-6666', '2002-06-24');
INSERT INTO students
    (first_name, last_name, email, phone, birthdate)
VALUES
    ('Alice', 'Wonderland', 'alice@wonderland.com', '555-4444', '2002-07-04');

CREATE TABLE student_grades
(
    id INTEGER Identity(1,1) PRIMARY KEY,
    student_id INTEGER,
    test TEXT,
    grade INTEGER
);

INSERT INTO student_grades
    (student_id, test, grade)
VALUES
    (1, 'Nutrition', 95);
INSERT INTO student_grades
    (student_id, test, grade)
VALUES
    (2, 'Nutrition', 92);
INSERT INTO student_grades
    (student_id, test, grade)
VALUES
    (1, 'Chemistry', 85);
INSERT INTO student_grades
    (student_id, test, grade)
VALUES
    (2, 'Chemistry', 95);



Select *
From student_grades, students
Where student_grades.student_id = students.id;

Select students.first_name, students.last_name, students.email, student_grades.test, student_grades.grade
From students
    Join student_grades
    On students.id = student_grades.student_id
Where grade > 90;



CREATE TABLE students
(
    id INTEGER Identity(1,1) PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    phone TEXT,
    birthdate TEXT
);

INSERT INTO students
    (first_name, last_name, email, phone, birthdate)
VALUES
    ('Peter', 'Rabbit', 'peter@rabbit.com', '555-6666', '2002-06-24');
INSERT INTO students
    (first_name, last_name, email, phone, birthdate)
VALUES
    ('Alice', 'Wonderland', 'alice@wonderland.com', '555-4444', '2002-07-04');

CREATE TABLE student_grades
(
    id INTEGER Identity(1,1) PRIMARY KEY,
    student_id INTEGER,
    test TEXT,
    grade INTEGER
);

INSERT INTO student_grades
    (student_id, test, grade)
VALUES
    (1, 'Nutrition', 95);
INSERT INTO student_grades
    (student_id, test, grade)
VALUES
    (2, 'Nutrition', 92);
INSERT INTO student_grades
    (student_id, test, grade)
VALUES
    (1, 'Chemistry', 85);
INSERT INTO student_grades
    (student_id, test, grade)
VALUES
    (2, 'Chemistry', 95);

CREATE TABLE student_projects
(
    id INTEGER Identity(1,1) PRIMARY KEY,
    student_id INTEGER,
    title TEXT
);

INSERT INTO student_projects
    (student_id, title)
VALUES
    (1, 'Carrotapault');



Select Students.First_Name, Students.Last_Name, Student_Projects.title
From Students
    Left Outer Join Student_projects
    On Students.id = student_projects.student_id;



Select customers.name, customers.email, orders.item, orders.price
From customers
    Left Outer Join Orders
    On customers.id = orders.customer_id;


Select customers.name, customers.email, SUM(orders.price) as Total
From Orders
    Join Customers
    On orders.customer_id = customers.id
Group by orders.customer_id


CREATE TABLE students
(
    id INTEGER Identity(1,1) PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    phone TEXT,
    birthdate TEXT,
    buddy_id INTEGER
);

INSERT INTO students
VALUES
    ('Peter', 'Rabbit', 'peter@rabbit.com', '555-6666', '2002-06-24', 2);
INSERT INTO students
VALUES
    ('Alice', 'Wonderland', 'alice@wonderland.com', '555-4444', '2002-07-04', 1);
INSERT INTO students
VALUES
    ('Aladdin', 'Lampland', 'aladdin@lampland.com', '555-3333', '2001-05-10', 4);
INSERT INTO students
VALUES
    ('Simba', 'Kingston', 'simba@kingston.com', '555-1111', '2001-12-24', 3);

Select students.first_name, students.last_name, buddies.email
From students
    Join students buddies
    On students.buddy_id = buddies.id

SELECT movies.title AS Movie_Title, sequel.title AS Sequel_Title
FROM movies
    LEFT OUTER JOIN movies sequel
    ON movies.sequel_id = sequel.id



CREATE TABLE project_pairs
(
    id INTEGER Identity(1,1) PRIMARY KEY,
    project1_id INTEGER,
    project2_id INTEGER
);

INSERT INTO project_pairs
    (project1_id, project2_id)
VALUES(1, 2);
INSERT INTO project_pairs
    (project1_id, project2_id)
VALUES(3, 4);

CREATE TABLE students
(
    id INTEGER Identity(1,1) PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    phone TEXT,
    birthdate TEXT
);

INSERT INTO students
    (first_name, last_name, email, phone, birthdate)
VALUES
    ('Peter', 'Rabbit', 'peter@rabbit.com', '555-6666', '2002-06-24');
INSERT INTO students
    (first_name, last_name, email, phone, birthdate)
VALUES
    ('Alice', 'Wonderland', 'alice@wonderland.com', '555-4444', '2002-07-04');
INSERT INTO students
    (first_name, last_name, email, phone, birthdate)
VALUES
    ('Aladdin', 'Lampland', 'aladdin@lampland.com', '555-3333', '2001-05-10');
INSERT INTO students
    (first_name, last_name, email, phone, birthdate)
VALUES
    ('Simba', 'Kingston', 'simba@kingston.com', '555-1111', '2001-12-24');

CREATE TABLE student_projects
(
    id INTEGER Identity(1,1) PRIMARY KEY,
    student_id INTEGER,
    title TEXT
);

INSERT INTO student_projects
    (student_id, title)
VALUES
    (1, 'Carrotapault');
INSERT INTO student_projects
    (student_id, title)
VALUES
    (2, 'Mad Hattery');
INSERT INTO student_projects
    (student_id, title)
VALUES
    (3, 'Carpet Physics');
INSERT INTO student_projects
    (student_id, title)
VALUES
    (4, 'Hyena Habitats');





Select One.Title, Two.title
from project_pairs
    Join student_projects One
    On project_pairs.project1_id = One.id
    Join student_projects Two
    On project_pairs.project2_id = Two.id


Select A.fullname, B.fullname
from friends
    Join persons A
    On friends.person1_id = A.id
    Join persons B
    On friends.person2_id = B.id
