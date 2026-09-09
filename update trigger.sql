select * from students;

INSERT INTO students(name, class, email_id)
VALUES
('Tanmay Shedage', 5, 'tanmay@gmail.com'),
('Gaurav Mate', 6, 'gaurav@gmail.com'),
('Sahil Shinde', 7, 'sahil@gmail.com'),
('Amit Patil', 8, 'amit@gmail.com'),
('Rahul Jadhav', 9, 'rahul@gmail.com');


create table students_log(user varchar(45) NOT NULL,
 description
varchar(65) NOT NULL);

select * from students_log;

DELIMITER @@
CREATE TRIGGER  after_update_studentinfo
AFTER UPDATE oN 
students for each Row  
BEGIN
    Insert into students_log values (user(),
    CONCAT('Update student Record',OLD.name,' Previous class:',
    OLD.class, 'Present Class', NEW.class));
END @@
DELIMITER ;