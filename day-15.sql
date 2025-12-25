-- SQL Advent Calendar - Day 15
-- Title: The Grinch's Mischief Tracker
-- Difficulty: hard
--
-- Question:
-- The Grinch is tracking his daily mischief scores to see how his behavior changes over time. Can you find how many points his score increased or decreased each day compared to the previous day?
--
-- The Grinch is tracking his daily mischief scores to see how his behavior changes over time. Can you find how many points his score increased or decreased each day compared to the previous day?
--

-- Table Schema:
-- Table: grinch_mischief_log
--   log_date: DATE
--   mischief_score: INTEGER
--

-- My Solution:

WITH score_tracker AS 
  ( 
        SELECT      log_date, mischief_score, 
                    LAG(mischief_score) OVER( ORDER BY log_date) AS previous_day_score,
                    mischief_score - (LAG(mischief_score) OVER(ORDER BY log_date)) AS score_diff
        FROM        grinch_mischief_log gt
  )

SELECT log_date, mischief_score, score_diff
FROM score_tracker;
