DROP PROCEDURE IF EXISTS ListAllSubscribers;

DELIMITER $$

CREATE PROCEDURE ListAllSubscribers()
BEGIN
    DECLARE v_name VARCHAR(100);
    DECLARE finished INT DEFAULT 0;
    DECLARE subscriber_cursor CURSOR FOR
	SELECT SubscriberName FROM Subscribers;

    DECLARE CONTINUE HANDLER FOR NOT FOUND 
        SET finished = 1;

    OPEN subscriber_cursor;

    read_loop: LOOP
        FETCH subscriber_cursor INTO v_name;
        IF finished = 1 THEN
            LEAVE read_loop;
        END IF;
        SELECT CONCAT('Subscriber: ', v_name) AS Output;
    END LOOP;
    CLOSE subscriber_cursor;
END $$

DELIMITER ;

CALL ListAllSubscribers();
