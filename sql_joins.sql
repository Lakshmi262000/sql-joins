CREATE TABLE learners (
    learner_id INT PRIMARY KEY,
    learner_name VARCHAR(100),
    age INT,
    course_id INT,
    city VARCHAR(100)
);

INSERT INTO learners
    (learner_id, learner_name, age, course_id, city)
VALUES
    (101, 'Aarav', 22, 1, 'Hyderabad'),
    (102, 'Meera', 24, 2, 'Chennai'),
    (103, 'Karthik', 21, 3, 'Bangalore'),
    (104, 'Divya', 23, 1, 'Hyderabad'),
    (105, 'Rahul', 25, 4, 'Pune'),
    (106, 'Sneha', 22, 5, 'Mumbai'),
    (107, 'Vikram', 26, 2, 'Delhi'),
    (108, 'Ananya', 21, 10, 'Kochi');


CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    duration_months INT,
    course_fee NUMERIC(10,2)
);


INSERT INTO courses
    (course_id, course_name, duration_months, course_fee)
VALUES
    (1, 'Python Development', 6, 45000.00),
    (2, 'Data Analytics', 5, 40000.00),
    (3, 'Java Development', 6, 50000.00),
    (4, 'Cloud Computing', 4, 55000.00),
    (5, 'Cyber Security', 6, 60000.00),
    (6, 'DevOps', 4, 52000.00),
    (7, 'AI & Machine Learning', 8, 75000.00);



select * from courses;
select * from learners;

---Display each learner along with their corresponding course name.
select learner_name,course_name
from learners as l 
inner join 
courses as c on
l.course_id = c.course_id;

----Display the names and cities of learners who are enrolled in a course. Include the course name.
select learner_name,city,course_name 
from learners as l inner join
courses as c on 
l.course_id = c.course_id;

----Display learners who are enrolled in courses where the course fee is greater than 50,000.
--Show:

--learner name
--course name
--course fee
select learner_name,course_name,course_fee
from learners as l inner join courses as c
on l.course_id = c.course_id
where course_fee > 50000;

---Display all learners along with their course names.
--If a learner is not assigned to any course, their course name should be NULL.
select learner_name,course_name from 
learners as l left join courses as c
on l.course_id = c.course_id;

---Find all learners who are not assigned to any course.
select l.learner_name,c.course_name,l.course_id from 
learners as l left join courses as c
on l.course_id = c.course_id
where c.course_id is null;

---Display all learners along with their course name and course duration.
--Learners without a course should also appear.
select learner_name,course_name,duration_months from 
learners as l left join courses as c
on l.course_id = c.course_id;

----Display all courses along with the learners enrolled in each course.
--Courses without any learners should also appear.
select course_name,learner_name from learners as l
right join courses as c on
l.course_id = c.course_id;

----Find all courses that do not have any learners enrolled.
select c.course_name,l.learner_name from learners as l
right join courses as c on
l.course_id = c.course_id
where l.course_id is null;

----Display every course and the number of learners enrolled in each course.
--Courses with no learners should show a count of 0.
select c.course_name,count(l.learner_name)from learners as l right join
courses as c on l.course_id = c.course_id
group by course_name;


---Display all learners and all courses,
--including learners who don't have a course and courses that don't have any learners.
select learner_name,course_name from
learners as l full join courses as c
on l.course_id = c.course_id;

---Find unmatched learners AND unmatched courses
select l.learner_name,c.course_name from
learners as l full join courses as c
on l.course_id = c.course_id
where l.learner_name is null
or c.course_name is null;

---Display all courses with learner count
select count(l.learner_name),c.course_name from
learners as l full join courses as c
on l.course_id = c.course_id
group by c.course_id,c.course_name;


----Table name change — ALTER TABLE ... RENAME-----
---Suppose learners table name ni students ga change cheyyali:
alter table learners
rename to TTT
SELECT * FROM TTT

ALTER TABLE TTT
RENAME TO learners

select * from learners;

---Existing table lo new column add cheyyadam
--Example: learners table ki email column add cheyyali:
alter table learners
add column phn_number int;

select * from learners;


------New value insert cheyyadam-------
---Existing learners table lo new learner add cheyyali:
insert into learners
(learner_id,learner_name,age,course_id,city,phn_number)
values
(109,'Isha',25,11,'Mumbai',635);

select * from learners;

alter table learners
drop column phn_number;

select * from learners;

alter table learners
add column Country varchar(50);

update learners
set Country = 'India';

SELECT * FROM learners;

---------------------------------------sub queries-------------------------------

select * from learners;
select * from courses;

----Find all courses whose course_fee is greater than the average course fee.
--Display:course_name,course_fee
select course_name,course_fee from courses 
where course_fee > (select avg(course_fee) from courses);

---Find the course(s) whose course_fee is equal to the highest course fee.
--Display:course_name,course_fee
select course_name,course_fee from courses
where course_fee = (select max(course_fee) from courses);

---Find all learners who are enrolled in a course whose fee is greater than 50,000.
--Display:learner_name,course_id
select l.learner_name,c.course_id,c.course_fee from learners as l
join courses as c
on l.course_id = c.course_id
where course_fee > 50000;

select learner_name,course_id from learners
where course_id in (select course_id from courses where course_fee > 50000);


----Find all learners who are enrolled in the same course as Aarav.
--Display:learner_name,course_id
select learner_name,course_id from learners where 
course_id in(select course_id from learners where learner_name = 'Aarav');


































































	