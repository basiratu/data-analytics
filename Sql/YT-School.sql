create table courses (course_id varchar (6) primary key,
					  course_name varchar (40) ,
					  course_unit integer,
					  department varchar (5));
					  
drop table courses;

insert into courses(course_id, course_name, course_unit, department)
values('EX101', 'Introduction to Microsoft Excel', 5, 'DP1');

insert into courses(course_id, course_name, course_unit, department)
	values
			('EX102', 'Intermediate Excel', 4, 'DP1'),
			('EX103', 'Advanced Excel', 3, 'DP1'),
			('PB101', 'Power BI for Dummies', 5, 'DP2'),
			('PB102', 'Data Modelling in Power BI', 3, 'DP2');
			
create table departments ("Department_ID" varchar(5) primary key,
						  "Department_Name" varchar(20));	
						  
insert into departments("Department_ID", "Department_Name")
values('DP1', 'MS Excel'),
		('DP2', 'Power BI'), 
		('DP3', 'Tableau'),
		('DP4', 'SQL');	
					
create table scores (student_id integer primary key,
					student_name varchar(50),
					course varchar(50),
					score integer);	
					
insert into scores(student_id, student_name, course, score)
values( 1, 'Bill James', 'PB102', 53),
(2,'Thompson Jude','EX103',78),
(3,'Shade Cooker','PB101',66),
(4, 'Granite Bin', 'PB102',71),
(5, 'Jide Stone', 'EX103',56),
(6,'Bode Thomas','EX101',94),
(7,'Sardina Grills','EX103',99),
(8,'Shark-Dodo King','EX103',87),
(9,'Queen Rotiseri','EX101',66),
(10,'Hillary James','EX103',74),
(11,'Senior Tina','PB101',70),
(12, 'Denis Joker', 'PB101',99),
(13,'Beauty TheBeholder','EX103',83);

					
insert into scores(student_id, student_name, course, score)
values
(14,'Johnny Komel','EX101',63),
(15,'Densel California','PB101',58),
(16,'Jack Robin', 'PB102',92),
(17,'Hillary Young', 'EX102',61),
(18,'Robin Hood','EX101',74),
(19,'James Matilda','PB102',58),
(20,'Tina Smart','EX101',51);	

alter table courses
	add constraint
	department foreign key
	("department") references departments("Department_ID");
	
alter table scores
	add constraint
	course foreign key
	(course) references courses(course_id);	
	
	
	YtSchools would like to know their performance in terms of number of students enrolled in each department and each course. To help them, you are to find out : 
--Number of students enrolled in each course.
Select * from Scores;
Select * from courses;
Select * from departments;

select course, count(student_id) from Scores
group by course;

-- Number of students in each department.(ans on 87.)
select  * from Scores
join courses 
on Scores.course=courses.course_id;

Select * from courses
full join departments
on courses.department=departments."Department_ID";

select department, count (student_id)from Scores
full join courses
on Scores.course=courses.course_id
group by department;

-- How many courses have at least 5 students enrolled.
Select * from Scores;
select count(student_id),course from Scores
group by course
having count(student_id)>=5;

-- The HOD of DP1 will like to know the average score of students in the department.
select * from Scores;
select round(AVG (score))from Scores
join courses
on Scores.course=courses.course_id
where department='DP1';

-- YTSchools would like to know which departments do not have courses yet.
select * from courses
full join departments
on courses.course_id=departments."Department_ID"
where course_id is null;

-- YTSchools will like to know the courses offered by the ‘Power BI’ Department.
select course_name, course_id, "Department_Name" from courses
full join departments
on courses.department = departments."Department_ID"
where "Department_Name" = 'Power BI';

select course_name, course_id, "Department_Name" from courses
full join departments
on courses.department = departments."Department_ID"
where "Department_Name" = 'Power BI';
