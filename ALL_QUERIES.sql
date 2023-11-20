-- CREATE TABLES

CREATE TABLE university (
    university_id SERIAL PRIMARY KEY,
    university_name VARCHAR
);
CREATE TABLE college (
    college_id SERIAL PRIMARY KEY,
    college_name VARCHAR,
    university_id INTEGER REFERENCES university(university_id)
);
CREATE TABLE course (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR
);
CREATE TABLE college_course (
    college_course_id SERIAL PRIMARY KEY,
    college_id INTEGER REFERENCES college(college_id),
    course_id INTEGER REFERENCES course(course_id)
);
create table subject(
subject_id serial primary key not null , subject_name VARCHAR not null)
CREATE TABLE course_subject (
    course_subject_id SERIAL PRIMARY KEY NOT NULL,
    course_id integer references course(course_id),
    subject_id INTEGER REFERENCES subject(subject_id)
);
create table semester(semester_id  SERIAL PRIMARY KEY NOT NULL, sem_month VARCHAR NOT null,sem_year INTEGER NOT null)

create table student(student_id serial primary key not null,student_name VARCHAR not null, DOB date ,phone integer ,joining_year integer, college_id integer references college(college_id),course_id integer references course(course_id))

create table marks(mark_id serial primary key not null,student_id integer references student(student_id),
semester_id integer references semester(semester_id),marks integer,subject_id integer references subject(subject_id))

-- INSERT DATAS

insert into university (university_name) values ('pondicherry university');

insert into college (college_name,university_id)
values ('PEC',1),('SMVEC',1),('MIT',1),('TAC',1),('IDHAYA',1);

insert into course (course_name)
values ('Mech'),('CSC'),('IT'),('EEE'),('ECE'),('MCA'),('BCA');

insert into course (course_name)
values ('B.Sc.,Chemistry'),('B.Sc., Computer Science'), ('M.Sc., Maths'),('M.Sc., Physics'),('B.A. Tamil'),('B.A. English');

insert into course (course_name)
values ('chemical engineering'),('BME');

insert into college_course (college_id,course_id)
values (1,1),(1,2),(1,3),(1,4),(1,14);

insert into college_course (college_id,course_id)
values (2,1),(2,2),(2,3),(2,4),(2,5);

insert into college_course (college_id,course_id)
values (3,2),(3,3),(3,4),(3,14),(3,15);

insert into college_course (college_id,course_id)
values (4,6),(4,7),(4,8),(4,9),(4,10)

insert into college_course (college_id,course_id)
values (5,11),(5,12),(5,13),(5,8),(5,10)

insert into subject(subject_name)
values ('tamil'),('english'),('maths'),('thermodynamics'),('physics'),('chemistry'),('environment science'),('database management system'),('artificial intelegence'),
       ('computer programing'),('java'),('python'),('algebra'),('trignometri'),('integral calculas');
insert into course_subject(subject_id,course_id)
values (4,1),(5,1),(6,1);
insert into course_subject(subject_id,course_id)
values (10,2),(11,2),(12,2),(10,3),(11,3),(12,3),(3,4),(2,4),(6,4),(4,5),(5,5),(6,5);
insert into course_subject(subject_id,course_id)
values (8,6),(9,6),(10,6),(7,7),(8,7),(9,7);

insert into course_subject(subject_id,course_id)
values (3,8),(6,8),(7,8),(10,9),(11,9),(12,9);

insert into course_subject(subject_id,course_id)
values (13,10),(14,10),(15,10),(3,11),(4,11),(5,11);

insert into course_subject(subject_id,course_id)
values (1,12),(2,12),(3,12),(1,13),(2,13),(3,13);

insert into course_subject(subject_id,course_id)
values (2,14),(3,14),(6,14),(2,15),(3,15),(4,15);

insert into semester(sem_month,sem_year)
values ('april',2023);

insert into student(student_name,DOB,phone,joining_year,course_id,college_id)
values ('Sriram','2004-08-09',0428356,2021,2,1);


INSERT INTO student(student_name, DOB, phone, joining_year, course_id, college_id)
VALUES
    ('ramajeyam', '2004-08-09', 0428356, 2021, 2, 1),
    ('Alice', '2003-03-15', 0712345, 2022, 3, 2),
    ('Bob', '2002-07-21', 0987654, 2020, 3, 3),
    ('Emily', '2005-01-12', 0567890, 2021, 7, 4),
    ('Daniel', '2003-11-05', 0123456, 2023, 2, 3),
    ('Grace', '2001-09-30', 0789012, 2020, 1, 3),
    ('Liam', '2004-06-18', 0345678, 2022, 13, 5),
    ('Olivia', '2002-04-25', 0890123, 2021, 8, 5),
    ('Mia', '2000-12-08', 0456789, 2023, 4, 2);

insert into student(student_name,DOB,phone,joining_year,course_id,college_id)
values ('sineka', '2001-01-10', 0567867, 2021, 7, 4);

INSERT INTO marks(student_id, semester_id, marks, subject_id)
VALUES
    (1, 1, 85, 10),
    (1, 1, 92, 11),
    (1, 1, 78, 12),
    (2, 1, 89, 10),
    (2, 1, 95, 11),
    (2, 1, 20, 12),
    (8, 1, 88, 1),
    (8, 1, 76, 2),
    (8, 1, 76, 3);

INSERT INTO marks(student_id, semester_id, marks, subject_id)
VALUES
    (5, 1, 10, 7),
    (5, 1, 9, 8),
    (5, 1, 20, 9);

INSERT INTO marks(student_id, semester_id, marks, subject_id)
VALUES
     (4, 1, 85, 10),
    (4, 1, 92, 11),
    (4, 1, 78, 12);
INSERT INTO marks(student_id, semester_id, marks, subject_id)
VALUES
    (7, 1, 90, 2),
    (7, 1, 90, 3),
    (7, 1, 90, 6),
    (6, 1, 90, 10),
    (6, 1, 90, 11),
    (6, 1, 90, 12);
INSERT INTO marks(student_id, semester_id, marks, subject_id)
VALUES
    (11, 1, 11, 7),
    (11, 1, 19, 8),
    (11, 1, -1, 9);
INSERT INTO marks(student_id, semester_id, marks, subject_id)
VALUES
    (9, 1, -1, 3),
    (9, 1, -1, 6),
    (9, 1, -1, 7);
   

-- TASKS

-- 1. get students count college wise
    select c.college_name, count(s.college_id) student_count from college c left join student s on c.college_id =s.college_id
group by c.college_name ;

-- 2. get students count in a college, course wise
    select c.college_name, c2.course_name, count(s.student_id) as student_count
from college c
inner join college_course cc on c.college_id = cc.college_id 
inner join course c2 on c2.course_id = cc.course_id
left join student s on cc.college_id = s.college_id and c2.course_id = s.course_id
group by c.college_name, c2.course_name
order by c.college_name, student_count desc;

-- SELECT c.college_name, co.course_name, COUNT(s.student_id) AS student_count
-- FROM college c
-- INNER JOIN student s ON c.college_id = s.college_id
-- INNER JOIN course co ON s.course_id = co.course_id
-- GROUP BY c.college_name, co.course_name
-- order by c.college_name, student_count desc;


-- 3. get the university rank holder across all courses(1 student)

    SELECT m.student_id, s.student_name, AVG(m.marks) AS cgp,c2.course_name, c.college_name 
FROM marks m
join student s on s.student_id = m.student_id 
join course c2 on c2.course_id = s.course_id 
join college c on c.college_id = s.college_id 
GROUP BY m.student_id,s.student_name,c2.course_name,c.college_name
HAVING AVG(marks) = (
    SELECT MAX(avg_marks)
    FROM (
        SELECT AVG(marks) AS avg_marks
        FROM marks
        GROUP BY student_id
    ) AS max_avg
);

-- 4. get the list of rank holders each course
    SELECT 
    student_id,
    student_name,
    course_name,
    cgp AS average_marks
FROM (
    SELECT 
        s.student_id,
        s.student_name,
        c.course_name,
        AVG(m.marks) AS cgp,
        rank() OVER(PARTITION BY c.course_id ORDER BY AVG(m.marks) DESC) AS rank
    FROM 
        marks m
    JOIN 
        student s ON s.student_id = m.student_id
    JOIN 
        course c ON c.course_id = s.course_id
    GROUP BY 
        s.student_id, 
        s.student_name,
        c.course_name,
        c.course_id 
) ranked_students
WHERE rank = 1;


-- 5. get the college topper across all courses
    select student_id ,student_name, college_name, cgp AS average_marks
from(
	select m.student_id ,s.student_name, c.college_name, AVG(m.marks) AS cgp,
rank() over(partition by c.college_id order by AVG(m.marks) DESC) as ranking
from marks m 
join student s on s.student_id = m.student_id 
join college c on c.college_id = s.college_id 
group by m.student_id ,s.student_name, c.college_name,c.college_id) student_ranks
where ranking = 1;


-- 6. get the college toppers each course
        select student_id,student_name,college_name ,course_name,cgp as avg_marks
from(
	select m.student_id ,s.student_name, c.college_name,c2.course_name, AVG(m.marks) AS cgp,
rank() over(partition by c2.course_id,c.college_id  order by AVG(m.marks) DESC) as ranking
from marks m 
join student s on s.student_id = m.student_id 
join college c on c.college_id = s.college_id 
join course c2 on c2.course_id = s.course_id 
group by m.student_id ,s.student_name, c.college_name,c2.course_id,c.college_id  ,c2.course_name) course_rank
where ranking =1;
        

-- 7. get the failed students count each subject 
    SELECT s2.subject_name, COUNT(m.student_id) AS num_failed_students
FROM marks m
JOIN subject s2 ON m.subject_id = s2.subject_id
WHERE m.marks < 30
GROUP BY s2.subject_name;


-- 8. get over all students list with semester marks
    SELECT m.student_id, s.student_name, AVG(m.marks) AS cgp,c2.course_name,s2.sem_month,s2.sem_year
FROM marks m
join student s on s.student_id = m.student_id 
join course c2 on c2.course_id = s.course_id 
join semester s2 on s2.semester_id = m.semester_id 
where s2.sem_month ='april' and s2.sem_year =2023
GROUP BY m.student_id,s.student_name,c2.course_name,s2.sem_month,s2.sem_year


-- 9. get the student list who wasnt appear to the exams
    SELECT s.student_id, s.student_name
FROM student s
LEFT JOIN marks m ON s.student_id = m.student_id
WHERE m.marks = -1 OR m.marks IS NULL
group by s.student_name,s.student_id ;

Task 3
-------
-- - update the mark to 40 those who were scored the marks between 35 to 39
-- - get the history of marks that are changed
-- - choose any select query from tast 2 and insert the values into a temp table(https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-select-into/)
-- - delete a college and its respective things
-- - alter all the tables add audit columns (createdAt,createBy,updatedAt,updatedBy)
-- - remove the duplicate values in the mark table(insert values for your convenient)
