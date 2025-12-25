-- SQL Advent Calendar - Day 12
-- Title: North Pole Network Most Active Users
-- Difficulty: hard
--
-- Question:
-- The North Pole Network wants to see who's the most active in the holiday chat each day. Write a query to count how many messages each user sent, then find the most active user(s) each day. If multiple users tie for first place, return all of them.
--
-- The North Pole Network wants to see who's the most active in the holiday chat each day. Write a query to count how many messages each user sent, then find the most active user(s) each day. If multiple users tie for first place, return all of them.
--

-- Table Schema:
-- Table: npn_users
--   user_id: INT
--   user_name: VARCHAR
--
-- Table: npn_messages
--   message_id: INT
--   sender_id: INT
--   sent_at: TIMESTAMP
--

-- My Solution:

WITH message_count AS 
  (
    SELECT   DATE(sent_at), sender_id, COUNT(message_id) AS total_messages
    FROM     npn_messages
    GROUP BY DATE(sent_at), sender_id),

  message_rank AS 
    (
    SELECT date, sender_id, total_messages, 
           DENSE_RANK() OVER(PARTITION BY date ORDER BY total_messages DESC) AS m_rank
    FROM   message_count)

SELECT date, sender_id, total_messages
FROM   message_rank
WHERE  m_rank = 1;
