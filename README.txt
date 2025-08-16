# Lab 2 – SQL Stored Procedures and Cursors  

*Roll Number:* 2025204005  
*Course:* CS6.302 – Software System Development  

---

## 🚀 Steps to Execute  

1.⁠ ⁠Open *MySQL Workbench* and connect to your server.  

2.⁠ ⁠Create and select the database:  
   ```sql
CREATE DATABASE IF NOT EXISTS LAB2;
use LAB2;
3.⁠ ⁠Create the tables and insert sample data (use the CREATE TABLE and INSERT statements from Activity.pdf).

  4.Run the procedure scripts in order:

SOURCE q1.sql;   -- ListAllSubscribers()  
SOURCE q2.sql;   -- GetWatchHistoryBySubscriber(IN sub_id INT)  
SOURCE q3.sql;   -- AddSubscriberIfNotExists(IN subName VARCHAR(100))  
SOURCE q4.sql;   -- SendWatchTimeReport()  
SOURCE q5.sql;   -- AllSubscribersWatchHistory()  

5.Test the procedures:

CALL ListAllSubscribers();
CALL GetWatchHistoryBySubscriber(1);
CALL AddSubscriberIfNotExists('New Subscriber');
CALL SendWatchTimeReport();
CALL AllSubscribersWatchHistory();

-----------------------------------------
Git Repository Link
-----------------------------------------
https://github.com/Drool3008/lab2sql_ssd
-----------------------------------------
Notes:
-----------------------------------------
•⁠  ⁠Ensure that the ⁠ Shows ⁠, ⁠ Subscribers ⁠, and ⁠ WatchHistory ⁠ tables exist before running the stored procedures.
•⁠  ⁠The procedures use the sample data provided in Activity.pdf, but you may add more data for testing.
•⁠  ⁠If you re-run the scripts, you may need to drop the existing procedures using:
  DROP PROCEDURE IF EXISTS procedure_name;
