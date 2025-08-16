DROP PROCEDURE IF EXISTS AddSubscriberIfNotExists;

DELIMITER $$

CREATE PROCEDURE AddSubscriberIfNotExists(IN p_subName VARCHAR(100))
BEGIN    
    DECLARE v_exists INT DEFAULT 0;
    DECLARE v_newId INT;

    SELECT COUNT(*) 
    INTO v_exists
    FROM Subscribers
    WHERE SubscriberName = p_subName;
    IF v_exists = 0 THEN

        SELECT IFNULL(MAX(SubscriberID), 0) + 1
        INTO v_newId
        FROM Subscribers;

        INSERT INTO Subscribers (SubscriberID, SubscriberName, SubscriptionDate)
        VALUES (v_newId, p_subName, CURDATE());

        SELECT CONCAT('New subscriber "', p_subName, 
                      '" added with ID ', v_newId) AS ResultMessage;
    ELSE

        SELECT CONCAT('Subscriber "', p_subName, 
                      '" already exists. No changes made.') AS ResultMessage;
    END IF;
END $$

DELIMITER ;

CALL AddSubscriberIfNotExists("Micheal Scott");
