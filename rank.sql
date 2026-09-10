select * from res1;
create table res1(s_name varchar(45),subjects varchar(45), marks int);
insert into res1(s_name,subjects,marks) values
("Pratibha","Maths",100),("Ankita","Science",80),
("Swarna","English",100),("Ankita","Maths",65),
("Pratibha","Science",80),("Swarna","Science",50),
("Pratibha","English",70),("Swarna","Maths",85),
("Ankita","English",90);

SELECT subjects, s_name, marks, dense_rank() 
 OVER ( partition by subjects order by marks desc ) 
 AS 'dense_rank' FROM result;
SELECT subjects,s_name,marks,rank() 
OVER ( partition by subjects order by marks desc ) 
AS 'rank' FROM res1;
SELECT subjects,s_name,marks,percent_rank()
OVER ( partition by subjects order by marks desc ) 
AS 'rank' FROM res1;
