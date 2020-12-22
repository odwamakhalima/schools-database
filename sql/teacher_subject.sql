create table teacher_subject (
	teacher_id int not null,
	subject_id int not null,
	foreign key (teacher_id) references teacher(id),
	foreign key (subject_id) references subject(id)
);

-- Linking subjects to a teacher
insert into teacher_subject (teacher_id, subject_id) values (1, 2);
insert into teacher_subject (teacher_id, subject_id) values (1, 3);
insert into teacher_subject (teacher_id, subject_id) values (1, 4);
insert into teacher_subject (teacher_id, subject_id) values (2, 5);
insert into teacher_subject (teacher_id, subject_id) values (2, 6);
insert into teacher_subject (teacher_id, subject_id) values (2, 1);
insert into teacher_subject (teacher_id, subject_id) values (5, 1);
insert into teacher_subject (teacher_id, subject_id) values (1, 1);


-- Joining teacher with subjects
select * from teacher
	join teacher_subject on teacher.id = teacher_subject.teacher_id
	join subject on teacher_subject.subject_id = subject.id;



-- Find all the Maths teachers
select 
	teacher.* 
from teacher
 	join teacher_subject on teacher.id = teacher_subject.teacher_id
	join subject on teacher_subject.subject_id = subject.id
where 
	subject.name = 'Mathematics';



-- finding all the teachers that teaches 3 or more than subjects,
select 
   teacher.first_name, teacher.last_name, teacher.email, count(*)  
from teacher
	join teacher_subject on teacher.id = teacher_subject.teacher_id
	join subject on teacher_subject.subject_id = subject.id
group by 
   teacher.first_name, teacher.last_name, teacher.email
having count(*) >= 3;