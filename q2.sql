DROP PROCEDURE IF EXISTS GetWatchHistoryBySubscriber;
DELIMITER $$
CREATE PROCEDURE GetWatchHistoryBySubscriber(IN p_subscriberId INT)
BEGIN
    SELECT 
        sh.Title AS ShowTitle,
        wh.WatchTime AS TimeWatched
    FROM 
        WatchHistory wh
        JOIN Shows sh ON sh.ShowID = wh.ShowID
    WHERE 
        wh.SubscriberID = p_subscriberId;
END $$
DELIMITER ;

CALL GetWatchHistoryBySubscriber(2);