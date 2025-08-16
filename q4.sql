DROP PROCEDURE IF EXISTS SendWatchTimeReport;
DELIMITER $$
CREATE PROCEDURE SendWatchTimeReport()
BEGIN
    DECLARE v_subscriberId INT;
    DECLARE finished INT DEFAULT 0;
    DECLARE cur_subscribers CURSOR FOR
        SELECT DISTINCT SubscriberID 
        FROM WatchHistory
        WHERE WatchTime IS NOT NULL;  
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND 
        SET finished = 1;

    OPEN cur_subscribers;

    subscriber_loop: LOOP
        FETCH cur_subscribers INTO v_subscriberId;
        IF finished = 1 THEN
            LEAVE subscriber_loop;
        END IF;
        CALL GetWatchHistoryBySubscriber(v_subscriberId);
    END LOOP;
    CLOSE cur_subscribers;
END $$

DELIMITER ;

CALL SendWatchTimeReport();
