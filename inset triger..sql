CREATE TABLE WorkCenters (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    capacity INT NOT NULL
);
select * from workcenters;
insert into workcenters(name,capacity) values ("Hot machine",200);
CREATE TABLE WorkCenterStats(
    totalCapacity INT NOT NULL
);
select * from workcenterstats;


DELIMITER @@ 
create trigger before_insert
BEFORE insert on workcenters For each row
BEGIN
	DECLARE rowcount INT;    
    SELECT COUNT(*)  INTO rowcount FROM WorkCenterStats;
    IF rowcount > 0 THEN 
		UPDATE WorkCenterStats SET totalCapacity = totalCapacity + new.capacity;
    ELSE
        INSERT INTO WorkCenterStats(totalCapacity) VALUES(new.capacity);
    END IF; 

END @@
DELIMITER ;

show triggers;