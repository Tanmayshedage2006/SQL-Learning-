CREATE TABLE members (
id INT auto_increment primary key,
name varchar(100) NOT null,
birthdate date
);

insert into members(name,birthdate) values ("Tanmay",Null);
insert into members(name ,birthdate) values ("Gaurav",07-06-2007);
create table reminders ( 
id INT auto_increment,
memberId INT,
message varchar(255) NOT null,
primary key (id, memberId)
);

DELIMITER @@
create trigger After_insert1
AFTER insert on members for each row 
BEGIN 
     IF NEW.birthdate IS NULL THEN
          INSERT INTO reminders(memberId,message)
          values (new.id,concat('Hi',NEW.name, 'pleade update your date of birth,'));
          END IF;
 END @@
 DELIMITER ;
 show triggers;
select * from members;
select * from reminders;