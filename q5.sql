DROP PROCEDURE IF EXISTS GetAllSubscribersWatchHistory;
DELIMITER $$
CREATE PROCEDURE GetAllSubscribersWatchHistory()
BEGIN

    DECLARE subscriber_id INT DEFAULT NULL;
    DECLARE no_more_rows BOOLEAN DEFAULT FALSE;
    DECLARE cur_subscribers CURSOR FOR
        SELECT SubscriberID 
        FROM Subscribers
        ORDER BY SubscriberID;
    DECLARE CONTINUE HANDLER FOR NOT FOUND 
        SET no_more_rows = TRUE;
    OPEN cur_subscribers;

    read_loop: LOOP
        FETCH cur_subscribers INTO subscriber_id;
        IF no_more_rows THEN
            LEAVE read_loop;
        END IF;
        SELECT CONCAT('Watch history for Subscriber ID: ', subscriber_id) AS Info;
        CALL GetWatchHistoryBySubscriber(subscriber_id);
    END LOOP;
    CLOSE cur_subscribers;
END $$
DELIMITER ;

CALL GetAllSubscribersWatchHistory();
